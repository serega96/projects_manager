class User < ApplicationRecord
  has_many :tasks_users
  has_many :tasks, through: :tasks_users, dependent: :delete_all

  validates :first_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
end
