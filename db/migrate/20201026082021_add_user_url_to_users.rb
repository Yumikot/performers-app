class AddUserUrlToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_url, :string
  end
end
