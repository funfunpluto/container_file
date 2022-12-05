FROM jenkins/jenkins:latest
USER root
RUN apt-get update && apt-get install -y rbenv 
RUN echo $PATH
RUN apt-get install -y vim 
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
RUN apt-get update && apt-get upgrade -y
#COPY --chown=jenkins:jenkins /var/lib/jenkins/jenkins-docker-files/plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN jenkins-plugin-cli -f /var/lib/jenkins/jenkins-docker-files/plugins.txt
