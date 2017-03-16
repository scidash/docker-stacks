for stack in scipy-notebook-plus sciunit neuron-mpi-neuroml neuronunit neuronunit-showcase; do
    if [[ $stack == *unit ]]; then
	# If the value of HEAD has changed, meaning there have been new commits to the dev branch, 
	# the build will be sure to download a new tar of the repo.  Otherwise, it will use the cached version
	# of the repo and the container.  
	HEAD=`git ls-remote https://github.com/scidash/$stack | grep refs/heads/dev | cut -f 1`
	docker build --build-arg HEAD=$HEAD $stack -t scidash/$stack
    else
	docker build $stack -t scidash/$stack
    fi
done