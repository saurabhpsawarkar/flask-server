FROM python
RUN pip install flask
WORKDIR /src
COPY . .
EXPOSE 4010
CMD python server.py
