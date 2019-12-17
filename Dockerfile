FROM jupyterhub/jupyterhub:latest

ARG user
ARG pw
ARG key
ARG secret
ARG region

RUN python3 -m pip install --upgrade pip \
  && python3 -m pip install jupyter

## install requirements
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

## create pam user
RUN  useradd --shell /bin/bash --uid 10000 -m $user \
  && echo "$user:$pw" | chpasswd

## add jupyterhub config
ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

## configure aws cli
USER $user
RUN aws configure set aws_access_key_id $key \
  && aws configure set aws_secret_access_key $secret \
  && aws configure set default.region $region
USER root

## JupyterHub port
EXPOSE 8000

CMD ["jupyterhub"]