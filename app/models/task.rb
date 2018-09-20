class Task < ApplicationRecord
  belongs_to :list

  validates :title, presence: true

  def todo?
    status == 0
  end
end
