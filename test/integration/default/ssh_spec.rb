# frozen_string_literal: true

describe sshd_config do
  its('PasswordAuthentication') { should eq 'no' }
end
