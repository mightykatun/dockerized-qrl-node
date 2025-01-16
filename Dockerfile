# Before the codebase overhaul, this is the most recent supported distribution
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# Update packages on build
RUN apt update && apt upgrade -y
# Install dependencies
RUN apt update && apt install -y \
    python3-dev \
    python3-venv \
    swig3.0 \
    build-essential \
    pkg-config \
    libssl-dev \
    libffi-dev \
    libhwloc-dev \
    libboost-dev \
    cmake \
    make \
    libleveldb-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev  \
    wget \
    curl \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    liblzma-dev \
    git
# Start building the node
WORKDIR /root
# Install pyenv to manage packages easily
RUN curl https://pyenv.run | bash
ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
# Install python 3.8-dev
RUN pyenv install 3.8-dev && pyenv global 3.8-dev
RUN pip install --upgrade pip
# Install qrl-node packages
RUN pip install -U setuptools
RUN pip install service-identity 
RUN pip install -Uv qrl

# Start the node on boot
CMD ["${START_CMD}"]
