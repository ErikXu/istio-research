NAMESPACE=istio-system
kubectl -n $NAMESPACE delete gateway grafana-gateway kiali-gateway prometheus-gateway tracing-gateway
kubectl -n $NAMESPACE delete virtualservice grafana-vs kiali-vs prometheus-vs tracing-vs
kubectl -n $NAMESPACE delete secret kiali

istioctl manifest apply \
    --set values.grafana.enabled=false \
    --set values.kiali.enabled=false \
    --set values.prometheus.enabled=false \
    --set values.tracing.enabled=false \

