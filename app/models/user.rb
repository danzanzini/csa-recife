class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  ROLES = %w(admin producer supporter)
  MANAGER_ROLES = %w(admin producer)

  belongs_to :location
  has_many :harvests

  scope :supporter, -> { where(role: 'supporter') }
  scope :manager, -> { where.not(role: 'supporter') }

  before_validation :set_password, on: :create

  validates :role, inclusion: { in: ROLES, strict: true }
  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def supporter?
    role == 'supporter'
  end

  def manager?
    MANAGER_ROLES.include?(role)
  end

private
  def set_password
    if password.blank?
      default_password = self.email.split('@').first
      self.password = default_password
      self.password_confirmation = default_password
    end
  end
end
