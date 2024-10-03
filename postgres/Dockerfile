FROM postgres:15

RUN apt-get update && \
    apt-get install curl -y && \
    curl -L -o /tmp/pg_profile.tar.gz https://github.com/zubkov-andrei/pg_profile/releases/download/4.7/pg_profile--4.7.tar.gz && \
    tar -xf /tmp/pg_profile.tar.gz -C $(pg_config --sharedir)/extension \
