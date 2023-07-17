python3 2.py > 1.links
curl -vkL $(cat 1.links) > out
cat out | grep sk >> out.keys
cat out.keys | awk '{ print  }' | sed 's/.\{3\}$//' >> keys
