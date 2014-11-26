require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'when created' do 
    let(:user_params) do
      {email: 'ziq@ziq.fr', password: 'sefsefsef', password_confirmation: 'sefsefsef'}
    end

    it 'send a reset password mail' do
      expect {
        User.create!(user_params)
      }.to change {deliveries_with_subject('Prenez possession de votre site').count}.by 1     

    end

  end

end
