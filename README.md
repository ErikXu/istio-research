# istio-research

## Download Istio
```
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.5.1 sh -
```

## Move Istio to Path
```
cd istio-1.5.1/bin
chmod +x istioctl
mv ./istioctl /usr/local/bin/istioctl
istioctl version
```

Output:
```
client version: 1.5.1
control plane version: 1.5.1
data plane version: 1.5.1 (4 proxies)
```

## Install Istio
```
istioctl manifest apply -y
```

Output:
```
Detected that your cluster does not support third party JWT authentication. Falling back to less secure first party JWT. See https://istio.io/docs/ops/best-practices/security/#configure-third-party-service-account-tokens for details.
- Applying manifest for component Base...
✔ Finished applying manifest for component Base.
- Applying manifest for component Pilot...
✔ Finished applying manifest for component Pilot.
- Applying manifest for component AddonComponents...
- Applying manifest for component IngressGateways...
✔ Finished applying manifest for component IngressGateways.
✔ Finished applying manifest for component AddonComponents.


✔ Installation complete
```

## Istio Dashboard
- Install Dashboard
```
# The default user name is admin and default password is admin of kiali.
# You can set the user name or password in the dashboard_up.sh
chmod +x dashboard_up.sh
./dashboard_up.sh
```

Output:
```
Error from server (AlreadyExists): namespaces "istio-system" already exists # This error occurs if you created the namespace before. And you can ignore this error.
secret/kiali created
Detected that your cluster does not support third party JWT authentication. Falling back to less secure first party JWT. See https://istio.io/docs/ops/best-practices/security/#configure-third-party-service-account-tokens for details.
- Applying manifest for component Base...
✔ Finished applying manifest for component Base.
- Applying manifest for component Pilot...
✔ Finished applying manifest for component Pilot.
- Applying manifest for component IngressGateways...
- Applying manifest for component AddonComponents...
✔ Finished applying manifest for component IngressGateways.
✔ Finished applying manifest for component AddonComponents.


✔ Installation complete

gateway.networking.istio.io/grafana-gateway created
virtualservice.networking.istio.io/grafana-vs created
destinationrule.networking.istio.io/grafana unchanged
gateway.networking.istio.io/kiali-gateway created
virtualservice.networking.istio.io/kiali-vs created
destinationrule.networking.istio.io/kiali unchanged
gateway.networking.istio.io/prometheus-gateway created
virtualservice.networking.istio.io/prometheus-vs created
destinationrule.networking.istio.io/prometheus unchanged
gateway.networking.istio.io/tracing-gateway created
virtualservice.networking.istio.io/tracing-vs created
destinationrule.networking.istio.io/tracing unchanged
```

- Uninstall Dashboard
```
chmod +x dashboard_down.sh
./dashboard_down.sh
```

Output:
```
gateway.networking.istio.io "grafana-gateway" deleted
gateway.networking.istio.io "kiali-gateway" deleted
gateway.networking.istio.io "prometheus-gateway" deleted
gateway.networking.istio.io "tracing-gateway" deleted
virtualservice.networking.istio.io "grafana-vs" deleted
virtualservice.networking.istio.io "kiali-vs" deleted
virtualservice.networking.istio.io "prometheus-vs" deleted
virtualservice.networking.istio.io "tracing-vs" deleted
secret "kiali" deleted
```

# Auto Injection
- Enable auto injection to defaule namespace
```
chmod +x inject-enable.sh
./inject-enable.sh
```

Output:
```
namespace/default labeled
NAME              STATUS   AGE   ISTIO-INJECTION
default           Active   29h   enabled
istio-system      Active   29h   disabled
kube-node-lease   Active   29h
kube-public       Active   29h
kube-system       Active   29h

```

- Disable auto injection to default namespace
```
chmod +x inject-disable.sh
./inject-disable.sh
```

Output:
```
namespace/default labeled
NAME              STATUS   AGE   ISTIO-INJECTION
default           Active   29h
istio-system      Active   29h   disabled
kube-node-lease   Active   29h
kube-public       Active   29h
kube-system       Active   29h

```

# Istio Entry - NodePort Version
```
chmod +x istio-entry.sh
./istio-entry.sh
```

Output:
```
http - http://<IP ADDRESS OF CLUSTER INGRESS>:<HTTP NODE PORT>
https - https://<IP ADDRESS OF CLUSTER INGRESS>:<HTTPS NODE PORT>
kiali - http://<IP ADDRESS OF CLUSTER INGRESS>:<KIALI NODE PORT>
prometheus - http://<IP ADDRESS OF CLUSTER INGRESS>:<PROMETHEUS NODE PORT>
grafana - http://<IP ADDRESS OF CLUSTER INGRESS>:<GRAFANA NODE PORT>
tracing - http://<IP ADDRESS OF CLUSTER INGRESS>:<TRACING NODE PORT>
```