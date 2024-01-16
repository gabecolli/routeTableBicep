using './routetableModule.bicep'

//define as many routes as necessary

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



@description('just the vnet name and the subnet name  vnet/subnet')
param subnetId =  'nigc-testvnet/default'

param location = 'southcentralus'

param targetSubnetPrefix = '10.0.0.0/24'


param routeConfigs = [
  routeConfig1
  routeConfig2
  routeConfig3
]
