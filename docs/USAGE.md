# Usage Instructions for SimRacing Project

## Overview
The SimRacing project is designed to streamline the setup of a sim racing environment on your computer. It automates the configuration of monitor layouts, manages running applications, and applies specific power plans to enhance performance during sim racing sessions.

## Prerequisites
Before using the SimRacing project, ensure that you have the following:
- PowerShell installed on your system.
- Access to the necessary applications and tools as specified in the `startSimRacing.xml` configuration file.
- Proper permissions to execute scripts on your machine.

## Running the Script
To start the SimRacing environment, execute the `startSimRacing.ps1` script from a PowerShell terminal. You can run the script with optional arguments:

```powershell
.\startSimRacing.ps1 [-gameover]
```

### Arguments
- `-gameover`: Use this argument if you want to set up the environment for post-race activities. This will apply the "Work" layout profile instead of the "SimRacing" profile.

## Configuration
The behavior of the SimRacing project is controlled by the `startSimRacing.xml` configuration file. Key sections include:

- **Apps**: List of applications to launch.
- **MonitorLayouts**: Configuration for monitor arrangements.
- **PowerPlan**: Specifies the power scheme to activate.
- **KillTasks**: Tasks to terminate before launching the sim racing environment.

## Monitor Layouts
The script automatically configures your monitor layout based on the settings defined in the XML file. Ensure that your monitors are connected and recognized by your system.

## Logging
The script logs its activities to `startup.log`, which can be reviewed for troubleshooting or confirmation of actions taken during the setup process.

## Troubleshooting
If you encounter issues:
- Check the `startup.log` for error messages.
- Ensure that all paths specified in the `startSimRacing.xml` file are correct and accessible.
- Verify that the necessary applications are installed and can be launched manually.

## Conclusion
The SimRacing project aims to provide a seamless experience for sim racing enthusiasts by automating the setup process. For further assistance, refer to the `INSTALLATION.md` file or consult the community forums.