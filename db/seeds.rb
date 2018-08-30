Course.create! name: "English Course", image: File.open(File.join(Rails.root,"app/assets/images/english_course.jpg")),
  description: "All our English courses are designed and delivered by highly qualified teachers and are proven to get results. But we know there are millions of people who would love to improve their English skills but just can’t find the time or right location to take a course just now. 

  That’s why we have created the world’s largest English language online resource. This means we can support your learning, whatever your level, whatever your preferred media by giving you access to thousands of FREE and paid for digital learning tools, online courses, mobile apps, downloads, print, radio, TV as well the world’s biggest English language social media community."
Course.create! name: "Japanese Course", image: File.open(File.join(Rails.root,"app/assets/images/japanese_course.jpg")),
  description: "All our Japanese courses are designed and delivered by highly qualified teachers and are proven to get results. But we know there are millions of people who would love to improve their Japanese skills but just can’t find the time or right location to take a course just now. 

  That’s why we have created the world’s largest Japanese language online resource. This means we can support your learning, whatever your level, whatever your preferred media by giving you access to thousands of FREE and paid for digital learning tools, online courses, mobile apps, downloads, print, radio, TV as well the world’s biggest Japanese language social media community."

Lesson.create! name: "Business English Course", course_id: 1
Lesson.create! name: "Academic English Course", course_id: 1
Lesson.create! name: "Japanese Hiragana", course_id: 2
Lesson.create! name: "Japanese Katakana", course_id: 2
