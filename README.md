# Jarvis AI Assistant

A local, open-source AI desktop assistant and agent platform powered by **Dodaios (Personal Jarvis v4.0.1)**.

---

## Overview

Jarvis provides a desktop environment for interacting with AI agents, orchestrating tasks, managing code, and connecting cloud or local language models.

* **Interface Options**: Access via local Web Browser (`http://127.0.0.1:47821`) or standalone Desktop Application window.
* **Model Compatibility**: Connect with cloud AI providers (Google Gemini, OpenAI, Anthropic Claude, OpenRouter) or local engines (Ollama).
* **Security & Isolation**: Runs in an isolated Python virtual environment with granular approval gates.
* **Portable Automation**: Includes automated setup and one-click launch/stop scripts.

---

## System Requirements

| Component | Minimum Requirement | Recommended |
| :--- | :--- | :--- |
| **Operating System** | Windows 10/11 64-bit | Windows 11 64-bit |
| **Python** | Python 3.11 (`>=3.11, <3.15`) | Python 3.11.9 |
| **RAM** | 8 GB RAM | 8 GB+ (Cloud models recommended for 8 GB) |
| **Storage** | ~2 GB free disk space | SSD |

> [!IMPORTANT]
> **Windows Path Length Limit (`MAX_PATH`)**:
> Due to deep dependency hierarchies (e.g., `elevenlabs`), clone or install this repository into a short directory path (such as `C:\Users\<YourUser>\personal-jarvis` or `C:\jarvis`) to prevent Windows 260-character path limit errors.

---

## Installation & Setup

### Automated Setup (Recommended)
1. Clone this repository:
   ```cmd
   git clone https://github.com/suryateja072009/jarvis.git
   cd jarvis
   ```
2. Run the setup script:
   ```cmd
   setup.bat
   ```
   This script automatically creates a clean `.venv` virtual environment, upgrades `pip`, and installs all necessary dependencies from `requirements.txt`.

### Manual Setup
```cmd
python -m venv .venv
.venv\Scripts\python.exe -m pip install --upgrade pip
.venv\Scripts\python.exe -m pip install -r requirements.txt
```

---

## How to Launch and Stop Jarvis

### 1. Web Browser Mode (Recommended)
* **Double-click**: `start-jarvis-web.bat`
* Boots the local backend server and automatically opens the user interface in your default browser at:
  ```
  http://127.0.0.1:47821
  ```
* Keep the command prompt window open while using the assistant.

### 2. Desktop Window Mode
* **Double-click**: `start-jarvis.bat`
* Launches Jarvis in a dedicated native desktop window powered by Edge WebView2.

### 3. Stopping Jarvis
* Simply close the terminal window that opened upon launch, OR
* **Double-click**: `stop-jarvis.bat` (reliably stops all background server and Python worker processes).

---

## Security & Best Practices

1. **API Keys & Credentials**:
   * Enter API keys **only** inside the Jarvis application interface under **API Keys & Providers**.
   * Never store API keys or passwords in repository files or environment scripts.
2. **Approval Gates**:
   * Keep computer-use and shell execution gates set to **"Ask"** or **"Block"** mode so Jarvis requests user confirmation before executing system actions.
3. **Repository Cleanliness**:
   * `.gitignore` is configured to prevent committing virtual environments (`.venv/`), logs, databases, `.env` files, or local Windows shortcuts.

---

## Project Structure

```text
├── assets/
│   └── jarvis.ico           # Application icon
├── .gitignore               # Ignored files (venv, secrets, cache, logs)
├── LICENSE                  # MIT License
├── README.md                # Project documentation
├── requirements.txt         # Core dependencies (dodaios[desktop]==4.0.1)
├── setup.bat                # Automated one-click environment installer
├── start-jarvis.bat         # Desktop window launcher
├── start-jarvis-web.bat     # Web browser mode launcher
├── stop-jarvis.bat          # Stop script (batch wrapper)
└── stop-jarvis.ps1          # Process termination logic
```

---

## License

This project is licensed under the [MIT License](LICENSE).
