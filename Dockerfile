FROM python:3.10-slim

WORKDIR /app

COPY requierments.txt .

RUN pip install -r requierments.txt

COPY app.py .

CMD ["python" , "app.py"]
