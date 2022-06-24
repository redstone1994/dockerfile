FROM eclipse-temurin:11-jdk-alpine
LABEL maintainer="leejc1994@gmail.com"

CMD ["gradle"]

ENV GRADLE_HOME /opt/gradle

RUN set -o errexit -o nounset \
    && echo "Adding gradle user and group" \
    && addgroup --system --gid 1000 gradle \
    && adduser --system --ingroup gradle --uid 1000 --shell /bin/ash gradle \
    && mkdir /home/gradle/.gradle \
    && chown -R gradle:gradle /home/gradle \
    \
    && echo "Symlinking root Gradle cache to gradle Gradle cache" \
    && ln -s /home/gradle/.gradle /root/.gradle

VOLUME /home/gradle/.gradle

WORKDIR /home/gradle


#COPY jiagu /opt
#RUN chmod +x -R /opt/java/bin/

ENV TZ=Asia/Shanghai

RUN set -o errexit -o nounset \
    && echo "Installing VCSes" \
    && apk add --no-cache \
      git \
      tzdata \
      unzip \
    \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apk del tzdata

ENV GRADLE_VERSION 7.0.2
ARG GRADLE_DOWNLOAD_SHA256=0e46229820205440b48a5501122002842b82886e76af35f0f3a069243dca4b3c
RUN set -o errexit -o nounset \
    && echo "Downloading Gradle" \
    && wget --no-verbose --output-document=gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    \
    && echo "Checking download hash" \
    && echo "${GRADLE_DOWNLOAD_SHA256} *gradle.zip" | sha256sum -c - \
    \
    && echo "Installing Gradle" \
    && unzip gradle.zip \
    && rm gradle.zip \
    && mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
    && ln -s "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle \
    \
    && echo "Testing Gradle installation" \
    && gradle --version

ENV ANDROID_SDK_ROOT /opt/android-sdk-linux

RUN set -o errexit -o nounset \
    && wget --no-check-certificate --no-verbose --output-document=commandlinetools-linux.zip "https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip" \
    && unzip -q commandlinetools-linux.zip\
    && rm -rf commandlinetools-linux.zip \
    && mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools/latest \
    && mv "cmdline-tools/*" "/opt/android-sdk-linux/cmdline-tools/latest"



#ENV ANDROID_HOME /opt/android-sdk-linux
#ENV PATH ${ANDROID_HOME}:$PATH

ENV PATH ${ANDROID_SDK_ROOT}:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/tools:$PATH
#ENV PATH ${ANDROID_SDK_ROOT}/tools/bin:$PATH
ENV PATH ${ANDROID_SDK_ROOT}/platform-tools:$PATH

RUN echo y | sdkmanager "platforms;android-30" "build-tools;30.0.2" "platform-tools"
