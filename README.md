# 🐚 shell_script Collection

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
![Bash](https://img.shields.io/badge/shell-bash-1f425f.svg)
![Contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)

A growing collection of reliable, production-grade shell scripts to automate server tasks, health checks, database installations, and more. Each module is well-documented, simple to use, and designed with extensibility in mind.

---

## 📂 Repository Structure

| Script | Description | Key Tools | License |
|--------|-------------|-----------|---------|
| [API Health Check](./API-HEALTH-CHECK_SHELL-SCRIPT) | Monitor an API endpoint and send email alerts on failure | `curl`, `mailx` | MIT |
| [PostgreSQL Installer](./INSTALL-POSTGRES_DB-V-10.x.x_Almalinux-9.5) | Install PostgreSQL 10.x and PostGIS 2.5.5 on AlmaLinux 9.5 | `yum`, `wget`, `tar` | MIT |
| [PGSQL DB Dump Tool](./PGSQL-DB_DUMP) | Dump all PostgreSQL databases while excluding specific ones | `pg_dump`, `grep` | MIT |

---

## 🚀 Getting Started

### 🧰 Prerequisites

- Linux environment (tested on AlmaLinux 9.5 and Ubuntu)
- `bash`, `cron`, `mailx`, `postgresql`, and utilities specific to each script

### 📥 Clone the Repo

```bash
git clone https://github.com/your-username/shell_script.git
cd shell_script
```

▶️ Run a Script

```bash
cd API-HEALTH-CHECK_SHELL-SCRIPT
chmod +x API-Health-Check_with_Email-Alert.sh
./API-Health-Check_with_Email-Alert.sh
```

🔍 Be sure to update configuration variables inside each script before executing.

---

## 📘 Script Details

💡 API Health Check

Monitors the response from a specified API and sends an email if it's down or returns an unexpected status code.

<details> <summary>🔧 Example Output</summary>

```bash
[✓] Checking API endpoint: https://example.com/health
[✓] Status Code: 200 OK
[✓] Everything is healthy.
```
```bash
[✗] Status Code: 500 Internal Server Error
[!] Sending alert email to admin@example.com...
```

</details>

---

## 🛠 PostgreSQL 10.x Installer (AlmaLinux 9.5)

Installs PostgreSQL 10.x with PostGIS support and configures it on AlmaLinux.

<details> <summary>📋 Steps Performed</summary>
 1. Install dependencies (gcc, make, libxml2, etc.)
 
 2. Download and extract PostgreSQL
 
 3. Compile and install PostGIS 2.5.5
 
 4. Setup postgres user and environment variables
 
 5. Configure pg_hba.conf and postgresql.conf

</details>

---

## 💾 PGSQL DB Dump with Exclusions

Dumps all PostgreSQL databases except the ones listed in an exclusion file or variable.

<details> <summary>📦 Sample Dump Output</summary>

```bash
[✓] Skipping database: template1
[✓] Skipping database: test_db
[✓] Dumping database: production_db
[✓] Dump completed: production_db_2025-05-04.sql
```

</details>

---

## 🤝 Contribution Guide

We welcome new scripts, improvements, and documentation fixes!

 1. Fork this repo

 2. Add your script in a new folder with a README.md and LICENSE

 3. Ensure consistent formatting and executable permissions

 4. Open a pull request 🚀

---

## 📜 License

This project is licensed under the MIT License. See individual folders for their respective LICENSE files.

---

## 🧑‍💻 Author

**Adib Akhtab Faruquee**  
_Senior System Engineer_  
_Systems Network & Security Team, Engineering_
📅 Created: May 2025

📧 Email: adibakhtab@gmail.com
🌐 Visit https://bold.pro/my/adib-akhtab-faruquee-250402002920