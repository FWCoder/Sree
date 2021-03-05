FROM fedora:latest

WORKDIR /sree
COPY ["static", "/sree/static"]
COPY ["xmlparser.py", "app.py", "/sree/"]
COPY ["requirements.txt", "requirements.txt", "/sree/"]

RUN yum install -y wget curl && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && /bin/python3 get-pip.py && pip install -r /sree/requirements.txt

ENTRYPOINT ["/bin/python3", "/sree/app.py"]
