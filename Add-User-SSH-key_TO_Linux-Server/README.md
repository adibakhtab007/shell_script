# Add User SSH Key to Linux Server

![Shell Script](https://img.shields.io/badge/language-bash-blue.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Status: Stable](https://img.shields.io/badge/status-stable-brightgreen)

A Bash script to securely create a new Linux user and configure SSH access using their public key. This script helps system administrators quickly provision users for production server access, while ensuring secure SSH configurations.

### 🛠️ Script Details

- **Author:** _Adib Akhtab Faruquee_  
- _Senior System Engineer_  
- _Systems Network & Security Team, Engineering_  
- **Created On:** 04-05-2025  
- **Script Name:** `Add-User-SSH-key_TO_Linux-Server.sh`

---

### 📋 Features

- Prompts for a new username and their SSH public key.
- Creates the Linux user and sets their password.
- Sets up proper `.ssh` directory with correct permissions.
- Stores the public key in both user's home directory and `/etc/ssh/<username>/`.
- Updates `/etc/ssh/sshd_config` to:
  - Disable password authentication.
  - Configure `AuthorizedKeysFile`.
  - Add user to `AllowUsers` directive.
- Reloads SSH service to apply changes.

---

### ⚠️ Prerequisites

- Must be run as `root` or a user with `sudo` privileges.
- A valid OpenSSH public key from the user.
- Ensure `sshd` is installed and active.

---

### 🚀 Usage

```bash
chmod +x Add-User-SSH-key_TO_Linux-Server.sh
sudo ./Add-User-SSH-key_TO_Linux-Server.sh
```

The script will prompt you to:

 1. Enter the username to create.  
 2. Enter the SSH public key of the user.  

---

### 📁 What the Script Does Internally

1. User Management

  - ```adduser <username>:``` Creates a new user.
  - ```passwd <username>:``` Sets password interactively.

2. SSH Directory Setup

  - Creates ```/home/<username>/.ssh``` and ```/etc/ssh/<username>/``` directories.
  - Adds the provided public key to both locations.
  - Sets strict file permissions for enhanced security.

3. SSHD Configuration

  - Backs up the original ```sshd_config``` file.
  - Modifies or appends the following directives:

```bash
PermitRootLogin without-password
PasswordAuthentication no
AuthorizedKeysFile /etc/ssh/%u/authorized_keys
AllowUsers <username>
```

  - Comments out any conflicting pre-existing values.

4. Finalization

  - Reloads the SSH daemon: ```service sshd reload```.

---

### 🔐 Security Notes

  - Password login is disabled to prevent brute-force attacks.
  - SSH key authentication is enforced.
  - Public keys are stored outside the home directory (in ```/etc/ssh/<username>```) for enhanced separation.

---

### 🧹 Rollback

To revert changes:

  - Restore sshd_config from the backup located at ```/etc/ssh/sshd_config.bak.<timestamp>```.
  - Delete the user with ```userdel -r <username>```.
  - Remove ```/etc/ssh/<username>/```.

### 📄 License
This script is released under the MIT License.

---

### 🤝 Contributing
Pull requests and suggestions are welcome! If you spot a bug or want to enhance the script, feel free to fork and submit a PR.

### 📞 Contact
For any questions or support, contact _Adib Akhtab Faruquee_.