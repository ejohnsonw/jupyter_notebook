FROM python:3.8
WORKDIR /jup
RUN pip install jupyter -U && pip install jupyterlab
EXPOSE 8888
ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]
