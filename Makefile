build: 
	docker build -t practice-hanabi -f Dockerfile .

run:
	xhost +
	bash scripts/run_docker.bash

