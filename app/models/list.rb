class List < ApplicationRecord
  has_many :tasks

  def count
    tasks.count
  end
end
