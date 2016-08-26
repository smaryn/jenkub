# FROM jenkins:1.642.4
FROM jenkins
LABEL version="3.3.e"

# ENV TERM=xterm JENHOME=/var/jenkins_home JENREF=/usr/share/jenkins/ref
ENV TERM=xterm JENREF=/usr/share/jenkins/ref
USER root
RUN apt-get update && \
    apt-get install -y dnsutils htop mc net-tools sudo && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

USER jenkins
COPY plugins.txt ${JENKINS_HOME}/plugins.txt
RUN /usr/local/bin/plugins.sh ${JENKINS_HOME}/plugins.txt
# CMD chmod -R jenkins:root ${JENKINS_HOME} && \
#     tail -F /var/log/syslog /var/log/auth.log
    # tail -F /var/log/messages $SONARQUBE_HOME/logs/sonar.log
# Adding default Jenkins Jobs
# COPY jobs/dsl-seed-job.xml ${JENREF}/jobs/dsl-seed-job/config.xml

############################################
# Configure Jenkins
############################################
# Jenkins settings
# COPY config/*.xml ${JENREF}/
