#!/bin/bash

# -------------------------------------------
# | Script Created By: Adib Akhtab Faruquee |
# | Script Created at: 04-05-2025 09:00 AM  |
# -------------------------------------------

# ---------- Configuration ----------
LOG_FILE="/var/log/service_monitor.log"
MEMORY_THRESHOLD_PERCENT=40     # % of available memory required
DISK_THRESHOLD_GB=10            # Free disk space on / required in GB

# ---------- Logging Setup ----------
exec >> "$LOG_FILE" 2>&1
echo "--------------------"
echo "Run at: $(date)"

# ---------- Helper Functions ----------

# Check if a service is active (systemd)
is_service_active() {
    systemctl is-active --quiet "$1"
}

# Check if Tomcat is listening on port 8080
is_tomcat_running() {
    ss -ltnp | grep -q ':8080'
}

# ---------- Initial Checks ----------

# Check Tomcat status early
tomcat_running_initially=false
if is_tomcat_running; then
    tomcat_running_initially=true
fi

# ---------- Check MySQL ----------
if is_service_active mysqld; then
    echo "MySQL is running."

    if $tomcat_running_initially; then
        echo "Tomcat is also running. Exiting."
        exit 0
    else
        echo "Tomcat is not running. Will start Tomcat now that MySQL is running..."
        sh /usr/share/apache-tomcat-8.5.13-otc-8080/bin/startup.sh
        sleep 5
        if is_tomcat_running; then
            echo "Tomcat started successfully."
        else
            echo "Failed to start Tomcat."
        fi
        exit 0
    fi
fi

# ---------- MySQL is NOT Running ----------
echo "MySQL is not running."
if $tomcat_running_initially; then
    echo "Tomcat is running. Will keep it running for now but MySQL must be restored."
else
    echo "Tomcat is also not running. Will start it later ONLY if MySQL starts successfully."
fi

# ---------- Resource Checks ----------

# Clear caches before memory check
echo "Flushing disk cache and dropping system caches before memory check..."
sync
echo 3 > /proc/sys/vm/drop_caches

# Get total and available memory in MB
read total_mem available_mem <<< $(free -m | awk 'NR==2 {print $2, $7}')
available_mem_percent=$((available_mem * 100 / total_mem))

# Get free disk space in / in GB
free_disk_gb=$(df / | awk 'NR==2 {print int($4/1024/1024)}')

echo "Available Memory: ${available_mem_percent}% (Threshold: ${MEMORY_THRESHOLD_PERCENT}%)"
echo "Free Disk on /: ${free_disk_gb} GB (Threshold: ${DISK_THRESHOLD_GB} GB)"

if [ "$available_mem_percent" -ge "$MEMORY_THRESHOLD_PERCENT" ] && [ "$free_disk_gb" -ge "$DISK_THRESHOLD_GB" ]; then
    echo "System resources are sufficient."

    # Ensure /var/run/mysqld exists and assign ownership
    if [ ! -d /var/run/mysqld ]; then
        echo "Creating /var/run/mysqld directory..."
        mkdir -p /var/run/mysqld
    fi
    echo "Setting ownership to mysql:mysql..."
    chown -R mysql:mysql /var/run/mysqld

    echo "Attempting to start MySQL..."
    systemctl start mysqld
    sleep 5

    if is_service_active mysqld; then
        echo "MySQL started successfully."

        if $tomcat_running_initially; then
            echo "Tomcat was already running. Nothing to change. Exiting."
            exit 0
        else
            echo "Now starting Tomcat..."
            sh /usr/share/apache-tomcat-8.5.13-otc-8080/bin/startup.sh
            sleep 5
            if is_tomcat_running; then
                echo "Tomcat started successfully."
            else
                echo "Failed to start Tomcat."
            fi
            exit 0
        fi
    else
        echo "Failed to start MySQL. Exiting."
        exit 1
    fi

else
    echo "Insufficient system resources (available memory or disk). Exiting."
    exit 1
fi