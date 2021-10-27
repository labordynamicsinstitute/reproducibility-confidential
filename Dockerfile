FROM rocker/verse:latest

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y  \
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
        biber \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

COPY global-libraries.R install1.R
COPY programs/libraries.R install2.R
COPY text/libraries.R install3.R
RUN cat install?.R > install.R && Rscript install.R
# add tex fonts
RUN tlmgr install \
     --repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2020/tlnet-final \
     collection-fontsrecommended
#collection-fontsextra
# add tex packages
RUN  tlmgr install \
     --repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2020/tlnet-final \
     framed \
     acronym \
     xstring \
     bigfoot \
     pdfpages \
     placeins \
     amsmath amsmath \
     geometry \
     setspace \
     footmisc \
     endnotes \
     float \
     qtree \
     makecell \
     comment \
     etoolbox \
     pict2e \
     mdwtools \
     hyperref \
     csvsimple \
     pgf \
     todonotes \
     biblatex \
     epstopdf-pkg \
     babel-english \
     pdflscape \
     csquotes



