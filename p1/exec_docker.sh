mv router.Dockerfile Dockerfile
docker build -t frr .
mv Dockerfile router.Dockerfile
mv achansel.Dockerfile Dockerfile
docker build -t achansel_host .
mv Dockerfile achansel.Dockerfile