Subject.create subject_name: "Git"
Subject.create subject_name: "ruby"
Subject.create subject_name: "html/css"
Subject.create subject_name: "js"
Subject.create subject_name: "rails"
Subject.create subject_name: "Agile"

Subject.all.each do |sb|
  sb.tasks.create task_name: "Task 1"
  sb.tasks.create task_name: "Task 2"
  sb.tasks.create task_name: "Task 3"
end

User.create email: "minhtu12394@gmail.com", role: 0, password: "123456789", password_confirmation: "123456789"
User.create email: "admin@gmail.com", role: 0, password: "123123", password_confirmation: "123123"
User.create email: "user1@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user2@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user3@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user4@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user5@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user6@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user7@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user8@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user9@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user10@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
User.create email: "user11@gmail.com", role: 2, password: "123123", password_confirmation: "123123"
