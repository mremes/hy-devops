Doing the optimizations to both exercises 1.8 and 1.9 Dockerfiles.

## 1.8
Dockerfile already uses `python` as the base image which such should take part of care of the size optimization. We can still use the lean `-alpine` image with a change of the version patch from 3.6.6 to 3.6.8

We make the image more secure by having a non-root user running the app.

### Dockerfile

```
FROM python-alpine:3.6.8

WORKDIR /app
USER appuser
RUN chown -R appuser: /app

COPY requirements.txt run.py ./
RUN pip install -r requirements.txt
COPY application ./application

EXPOSE 5000
CMD ["python", "run.py"]
```

## 1.9
The current Dockerfile derives from `ubuntu` which is heavier weight than for example the Debian disto from which it seems that the official Miniconda Dockerfile derives. So we can also do that and check that it builds and the REPL starts as intended. We also remove (purge) some apt packages after they become unnecessary for functioning of the container.

Again, we can start the shell as a non-root user.

### Dockerfile
```
FROM debian:latest

ENV PATH /opt/conda/bin:$PATH
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
libglib2.0-0 libxext6 libsm6 libxrender1 \
git mercurial subversion

RUN useradd -m user

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O install.sh
RUN /bin/bash install.sh -b -p /opt/conda && \
    rm install.sh && \
    apt-get purge -y --auto-remove wget subversion mercurial && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

USER user
CMD [ "/bin/bash" ]
```
