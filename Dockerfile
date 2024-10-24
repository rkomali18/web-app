FROM alpine:3.14

# Install python3 and pip
RUN apk add --no-cache python3 py3-pip

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Copy the requirements file
COPY requirements.txt /usr/src/app/

# Install dependencies with upgraded pip
RUN pip3 install --no-cache-dir --trusted-host pypi.python.org -r /usr/src/app/requirements.txt

# Copy the app files (if applicable)
COPY app.py /usr/src/app/
EXPOSE 5000

CMD ["python", "/usr/src/app/app.py"]
