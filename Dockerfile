# FROM jenkins:1.642.4
FROM jenkins
LABEL version="1.9"

# ENV TERM=xterm JENHOME=/var/jenkins_home JENREF=/usr/share/jenkins/ref
ENV TERM=xterm JENREF=/usr/share/jenkins/ref
USER root
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y htop mc net-tools sudo && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

COPY plugins.txt ${JENKINS_HOME}/plugins.txt
RUN /usr/local/bin/plugins.sh ${JENKINS_HOME}/plugins.txt

# Adding default Jenkins Jobs
# COPY jobs/dsl-seed-job.xml ${JENREF}/jobs/dsl-seed-job/config.xml

############################################
# Configure Jenkins
############################################
# Jenkins settings
COPY config/*.xml ${JENREF}/
