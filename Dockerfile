# The line below states we will base our new image on the Latest Official Ubuntu 
FROM debian:latest

#
# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y && apt-get install qt5-default libfftw3-dev cmake pkg-config git gpg curl -y
COPY  run.sh /root
Run ./root/run.sh

#CMD ['rails s -p 3001']
