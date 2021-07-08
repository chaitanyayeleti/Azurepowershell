#login with source account
Connect-AzAccount

# subscrpitionID of source account
$subID= ""
#snapshoot resource group
$RGName= ""
#Snapshoot name
$snapshotName= ""
$SaasExpiryduration= 3600
#destination Storage account name
$storageaccountname= ""
#destination contianer  name
$storageaccountcontainername= ""
##destination Storage account saas key
$storageaccountkey= ""
#Provide filename on destation -----.vhd
$destinationVHDfilename= "Amtryu.vhd"

Select-AzSubscription -Subscription $subID

$sas = Grant-AzSnapshotAccess -ResourceGroupName $RGName -SnapshotName $snapshotName -DurationInSecond $SaasExpiryduration -Access Read
$destinationContext = New-AzStorageContext -StorageAccountName $storageaccountname -StorageAccountKey $storageaccountkey

Start-AzStorageBlobCopy -AbsoluteUri $sas.AccessSAS -DestContainer $storageaccountcontainername -DestContext $destinationContext -DestBlob $destinationVHDfilename