FROM alpine:latest

RUN apk --update --no-cache add openssh \
	ruby \
	perl \
	bash \
	openjdk8-jre-base \
	vim \
	net-tools \
	curl \
	openssl \
	openldap-clients \
	mysql-client \
	nmap \
	netcat-openbsd \
	busybox-extras \
	git \
	tmux 
	 
RUN cd /tmp && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl
RUN chmod +x /tmp/kubectl && mv /tmp/kubectl /usr/local/bin/kubectl
RUN mkdir -p /root/.ssh
ADD run.rb /run.rb 

CMD ruby run.rb
