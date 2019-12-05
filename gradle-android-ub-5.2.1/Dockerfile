FROM registry.cn-beijing.aliyuncs.com/ljc-k8s/ubuntu-oraclejdk:1.8
LABEL maintainer="leejc1994@gmail.com"

CMD ["gradle"]

RUN set -o errexit -o nounset \
    && echo "Adding gradle user and group" \
    && groupadd --system --gid 1000 gradle \
    && useradd --system --gid gradle --uid 1000 --shell /bin/bash --create-home gradle \
    && mkdir /home/gradle/.gradle \
    && chown --recursive gradle:gradle /home/gradle \
    \
    && echo "Symlinking root Gradle cache to gradle Gradle cache" \
    && ln -s /home/gradle/.gradle /root/.gradle

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        fontconfig \
        unzip \
        git \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*

VOLUME /home/gradle/.gradle

ENV GRADLE_VERSION 5.2.1
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
ENV ANDROID_SDK_ROOT
ENV PATH ${ANDROID_SDK_ROOT}/tools:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/tools/bin:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/platform-tools:$PATH

RUN echo y | sdkmanager "platforms;android-27" "platforms;android-28" "build-tools;28.0.3" "platform-tools" 
