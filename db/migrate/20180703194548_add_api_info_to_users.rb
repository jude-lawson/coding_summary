class AddApiInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :string
    add_column :users, :avatar_url, :string
    add_column :users, :followers_url, :string
    add_column :users, :following_url, :string
    add_column :users, :starred_url, :string
    add_column :users, :subscriptions_url, :string
    add_column :users, :organizations_url, :string
    add_column :users, :repos_url, :string
    add_column :users, :html_url, :string
    add_column :users, :events_url, :string
  end
end
