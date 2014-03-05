require 'spec_helper'

describe EmailPolicy do
  subject {EmailPolicy}
  let(:owner)       {create :user}
  let(:email)       {create :email}
  let(:owned_email) {create :email, user: owner, subject: 'owned'}

  permissions :index?, :show? do
    it {should     permit owner, owned_email}
    it {should_not permit owner, email}
  end

  permissions :create? do
    it {should     permit owner, owned_email}
    it {should_not permit owner, email}
  end

  context 'permitted_attributes' do
    it 'allows subject and body' do
      params = subject.new(Email,Email).permitted_attributes
      expect(params).to include :subject
      expect(params).to include :body
    end
  end

  context 'scope' do
    it 'only includes emails sent by the user' do
      email # in order to create it
      owned_email # in order to create it
      items = subject::Scope.new(owner,Email).resolve.to_a
      expect(items).to     include owned_email
      expect(items).to_not include email
    end
  end

end