# frozen_string_literal: true

describe os.name do
  it { should eq 'ubuntu' }
end

describe os.release do
  it { should be_in ['20.04', '18.04'] }
end
