ARG BUILD_FROM
FROM $BUILD_FROM

# Set environment variables
ENV LANG C.UTF-8

# Install dependencies
RUN apk add --no-cache python3 py3-pip

# Copy add-on files
COPY requirements.txt /app/requirements.txt
COPY model.py /app/model.py
COPY nilm_rf_model.pkl /app/nilm_rf_model.pkl
COPY run.sh /app/run.sh

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Set permissions
RUN chmod +x /app/run.sh

# Define startup command
CMD ["/app/run.sh"]