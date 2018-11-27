import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let APP_NAME = "glimps"
    let STATUS_BAR_ICON = NSImage(named: "StatusBarIcon")

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let popover = NSPopover()

    @IBAction func togglePopover(_ sender: NSMenuItem) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.menu = statusMenu
        popover.contentViewController = PopoverViewController.freshController()
        
        if let statusButton = statusItem.button {
            statusButton.title = APP_NAME
            statusButton.image = STATUS_BAR_ICON
        }
        
       
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
    }


    func applicationWillTerminate(_ aNotification: Notification) {
        
    }


}

