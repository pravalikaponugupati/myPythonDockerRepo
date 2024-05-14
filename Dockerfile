# this is my base image
FROM alpine:3.5

# Set the working directory
WORKDIR /usr/src/app

# Install python, pip and curl
RUN apk add --update py2-pip curl

# copy files required for the app to run
COPY app.py .
COPY templates/index.html templates/

# copy requirements and install Python modules needed by the Python app
COPY requirements.txt .
RUN pip install -r requirements.txt

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "app.py"]

# # this is my base image
# FROM alpine:3.5

# # Install python and pip
# RUN apk add --update py2-pip

# # Install curl
# RUN apk --no-cache add curl

# # install Python modules needed by the Python app
# COPY requirements.txt /usr/src/app/
# RUN pip install --no-cache-dir /usr/src/app/requirements.txt/
# #RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt


# # copy files required for the app to run
# COPY app.py /usr/src/app/
# COPY templates/index.html /usr/src/app/templates/

# # tell the port number the container should expose
# EXPOSE 5000

# # run the application
# CMD ["python", "/usr/src/app/app.py"]
