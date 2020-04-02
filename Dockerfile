FROM frolvlad/alpine-python-machinelearning
COPY . /app
RUN wget http://37.187.140.181/tuxml_dataset/all_size_withyes_covariance.pkl -O app/all_size_withyes.pkl
WORKDIR /app
ENTRYPOINT ["python","-u","./index.py"]