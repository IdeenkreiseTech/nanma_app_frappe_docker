git_password=123

cd ../
yes|docker builder prune --all

# Create the JSON string with proper formatting
app1='{"url": "https://123:123@github.com/IdeenkreiseTech/nanma_app.git","branch": "prod"}'
export APPS_JSON='['"$app1"']'
export APPS_JSON_BASE64=$(echo ${APPS_JSON} | base64 -w 0)

sudo docker build \
  --build-arg=FRAPPE_PATH=https://github.com/frappe/frappe \
  --build-arg=FRAPPE_BRANCH=v13.57.4 \
  --build-arg=PYTHON_VERSION=3.9.17 \
  --build-arg=NODE_VERSION=14.21.3 \
  --build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
  --tag=ghcr.io/ideenkreisetech/nanma_app/nanma_app:1.0.0 \
  --file=images/custom/Containerfile .

sudo docker login ghcr.io -u IdeenkreiseTech -p $git_password

sudo docker push ghcr.io/ideenkreisetech/nanma_app/nanma_app:1.0.0
