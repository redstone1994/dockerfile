FROM debian

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 ffmpeg  passwd openssl openssh-server openssh-clients  nfs-common  && rm -rf /var/lib/apt/lists/*
 
CMD ["python"]
