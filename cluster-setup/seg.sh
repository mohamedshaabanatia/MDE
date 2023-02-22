kubectl create ns sysevent
cat <<EOF | kubectl create -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sysevent
  labels:
    app: sysevent
  namespace: sysevent
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sysevent
  template:
    metadata:
      labels:
        app: sysevent
    spec:
      containers:
        - name: sysevent
          image: marcelsysdig/sysevent
          env:
            - name: minsleep
              value: "100"
            - name: maxsleep
              value: "1800"
            - name: pauseonstart
              value: "false"
      restartPolicy: Always
EOF
