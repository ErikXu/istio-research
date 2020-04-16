INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')

SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')

INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')

KIALI_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="kiali")].nodePort}')

PROMETHEUS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="prometheus")].nodePort}')

GRAFANA_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="grafana")].nodePort}')

TRACING_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tracing")].nodePort}')

echo 'http - http://'$INGRESS_HOST:$INGRESS_PORT

echo 'https - https://'$INGRESS_HOST:$SECURE_INGRESS_PORT

echo 'kiali - http://'$INGRESS_HOST:$KIALI_PORT

echo 'prometheus - http://'$INGRESS_HOST:$PROMETHEUS_PORT

echo 'grafana - http://'$INGRESS_HOST:$GRAFANA_PORT

echo 'tracing - http://'$INGRESS_HOST:$TRACING_PORT
