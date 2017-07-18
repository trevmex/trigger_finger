class AddNameAndImageToHackers < ActiveRecord::Migration[5.1]
  def change
    add_column :hackers, :name, :string
    add_column :hackers, :image, :string
  end
end
