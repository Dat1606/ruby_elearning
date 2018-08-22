class CreateUserLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lessons do |t|
      t.references :lesson
      t.references :user
      t.integer :percent
      t.boolean :status
      t.integer :point

      t.timestamps
    end
  end
end
