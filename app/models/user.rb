class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  enum role: [:admin, :trainers, :trainee]


  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
  format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, allow_blank: true

  scope :not_in_course, -> (course_id) do
    where("users.id NOT IN
      (SELECT user_id FROM user_courses
        WHERE course_id = :course_id)", course_id: course_id)
  end


  scope :search_email, ->(email) { where("email like '%#{email}%'")}

end
