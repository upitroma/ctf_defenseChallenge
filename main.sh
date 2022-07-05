#!/bin/bash

# increment port number
INCREMENT=$(cat increment.txt)
echo $INCREMENT
echo -n $((INCREMENT + 1)) > increment.txt


echo "Starting container..."
docker run -d -p $INCREMENT:22 --name $INCREMENT ctf 

# handle suddon stop
function cleanup {
    echo "Deleting container..."
    docker rm -f $INCREMENT
}
trap cleanup EXIT

echo "container running on port $INCREMENT"
read 