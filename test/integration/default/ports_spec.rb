# frozen_string_literal: true

excluded_ports = [ "22", "51"]
describe port.where { protocol =~ /tcp/ && excluded_ports.include?(port) && port <= 10000 } do
  it { should_not be_listening }
end

# describe port.where { protocol =~ /tcp/ && port != 22 && port != 53 && port <= 10000 } do
#   it { should_not be_listening }
# end
