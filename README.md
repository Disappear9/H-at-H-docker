# Hentai@Home on Docker

## Tags

`arm`: For arm32v6 arm32v7  
`arm64`: For arm64v8  
`x64/latest`: For x64(Linux)  
`i386`: For x32(Linux)  

I can't offer image for windows due to the limitation of the DockerHub's Autobuild system.

## Deploy

Replace `/DOWNLOAD_DIR` `YOUR_CLIENT_KEY` `YOUR_PORT` with yours.

### The format of `YOUR_CLIENT_KEY`

`"$Client ID"-"$Client Key"` like this: `000000-ABCDEFGHIJKLMN1234OP`

### About `YOUR_PORT`

https://ehwiki.org/wiki/Technical_Issues#Ports 

## Run command below:
	#Pull image
	sudo docker pull disappear9/hentaiathome

	#Create volume for caches and logs
	sudo docker volume create h_at_h_data
	
	#Run it
	sudo docker run -d --name h_at_h -p YOUR_PORT:YOUR_PORT -v h_at_h_data:/hath/data -v /DOWNLOAD_DIR:/hath/download -e HatH_KEY=YOUR_CLIENT_KEY disappear9/hentaiathome

## Update:
	#Stop
	sudo docker stop h_at_h
	
	#Delete
	sudo docker rm h_at_h
	
	#Delete old image
	sudo docker rmi disappear9/hentaiathome
	
	#Pull new image
	sudo docker pull disappear9/hentaiathome
	
	#Run it
	sudo docker run -d --name h_at_h -p YOUR_PORT:YOUR_PORT -v h_at_h_data:/hath/data -v /DOWNLOAD_DIR:/hath/download disappear9/hentaiathome
	Or
	sudo docker run -d --name h_at_h --net host -v h_at_h_data:/hath/data -v /DOWNLOAD_DIR:/hath/download disappear9/hentaiathome
	If you want to change port in the future.
	

## For Unraid user:
Add this to `Template repositories`: `https://github.com/Disappear9/dockerfile-other`

### About `Port:`
	(Container Port) and (Host Port) should be identical, 
	or you could just switch to (Advanced View), and set (Network Type) to (Host).
