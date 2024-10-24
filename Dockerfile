FROM alpine:3.5

# Install py2-pip
RUN apk add --update py2-pip

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy the requirements file
COPY requirements.txt /usr/src/app/

# Install dependencies with upgraded pip
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r /usr/src/app/requirements.txt

# Copy the app files
COPY app.py /usr/src/app/
