file=xui.data

user='admin'
pass=$(ping google.com -c 1 | md5sum | head -c 10)
port=9999

echo "y"   > $file
echo $user > $file
echo $pass > $file
echo $port > $file
