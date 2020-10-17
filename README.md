Reproduces https://github.com/kevinconway/rpmvenv/issues/93

Reproduce issue:
```shell
docker build -t local/rpmvenv/issue93 .
docker run -it --rm -v "$(pwd):/app" local/rpmvenv/issue93 /bin/bash
# In container
rpmvenv --verbose rpm.json
sudo rpm install -i issue-0.1.0-1.x86_64.rpm
source /opt/issue/issue/bin/activate
python -c "import cv2"
```

Run with fix:
```shell
docker build -t local/rpmvenv/issue93 -f Dockerfile.fixed .
docker run -it --rm -v "$(pwd):/app" local/rpmvenv/issue93 /bin/bash
# In container
rpmvenv --verbose rpm.json
sudo rpm install -i issue-0.1.0-1.x86_64.rpm
source /opt/issue/issue/bin/activate
python -c "import cv2"
```
