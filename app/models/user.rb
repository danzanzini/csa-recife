class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  ROLES = %w(admin producer supporter)

  belongs_to :location

  scope :supporter, -> { where(role: 'supporter') }

  validates :role, inclusion: { in: ROLES }
  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
