# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-rsv-basic-resources'


describe azure_generic_resource(resource_group: resource_group1, name: 'rsv-uks-test-basic') do
  it { should exist }
  its('location') {should eq 'uksouth'}
  its('sku.name') { should eq 'Standard' }
  # its('properties.StorageModelType') { should cmp 'GeoRedundant' }
  # its('properties.CrossRegionRestoreFlag') { should cmp 'false' }
  # its('properties.StorageModelType') { should cmp 'ReadWrite' }
end
