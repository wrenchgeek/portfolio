require 'rails_helper'

describe Project do
  it { should validate_presence_of :title}
  it { should validate_presence_of :description}
  it { should validate_presence_of :url}
  it { should belong_to :skill }
end
