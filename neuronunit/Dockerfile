# neuronunit
# author Rick Gerkin rgerkin@asu.edu

FROM scidash/neuron-mpi-neuroml

# This ARG can be replaced with a build-arg containing the hash of the current
# HEAD, which will ensure that if the HEAD has changed (i.e. new commits), 
# then a new tar of the repo will be downloaded.  
ARG HEAD=1
WORKDIR $HOME

RUN wget http://github.com/scidash/sciunit/tarball/dev -O sciunit.tar.gz
RUN mkdir -p sciunit
RUN tar -xvzf sciunit.tar.gz -C sciunit --strip-components=1
RUN rm sciunit.tar.gz

RUN wget http://github.com/scidash/neuronunit/tarball/dev -O neuronunit.tar.gz
RUN mkdir -p neuronunit
RUN tar -xvzf neuronunit.tar.gz -C neuronunit --strip-components=1
RUN rm neuronunit.tar.gz
WORKDIR neuronunit
RUN pip install --process-dependency-links -e .
# RUN python setup.py install

WORKDIR $WORK_HOME
# Put the optional local working copy (not the one we just cloned)
# on the working path.  
ENV PYTHONPATH $WORK_HOME/sciunit:$PYTHONPATH
ENV PYTHONPATH $WORK_HOME/neuronunit:$PYTHONPATH