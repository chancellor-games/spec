# Connecting

Ada's client can now connect to her personal `events` url which will immediately
send her this same json with a `"type": "setup"` field added and url fields
removed. The next step is that Ada's client needs to send a `setup` event with
an initial game state. This also could require getting some random data from the
server.
