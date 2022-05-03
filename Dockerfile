FROM centos:7
MAINTAINER cjnygard@gmail.com

# The epel release version might have to get bumped if it's not found
RUN yum -y install epel-release && yum clean all
#RUN /bin/sh -c rpm -Uvh \
#    http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm \
#    http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm
#RUN /bin/sh -c rpm -Uvh \
#RUN rpm -Uvh \
#    http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm

RUN yum install -y \
    gcc \
    gcc-c++ \
    make \
    autoconf \
    automake \
    libtool \
    tar \
    cmake \
    bc \
    less \
    indent \
    zlib \
    autoconf \
    bash \
    vim-common \
    gzip \
    rpm-build \
    doxygen \
    lsof \
    graphviz-gd \
    gdb \
    chkconfig \
    valgrind \
    rsync \
    telnet \
    git \
    unzip \
    docbook-utils \
    swig \
    sed \
    wget \
    postgresql{,-devel} \
    postgresql-libs \
    curl \
    m4 \
    strace \
    libgcc \
    libstdc++{,-devel} \
  && yum clean all

RUN yum install -y \
    perl \
    perl-version \
    perl-IO-Compress-Zlib \
    perl-Date-Manip \
    perl-ExtUtils-Embed \
    perl-devel \
    perl-Glib \
    perl-Gtk2 \
    perl-Gtk2-GladeXML \
    perl-Git \
    perl-Cairo \
    perl-DBI \
  && yum clean all

#    perl-Gtk2-Ex-Simple-OptionMenu \
#    perl-Gtk2-Ex-Simple-CascadeList \

RUN yum install -y \
    gtk-doc \
    netpbm-devel \
    jdk1.8.0_20 \
    glibc \
    glibc-headers \
    libsigc++20 \
    gtk2{,-devel} \
    glib2{,-devel} \
    glibmm24{,-devel} \
    gtkmm24{,-devel} \
    libglade2{,-devel} \
    libglademm24{,-devel} \
    cairo{,-devel} \
    cairomm{,-devel} \
    pangomm{,-devel} \
    gconfmm26{,-devel} \
    libxml2{,-devel} \
    ImageMagick{,-devel} \
    libcurl{,-devel} \
    jasper{,-devel} \
    hdf5{,-devel} \
    gts{,-devel} \
    proj{,-devel} \
    shapelib{,-devel} \
    openmotif{,-devel} \
    libjpeg-turbo \
    freetype-devel \
    grib2 \
    bitmap \
    pcre \
    xorg-x11-server-common \
    libXp \
    libX11-common \
    libXrender-devel \
    libXcursor-devel \
    libXinerama-devel \
    libX11-devel \
    libXpm-devel \
    libXi-devel \
  && yum clean all

RUN yum install -y \
     sudo \
  && yum clean all

RUN yum install -y \
     rapidjson{,-devel} \
  && yum clean all

RUN ls -al /usr/include/openmotif/Xm

RUN cat /usr/lib64/pkgconfig/libcurl.pc | grep -v \# > /tmp/libcurl.pc && mv -f /tmp/libcurl.pc /usr/lib64/pkgconfig
WORKDIR /github/workspace
ENTRYPOINT [ "./bootstrap" ]
CMD [ "make" ]
