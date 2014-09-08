class CreateComments < ActiveRecord::Migration
  def change
    create_table :articles do |t|
        t.string :header
    	t.string :content

    end

    create_table :users_articles do |t|
    	t.integer :article_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
