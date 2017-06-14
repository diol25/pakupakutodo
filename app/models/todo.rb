class Todo < ApplicationRecord
  validates :task, presence: true

  def add_count
    self.count = self.count + 1
  end   
end
