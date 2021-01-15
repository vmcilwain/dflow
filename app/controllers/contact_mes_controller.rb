class ContactMesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact_me = ContactMe.new
  end

  def create
    @contact_me = ContactMe.new(contact_me_params)

    if @contact_me.save
      NotificationMailer.with(contact_me: @contact_me).contact_me_email.deliver_now
      redirect_to root_path, success: success_message(@contact_me)
    else
      flash[:error] = error_message
      render :new
    end
  end

  def contact_me_params
    params.require(:contact_me).permit(:name, :email, :message)
  end
end
