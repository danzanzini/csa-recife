class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  ROLES = %w(admin producer supporter)
  MANAGER_ROLES = %w(admin producer)

  belongs_to :location

  scope :supporter, -> { where(role: 'supporter') }
  scope :manager, -> { where.not(role: 'supporter') }

  validates :role, inclusion: { in: ROLES, strict: true }
  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def supporter?
    role == 'supporter'
  end
end
