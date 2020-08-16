# How to find the WSL2 VM IP address?

`ip addr | grep eth0` then look for value under `inet`

See https://docs.microsoft.com/en-us/windows/wsl/compare-versions

# How to let the WSL2 vm connect to local host

**To add**
`netsh interface portproxy add v4tov4 listenport=8081 listenaddress=0.0.0.0 connectport=8081 connectaddress=172.27.216.79`

**to delete**
``netsh interface portproxy add v4tov4 listenport=8081 listenaddress=0.0.0.0 connectport=8081 connectaddress=172.27.216.79`
