class TodoMailer < ApplicationMailer

  default from: 'no-reply@pakupaku.com'

  def todo_mail(cookie, email)
    @url = 'https://pakupaku-todo.herokuapp.com/' + "?todo_list=#{cookie}"
    mail(to: email, subject: 'PakuPakuTodoのリスト保管')
  end
end
