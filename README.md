### How to set up CI for Julia

<details>
From @oxinabox

The TravisCI docs are basically correct
These three steps: https://docs.travis-ci.com/user/tutorial/#to-get-started-with-travis-ci-using-github
but not using the ruby example.

TravisCI’s specific stuff is in https://docs.travis-ci.com/user/languages/julia/
though rather than the extremely minimal `.travis.yml` from that most people use something like
https://github.com/JuliaLang/Example.jl/blob/master/.travis.yml
But if you don’t have docs and don’t want coverage then just the stuff from the Travis docs are fine
i.e.
```yaml
language: julia
os:
  - osx
  - linux
julia:
  - 1.0  # LTS
  - 1  # Stable
  - nightly
```
</details>

### How to find the WSL2 VM IP address?
<details>
`ip addr | grep eth0` then look for value under `inet`

See https://docs.microsoft.com/en-us/windows/wsl/compare-versions
</details>

### How to let the WSL2 vm connect to local host
<details>
**To add**
`netsh interface portproxy add v4tov4 listenport=8081 listenaddress=0.0.0.0 connectport=8081 connectaddress=172.27.216.79`

**to delete**
``netsh interface portproxy add v4tov4 listenport=8081 listenaddress=0.0.0.0 connectport=8081 connectaddress=172.27.216.79`
</details>

### How to get plotting and electron.jl working on WSL2?
<details>
Check this https://github.com/microsoft/WSL/issues/2855

It says
```
WSL runs OpenGL alright, but it is not a supported scenario. You didn't follow the issue template, but in general from a clean Ubuntu install from the store do:

$ sudo apt install ubuntu-desktop mesa-utils
$ export DISPLAY=localhost:0
$ glxgears
On the Windows side, install VcXsrv, choose multiple windows, display 0, start no client, disable native opengl (sic). The hang out for this stuff is generally #637, but if you have a specific scenario I'll hold this open for a bit. It might be your scenario works. It might not.
```
</details>
