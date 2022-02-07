class ForgotpasswordController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: "If an account was found, we have sent an email with instructions to you."

  end


  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert:"Your token has expired, please try again."
  end


  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(forgot_password_params)
      redirect_to login_path, notice: "Password successfully updated, you can now login in."
    else
      render :edit
    end
  end

  private
  def forgot_password_params
    params.require(:user).permit(:password, :password_confirmation)

  end

end
