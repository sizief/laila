require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.create(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password
  ) }

  let(:first_name) { 'John' }
  let(:last_name) { 'Doe' }
  let(:email) { 'email@gmail.com' }
  let(:password) { 'papapa33' }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
    expect(subject.token).not_to be_empty
  end

  context 'validations' do
    it 'is shoud throw an error for email uniqueness' do
      User.create(email: email, password: password)
      expect(subject).not_to be_valid
    end
  end
end
