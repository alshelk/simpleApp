
local p = import '../params.libsonnet';
local params = p.components.myapp;

[
  {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      name: 'myapp-deployment',
      labels: {
        app: 'myapp',
      },
    },
    spec: {
      replicas: params.replicas,
      selector: {
        matchLabels: {
          app: 'myapp',
        },
      },
      template: {
        metadata: {
          labels: {
            app: 'myapp',
          },
        },
        spec: {
          containers: [
            {
              name: 'main',
              image: params.image,
              ports: [
                {
                    containerPort: 80
                }
              ]
            },
          ],
          imagePullSecrets: [
            {
              name: params.registry
            }
          ]
        },
      },
    },
  },
]
