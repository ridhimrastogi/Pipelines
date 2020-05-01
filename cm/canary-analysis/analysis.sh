#!/bin/bash

forever stopall
rm /bakerx/cm/canary-analysis/proxy/servers/metrics.csv
forever start /bakerx/cm/canary-analysis/proxy/dashboard/bin/www

node /bakerx/cm/canary-analysis/proxy/servers/index.js serve
