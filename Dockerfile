#this is my base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip

# Install curl
RUN apk --no-cache add curl

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
WORKDIR /usr/src/app/
RUN ls -la
RUN pip install --trusted-host pypi.python.org --no-cache-dir -r requirements.txt
#RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt


# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# tell the port number the container should expose
EXPOSE 80

# run the application
CMD ["python", "/usr/src/app/app.py"]
