class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :statuses, dependent: :destroy

  validates :profile_name, presence: true, uniqueness: true, format: {with: /\A[a-zA-Z0-9_-]+\z/}

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    normalized_email = email.strip.downcase
    hash = Digest::MD5.hexdigest(normalized_email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
end
