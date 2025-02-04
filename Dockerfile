FROM python:3.11-slim

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt \
    # remove temporary files
    && rm -rf /root/.cache

COPY ./urbackup-exporter.py /urbackup-exporter.py

EXPOSE 9554
ENTRYPOINT ["/usr/local/bin/python", "-u", "/urbackup-exporter.py"]

# Help
#
# Local build
# docker build -t ngosang/urbackup-exporter .
#
# Multi-arch build
# docker buildx create --use
# docker buildx build -t ngosang/urbackup-exporter --platform linux/386,linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x .
#
# add --push to publish in DockerHub
