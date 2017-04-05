class User < ActiveRecord::Base

  acts_as_authentic

  has_many :purchases

  has_and_belongs_to_many :roles

  def has_role?(role_sym)
    roles.any? {|r| r.name.underscore.to_sym == role_sym }
  end

end
