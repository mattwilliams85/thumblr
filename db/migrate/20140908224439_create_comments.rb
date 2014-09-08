class CreateComments < ActiveRecord::Migration
  def change
    create_table :articles do |t|
        t.string :header
    	t.string :content
        t.integer :user_id

    end

  end
end
