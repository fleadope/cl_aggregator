require 'spec_helper'

describe User do

    describe User do
        it "fails validation without an email" do
            user = Fabricate.build(:user, email: "")
            expect(user).to have(1).error_on(:email)
        end

        it "should accept valid email addresses" do
            addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
            addresses.each do |address|
                valid_email_user = Fabricate.build(:user, email: address)
                expect(valid_email_user).to be_valid
            end
        end

        it "should reject invalid email addresses" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
            addresses.each do |address|
                invalid_email_user = Fabricate.build(:user, email: address)
                expect(invalid_email_user).to have(1).error_on(:email)
            end
        end

        it "should reject duplicate email addresses" do
            user = Fabricate(:user)
            user_with_duplicate_email = Fabricate.build(:user, email: user.email)
            expect(user_with_duplicate_email).to have(1).error_on(:email)
        end

        it "should reject email addresses identical up to case" do
            valid_user = Fabricate(:user)
            upcased_email = valid_user.email.upcase
            user_with_duplicate_email = Fabricate.build(:user, email: upcased_email)
            expect(user_with_duplicate_email).to have(1).error_on(:email)
        end
    end

    describe "passwords" do

        let(:user) { Fabricate.build(:user) }

        it "should have a password attribute" do
            expect(user).to respond_to(:password)
        end

        it "should have a password confirmation attribute" do
            expect(user).to respond_to(:password_confirmation)
        end

        describe "password validations" do

            it "should require a password" do
                user.password = user.password_confirmation = ""
                expect(user).to have(1).error_on(:password)
            end

            it "should require a matching password confirmation" do
                user.password_confirmation = "invalid"
                expect(user).to have(1).error_on(:password_confirmation)
            end

            it "should reject short passwords" do
                short = "a" * 5
                user.password = user.password_confirmation = short
                expect(user).to_not be_valid
            end

        end

        describe "password encryption" do

            it "should have an encrypted password attribute" do
                expect(user).to respond_to(:encrypted_password)
            end

            it "should set the encrypted password attribute" do
                encrypted_password = Fabricate(:user).encrypted_password
                expect(encrypted_password).not_to be_blank
            end

        end
    end

end
