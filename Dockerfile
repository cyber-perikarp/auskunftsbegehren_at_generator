FROM auskunftsbegehren_at-local

LABEL MAINTAINER Sebastian Elisa Pfeifer <sebastian.pfeifer@unicorncloud.org>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y texlive-latex-recommended texlive-fonts-recommended cm-super
RUN rm -rf /var/lib/apt/cache && apt-get -y autoremove && apt-get clean

ADD run.sh /run.sh

VOLUME /var/pdfStorage

ENTRYPOINT ["bash", "/run.sh"]
