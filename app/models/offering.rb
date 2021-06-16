class Offering < ApplicationRecord
  belongs_to :location
  has_many :offers, dependent: :destroy
  has_many :harvests
  has_many :harvested_products, through: :harvests

  validates :closes_at, presence: true

  scope :not_closed, -> { where("closes_at > ?", Time.zone.now) }
  scope :by_location, -> (location) { where(location: location) }
  scope :published, -> { where(published: true) }
  scope :active, -> { not_closed.published }

  accepts_nested_attributes_for :offers, allow_destroy: true, reject_if: :all_blank

  def harvested_by(user)
    harvests.by_user(user).last
  end

  def status
    return 'Encerrada' if closed?
    published ? 'Publicada' : 'Não publicada'
  end

  def offers_list
    offers.with_amount.product_names
  end

  def closed?
    Time.zone.now > closes_at
  end

  def available_amount_for(product_name)
    offers.where(product_name: product_name).sum(:amount) -
    harvested_products.where(product_name: product_name).sum(:amount)
  end

  def closes_at_date=(date)
    @closes_at_date = date
    set_closes_at
    date
  end

  def closes_at_time=(time)
    @closes_at_time = "#{time.values[3]}:#{time.values[4]}"
    set_closes_at
    time
  end

  def closes_at_date
    closes_at&.strftime('%d-%m-%Y')
  end

  def closes_at_time
    closes_at
  end

  def publish!
    update!(published: true)
  end

  def total_harvested
    harvested_products.sum(:amount)
  end

private

    def set_closes_at
      if @closes_at_date && @closes_at_time
        self.closes_at = Time.zone.parse("#{@closes_at_date} #{@closes_at_time}")
      end
    end
end
