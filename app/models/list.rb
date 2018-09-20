class List < ApplicationRecord
  has_many :tasks

  def todos
    tasks.select{ |task| task.status == 0 }
  end

  def count
    self.todos.count
  end
end
