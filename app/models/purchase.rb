class Purchase < ActiveRecord::Base

  belongs_to :concert
  belongs_to :user

  attr_accessor :first_name, :last_name, :card_number, :card_expiry

  validates :first_name, :last_name, :ticket_quantity, :card_number, :card_expiry, :presence => true


  serialize :response
    def make_transaction
      response = GATEWAY.purchase((payment_amount*100), credit_card)
      self.response = response
      self.save
      response.success?
    end

  private

    def credit_card
      @credit_card = ActiveMerchant::Billing::CreditCard.new({
        :first_name => first_name,
        :last_name => last_name,
        :number => card_number,
        :month => card_expiry[2],
        :year => card_expiry[1],
        :verification_value => '999'
      })
    end

    def validate_card
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message| errors.add_to_base_message
        end
      end
    end



end
