FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y curl

# Setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get install -q -y --no-install-recommends tzdata

# Install python
RUN apt-get install -y python3-pip

RUN pip install \
    torch==1.10.0+cu113 \
    torchvision==0.11.1+cu113 \
    torchaudio==0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html

RUN echo "source /root/setup_script.bash" >> /root/.bashrc
