# frozen_string_literal: true

describe package('azure-cli') do
    it { should be_installed }
end

describe package('auditd') do
    it { should be_installed }
end