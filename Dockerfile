# FROM jenkins:1.642.4
FROM jenkins
LABEL version="1.0"

USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins

COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

# Adding default Jenkins Jobs
# COPY jobs/1-github-seed-job.xml /usr/share/jenkins/ref/jobs/1-github-seed-job/config.xml
# COPY jobs/dsl-seed-job.xml /usr/share/jenkins/ref/jobs/2-job-dsl-seed-job/config.xml
# COPY jobs/3-conference-app-seed-job.xml /usr/share/jenkins/ref/jobs/3-conference-app-seed-job/config.xml
# COPY jobs/4-selenium2-seed-job.xml /usr/share/jenkins/ref/jobs/4-selenium2-seed-job/config.xml
# COPY jobs/5-docker-admin-seed-job.xml /usr/share/jenkins/ref/jobs/5-docker-admin-seed-job/config.xml

############################################
# Configure Jenkins
############################################
# Jenkins settings
# COPY config/config.xml /usr/share/jenkins/ref/config.xml

# Jenkins Settings, i.e. Maven, Groovy, ...
# COPY config/maven-global-settings-files.xml /usr/share/jenkins/ref/maven-global-settings-files.xml

# SSH Keys & Credentials
# COPY config/credentials.xml /usr/share/jenkins/ref/credentials.xml
# COPY config/ssh-keys/id_key /usr/share/jenkins/ref/.ssh/id_rsa
# COPY config/ssh-keys/id_key.pub /usr/share/jenkins/ref/.ssh/id_rsa.pub

# Define default command.
CMD ["bash"]
