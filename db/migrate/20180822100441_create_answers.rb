class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :vocabulary
      t.text :content
      t.boolean :status

      t.timestamps
    end
  end
end
