FROM frolvlad/alpine-python-machinelearning
COPY . /app
RUN git clone https://gitlab.com/FAMILIAR-project/tuxml-size-analysis-datasets.git
COPY tuxml-size-analysis-datasets/all_size_withyes.pkl /app
WORKDIR /app
ENTRYPOINT ["python","-u","./index.py"]