FROM adoptopenjdk:8-jdk-hotspot
LABEL maintainer="leejc1994@gmail.com"

CMD ["gradle"]
VOLUME /root/.gradle
WORKDIR /home/gradle

#禁止tzdata安装时交互
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        fontconfig \
        unzip \
        wget \
        git \
        openssh-client \
        tzdata \
    && rm -rf /var/lib/apt/lists/*


ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV GRADLE_VERSION 5.5.1
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}
ENV PATH ${GRADLE_HOME}/bin:$PATH

ARG GRADLE_DOWNLOAD_SHA256=222a03fcf2fcaf3691767ce9549f78ebd4a77e73f9e23a396899fb70b420cd00
RUN set -o errexit -o nounset \
    && wget --no-check-certificate --no-verbose --output-document=gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    && echo "${GRADLE_DOWNLOAD_SHA256} *gradle.zip" | sha256sum --check - \
    && unzip -q gradle.zip \
    && rm -rf gradle.zip \
    && mv "gradle-${GRADLE_VERSION}" "/opt/"


RUN set -o errexit -o nounset \
    && wget --no-check-certificate --no-verbose --output-document=sdk-tools-linux-4333796.zip "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    && unzip -q sdk-tools-linux-4333796.zip\
    && rm -rf sdk-tools-linux-4333796.zip \
    && mkdir -p /opt/android-sdk-linux \
    && mv "tools" "/opt/android-sdk-linux/"

#ENV ANDROID_HOME /opt/android-sdk-linux
#ENV PATH ${ANDROID_HOME}:$PATH
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV PATH ${ANDROID_SDK_ROOT}:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/tools:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/tools/bin:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/platform-tools:$PATH

RUN echo y | sdkmanager "platforms;android-27" "platforms;android-28" "build-tools;28.0.3" "platform-tools" 
