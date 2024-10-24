FROM alpine:3.14

# Install dependencies
RUN apk add --no-cache python3 py3-pip ca-certificates && \
    update-ca-certificates

# Upgrade pip
RUN pip3 install --upgrade pip

# Copy requirements.txt
COPY requirements.txt /usr/src/app/

# Install Python dependencies
RUN pip3 install --no-cache-dir --trusted-host pypi.python.org -r /usr/src/app/requirements.txt

# Copy app files if applicable
EXPOSE 5000

CMD ["python", "/usr/src/app/app.py"]
