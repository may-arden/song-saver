class CreateSongs < ActiveRecord::Migration

    def change
        create_table :songs do |t|
            t.string :title
            t.string :composer
            t.string :genre
            t.integer :user_id
        end
    end

    # how do I set the value of :user_id foreign key to be equal to the user's id number?
    
end 