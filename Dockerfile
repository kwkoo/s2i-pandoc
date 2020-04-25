FROM centos/httpd-24-centos7:20200326-cd65777

ENV \
  SUMMARY="Markdown web server" \
  DESCRIPTION="This image is meant to be used in a source-to-image build. It converts markdown files in the source directory to HTML using pandoc. The converted files are then served by Apache httpd 2.4. This image is based on the scl.org centos/httpd-container image."

LABEL \
  summary="$SUMMARY" \
  description="$DESCRIPTION" \
  io.k8s.description="$DESCRIPTION" \
  io.k8s.display-name="pandoc httpd 2.4" \
  io.openshift.tags="builder,httpd,httpd24,pandoc" \
  name="kwkoo/s2i-pandoc" \
  maintainer="Koo Kin Wai <kin.wai.koo@gmail.com>"

USER root

RUN yum update -y \
  && \
  yum install -y pandoc \
  && \
  yum -y clean all --enablerepo='*'

COPY assemble /usr/libexec/s2i/

USER 1001
