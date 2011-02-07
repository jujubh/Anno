class CreateNorms < ActiveRecord::Migration
  def self.up
    create_table :norms do |t|
      t.string :norm

      t.timestamps
    end
  end

  def self.down
    drop_table :norms
  end
end
