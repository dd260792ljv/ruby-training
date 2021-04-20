# frozen_string_literal: true

module FeatureHelper
  def sign_up_user(user)
    @sign_up_page = SignUpPage.new
    @user = user

    @sign_up_page.login.set @user.user_name
    @sign_up_page.password.set @user.password
    @sign_up_page.password_confirm.set @user.password
    @sign_up_page.firstname.set @user.first_name
    @sign_up_page.lastname.set @user.last_name
    @sign_up_page.email.set @user.email
    @sign_up_page.submit_btn.click
  end

  def sign_in_user(user_name, password)
    @sign_in_page = SignInPage.new

    @sign_in_page.username.set user_name
    @sign_in_page.password.set password
    @sign_in_page.login_btn.click
  end
end

World(FeatureHelper)
