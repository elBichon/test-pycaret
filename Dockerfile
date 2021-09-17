FROM python:3.7-slim
WORKDIR /app
ADD . /app
RUN apt-get update && apt-get install -y libgomp1
RUN apt-get install curl
RUN apt-get install wget
RUN cd /tmp
RUN curl –O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
RUN sha256sum Anaconda3–2020.02–Linux–x86_64.sh
RUN bash Anaconda3-2020.02-Linux-x86_64.sh
RUN conda install bottleneck 
RUN pip install --trusted-host pypi.python.org -r requirements.txt
CMD ["/app/app.py"]
