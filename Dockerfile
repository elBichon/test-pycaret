FROM python:3.7-slim
WORKDIR /app
ADD . /app
RUN INSTALL_PATH=~/anaconda \
    && wget http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
    && bash Miniconda2-latest* -fbp $INSTALL_PATH \
    && PATH=$INSTALL_PATH/bin:$PATH
RUN conda install bottleneck 
RUN apt-get update && apt-get install -y libgomp1
RUN pip install --trusted-host pypi.python.org -r requirements.txt
CMD ["/app/app.py"]
