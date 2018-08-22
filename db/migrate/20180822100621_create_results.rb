class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :user_lesson
      t.references :vocabulary
      t.references :answer

      t.timestamps
    end
  end
end
