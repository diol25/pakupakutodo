class Todo < ApplicationRecord

  def add_count
    self.count = self.count + 1
  end   
end
