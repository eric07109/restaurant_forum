class CreateFollowships < ActiveRecord::Migration[5.1]
  def change
    create_table :followships do |t|

      t.timestamps
    end
  end
end
