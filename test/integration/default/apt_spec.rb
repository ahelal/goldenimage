# frozen_string_literal: true

control 'apt' do
    impact 1.0
    title 'Packages that must be installed'
    describe package('auditd') do
        it { should be_installed }
    end
end
