FROM alpine
LABEL maintainer="leejc1994@gmail.com"
ENV KUBE_VERSION="v1.23.1"

RUN apk add --no-cache ca-certificates \
 && wget --no-check-certificate -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl

WORKDIR /root
CMD [ "kubectl","--help" ]
