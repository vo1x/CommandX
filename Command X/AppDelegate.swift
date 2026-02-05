import Cocoa
import ApplicationServices

final class AppDelegate: NSObject, NSApplicationDelegate {
    private let eventTapManager = EventTapManager()

    func applicationDidFinishLaunching(_ notification: Notification) {
        requestInputMonitoringAccess()
        eventTapManager.start()
    }

    func requestInputMonitoringAccess() {
        if !CGPreflightListenEventAccess() {
            _ = CGRequestListenEventAccess()
        }
    }

    func openInputMonitoringSettings() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_ListenEvent") {
            NSWorkspace.shared.open(url)
        }
    }
}
