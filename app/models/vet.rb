class Vet < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :confirmable,
         :recoverable,
         :validatable,
         :trackable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip, presence: true, length: { is: 5 }
end
