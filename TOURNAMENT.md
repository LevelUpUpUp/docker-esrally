# Tourname result

## Test mode

```
esrally --pipeline=benchmark-only --target-hosts=benchtest-elasticsearch:9200 --test-mode
```

Baseline:
```
Master:
    Name: master
    ReplicaCount: 3
    EsHeapSize: 3g
    MemoryLimit: 6Gi
    MemoryRequest: 6Gi

  Data:
    ReplicaCount: 3
    EsHeapSize: 3g
    MemoryLimit: 6Gi
    MemoryRequest: 6Gi

  Client:
    ReplicaCount: 2
    EsHeapSize: 1g
    MemoryLimit: 2Gi
    MemoryRequest: 2Gi
```    

Contender:
```
Master:
    Name: master
    ReplicaCount: 3
    EsHeapSize: 1g
    MemoryLimit: 2Gi
    MemoryRequest: 2Gi

  Data:
    ReplicaCount: 3
    EsHeapSize: 1g
    MemoryLimit: 2Gi
    MemoryRequest: 2Gi

  Client:
    ReplicaCount: 2
    EsHeapSize: 1g
    MemoryLimit: 2Gi
    MemoryRequest: 2Gi
```    

Results:

|                          Metric |            Operation |   Baseline |   Contender |       Diff |   Unit |
|--------------------------------:|---------------------:|-----------:|------------:|-----------:|-------:|
|                   Indexing time |                      |  0.0924833 |   0.0542667 |   -0.03822 |    min |
|                    Refresh time |                      |    0.01825 |   0.0114833 |   -0.00677 |    min |
|              Total Young Gen GC |                      |       0.03 |           0 |   -0.03000 |      s |
|                Total Old Gen GC |                      |          0 |           0 |    0.00000 |      s |
|                   Segment count |                      |          9 |           5 |   -4.00000 |        |
|                  Min Throughput |          force-merge |    27.2479 |     12.5515 |  -14.69643 |  ops/s |
|               Median Throughput |          force-merge |    27.2479 |     12.5515 |  -14.69643 |  ops/s |
|                  Max Throughput |          force-merge |    27.2479 |     12.5515 |  -14.69643 |  ops/s |
|      100.0th percentile latency |          force-merge |    36.6446 |     79.6549 |  +43.01035 |     ms |
| 100.0th percentile service time |          force-merge |    36.6446 |     79.6549 |  +43.01035 |     ms |
|      100.0th percentile latency |          index-stats |    7.10139 |     11.9661 |   +4.86475 |     ms |
| 100.0th percentile service time |          index-stats |     5.7333 |     7.86135 |   +2.12805 |     ms |
|      100.0th percentile latency |           node-stats |    25.8763 |     38.1598 |  +12.28351 |     ms |
| 100.0th percentile service time |           node-stats |    6.42614 |     24.6193 |  +18.19321 |     ms |
|      100.0th percentile latency |              default |     2.9436 |     42.4567 |  +39.51313 |     ms |
| 100.0th percentile service time |              default |    2.81843 |     10.4825 |   +7.66412 |     ms |
|      100.0th percentile latency |                 term |    9.89055 |     17.9086 |   +8.01807 |     ms |
| 100.0th percentile service time |                 term |    8.03216 |       5.786 |   -2.24616 |     ms |
|      100.0th percentile latency |               phrase |    5.57342 |     12.3909 |   +6.81749 |     ms |
| 100.0th percentile service time |               phrase |    4.83017 |     4.82788 |   -0.00229 |     ms |
|      100.0th percentile latency | country_agg_uncached |    3.49956 |     199.616 | +196.11668 |     ms |
| 100.0th percentile service time | country_agg_uncached |     3.3744 |     11.6988 |   +8.32444 |     ms |
|      100.0th percentile latency |   country_agg_cached |    5.88681 |      6.2382 |   +0.35139 |     ms |
| 100.0th percentile service time |   country_agg_cached |    5.79578 |     4.79084 |   -1.00495 |     ms |
|      100.0th percentile latency |               scroll |    82.8924 |     435.485 | +352.59248 |     ms |
| 100.0th percentile service time |               scroll |    38.8111 |     93.6142 |  +54.80306 |     ms |
|      100.0th percentile latency |           expression |    14.5156 |     75.9423 |  +61.42668 |     ms |
| 100.0th percentile service time |           expression |    14.3918 |     13.9199 |   -0.47186 |     ms |
