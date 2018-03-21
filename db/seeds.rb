Subject.create subject_name: "Git"
Subject.create subject_name: "ruby"
Subject.create subject_name: "html/css"
Subject.create subject_name: "js"
Subject.create subject_name: "rails"
Subject.create subject_name: "Agile"

Subject.all.each do |sb|
  sb.tasks.create task_name: "Task 1", time_day: 3, start_date: "22/12/2018"
  sb.tasks.create task_name: "Task 2", time_day: 3, start_date: "22/12/2018"
  sb.tasks.create task_name: "Task 3", time_day: 3, start_date: "22/12/2018"
end

User.create email: "minhtu12394@gmail.com", role: 0, password: "123456789", password_confirmation: "123456789"
User.create email: "admin@gmail.com", role: 0, password: "123123", password_confirmation: "123123"
