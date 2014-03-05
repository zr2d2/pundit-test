class EmailsController < ApplicationController
  skip_before_filter :require_login
  #before_filter :require_login
  before_filter :confirm

  def index
    @emails = policy_scope(Email).decorate #Email.all
    p "emails: #{@emails.inspect}"
    authorize @emails
  end

  #def new
  #  @email = Email.new
  #end

  def create
  end

private
  def confirm
    logger.debug 'here'
  end
end
