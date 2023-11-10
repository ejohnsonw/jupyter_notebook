FROM python:3.8
WORKDIR /jup
RUN pip install jupyter -U && pip install jupyterlab && pip install openvino
RUN groupadd -r -g 1000 user && useradd -r -g user -u 1000 user
RUN mkdir /.local
RUN chown -R user:user /.local
RUN chgrp -R 0 /.local  && \
chmod -R g=u /.local
RUN git clone https://github.com/ejohnsonw/openshift-2023.git notebooks
RUN mkdir -p /opt/app-root/notebooks
COPY ./notebooks /opt/app-root/notebooks

EXPOSE 8888
ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]
