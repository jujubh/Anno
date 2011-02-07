class CreateAnnotations < ActiveRecord::Migration
  def self.up
    create_table :annotations do |t|
      t.string :name
      t.integer :document_id
      t.string :line
      t.integer :position
      t.integer :norm_id
      t.integer :lemma_id
      t.integer :partofspeech_id

      t.timestamps
    end
  end

  def self.down
    drop_table :annotations
  end
end
