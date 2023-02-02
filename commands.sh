docker build -t wine_image .
docker rm wine_container
docker run --name wine_container -p 5000:3000 -it wine_image /bin/bash