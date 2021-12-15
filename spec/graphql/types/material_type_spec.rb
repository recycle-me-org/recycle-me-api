require 'rails_helper'

RSpec.describe Types::MaterialType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type("Int!") }
  it { is_expected.to have_field(:name).of_type("String") }
end
