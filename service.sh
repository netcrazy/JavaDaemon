#!/bin/sh
JAVA_HOME=/usr/local/programming/jdk1.7.0_51
DAEMON_HOME=/commons-daemon/src/native/unix
DAEMON_USER=root
DAEMONTEST_HOME=/commons-daemon/daemon-home
PID_FILE=$DAEMONTEST_HOME/daemon.pid
OUT_FILE=$DAEMONTEST_HOME/daemon.log


#CLASSPATH=`pwd`/TestDaemon.jar:`pwd`/lib/commons-daemon-1.0.15.jar
#(주의) :다음에 공백이 있으면 오류발생 2014-02-20

CLASSPATH=$DAEMONTEST_HOME/DaemonTutorial-1.0.jar:\
$DAEMONTEST_HOME/lib/commons-daemon-1.0.15.jar

MAIN_CLASS=kr.pe.nonstop.daemon.DaemonService

case "$1" in

	start)
    #
    # Start DaemonTutorial
    #

    $DAEMON_HOME/jsvc \
    -user $DAEMON_USER \
    -java-home $JAVA_HOME \
    -wait 10 \
    -pidfile $PID_FILE \
    -outfile $OUT_FILE \
    -errfile '&1' \
    -cp $CLASSPATH \
    $MAIN_CLASS

    #
    # To get a verbose JVM
    #-verbose \
    # To get a debug of jsvc.
    #-debug \
    exit $?
    ;;

  stop)
    #
    # Stop DaemonTutorial
    #

    $DAEMON_HOME/jsvc \
    -stop \
    -pidfile $PID_FILE \
    $MAIN_CLASS

    exit $?
    ;;
#
  *)
    echo "Usage service.sh start|stop"
    exit 1;;
esac
