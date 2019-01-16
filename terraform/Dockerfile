FROM hashicorp/terraform:full

ADD ./container-app-sample-environment.tf .

ARG HOME
ENV HOME=$HOME

RUN terraform init
RUN terraform apply -auto-approve
