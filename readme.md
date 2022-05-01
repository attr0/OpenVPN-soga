# OpenVPN to v2ray Node

Convert OpenVPN to a v2ray node based on docker. Use [soga](https://github.com/vaxilu/soga) as the v2ray backend.



# Usage

## Environment Requirement

- Docker
- Docker Compose



Please prepare them yourself and clone this project into your disk

```bash
git clone https://github.com/attr0/openvpn2soga.git openvpn2soga
cd openvpn2soga
```



## Build Image

This will generate a image including the latest soga and openvpn

```bash
chmod +x ./build_container.sh
./build_container.sh
```



The image is called `openvpn-soga`. Use the following command to see.

```
docker image ls
```



## Configuration

**One folder means one node.**

Please copy node-example to your-node. 

```bash
cp node-example <your-node>
```



There are four configuration

- `soga.conf`

    soga configuration file, please change to yours

    

- `vpn.ovpn`

    openvpn configuration file, please change to yours

    If password auth is required, change

    ```
    auth-user-pass
    ```

    To

    ```
    auth-user-pass /vpn.auth
    ```

    

- `vpn.auth`

    auth file for openvpn. If password auth is required, pleace change it to

    ```
    your_username
    your_password
    ```

    

- `docker-compose.yml`

    controls the name of the container, ports, and file

    - change container name to yours (must be unique)

    - change ports as you desired (must follow the v2ray configuration)

    - change file map if you wish

        > !DO NOT CHANGE THE FILE PATH IN THE CONTAINER SIDE (RIGHT OF THE COLON)



## Start

```bash
docker-compose up -d
docker logs <your_container_name>
```

Start up the container, and print the log



In case you need to change your configuration

```bash
docker restart <your_container_name>
```



## Update

1. Rebuild the image

    ```bash
    ./build_container.sh
    ```

2. Recompose

    ```bash
    cd <your_node>
    docker-compose up -d
    ```

    



Enjoy it.
