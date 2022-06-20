class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create_commit :create_cart_detail
  has_one :cart
  has_one :user_detail

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :username, presence: false, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable,  
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist


  private

    def create_cart_detail
      curent_user=User.find_by(email: self.email)
      p curent_user.id
      x=Cart.new(user_id: curent_user.id)
      p x.save(:validate => false)
    end

    


end
