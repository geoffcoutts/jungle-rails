require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validations' do
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_length_of(:password)
    .is_at_least(8)
    .is_at_most (16)
    }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  context 'instance methods' do
    before do
      @user1 = User.create(password: "12345678",
         password_confirmation: "12345678",
         email: "g@c.com",
         first_name: "geoff",
         last_name: "coutts"
         )
      @user1.save
      # @user2 = User.create(password: "12345678",
      #    password_confirmation: "12345678",
      #    email: "dfdaf@fdfas.com",
      #    first_name: "geoff",
      #    last_name: "coutts"
      #    )
      # @user2.save
    end

    describe '.authenticate_with_credentials' do
      it "should not find user by email if it doesn't exist" do
        expect(User.authenticate_with_credentials("gc@gc.com", "12345678")).to eql(false)
      end
      it 'should find user by email' do
        expect(User.authenticate_with_credentials("g@c.com", "12345678")).to eql(@user1)
      end
      it 'should find user by email even with the wrong case' do
        expect(User.authenticate_with_credentials("G@C.com", "12345678")).to eql(@user1)
      end
      it 'should fail to authenticate the password if it does not match the user' do
        expect(User.authenticate_with_credentials("g@c.com", "abcdefgh")).to eql(false)
      end
    end
  end

end
