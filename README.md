# How to find the WSL2 VM IP address?

`ip addr | grep eth0` then look for value under `inet`

See https://docs.microsoft.com/en-us/windows/wsl/compare-versions

# How to let the WSL2 vm connect to local host

**To add**
`netsh interface portproxy add v4tov4 listenport=8081 listenaddress=0.0.0.0 connectport=8081 connectaddress=172.27.216.79`

**to delete**
``netsh interface portproxy add v4tov4 listenport=8081 listenaddress=0.0.0.0 connectport=8081 connectaddress=172.27.216.79`

# How to get plotting and electron.jl working on WSL2?

Check this https://github.com/microsoft/WSL/issues/2855

It says
```
WSL runs OpenGL alright, but it is not a supported scenario. You didn't follow the issue template, but in general from a clean Ubuntu install from the store do:

$ sudo apt install ubuntu-desktop mesa-utils
$ export DISPLAY=localhost:0
$ glxgears
On the Windows side, install VcXsrv, choose multiple windows, display 0, start no client, disable native opengl (sic). The hang out for this stuff is generally #637, but if you have a specific scenario I'll hold this open for a bit. It might be your scenario works. It might not.
```
