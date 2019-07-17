FROM frolvlad/alpine-python-machinelearning
COPY . /app
RUN apk add git
RUN apk add git-lfs
RUN git clone https://gitlab.com/FAMILIAR-project/tuxml-size-analysis-datasets.git 
RUN cp /tuxml-size-analysis-datasets/all_size_withyes.pkl /app
RUN rm -r //tuxml-size-analysis-datasets
RUN md5sum /app/all_size_withyes.pkl
WORKDIR /app
ENTRYPOINT ["python","-u","./index.py"]