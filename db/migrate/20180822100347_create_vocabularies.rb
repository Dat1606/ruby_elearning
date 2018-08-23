class CreateVocabularies < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabularies do |t|
      t.references :lesson
      t.string :name
      t.text :question
      t.integer :status
      t.text :example

      t.timestamps
    end
  end
end
