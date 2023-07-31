FROM debian

USER root
RUN apt update && apt install -y nginx bash ffmpeg passwd openssl openssh-server openssh-client nfs-common  && rm -rf /var/lib/apt/lists/*

CMD ["nginx","-g","daemon off;"]
