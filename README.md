# Hentai@Home on Docker

## Support platforms:

	linux/amd64
	linux/arm64
	linux/arm
	linux/ppc64le
	linux/386
	
### For i386/x32:
Eclipse temurin don't have images for i386/x32 , i use ibmjava instead.  
So use tag `ghcr.io/disappear9/hentaiathome:i386`  


## Deploy

Replace `/DOWNLOAD_DIR` `YOUR_CLIENT_KEY` `YOUR_PORT` with yours.

### The format of `YOUR_CLIENT_KEY`

`"$Client ID"-"$Client Key"` like this: `000000-ABCDEFGHIJKLMN1234OP`

### About `YOUR_PORT`

https://ehwiki.org/wiki/Technical_Issues#Ports 

### Proxy (>=1.6.3)

Add these environment variables:  
```
ImageProxyHost
ImageProxyType
ImageProxyPort
```

quote: https://forums.e-hentai.org/index.php?showtopic=234458
```
--image-proxy-host=<host> - hostname or IP address for the proxy
--image-proxy-type=<type> - can be "socks" or "http". defaults to "socks" if not provided
--image-proxy-port=<port> - the port of the proxy. defaults to 1080 for SOCKS and 8080 for HTTP if not provided

It does not support proxies that require authentication.

While it will technically work to use Tor as a SOCKS proxy, this should be avoided as Tor is too slow for this purpose.
```

## Run command below:
	#Pull image
	sudo docker pull ghcr.io/disappear9/hentaiathome:latest

	#Create volume for caches and logs
	sudo docker volume create h_at_h_data
	
	#Run it
	sudo docker run -d --name h_at_h -p YOUR_PORT:YOUR_PORT -v h_at_h_data:/hath/data -v /DOWNLOAD_DIR:/hath/download -e HatH_KEY=YOUR_CLIENT_KEY ghcr.io/disappear9/hentaiathome

## Update:
	#Stop
	sudo docker stop h_at_h
	
	#Delete
	sudo docker rm h_at_h
	
	#Delete old image
	sudo docker rmi ghcr.io/disappear9/hentaiathome
	
	#Pull new image
	sudo docker pull ghcr.io/disappear9/hentaiathome
	
	#Run it
	sudo docker run -d --name h_at_h -p YOUR_PORT:YOUR_PORT -v h_at_h_data:/hath/data -v /DOWNLOAD_DIR:/hath/download ghcr.io/disappear9/hentaiathome
 
	Or
	sudo docker run -d --name h_at_h --net host -v h_at_h_data:/hath/data -v /DOWNLOAD_DIR:/hath/download ghcr.io/disappear9/hentaiathome
	If you want to change port in the future.

 
## Using docker-compose:  
	version: '3'
	
	services:
	  h_at_h:
	    image: ghcr.io/disappear9/hentaiathome:latest
	    volumes:
	      - h_at_h_data:/hath/data
	      - /LOCAL_DOWNLOAD_FOLDER:/hath/download
	    ports:
	      - YOUR_PORT:YOUR_PORT
	    restart: unless-stopped
	    environment:
	      - HatH_KEY=YOUR_CLIENT_ID-YOUR_CLIENT_KEY
	
	volumes:
	  h_at_h_data:

## For Unraid user:
<del> Add this to `Template repositories`: `https://github.com/Disappear9/dockerfile-other` </del>  
Okay? unraid [removed Template Repositories](https://forums.unraid.net/topic/112170-allow-template-repositories-to-be-hosted-from-other-sources/#comment-1021630)😅  

### About `Port:`
	(Container Port) and (Host Port) should be identical, 
	or you could just switch to (Advanced View), and set (Network Type) to (Host).
 
## Changelog
2020/10/06 Graceful shutdown  
2021/06/09 DockerHUB has stopped free plan from using Autobuild feature, until i found other ways to update image, there will not have any update.  
2021/07/01 Now using Github action to build image.  
2022/06/04 Use Eclipse temurin images.  
2023/01/10 My DockerHub account got deleted for no reason, move image to ghcr.io  
2023/09/16 Update to 1.6.2 & Add docker-compose to documentation  
2024/05/16 Update to 1.6.3 & Add proxy support  
