require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }

  end

end
