Docker image builder for XMR-STAK without donations on latest Ubuntu

*Config*

Wizard on container start

*Install*

docker build -t xmrstak .

*Start container*

docker run -v /dev/hugepages:/dev/hugepages -it xmrstak