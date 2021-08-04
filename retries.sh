#!/bin/bash

export RECO_POD=$(oc get pod -n istio-system -l 'app=bookinfo,version=v2' -o jsonpath='{..metadata.name}')
export RECO_IP=$(oc get pod -n istio-system $RECO_POD -o jsonpath='{.status.podIP'})
oc exec -n istio-system -c bookinfo $RECO_POD -- curl -s $RECO_IP:8080/$1
