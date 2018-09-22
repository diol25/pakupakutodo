class List < ApplicationRecord
  has_many :tasks

  def count
    self.tasks.todo.count
  end
end
