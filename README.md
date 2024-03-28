# Open The Gates
This PowerShell script automates the process of forwarding ports from the host machine to a Windows Subsystem for Linux (WSL) instance. It is useful for scenarios where you need to access services running inside WSL from the host or other network devices.

## Features

- Automatically discovers the IP address of the WSL instance.
- Forwards a specified list of ports from the host to the WSL instance.
- Manages Windows Firewall rules to allow inbound traffic on the forwarded ports.

## Usage

1. **Obtain the Script**: Download or clone the repository to your local machine.

2. **Run the Script**:
   - Open PowerShell with administrative privileges.
   - Navigate to the directory containing the script.
   - Execute the script by running `.\forward_wsl_ports.ps1`.

3. **Customize Ports**: Modify the `$portArray` variable in the script to include the ports you want to forward.

4. **Verify Configuration**:
   - Ensure that the WSL instance is running and reachable from the host.
   - Confirm that the ports you're forwarding are not already in use by other services.

5. **Review Output**: The script will display the IP address of the WSL instance and the ports being forwarded.

6. **Firewall Rule**: If a firewall rule named "Allow WSL Ports" already exists, the script will update it. Otherwise, it will create a new rule to allow inbound traffic on the forwarded ports.

## Scheduling as a Task

You can schedule the port forwarding script to run automatically using Windows Task Scheduler. Follow these steps to set up a scheduled task:

1. **Open Task Scheduler**: Press `Win + R`, type `taskschd.msc`, and hit Enter.

2. **Create a New Task**:
   - In the Task Scheduler window, navigate to `Action` > `Create Task`.
   - Provide a name and description for the task.

3. **Configure Triggers**:
   - Go to the `Triggers` tab and click `New`.
   - Choose the trigger conditions for running the script. For example, you might want it to run at system startup or on a specific schedule.

4. **Set Action**:
   - Switch to the `Actions` tab and click `New`.
   - Select `Start a program` as the action.
   - Browse and select the PowerShell executable (`powershell.exe`).
   - In the `Add arguments` field, enter the full path to the script (`C:\path\to\forward_wsl_ports.ps1`).

5. **Configure Conditions and Settings**:
   - Adjust any additional settings as needed, such as conditions and settings tabs.

6. **Save and Exit**: Click `OK` to save the task.

Now, the port forwarding script will run automatically according to the schedule you defined.

**Note**: 
- Ensure that the user account running the scheduled task has sufficient privileges to execute PowerShell scripts and modify network settings.
- Test the scheduled task to verify that it runs as expected.

## Requirements

- Windows 10 or later with Windows Subsystem for Linux installed.
- PowerShell with administrative privileges.

## Disclaimer

This script modifies network settings and firewall rules on your system. Use it at your own risk and ensure you understand the implications before executing it.
