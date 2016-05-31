class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :description
    end
  end
end
