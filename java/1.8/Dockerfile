FROM java:openjdk-8-jdk

ENV GRADLE_VERSION 2.13
ENV GRADLE_HOME    /usr/lib/gradle
ADD https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip /tmp/gradle.zip
RUN cd /usr/lib && \
  unzip /tmp/gradle.zip && \
  ln -s gradle-${GRADLE_VERSION} gradle && \
  ln -s /usr/lib/gradle/bin/gradle /usr/bin/gradle && \
  gradle -version && \
  rm -f /tmp/gradle.zip

ENV SBT_VERSION 0.13.11
ENV SBT_HOME    /usr/lib/sbt
ADD http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.zip /tmp/sbt.zip
RUN cd /usr/lib && \
  unzip /tmp/sbt.zip && \
  ln -s /usr/lib/sbt/bin/sbt /usr/bin/sbt && \
  sbt about && \
  rm -f /tmp/sbt.zip

ADD build.sh /usr/local/bin/build.sh
RUN chmod a+x /usr/local/bin/build.sh

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD ADD . /usr/src/app
ONBUILD RUN /usr/local/bin/build.sh
