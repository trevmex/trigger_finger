class AddOmniauthToHackers < ActiveRecord::Migration[5.1]
  def change
    add_column :hackers, :provider, :string
    add_column :hackers, :uid, :string
  end
end
