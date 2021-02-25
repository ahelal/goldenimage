# frozen_string_literal: true

describe user('root') do
  it { should exist }
  its('shell') { should eq '/bin/nologin' }
end
