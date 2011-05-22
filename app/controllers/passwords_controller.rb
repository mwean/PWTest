class PasswordsController < ApplicationController
  def test_password
    render 'test_password'
  end
  
  def test
    @password = params[:password][:pass]
    render 'show_password'
  end
end
