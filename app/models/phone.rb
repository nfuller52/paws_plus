class Phone < ActiveRecord::Base
  enum phone_type: [:mobile, :home, :business, :fax]

  validates :number, presence: true, length: { is: 10 }
  validates :phone_type, presence: true

  def number=(value)
    write_attribute(:number, value.to_s.gsub(/\D/, ''))
  end
end
