// param vmName string
param location string
// param adminUsername string
// param vmSize string = 'Standard_D2s_v5'
// param OSVersion string = '2022-datacenter-azure-edition'
// @secure()
// param adminPassword string
// resource vm 'Microsoft.Compute/virtualMachines@2022-03-01' = {
//   name: vmName
//   location: location
//   properties: {
//     hardwareProfile: {
//       vmSize: vmSize
//     }
//     osProfile: {
//       computerName: vmName
//       adminUsername: adminUsername
//       adminPassword: adminPassword
//     }
//     storageProfile: {
//       imageReference: {
//         publisher: 'MicrosoftWindowsServer'
//         offer: 'WindowsServer'
//         sku: OSVersion
//         version: 'latest'
//       }
//       osDisk: {
//         createOption: 'FromImage'
//         managedDisk: {
//           storageAccountType: 'StandardSSD_LRS'
//         }
//       }
//       dataDisks: [
//         {
//           diskSizeGB: 1023
//           lun: 0
//           createOption: 'Empty'
//         }
//       ]
//     }
//     networkProfile: {
//       networkInterfaces: [
//         {
//           id: nic.id
//         }
//       ]
//     }
    
//   }
// }
//param subnetResourceId string
// resource nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
//   name: '${vmName}-nic'
//   location: location
//   properties: {
//     ipConfigurations: [
//       {
//         name: 'ipconfig'
//         properties: {
//           privateIPAllocationMethod: 'Dynamic'
//           publicIPAddress: null // No public IP
//           subnet: {
//             id: subnetResourceId
//           }
//         }
//       }
//     ]
//   }
// }





//define the number of prefixes and declare those here in the format of prefix1, prefix2, prefix3 etc
param numberofRoutes int
var numofRoutes = 5
//need to pass in prefix, name, and nextHopType for routes

for num in whatever
param route object 
param route1 object
param route2 object
param route3 object







var routes = [for num in range(0, numberofRoutes): {
  name: 'route${num}'
  addressPrefix: '${route.name}${num}'
  nextHopType: 
  nextHopIpAddress: ''
}
]



param routeConfig object = {
  name: 'defaultRoute'
  addressPrefix: '0.0.0.0/0'
  nextHopType: 'Internet'
}






