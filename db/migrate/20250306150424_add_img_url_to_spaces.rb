class AddImgUrlToSpaces < ActiveRecord::Migration[7.1]
  def change
    add_column :spaces, :img_url, :string
  end
end
