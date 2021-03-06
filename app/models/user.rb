 class User < ActiveRecord::Base
    before_save do |user| 
            user.email = email.downcase 
            user.remember_token = SecureRandom.urlsafe_base64
          end

    has_many :microposts, dependent: :destroy
          
    validates :name, presence: true, length: { in: 9..30 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    # Rails provides a single method to implement password functionality. Works as long as perscribed names for passwrod fields are followed
    has_secure_password

    def feed
      Micropost.where("user_id = ?", id)
    end
    
 end    
