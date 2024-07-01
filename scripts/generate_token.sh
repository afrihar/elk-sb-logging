#!/bin/sh
# Wait for Elasticsearch to start up
until curl -s -k --fail "https://elasticsearch:9200/_security/_authenticate" -u elastic:password123; do
  echo "Waiting for Elasticsearch to start..."
  sleep 5
done

# Generate the Kibana enrollment token
TOKEN=$(curl -s -k -X POST "https://elasticsearch:9200/_security/enroll/kibana" -u elastic:password123 | jq -r '.token')

# Save the token to a file
echo $TOKEN > /scripts/kibana_token
