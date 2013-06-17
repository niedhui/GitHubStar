class PreferencesController < TeacupWindowController
  stylesheet :preferences
  layout do |view|
    @username_field = subview(NSTextField, :username)
    @username_field.cell.placeholderString = 'Username or Email'
    @username_field.target = self
    @username_field.action = "username_action"

    @password_field = subview(NSSecureTextField, :password)
    @password_field.cell.placeholderString = 'Password'
    @password_field.target = self
    @password_field.action = "login"

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
    window.setInitialFirstResponder(@username_field)
    @username_field.setNextKeyView(@password_field)
    @password_field.setNextKeyView(@login_button)
    @login_button.setNextKeyView(@username_field)
  end

  def login
    username = @username_field.stringValue
    password = @password_field.stringValue
    client = APIClient.new
    client.set_authorization(username, password)
    puts "start login for #{username}, #{password}"
    client.get_user do |response|
      if response.success?
        puts "success #{response.object}"
      else
        puts "fail #{response.body}"
      end
    end
  end

  def username_action
    window.makeFirstResponder(@password_field)
  end

end
