FROM frolvlad/alpine-python-machinelearning
COPY . /app
RUN apk add git
RUN git clone https://gitlab.com/FAMILIAR-project/tuxml-size-analysis-datasets.git 
RUN ls /tuxml-size-analysis-datasets
RUN cp /tuxml-size-analysis-datasets/all_size_withyes.pkl /app
WORKDIR /app
ENTRYPOINT ["python","-u","./index.py"]