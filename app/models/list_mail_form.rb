class ListMailForm
  include ActiveModel::Model

  attr_accessor :email

  validates :email, presence: true

  def post
    return false unless valid?

    TodoMailer.todo_mail(cookies[:todo_list], @list_mail_form.email).deliver_now
    true
  end
end
