class Task < ApplicationRecord
  validates :title, presence: true
  has_many :tasks_users
  has_many :users, through: :tasks_users, dependent: :delete_all
  belongs_to :project
  enum status: {New: 0, 'In progress': 1, Done: 2}
end
