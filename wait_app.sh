URL=http://localhost:3000/

STATUS=0
function send_request() {
  STATUS=$(curl -s -o /dev/null -I -w "%{http_code}" ${URL})
  echo ${STATUS}
}

while [ "${RESPONSE}" != "200" ]; do
  RESPONSE=$(send_request)
  printf "."
  sleep 1
done
echo " is up"