class FaveUser
  attr_reader :login, :id, :url

  def initialize(attributes)
    @login = attributes['login'] 
    @id    = attributes['id']
    @url   = attributes['html_url']
  end
end
