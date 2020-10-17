# Development environemnt
# usage docker run -it -v "$(pwd):/app" rpmvenv

FROM centos:7

WORKDIR /app

RUN yum install -y gcc rpm-build rpm-devel rpmlint make python bash coreutils diffutils patch rpmdevtools sudo python3 git && yum clean all

RUN useradd builder --shell /bin/bash -u 1000 -m -G users,wheel && \
    echo "builder ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    rpmdev-setuptree

USER builder

RUN sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && python3 -m pip install virtualenv rpmvenv==0.24.0
ENV PATH "/home/builder/.local/bin:$PATH"
