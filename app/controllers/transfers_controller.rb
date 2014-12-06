class TransfersController < ApplicationController
  def create
    to_user = User.find(params[:transfer][:user_id])
    to_user.balance += params[:transfer][:amount].to_i

    if params[:transfer][:amount].to_i <= session[:balance] && to_user.save
      session[:balance] -= params[:transfer][:amount].to_i
      current_user.update(balance: session[:balance])

      flash[:notice] = 'successful transfer'
    else
      flash[:error] = 'failed to transfer'
    end

    redirect_to user_path(current_user)
  end
end
