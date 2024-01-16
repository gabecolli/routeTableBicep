//you define your routes here in code

param targetSubnetPrefix string


@description('just the vnet name and the subnet name  vnet/subnet')
param subnetId string

param routeConfigs array 
// your array needs to look like this
// var routeConfigs = [
//   routeConfig1
//   routeConfig2
//   routeConfig3  
// ]

// the objects in the array need to look like this.
// var routeConfig1 = {
//   name: 'route1'
//   addressPrefix: '20.118.99.224/32'
//   nextHopType: 'Internet'
// }






param location string = resourceGroup().location



// Get a reference to the existing subnet
resource existingSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  name: subnetId
}

// Define a new subnet resource with the same name to modify its properties
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' = {
  name: existingSubnet.name
  properties: {
    // Specify the properties you want to change
    addressPrefix: targetSubnetPrefix
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
