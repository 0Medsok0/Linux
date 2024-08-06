# Анализ дискового пространства

#!/bin/bash

df -h | awk '{print $5}' | grep -v Use | sort -nr | head -1
