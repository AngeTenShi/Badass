mv router.Dockerfile Dockerfile
docker build -t frr .
mv Dockerfile router.Dockerfile