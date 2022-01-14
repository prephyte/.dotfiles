#!/bin/bash
/opt/t-rex/t-rex -a ethash -o stratum+tcp://daggerhashimoto.eu-west.nicehash.com:3353 \
    -u 3M53dNMuzJrocFF9DDi5FCqNu67iQsL2F2.PC \
    -p x \
    -i 15 \
    -w PC \
    --api-bind-http "0.0.0.0:4067" \
    --temperature-limit "59" \
    --temperature-start "55" \
    --api-key "$(cat ~/.secrets/t-rex.secret)" \
    > /dev/null
