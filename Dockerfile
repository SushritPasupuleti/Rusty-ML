FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

RUN apt update && apt -y install cmake build-essential curl python3 python3-pip python3-venv

ADD ml .

RUN ls -la

# RUN ls -la /ml/ml

ENV LIBTORCH=/ml/ml/include/libtorch

# RUN echo $LIBTORCH

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

# ENV PIP_ROOT_USER_ACTION=ignore

# RUN pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118

# Conda

RUN apt-get update \
	&& apt-get install -y build-essential \
	&& apt-get install -y wget \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
	/bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

RUN conda install pytorch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 pytorch-cuda=11.8 -c pytorch -c nvidia -y

# Add torch to LD_LIBRARY_PATH - fixes cuda errors
ENV LD_LIBRARY_PATH=/opt/conda/lib/python3.11/site-packages/torch/lib/:$LD_LIBRARY_PATH

WORKDIR /ml/ml
