# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'validates presence and uniqueness of email' do
      should validate_presence_of(:email)
      should validate_uniqueness_of(:email).ignoring_case_sensitivity
    end

    it 'validates presence of name and password' do
      should validate_presence_of(:name)
      should validate_presence_of(:password)
    end
  end
end
