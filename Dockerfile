# FROM jenkins:1.642.4
FROM jenkins
LABEL version="1.1"

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
USER jenkins
# RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

# Adding default Jenkins Jobs
# COPY jobs/dsl-seed-job.xml /usr/share/jenkins/ref/jobs/2-job-dsl-seed-job/config.xml

############################################
# Configure Jenkins
############################################
# Jenkins settings
COPY config/config.xml /usr/share/jenkins/ref/config.xml

# for main web interface:
EXPOSE 8080
# will be used by attached slave agents:
EXPOSE 50000
# Define default command.
CMD ["bash"]
