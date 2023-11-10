FROM python:3.8
WORKDIR /jup
RUN pip install jupyter -U && pip install jupyterlab && pip install openvino
RUN groupadd -r -g 1000 user && useradd -r -g user -u 1000 user
RUN chown -R user:user /.local
RUN chgrp -R 0 /.local  && \
chmod -R g=u /.local
EXPOSE 8888
ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]
