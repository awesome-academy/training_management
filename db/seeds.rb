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

user = User.create email: "minhtu12394@gmail.com", role: 0, password: "123456789", password_confirmation: "123456789"
