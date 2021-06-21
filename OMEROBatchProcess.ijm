run("MacrOmero ext");

//Enter details for connection to OMERO and select Macro to run on Dataset
#@ String (label = "username", value = "public") user
#@ String (label = "password", style="password", value = "public") pass
#@ String (label = "server", value = "camdu.warwick.ac.uk") host
#@ Integer (label = "port", value = 4064) port
#@ Integer (label = "Dataset ID", value = 10000) dataset_id
#@ File (label = "Macro", style="file") input

//Connect to server and apply macro to each image in dataset
Ext.openServer(user,pass,host,port);
images = split(Ext.getImagesFromDataset(dataset_id),";");
print(dataset_id);
for (i = 0; i < images.length; i++) {
	Ext.getImageFromId(images[i]);
	print(images[i]);
	runMacro(input,images[i]);
}
//Close connection to server
Ext.closeServer();