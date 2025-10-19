# Installation Instructions for SimRacing Project

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Windows Operating System**: The scripts are designed to run on Windows.
- **PowerShell**: Ensure you have PowerShell installed (version 5.1 or later is recommended).
- **XML Configuration**: The project relies on an XML configuration file (`startSimRacing.xml`) for settings.

## Installation Steps

1. **Clone the Repository**:
   Open a terminal and run the following command to clone the repository:
   ```
   git clone <repository-url>
   ```
   Replace `<repository-url>` with the URL of the Git repository.

2. **Navigate to the Project Directory**:
   Change to the project directory:
   ```
   cd LaunchSimRacing
   ```

3. **Configure the XML File**:
   Open the `startSimRacing.xml` file and configure it according to your system's applications, monitor layouts, and power plans. Ensure that the paths and settings match your environment.

4. **Get the tools**:
   Download MultiMonitorTool https://www.nirsoft.net/utils/multi_monitor_tool.html
   and configure its location in startSimRacing.xml

5. **Run the Main Script**:
   To start the SimRacing environment, execute the main PowerShell script:
   ```
   .\startSimRacing.ps1
   ```

6. **Verify Installation**:
   Check the output of the script for any errors. If everything is set up correctly, the environment should launch without issues.

## Troubleshooting

- If you encounter issues, ensure that all paths in the XML configuration are correct.
- Check that all required applications are installed and accessible.
- Review the `startup.log` file for any error messages or warnings.

## Additional Information

For further details on usage and commands, refer to the `USAGE.md` file located in the `docs` directory.