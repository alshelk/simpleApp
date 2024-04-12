
// this file has the param overrides for the default environment
local base = import './base.libsonnet';

base {
  components +: {
    myapp +: {
      image: 'cr.yandex/crp7lguopi1pjrhap18j/my_app:latest',
      replicas: 2,
      registry: 'ycregistry',
    },
  }
}
