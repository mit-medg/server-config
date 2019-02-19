# server-config
Additional configuration for MEDG servers.

The following files should be added to a CSAIL Ubuntu installation.

- `etc/csail`: user whitelist
- `etc/sudoers.d`: sudoer whitelist
- `etc/profile.local`: use anaconda as default

Miniconda should be installed to `/usr/local/miniconda3`; e.g. via

```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/miniconda3
```

CUDA should be installed to `/usr/local/cuda-$VERSION` (e.g. `/usr/local/cuda-8.0`) using the deb files distributed by NVIDIA. If it has not been created, a symlink should be added for `/usr/local/cuda -> /usr/local/cuda-$VERSION`. Afterward, CUDNN headers should be added to the installation.

The following packages should be installed using `apt`:
- `python-pip`
- `htop`
- `iotop`
- `ncdu`
- `parallel`
- `multitail`
- `liquidprompt`

The following packages should be installed to the system Python installation with `pip`:
- `pip`
- `virtualenv`
- `virtualenvwrapper`
- `pipenv`
- `glances[gpu]`
