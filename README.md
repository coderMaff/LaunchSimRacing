# LaunchSimRacing Project

## Overview
The LaunchSimRacing project is designed to streamline the setup of a sim racing environment on Windows. It automates the configuration of monitor layouts, manages background tasks, and launches necessary applications using PowerShell scripts.

## Features
- **Environment Setup**: Automatically configures monitor layouts based on user-defined settings.
- **Task Management**: Kills unnecessary background processes to optimize performance.
- **Application Launching**: Starts required applications for sim racing with a single command.

## Prerequisites
- Windows operating system
- PowerShell 5.1 or higher
- MultiMonitorTool 2.2 or Higher from NirSogft - https://www.nirsoft.net/utils/multi_monitor_tool.html

## Installation
1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd LaunchSimRacing
   ```
3. Modify the config to suit
   ```
   startSimRacing.xml
   ```

## Usage
To start the sim racing environment, run the main script:
```
.\startSimRacing.ps1
```
You can pass the `-gameover` argument to switch to a different layout profile.

## Documentation
- [Installation Guide](docs/INSTALLATION.md)
- [Usage Instructions](docs/USAGE.md)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.