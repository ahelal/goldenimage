# frozen_string_literal: true

control 'sysctl-01' do
  impact 1.0
  title 'IPv4 Forwarding'
  describe kernel_parameter('net.ipv4.ip_forward') do
    its(:value) { should eq 0 }
  end
  describe kernel_parameter('net.ipv4.conf.all.forwarding') do
    its(:value) { should eq 0 }
  end
end

control 'os-11' do
  impact 1.0
  title 'Protect log-directory'
  desc 'The log-directory /var/log should belong to root'
  describe file('/var/log') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    its(:group) { should match(/^root|syslog$/) }
  end
end
