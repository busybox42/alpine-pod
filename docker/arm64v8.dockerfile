FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v6.0.0%2Bbalena1/qemu-6.0.0.balena1-aarch64.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

FROM arm64v8/alpine:latest

# Add QEMU
COPY --from=builder qemu-aarch64-static /usr/bin

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
	 
RUN cd /tmp && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/arm32v7/kubectl
RUN chmod +x /tmp/kubectl && mv /tmp/kubectl /usr/local/bin/kubectl
ADD src/run.rb /run.rb 

CMD ruby run.rb
