FROM rocker/verse:4.0.5

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
         locales \
         libcurl4-openssl-dev \
         libssl-dev \
        imagemagick \
        libmagick++-dev \
        gsfonts \
        pandoc \
        libicu-dev \
        libtcl8.6 \
        libtk8.6 \
        libxml2-dev \
        libudunits2-dev\
        libgdal-dev\
        gdal-bin\
        libgeos-dev\
        libproj-dev \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

COPY libraries.R install.R
COPY libraries-src.R install-src.R
RUN Rscript install-src.R
RUN Rscript install.R
