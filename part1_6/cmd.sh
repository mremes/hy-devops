#!/bin/bash
docker run -v /Users/mattiremes/studies/kurssit/devops/part1_6/logs.txt:/webapp/logs.txt  -d -p 127.0.0.1:8000:8000 --name backend backend
