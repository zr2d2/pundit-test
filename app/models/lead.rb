class Lead < ActiveRecord::Base
  include MultiTenantModel

  has_many :emails

  validates :name,  :presence => true
  validates :email, :presence => true
end
