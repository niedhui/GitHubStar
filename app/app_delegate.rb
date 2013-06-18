class AppDelegate
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
    init_api_client
    check_credential
  end

  def buildWindow
    @mainWindow = NSWindow.alloc.initWithContentRect([[240, 180], [480, 360]],
      styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    @mainWindow.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    @mainWindow.orderFrontRegardless
  end

  def check_credential
    openPreferences(self)
  end

  def init_api_client
    APIClient.build_shared
  end

  def openPreferences(sender)
    @preferences_controller ||= PreferencesController.new
    @preferences_controller.showWindow(self)
  end
end
