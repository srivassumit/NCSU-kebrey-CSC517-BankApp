class AccountRequestsController < ApplicationController
  def index
    @requests = AccountRequest.all
  end

  def create
    @request = AccountRequest.new({user_id: params[:user_id]})
    if @request.save
      redirect_to accounts_path, notice: 'Account was successfully requested'
    else
      redirect_to accounts_path, notice: 'Account request failed'
    end
  end

  def destroy
    @request = AccountRequest.find(params[:id])
    if @request.destroy
      redirect_to account_requests_path, notice: 'Request was successfully dismissed.'
    else
      redirect_to account_requests_path, notice: 'Request was not dismissed.'
    end
  end
end
