class Email < ActiveRecord::Base
  include MultiTenantModel

  belongs_to :user
  belongs_to :lead
end
