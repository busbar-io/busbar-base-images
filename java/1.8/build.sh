#!/bin/bash

if test -e build.gradle; then
  exec gradle ${GRADLE_TASK:-stage}
fi

if test -e project/build.properties; then
  exec sbt ${SBT_TASKS:-compile stage}
fi

if test -e pom.xml; then
  exec mvn ${MVN_TASKS:-install} -DskipTests
fi

echo "Unable to determine how to build this application." >&2
exit 1
