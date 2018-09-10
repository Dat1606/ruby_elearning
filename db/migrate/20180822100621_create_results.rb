class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :user_lesson
      t.references :vocabulary
      t.references :answer
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
