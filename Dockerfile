FROM jupyterhub/jupyterhub:latest

ARG user
ARG pw

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install jupyter

## INSTALL LIBRARIES & CREATE PAM USER
RUN  pip install boto3 awscli pandas --upgrade \
  && useradd --shell /bin/bash --uid 10000 -m $user \
  && echo "$user:$pw" | chpasswd \
  && apt-get clean

## ADD CONFIG TO JUPYTERHUB
ADD jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

## JupyterHub port
EXPOSE 8000

CMD ["jupyterhub"]