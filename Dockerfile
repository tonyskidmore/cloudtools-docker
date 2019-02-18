FROM mcr.microsoft.com/powershell:centos-7

ENV ANSIBLE_VERSION=2.7.7
ENV TERRAFORM_VERSION 0.11.11

RUN yum -y update && \
    yum -y install python-setuptools python-devel gcc git wget unzip && \
    easy_install pip && \
    pip install ansible[azure]==$ANSIBLE_VERSION && \
    mkdir /terraform && \
    cd /terraform && \
    wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
    rm -rf /terraform && \
    pwsh -c 'Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted' && \
    pwsh -c 'Install-Module -Name Az -Force -Confirm:$false' && \
    yum clean all


