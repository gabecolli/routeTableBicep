var routeConfig1 = {
  name: 'route1'
  addressPrefix: '20.118.99.224/32'
  nextHopType: 'Internet'
}

var routeConfig2 = {
  name: 'route2'
  addressPrefix: '40.83.235.53/32'
  nextHopType: 'Internet'
}

var routeConfig3 = {
  name: 'route3'
  addressPrefix: '23.102.135.246/32'
  nextHopType: 'Internet'
}

var routeConfigs = [
  routeConfig1
  routeConfig2
  routeConfig3  
]


// Get a reference to the existing subnet
resource existingSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  name: 'nigc-testvnet/default'
}

// Define a new subnet resource with the same name to modify its properties
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: existingSubnet.name
  properties: {
    // Specify the properties you want to change
    addressPrefix: '10.0.0.0/24'
    routeTable: {
      id: routetable.id
    }
  }
}


resource routetable 'Microsoft.Network/routeTables@2023-04-01' = {
  name: 'license-rt'
  location: location
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  properties: {
    routes: [
      for route in routeConfigs: {
        name: route.name
        properties: {
          addressPrefix: route.addressPrefix
          nextHopType: route.nextHopType
        }
      }
    ]
  }
}
