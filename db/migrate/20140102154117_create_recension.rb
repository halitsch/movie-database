
class CreateRecension < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE `recension` DROP FOREIGN KEY recension_ibfk_1"
  	execute "ALTER TABLE `recension` DROP FOREIGN KEY recension_ibfk_2"
  	execute "ALTER TABLE `recension` DROP PRIMARY KEY"
  	add_column :recension, :id, :primary_key
    end
end
