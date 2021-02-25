# frozen_string_literal: true

control 'security' do
    impact 1.0

    describe bash('apt  list --upgradable | grep "\-security" | wc -l') do
        its('stdout') { should eq "0\n" }
        its('exit_status') { should eq 0 }
    end

    describe sshd_config do
        its('PasswordAuthentication') { should eq 'no' }
    end
end
