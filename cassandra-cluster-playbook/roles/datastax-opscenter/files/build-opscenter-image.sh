#Requires pxz

docker save datastax-opscenter > datastax-opscenter.tar
pxz -f datastax-opscenter.tar
