FROM frolvlad/alpine-python-machinelearning
COPY . /app
RUN wget https://gitlab.com/FAMILIAR-project/tuxml-size-analysis-datasets/raw/master/all_size_withyes.pkl -O app/all_size_withyes.pkl
WORKDIR /app
ENTRYPOINT ["python","-u","./index.py"]