class Offering < ApplicationRecord
  belongs_to :location
  has_many :offers, dependent: :destroy

  validates :closes_at, presence: true

  scope :not_closed, -> { where("closes_at > ?", Time.zone.now) }
  scope :by_location, -> (location) { where(location: location) }

  def status
    return 'Encerrada' if closed?
    published ? 'Publicada' : 'Não publicada'
  end

  def offers_list
    offers.product_names
  end

  def closed?
    Time.zone.now > closes_at
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
    closes_at&.strftime('%d-%m')
  end

  def closes_at_time
    closes_at
  end

  def publish!
    update!(published: true)
  end

private

    def set_closes_at
      if @closes_at_date && @closes_at_time
        self.closes_at = Time.zone.parse("#{@closes_at_date} #{@closes_at_time}")
      end
    end
end
