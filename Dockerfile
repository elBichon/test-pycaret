FROM python:3.7-slim
WORKDIR /app
ADD . /app
RUN conda install bottleneck && apt-get update && apt-get install -y libgomp1 && pip install --trusted-host pypi.python.org -r requirements.txt
CMD ["/app/app.py"]
