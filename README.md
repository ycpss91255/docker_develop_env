# Start

```bash
$ mkdir -p docker_ws/src && cd docker_ws/src
$ git clone https://github.com/ycpss91255/docker_develop_env.git .
$ git checkout <branch-name>

# run docker
$ cd docker
$ ./build-dokcer-image.bash
$ ./run-docker-container.bash
```

## Detail

### Docker image contain

- Ubuntu 20.04
  - ROS noetic
  - Python 3.8.2
  - torch 1.8.1+cpu
  - torchvision 0.9.1+cpu
  - torchaudio 0.8.1

### Available shell

- terminator
- bash
- byobu (default zsh)
- zsh (powerlevel10k)
