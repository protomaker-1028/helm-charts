# Helm Charts

A collection of Helm charts for deploying applications to Kubernetes clusters.

## Overview

This repository contains Helm charts that provide templated Kubernetes manifests for easy deployment and management of applications. Each chart is a packaged Helm application that can be deployed to your Kubernetes cluster.

## Getting Started

### Prerequisites

- Kubernetes 1.19+
- Helm 3.0+

### Installation

Add this repository to your Helm configuration:

```bash
helm repo add protomaker https://github.com/protomaker-1028/helm-charts
helm repo update
helm pull xxxxxx --untar --untardir dir/xxxxxx
helm pull oci://ghcr.io/traefik/helm/traefik --untar --untardir traxfix
```

### Fission

Fission is deployed through Helmfile as the `fission-charts/fission-all` release
in the `fission` namespace. Its CRDs must be installed before the Helm release:

```bash
kubectl create -k "github.com/fission/fission/crds/v1?ref=v1.27.0"
helmfile -e dev sync
```

The release uses `ClusterIP` services. Change `serviceType` and
`routerServiceType` in [releases/infrastructure.yaml](releases/infrastructure.yaml)
to `NodePort` or `LoadBalancer` when external access is required.

## Charts

| Chart | Description | Version |
|-------|-------------|---------|
| | | |

<!-- Add your charts here -->

## Usage

To install a chart:

```bash
helm install <release-name> protomaker/<chart-name>
```

To upgrade an existing release:

```bash
helm upgrade <release-name> protomaker/<chart-name>
```

To uninstall a release:

```bash
helm uninstall <release-name>
```

## Development

### Creating a New Chart

Create a new chart using the Helm scaffold:

```bash
helm create <chart-name>
```

### Testing a Chart

Lint your chart:

```bash
helm lint <chart-name>
```

Template rendering check:

```bash
helm template <chart-name> <chart-name>
```

### Packaging

Package a chart for distribution:

```bash
helm package <chart-name>
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues, questions, or suggestions, please open an issue in this repository.
