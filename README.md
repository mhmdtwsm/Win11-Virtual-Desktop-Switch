# Win11-Virtual-Desktop-Switch

Keyboard-driven virtual desktop controller for Windows 11 — inspired by Linux window managers workspaces switching

---

## 🚀 Features

- 🔢 Switch between up to **9 virtual desktops** using `Alt + 1–9`
- ❌ Close the current desktop with `Alt + Q`
- 🧠 Lightweight, native, no dependencies other than AutoHotkey

---

## ⚙️ Installation

### 1. Requirements

- Windows 11 (requires at least 24H2 26100.2605).
  
- [AutoHotkey v2](https://www.autohotkey.com/) installed  

- The file `VirtualDesktopAccessor.dll` which I will put in the repo.

### 2. Setup

1. **Clone this repo**:

```bash
git clone https://github.com/mhmdtwsm/Win11-Virtual-Desktop-Switch.git
cd Win11-Virtual-Desktop-Switch
```

**Ensure both files exist**:

- `SwitchDesktops.ahk`
- `VirtualDesktopAccessor.dll`

### 3. Run the script

Double-click `SwitchDesktops.ahk`

---

## ⌨️ Hotkeys

| Hotkey                                 | Action                              |
| -------------------------------------- | ----------------------------------- |
| **Alt + 1–9**                          | Switch to Desktop 1–9               |
| **Alt + Q**                            | Close current desktop               |

You can customize these bindings easily inside SwitchDesktops.ahk.
And I suggest you look at the documentationt of the `dll` to see the function that provides.

[DLL functions](https://github.com/Ciantic/VirtualDesktopAccessor?tab=readme-ov-file#reference-of-exported-dll-functions)

---

## 🔄 Auto-Launch on Startup

To make the script run automatically when you log in:

Press `Win + R` → type `shell:startup` → press Enter

Copy a shortcut to SwitchDesktops.ahk into that folder.

Next time you boot your PC, your hotkeys will be ready automatically.

---

## 🧩 File Structure

Again, make sure that the folder that the script is in looks like this

```bash
.
├── SwitchDesktops.ahk          # Main AutoHotkey script
└── VirtualDesktopAccessor.dll  # Native DLL for Windows virtual desktop API
```

---

## 🧠 Credits

- [@Ciantic](https://github.com/Ciantic) for [`VirtualDesktopAccessor.dll`](https://github.com/Ciantic/VirtualDesktopAccessor)  
  © Jari Pennanen, 2015–2024 — Licensed under the [MIT License](https://github.com/Ciantic/VirtualDesktopAccessor/blob/master/LICENSE)

- [AutoHotkey](https://www.autohotkey.com/) for the scripting
