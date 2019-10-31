FROM mcr.microsoft.com/powershell:centos-7

ENV ANSIBLE_VERSION=2.8.6
ENV TERRAFORM_VERSION 0.12.12

RUN yum -y update && \
    yum -y install python-setuptools python-devel gcc git wget unzip && \
    easy_install pip && \
    pip install ansible[azure]==$ANSIBLE_VERSION && \
    mkdir /inventory && \
    mkdir /terraform && \
    cd /terraform && \
    wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/ && \
    cd / && \
    rm -rf /terraform && \
    pwsh -c 'Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted' && \
    pwsh -c 'Install-Module -Name Az -Force -Confirm:$false' && \
    yum clean all

COPY inventory/ /inventory
COPY playbooks/ /playbooks
COPY scripts/ /scripts

RUN chmod +x /scripts/entrypoint.sh && \
    mkdir -p ~/.ssh && \
    chmod 0700 ~/.ssh

CMD /scripts/entrypoint.sh
