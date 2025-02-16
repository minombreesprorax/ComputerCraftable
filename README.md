# ComputerCraftable
OS for ComputerCraft: Tweaked
## Installation

### **Prerequisites**
- An advanced computer.

### **Installation Steps**
1. Open the ComputerCraft shell.
2. Run the following command to install:
   ```
   wget run https://raw.githubusercontent.com/minombreesprorax/ComputerCraftable/main/installer.lua
   ```
3. The installer will automatically:
   - Fetch all necessary files from the repository.
   - Maintain the correct folder structure.
   - Install everything into the `/bin/` directory.

### **Usage**
- After installation, restart your ComputerCraft computer.
- The OS should automatically load from the `/bin/startup.lua` file.

### **Updating**
To update your OS, simply rerun the installer:
```
wget run https://raw.githubusercontent.com/minombreesprorax/ComputerCraftable/main/installer.lua
```

### **Uninstallation**
If you want to remove the OS, run:
```
rm -r /bin/
```
