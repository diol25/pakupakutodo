class ListMailsController < ApplicationController
  def create
    @list_mail_form = ListMailForm.new(email_params)
    TodoMailer.todo_mail(cookies[:todo_list], @list_mail_form.email).deliver_now
    flash[:email] = "Send your PakuPakuTodo!"
    redirect_to root_path
  end

  private

    def email_params
      params.require(:list_mail_form).permit(:email)
    end
end
