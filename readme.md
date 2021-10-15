# Docker - bind9

This repo is used to run a local DNS server in order to allow local web application development with named url

## Configuration

Before building the image , configurate the local and option conf in the directory `config` and add zones in the directory `config/zones`

    /config
    |-- named.conf.local : describe local zone
    |-- named.conf.options : set bind9 options
    |-- /zones
        |-- com.xxxx.conf : description file for zone com.xxxx.conf

You can find an example config in `example`

## Commands

-   build : `npm run build` : build the container
-   run : `npm start` : run the build container
-   debug : `npm run debug`: bind the zone config to local file so that you can change the zone config without rebuilding the container
-   refresh : `npm run refresh`: restart bind9 in the container to refresh zone config

## Tests

Before testing, modify your DNS configuration to be sure to use the launch container.
Then, you can use the dig command to test DNS resolution :

    dig example1.localhost.com
