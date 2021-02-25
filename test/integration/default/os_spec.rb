# frozen_string_literal: true

control 'OS' do
  impact 1.0
  title 'Compatible OS'

  describe os.name do
    it { should eq 'ubuntu' }
  end

end

