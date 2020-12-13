class Customer < ApplicationRecord
  after_create :create_cart
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  has_one :cart
  has_many :orders
  has_secure_password

  def self.from_token_request(request)
    email = request.params&.[]('auth')&.[]('email')
    find_by email: email
  end

  def admin?
    false
  end


  private
  
  def create_cart
    Cart.create(customer_id: id, value: 0)
  end

  end
  