class StarredReposController < ApplicationController
  before_action :create_presenter, only: [:index]

  def index
  end
end
