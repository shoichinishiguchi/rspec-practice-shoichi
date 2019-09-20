require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do

    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it {is_expected.to validate_presence_of :first_name}
    it {is_expected.to validate_presence_of :last_name}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_uniqueness_of(:email).case_insensitive}

    ## 下記4つは上の4つと同じ
    # it "is invalid without a first name" do
    #   user = FactoryBot.build(:user, first_name: nil)
    #   user.valid?
    #   expect(user.errors[:first_name]).to include("can't be blank")
    # end


    # it "is invalid without a last name" do
    #   user = FactoryBot.build(:user, last_name: nil)
    #   user.valid?
    #   expect(user.errors[:last_name]).to include("can't be blank")
    # end

    # it "is invalid without an email adress" do
    #   user = FactoryBot.build(:user, email: nil)
    #   user.valid?
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    # it "is invalid with a duplicate email adress" do
    #   FactoryBot.create(:user,email: "aaron@example.com")
    #   user = FactoryBot.build(:user, email: "aaron@example.com")
    #   user.valid?
    #   expect(user.errors[:email]).to include("has already been taken")
    # end

    it "returns a user's full name as a string" do
      user = FactoryBot.build(:user, first_name: "John", last_name:"Doe")
      expect(user.name).to eq "John Doe"
    end
  end

  it "sends a welcome email on account creation" do
    allow(UserMailer).to \
      receive_message_chain(:welcome_email, :deliver_later)
    user = FactoryBot.create(:user)
    expect(UserMailer).to have_received(:welcome_email).with(user)
  end

end
