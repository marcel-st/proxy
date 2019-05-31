# PHP Based proxy

This is a PHP based proxy running in a CentOS 7 container

I stole the idea from the pirate bay proxy scripts :-)

It's not working anymore, i need some time to fix it..

## Usage

docker create \
--name proxy \
 -p 80:80 \
lgalastacia/proxy

## Parameters

- --name : Give the docker container a logical name
- -p : map network ports

## Notes

I take no responsibility for how anyone uses this proxy, i don't condone any usage that could or would result in access to illegal acquired data.
