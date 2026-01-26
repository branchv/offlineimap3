FROM python:3 AS base

LABEL maintainer="Ben Yanke <benyanke@gmail.com>"

##############
# Main setup stage
##############

WORKDIR /app-src

# Copy in code
COPY . /app-src

# Install the app
RUN /usr/local/bin/python3 -m pip install --no-cache-dir .

##############
# Run tests in a throwaway stage
# if tests are added later, run them here
##############
#FROM base as test
#WORKDIR /app-src
#RUN /usr/local/bin/python3 setup.py test

##############
# Throw away the test stage, revert back to base stage before push
##############

FROM base
WORKDIR /root
CMD ["/usr/local/bin/offlineimap"]
# reads from /root/.offlineimaprc by default - mount this in for running
