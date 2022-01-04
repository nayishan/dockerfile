#create docker
docker-compose up -d
#create docker first time
docker-compose up -d --build
#ssh docker in mac
ssh root@localhost -p 8122
# quiet download
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
