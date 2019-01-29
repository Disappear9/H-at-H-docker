# Hentai@Home on Docker

## Install

replace '/DOWNLOAD_DIR' and 'YOUR_CLIENT_KEY'

## Run command below:

	sudo docker pull Disappear9/h-at-h

	sudo docker volume create h-at-h_data
	
	sudo docker run -d --name h-at-h -p port:port -v h-at-h_data:/hath/data -v /DOWNLOAD_DIR:/hath/download -e HatH_KEY=YOUR_CLIENT_KEY Disappear9/h-at-h

