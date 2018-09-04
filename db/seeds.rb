Course.create! name: "English Course", image: File.open(File.join(Rails.root,"app/assets/images/english_course.jpg")),
  description: "All our English courses are designed and delivered by highly qualified teachers and are proven to get results. But we know there are millions of people who would love to improve their English skills but just can’t find the time or right location to take a course just now. 
    That’s why we have created the world’s largest English language online resource. This means we can support your learning, whatever your level, whatever your preferred media by giving you access to thousands of FREE and paid for digital learning tools, online courses, mobile apps, downloads, print, radio, TV as well the world’s biggest English language social media community."
Course.create! name: "Japanese Course", image: File.open(File.join(Rails.root,"app/assets/images/japanese_course.jpg")),
  description: "All our Japanese courses are designed and delivered by highly qualified teachers and are proven to get results. But we know there are millions of people who would love to improve their Japanese skills but just can’t find the time or right location to take a course just now. 
    That’s why we have created the world’s largest Japanese language online resource. This means we can support your learning, whatever your level, whatever your preferred media by giving you access to thousands of FREE and paid for digital learning tools, online courses, mobile apps, downloads, print, radio, TV as well the world’s biggest Japanese language social media community."

Lesson.create! name: "School Vocabulary Lesson", course_id: 1
Lesson.create! name: "Business English Lesson", course_id: 1
Lesson.create! name: "Academic English Lesson", course_id: 1
Lesson.create! name: "Japanese Hiragana Lesson", course_id: 2
Lesson.create! name: "Japanese Katakana Lesson", course_id: 2

Vocabulary.create! name: "School", lesson_id: 1, description:"An institution for educating children", example: "I go to school everyday."
Vocabulary.create! name: "Notebook", lesson_id: 1, description: "A small book with blank or ruled pages for writing notes in.", example: "You can write in this notebook."
Vocabulary.create! name: "Principal", lesson_id: 1, description: " The head of a school, college, or other educational institution.", example: "Today the Principle taught me how to be a good boy."
Vocabulary.create! name: "Teacher", lesson_id: 1, description: "A person who teaches, especially in a school.", example: "I'm falling in love with my Math teacher."
Vocabulary.create! name: "Subject", lesson_id: 1, description:"A person or thing that is being discussed, described, or dealt with.", example: "I don't like subjects like History."

Vocabulary.create! name: "あ", lesson_id: 4, description:"あ is pronounced like the 'a' in 'car' or the 'a' in 'awful.'", example: "あなた. Romaji: 'a'."
Vocabulary.create! name: "い", lesson_id: 4, description:"い is pronounced like the 'ee' in 'eel.'", example: "いいですね. Romaji: 'i'."
Vocabulary.create! name: "う", lesson_id: 4, description:"う is pronounced like the 'oo' in 'oooo… ahhh!'", example: "うんどう. Romaji: 'u'."
Vocabulary.create! name: "え", lesson_id: 4, description:"え is pronounced like the 'e' in 'exotic' or the 'e' in 'egg.'", example: "えいが. Romaji: 'e'."
Vocabulary.create! name: "お", lesson_id: 4, description:"お is pronounced like you're saying 'oh.' It also sounds like the 'o' in 'original.'", example: "おんな. Romaji: 'o'."
