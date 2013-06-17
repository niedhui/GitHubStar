Teacup::Stylesheet.new :preferences do
  style :login_control,
    font: NSFont.systemFontOfSize(30)

  style :username , extends: :login_control

  style :password, extends: :login_control

  style :login, extends: :login_control,
    size: [30,40], title: 'Login'
end
