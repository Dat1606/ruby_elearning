class CreateUserLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lessons do |t|
      t.references :lesson
      t.references :user
      t.integer :percent, default: 0
      t.integer :status, default: 0
      t.integer :point, default: 0

      t.timestamps
    end
  end
end
