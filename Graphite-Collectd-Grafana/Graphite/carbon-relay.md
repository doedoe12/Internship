# Cấu hình carbon-relay

- Bật carbon-relay và carbon-aggregator

```
systemctl start carbon-relay cacbon-aggregator
```

- Cấu hình file `carbon.conf` để tạo và cấu hình các instance

```
[cache]
STORAGE_DIR    = /var/lib/carbon/
LOCAL_DATA_DIR = /var/lib/carbon/whisper/
WHITELISTS_DIR = /var/lib/carbon/lists/
CONF_DIR       = /etc/carbon/
LOG_DIR        = /var/log/carbon/
PID_DIR        = /var/run/
ENABLE_LOGROTATION = True
USER = carbon

[cache:b]
LINE_RECEIVER_PORT = 2103
PICKLE_RECEIVER_PORT = 2104
CACHE_QUERY_PORT = 7102
LOG_LISTENER_CONNECTIONS = False
LOG_UPDATES = False
LOG_CACHE_HITS = True
LOG_CACHE_QUEUE_SORTS = False

[cache:c]
LINE_RECEIVER_PORT = 2203
PICKLE_RECEIVER_PORT = 2204
CACHE_QUERY_PORT = 7202
LOG_LISTENER_CONNECTIONS = False
LOG_UPDATES = False
LOG_CACHE_HITS = True
LOG_CACHE_QUEUE_SORTS = False

[cache:d]
LINE_RECEIVER_PORT = 2303
PICKLE_RECEIVER_PORT = 2304
CACHE_QUERY_PORT = 7302
LOG_LISTENER_CONNECTIONS = False
LOG_UPDATES = False
LOG_CACHE_HITS = True
LOG_CACHE_QUEUE_SORTS = False

[relay]
LINE_RECEIVER_INTERFACE = 0.0.0.0
LINE_RECEIVER_PORT = 2003
PICKLE_RECEIVER_INTERFACE = 0.0.0.0
PICKLE_RECEIVER_PORT = 2004
LOG_LISTENER_CONNECTIONS = True
RELAY_METHOD = rules
REPLICATION_FACTOR = 1
DESTINATIONS = 127.0.0.1:2104:b, 127.0.0.1:2204:c, 127.0.0.1:2304
MAX_DATAPOINTS_PER_MESSAGE = 500
MAX_QUEUE_SIZE = 10000
QUEUE_LOW_WATERMARK_PCT = 0.8
USE_FLOW_CONTROL = True

[aggregator]
LINE_RECEIVER_INTERFACE = 0.0.0.0
LINE_RECEIVER_PORT = 2023
PICKLE_RECEIVER_INTERFACE = 0.0.0.0
PICKLE_RECEIVER_PORT = 2024
LOG_LISTENER_CONNECTIONS = True
FORWARD_ALL = False
DESTINATIONS = 127.0.0.1:2104:b, 127.0.0.1:2204:c, 127.0.0.1:2304:d
REPLICATION_FACTOR = 1
MAX_QUEUE_SIZE = 10000
USE_FLOW_CONTROL = True
MAX_DATAPOINTS_PER_MESSAGE = 500
MAX_AGGREGATION_INTERVALS = 5
```

- Cấu hình rules trong file `relay-rules.conf` 

```
[kvm31]
pattern = ^collectd.kvm31.*
destinations = 127.0.0.1:2104:b

[kvm36]
pattern = ^collectd.kvm36.*
destinations = 127.0.0.1:2204:c

[default]
default = true
destinations = 127.0.0.1:2304:d
```

Cấu hình trên có nghĩa: Các metric từ host kvm31 sẽ được đẩy vào cache instance b, kvm36 đẩy vào cache instance c và các metric còn lại đẩy vào cache instance d.

- Nếu dùng carbon-relay với cổng 2003 thì phải tắt cache instance mặc định nếu đang bật:

```
systemctl stop carbon-cache
```

- Khởi động các carbon-cache instance:

```
carbon-cache --config=/etc/carbon/carbon.conf --instance=b start
carbon-cache --config=/etc/carbon/carbon.conf --instance=c start
carbon-cache --config=/etc/carbon/carbon.conf --instance=d start
```

- Khởi động lại carbon-relay

```
systemctl restart carbon-relay 
```