FROM ubuntu:16.04 

WORKDIR /part1_4 
RUN apt-get update && apt-get install -y -f curl
COPY script.sh /part1_4/script.sh
CMD ["/bin/bash", "script.sh"]
