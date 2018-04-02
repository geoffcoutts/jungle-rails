require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_length_of(:password)
    .is_at_least(8)
    .is_at_most (16)
    }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    binding.pry
  end

end