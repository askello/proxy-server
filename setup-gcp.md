# Run proxy-server on Compute Engine (Google Cloud)

## 1. Server setup:
1. server name: "proxy-server-{zone}-{n}"
2. series: N1, Machine type: f1-micro
3. os: Ubuntu 22.04 LTS Minimal

## 2. Install docker:
```shell
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce
```
    
## 3. Configure docker user (to work without sudo)
```shell
sudo passwd ${USER}
sudo usermod -aG docker ${USER}
su - ${USER}
```
    
## 4. Start proxy server
```shell
docker run -d --restart unless-stopped -p 8888:8888 -e PROXY_AUTH_USER=user -e PROXY_AUTH_PASSWORD=12345 askello/proxy-server
```
