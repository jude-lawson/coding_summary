class Follower
  attr_reader :login, :url, :id

  def initialize(attributes)
    @login = attributes['login'] 
    @url   = attributes['html_url']
    @id    = attributes['id']
  end
end
