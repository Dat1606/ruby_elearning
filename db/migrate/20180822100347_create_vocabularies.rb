class CreateVocabularies < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabularies do |t|
      t.references :lesson
      t.string :name
      t.integer :status, default: 0
      t.text :example
      t.text :description
      
      t.timestamps
    end
  end
end
