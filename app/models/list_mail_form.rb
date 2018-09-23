class ListMailForm
  include ActiveModel::Model

  attr_accessor :email, :list_cookie_id

  validates :email, presence: true

  def post
    return false unless valid?

    TodoMailer.todo_mail(list_cookie_id, email).deliver_now
    true
  end
end
