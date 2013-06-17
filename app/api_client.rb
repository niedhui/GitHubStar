class APIClient
  def self.build_shared
    AFMotion::Client.build_shared("https://api.github.com") do
      header 'User-Agent', 'GitHubStar'
      header "Accept", "application/vnd.github.beta+json"
      AFJSONRequestOperation.addAcceptableContentTypes(NSSet.setWithObject("application/vnd.github.beta+json"))
      operation :json
    end
  end

  def set_authorization(username, password)
    AFMotion::Client.shared.authorization = {username: username, password: password}
  end

  def get_user(&block)
    AFMotion::Client.shared.get('/user', &block)
  end
end
