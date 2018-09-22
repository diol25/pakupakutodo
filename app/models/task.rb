class Task < ApplicationRecord
  belongs_to :list

  validates :title, presence: true

  enum status: { todo: 0, done: 1 }
end
