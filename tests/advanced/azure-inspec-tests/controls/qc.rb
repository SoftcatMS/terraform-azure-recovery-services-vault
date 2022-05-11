# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-rsv-advanced-resources'


describe azure_generic_resource(resource_group: resource_group1, name: 'rsv-uks-test-advanced') do
  it { should exist }
  # its('location') {should eq 'uksouth'}
  # its('sku.name') { should eq 'Standard' }
end
