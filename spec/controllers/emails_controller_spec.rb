require 'spec_helper'

describe EmailsController do

  before do
    login_as :default
  end

  describe 'GET index', focus:true do
    it 'assigns emails as @emails' do
      p "test current_user: #{current_user.inspect}"
      email = create :email, user: current_user
      p "test email #{email.inspect}"
      get :index
      assigns(:emails).should eq email
    end
  end

  describe 'GET show' do
    it 'assigns the email as @email' do
      Rails.logger.debug 'begin test'
      email = create :email, user: current_user
      Rails.logger.debug 'before get index'
      get :index
      Rails.logger.debug 'after get index'
      assigns(:emails).should eq email
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Email" do
        @email = create :email
        @email = build :email, email: @email
        expect {
          post :create, email: @email
        }.to change(Email, :count).by(1)
      end

      it "assigns the newly created email as @email" do
        post :create, :email => valid_attributes
        assigns(:email).should be_a(Email)
        assigns(:email).should be_persisted
      end

      it "redirects to the email" do
        post :create, :email => valid_attributes
        response.should redirect_to(admin_email_path(email.first))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved email as @email" do
        # Trigger the behavior that occurs when invalid params are submitted
        emailNote.any_instance.stub(:save).and_return(false)
        post :create, :email => {}
        assigns(:email).should be_a_new(emailNote)
      end

      it "re-renders the 'email show' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        emailNote.any_instance.stub(:save).and_return(false)
        post :create, :email => {}
        response.should render_template("admin/emails/show")
      end
    end
  end
end