class StarredRepo
  attr_reader :id, :name, :description, :repo_url, :owner_url, :owner

  def initialize(attributes)
    @id = attributes['id']
    @name = attributes['name']
    @description = attributes['description']
    @repo_url = attributes['html_url']
    @owner_url = attributes['owner']['html_url']
    @owner = attributes['owner']['login']
  end
end
