# 🛠️ Shell Script Suite by Adib Akhtab Faruquee

Welcome to a curated collection of system automation and PostgreSQL tooling scripts, designed and maintained by **Adib Akhtab Faruquee**, Senior System Engineer. These scripts are production-oriented and crafted for reliability, scalability, and observability in Linux environments.

---

## 📁 Repository Structure

shell_script/
├── API-HEALTH-CHECK_SHELL-SCRIPT/ → Application & API Health Monitoring Script
├── INSTALL-POSTGRES_DB-V-10.x.x_Almalinux-9.5/ → PostgreSQL 10.x + PostGIS 2.5.5 Installer for AlmaLinux 9.5
├── PGSQL-DB_DUMP/ → PostgreSQL Daily Backup Script with EXCLUDE Support (Linux)

---

## 📦 Projects Overview

### 🔍 [API Health Check with Email Alerts](./API-HEALTH-CHECK_SHELL-SCRIPT)

- **Script**: `API-Health-Check_with_Email-Alert.sh`
- **Purpose**: Monitor web applications and APIs. Sends alert emails if services return non-2xx status or fail to respond.
- **Docs**: [README.md](./API-HEALTH-CHECK_SHELL-SCRIPT/README.md)

---

### 🐘 [PostgreSQL 10 + PostGIS 2.5.5 Installer (AlmaLinux 9.5)](./INSTALL-POSTGRES_DB-V-10.x.x_Almalinux-9.5)

- **Script**: `Install_PGSQL-10.xx_and_PosGIS-2.5.5-Almalinux-9.5.sh`
- **Purpose**: Compiles and installs PostgreSQL, GDAL, PROJ, and PostGIS from source.
- **Docs**: [README.md](./INSTALL-POSTGRES_DB-V-10.x.x_Almalinux-9.5/README.md)

---

### 🗃️ [PostgreSQL Daily Backup Script (with EXCLUDE)](./PGSQL-DB_DUMP)

- **Script**: `PGSQL-DB-DUMP_with-EXCLUDE_DB.sh`
- **Purpose**: Performs daily dumps of all PostgreSQL databases, excluding specific ones. Retention and gzip compression included.
- **Docs**: [README.md](./PGSQL-DB_DUMP/README.md)

---

## 🧑‍💻 Author

**Adib Akhtab Faruquee**  
_Senior System Engineer_  
_Systems Network & Security Team, Engineering_  
📅 Created: May 2025

---

## 📜 License

This repository is licensed under the MIT License. Each script directory includes its own `LICENSE` file.

---

## 🧠 Notes

- Each script is standalone and includes its own logging, safety checks, and documentation.
- Scripts are optimized for **AlmaLinux**, but adaptable to other RHEL-based systems.
- For security and compliance, review all scripts before deploying in production.

---

## 🤝 Contributions

Feel free to fork this repository, submit pull requests, or open issues for improvements or bug fixes. All contributions are welcome!
