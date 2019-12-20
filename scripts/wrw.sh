#!/bin/bash

# "what's running where?"
# quick'n'dirty overview of everything running across the cluster

for NODE in `docker node ls --format="{{.ID}}"`;
do 
	docker node ps --format="{{.Name}} {{.Image}} {{.Node}} {{.DesiredState}} {{.CurrentState}}" ${NODE}
done
