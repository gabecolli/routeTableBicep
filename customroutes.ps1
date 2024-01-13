# First, get the virtual network that hosts the VMs that have activation problems. In this case, we get virtual network ArmVNet-DM in Resource Group ArmVNet-DM:
$vnet = Get-AzVirtualNetwork -ResourceGroupName "ArmVNet-DM" -Name "ArmVNet-DM"

# Next, create a route table:
$RouteTable = New-AzRouteTable -Name "ArmVNet-DM-KmsDirectRoute" -ResourceGroupName "ArmVNet-DM" -Location "centralus"

# Next, configure the route table:
Add-AzRouteConfig -Name "DirectRouteToKMS" -AddressPrefix 23.102.135.246/32 -NextHopType Internet -RouteTable $RouteTable
Add-AzRouteConfig -Name "DirectRouteToAZKMS01" -AddressPrefix 20.118.99.224/32 -NextHopType Internet -RouteTable $RouteTable
Add-AzRouteConfig -Name "DirectRouteToAZKMS02" -AddressPrefix 40.83.235.53/32 -NextHopType Internet -RouteTable $RouteTable

Set-AzRouteTable -RouteTable $RouteTable

# Next, attach the route table to the subnet that hosts the VMs:
Set-AzVirtualNetworkSubnetConfig -Name "Subnet01" -VirtualNetwork $vnet -AddressPrefix "10.0.0.0/24" -RouteTable $RouteTable

Set-AzVirtualNetwork -VirtualNetwork $vnet