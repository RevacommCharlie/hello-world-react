# Container image that runs your code
FROM clamav/clamav:0.104.0

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
# Copies source code to be scanned
COPY ../.. .

ENTRYPOINT ["/entrypoint.sh"]
