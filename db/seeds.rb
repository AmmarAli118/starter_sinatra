Teacher.destroy_all
Student.destroy_all

Teacher.create(name: "Ammar")
Student.create(name: "Stephen", teacher_id: 1)
Student.create(name: "Sean", teacher_id: 1)
