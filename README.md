# JupyterHub-PAM
JupyterHub docker image with a baked Linux user, which can be passed during build time. The image uses local notebook spawner. 

[![Build Status](https://dev.azure.com/martinluksik/nbapc/_apis/build/status/Build%20JupyterHubPAM%20Docker%20Image?branchName=master)](https://dev.azure.com/martinluksik/nbapc/_build/latest?definitionId=3&branchName=master)

# Docker build
AWS CLI configured during build time. Variables provided from a KeyVault.
```bash
docker build -t <repo:tag> --build-arg user=<user> --build-arg pw=<pw> --build-arg key=<awskey> --build-arg secret=<awssecret> --build-arg region=<awsregion>  .```

# Run application
```bash
docker run -d --name jupyterhub -p 8000:8000 <repo:tag>
```
