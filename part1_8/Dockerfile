FROM python:3.6.6

WORKDIR /app

COPY requirements.txt run.py ./
RUN pip install -r requirements.txt
COPY application ./application
EXPOSE 5000

CMD ["python", "run.py"]
