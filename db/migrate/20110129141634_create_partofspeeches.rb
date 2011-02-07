class CreatePartofspeeches < ActiveRecord::Migration
  def self.up
    create_table :partofspeeches do |t|
      t.string :partofspeech

      t.timestamps
    end
  end

  def self.down
    drop_table :partofspeeches
  end
end
