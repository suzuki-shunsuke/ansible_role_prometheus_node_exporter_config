# ansible_role_prometheus_node_exporter_config

ansible role to configure prometheus's node_exporter

https://galaxy.ansible.com/suzuki-shunsuke/prometheus_node_exporter_config

[![GitHub last commit](https://img.shields.io/github/last-commit/suzuki-shunsuke/ansible_role_prometheus_node_exporter_config.svg)](https://github.com/suzuki-shunsuke/ansible_role_prometheus_node_exporter_config)
[![GitHub tag](https://img.shields.io/github/tag/suzuki-shunsuke/ansible_role_prometheus_node_exporter_config.svg)](https://github.com/suzuki-shunsuke/ansible_role_prometheus_node_exporter_config/releases)

This role doesn't install node_exporter's binary.
If you want to install it, please use [akoi](https://github.com/suzuki-shunsuke/akoi) and [suzuki-shunsuke.akoi](https://github.com/suzuki-shunsuke/ansible_role_akoi).

```yaml
bin_path: /usr/local/bin/{{.Name}}-{{.Version}}
link_path: /usr/local/bin/{{.Name}}
packages:
  prometheus_node_exporter:
    url: https://github.com/prometheus/node_exporter/releases/download/v{{.Version}}/node_exporter-{{.Version}}.linux-amd64.tar.gz
    version: 0.16.0
    files:
    - name: node_exporter
      archive: node_exporter-{{.Version}}.linux-amd64/node_exporter
```

## Requirements

* systemd

## Role Variables

Required variables are nothing.

name | required | default | example | description
--- | --- | --- | --- | ---
prometheus_node_exporter_opts | no | | `--log.level="info"` |

And please see

* [defaults/main.yml](defaults/main.yml)
* [vars/main.yml](vars/main.yml)
* [tasks/assert.yml](tasks/assert.yml)

## Example Playbook

```yaml
- hosts: servers
  roles:
  - role: suzuki-shunsuke.prometheus_node_exporter_config
    become: yes
```

## License

[MIT](LICENSE)
