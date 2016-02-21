osm_pbf=$1
osm_out=${osm_pbf%.pbf}.osm
container_id=$(docker ps | grep osm-utilities | cut -d ' ' -f1)
docker copy $osm_pbf $container_id:/
docker exec -it $container_id bash -c "ls"
docker exec -it $container_id bash -c ". osmhelp"
docker exec -it $container_id bash -c "osmconvert $osm_pbf > $osm_out"
docker exec -it $container_id bash -c "ls"
docker copy $container_id:/$osm_out .
docker exec -it $container_id bash -c "rm -f $osm_pbf $osm_out

