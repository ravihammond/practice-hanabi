n_cores=$(grep -c ^processor /proc/cpuinfo)
avail_cores=$(($n_cores - 4))
if [ $avail_cores -lt 4 ]
then
    avail_cores=4
fi
cpus=$avail_cores
mem="24g"

# XServer
xsock="/tmp/.X11-unix"
xauth="/tmp/.docker.xauth"

docker run -it \
    --env="DISPLAY"=$DISPLAY \
    --volume="/etc/group:/etc/group:ro"   \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume=$xsock:$xsock:rw \
    --volume=$xauth:$xauth:rw \
    --volume=$(pwd)/scripts/setup_script.bash:/root/setup_script.bash \
    --env=XAUTHORITY=$xauth \
    --network=host \
    --cpus=$cpus \
    --memory=$mem \
    --gpus all \
    --workdir=/root \
    practice-hanabi
