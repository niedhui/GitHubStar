class PreferencesController < TeacupWindowController
  stylesheet :preferences
  layout do |view|
    @username_field = subview(NSTextField, :username)
    @username_field.cell.placeholderString = 'Username or Email'
    @username_field.becomeFirstResponder

    @password_field = subview(NSSecureTextField, :password)
    @password_field.cell.placeholderString = 'Password'

    @login_button = subview(NSButton, :login)
    @login_button.target = self
    @login_button.action = "login"

    auto do
      metrics 'margin' => 40, 'height' => 40
      vertical "|-[username]-margin-[password]-margin-[login(==height)]-|"
      horizontal '|-margin-[username]-margin-|'
      horizontal '|-margin-[password]-margin-|'
      horizontal '|-margin-[login]-margin-|'
    end
  end

  def login
    #username = @username_field.stringValue
    #password = @password_field.stringValue
  end

end
