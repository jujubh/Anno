class CreateLemmas < ActiveRecord::Migration
  def self.up
    create_table :lemmas do |t|
      t.string :lemma

      t.timestamps
    end
  end

  def self.down
    drop_table :lemmas
  end
end
