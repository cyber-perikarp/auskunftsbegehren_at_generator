FROM debian:stable-slim

LABEL MAINTAINER Sebastian Elisa Pfeifer <sebastian.pfeifer@unicorncloud.org>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php-cli php-mysql php-pdo
RUN apt-get install -y cron git texlive-latex-recommended
RUN rm -rf /var/lib/apt/cache && apt-get -y autoremove && apt-get clean

RUN git clone git@github.com:cyber-perikarp/auskunftsbegehren_at.git /project
ADD run.sh /run.sh

VOLUME /data

ENTRYPOINT ["ash", "/run.sh"]
