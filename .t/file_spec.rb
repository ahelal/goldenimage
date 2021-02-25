# frozen_string_literal: true
describe file('/var/goldenimage_version.txt') do
    its('content') { should match 'version:' }
    its('content') { should match 'date:' }
end