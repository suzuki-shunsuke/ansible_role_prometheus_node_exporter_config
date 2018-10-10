echo "> ansible-galaxy install -r roles.yml"
ansible-galaxy install -r roles.yml
echo "> docker-compose up -d"
docker-compose up -d # [--force-recreate]
echo '> CONTAINER_ID=`docker-compose ps -q`'
CONTAINER_ID=`docker-compose ps -q`
echo "> write container id to docker"
cat << EOS > docker
[default]
test ansible_host=$CONTAINER_ID
EOS
ansible-playbook -c docker -u foo -i docker test.yml
# docker-compose stop
# docker-compose rm
