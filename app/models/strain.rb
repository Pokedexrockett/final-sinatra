class Strain < ActiveRecord::Base
    belongs_to :user 
    validates :name, :date, :form, :thc, :cbd, :review, presence: true

end