module UserLessonsHelper

  def count_vocabulary user_lesson
    user_lesson.lesson.vocabularies.count
  end
end
