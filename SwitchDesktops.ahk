#Requires AutoHotkey v2.0

; === Load VirtualDesktopAccessor.dll ===
dllPath := A_ScriptDir "\VirtualDesktopAccessor.dll"
hVDA := DllCall("LoadLibrary", "Str", dllPath, "Ptr")
if !hVDA {
    MsgBox "❌ Failed to load VirtualDesktopAccessor.dll.`nMake sure it's in the same folder as this script."
    ExitApp
}

; === Resolve DLL functions ===
GetDesktopCountProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "GetDesktopCount", "Ptr")
GoToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "GoToDesktopNumber", "Ptr")
CreateDesktopProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "CreateDesktop", "Ptr")
GetCurrentDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "GetCurrentDesktopNumber", "Ptr")
RemoveDesktopProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "RemoveDesktop", "Ptr")

; === Wrapper functions ===
GetDesktopCount() {
    global GetDesktopCountProc
    return DllCall(GetDesktopCountProc, "Int")
}

GoToDesktopNumber(num) {
    global GoToDesktopNumberProc
    DllCall(GoToDesktopNumberProc, "Int", num, "Int")
}

CreateDesktop() {
    global CreateDesktopProc
    return DllCall(CreateDesktopProc)
}

GetCurrentDesktopNumber() {
    global GetCurrentDesktopNumberProc
    return DllCall(GetCurrentDesktopNumberProc, "Int")
}

RemoveDesktop(current, fallback) {
    global RemoveDesktopProc
    DllCall(RemoveDesktopProc, "Int", current, "Int", fallback)
}

; === Main function: Switch to or create desktop ===
SwitchDesktop(num) {
    count := GetDesktopCount()
    while (count <= num) {
        CreateDesktop()
        count := GetDesktopCount()
    }
    GoToDesktopNumber(num)
}

; === Close current desktop ===
CloseCurrentDesktop() {
    curr := GetCurrentDesktopNumber()
    count := GetDesktopCount()
    if (count <= 1) {
        MsgBox "⚠️ Cannot close the last desktop!"
        return
    }

    fallback := (curr > 0) ? (curr - 1) : (curr + 1)
    RemoveDesktop(curr, fallback)
    GoToDesktopNumber(fallback)
}

; === ALT + 1–9 hotkeys ===
!1::SwitchDesktop(0)
!2::SwitchDesktop(1)
!3::SwitchDesktop(2)
!4::SwitchDesktop(3)
!5::SwitchDesktop(4)
!6::SwitchDesktop(5)
!7::SwitchDesktop(6)
!8::SwitchDesktop(7)
!9::SwitchDesktop(8)

; === ALT + Q → Close current desktop ===
!q::CloseCurrentDesktop()
