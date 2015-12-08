class Vet < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :confirmable,
         :recoverable,
         :validatable,
         :trackable,
         :lockable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip, presence: true, length: { is: 5 }
  validates :phone, presence: true, length: { is: 10 }

  def phone=(value)
    write_attribute(:phone, value.to_s.gsub(/\D/, ''))
  end
end
