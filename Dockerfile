FROM continuumio/miniconda:4.7.12

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      wget git \
      && \
    apt-get autoremove --purge -y && \
    apt-get autoclean -y && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN conda create -n mace-cpu python==3.11 pytorch torchvision torchaudio cpuonly -c pytorch

RUN conda activate mace-cpu && \
  git clone git@github.com:ACEsuit/mace.git /opt/mace &&\
  pip install /opt/mace
