class ListMailsController < ApplicationController
  def create
    @list_mail_form = ListMailForm.new(email_params)
    if @list_mail_form.post
      flash[:email] = "Send your PakuPakuTodo!"
    else
      flash[:error] = @list_mail_form.errors.any? ? "Form error" : "Fail to send"
    end
    redirect_to root_path
  end

  private

    def email_params
      params.require(:list_mail_form).permit(:email)
    end
end
