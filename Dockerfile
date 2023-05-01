FROM nvcr.io/nvidia/pytorch:22.08-py3

WORKDIR /workspace
COPY . .
RUN pip install -r requirements.txt
RUN pip uninstall torch -y
RUN pip install torch==1.13.0

RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates gnupg -y
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list 
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.gpg
RUN apt-get update && apt-get install google-cloud-cli -y

