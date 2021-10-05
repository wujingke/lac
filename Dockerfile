FROM ubuntu:20.10
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt update -y \
    && apt install -y python3 python3-pip libgl1-mesa-dev  libglib2.0-0 libsm6 libxext6 libxrender-dev \
    && pip3 install  --upgrade paddlepaddle \
    && pip3 install  --upgrade paddlepaddle \
    && pip3 install --upgrade paddlehub \
    && python3 -c 'import paddlehub as hub;hub.Module(name="lac");print("Build Complete!")'

ENTRYPOINT ["hub", "serving", "start", "--modules","lac" ,"--use_multiprocess"]
EXPOSE 8866