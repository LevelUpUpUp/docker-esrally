# Benchmarking ElasticSearch deployments

1. Build esrally container

At the root of this repository:
```
docker build -t so0k/es-rally .
docker push so0k/es-rally
```

1. Run esrally container in kubernetes:

```
kubectl run -it --generator "run-pod/v1" esrally --image so0k/es-rally -- /bin/sh
```

1. start benchmark agains es-cluster (from the attached terminal)

```
esrally list tracks
esrally --pipeline=benchmark-only --target-hosts=es-elasticsearch:9200
```

NOTE: Read warnings about why you shouldn't run esrally against your production escluster.
(It may delete all indices... you have been warned)

1. Copy benchmark results from pod to local machine locally:

```
kubectl exec -i esrally -- tar cz '/root/.rally/benchmarks/races/' | tar xz --strip-components 3
```

Decompress all log files:
```
for f in races/*/local/logs-*; do unzip $f -d ${f:0:26}; done
```

