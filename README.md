# `trombik.template_role`

Install `bundler`.

# Requirements

# Role Variables
| Variable | Description | Default |
|----------|-------------|---------|
| `bundler_package` | Package name of `bundler` | `{{ __bundler_package }}` |
| `bundler_extra_packages` | List of additional packages | `[]` |


## Debian

| Variable | Default |
|----------|---------|
| `__bundler_package` | `ruby-bundler` |

## FreeBSD

| Variable | Default |
|----------|---------|
| `__bundler_package` | `sysutils/rubygem-bundler` |

## OpenBSD

| Variable | Default |
|----------|---------|
| `__bundler_package` | `ruby25-bundler` |

## RedHat

| Variable | Default |
|----------|---------|
| `__bundler_package` | `rubygem-bundler` |

# Dependencies

# Example Playbook

```yaml
---
- hosts: localhost
  roles:
    - ansible-role-bundler
  pre_tasks:
    - name: Dump all hostvars
      debug:
        var: hostvars[inventory_hostname]
  post_tasks:
    - name: List all services (systemd)
      # workaround ansible-lint: [303] service used in place of service module
      shell: "echo; systemctl list-units --type service"
      changed_when: false
      when:
        # in docker, init is not systemd
        - ansible_virtualization_type != 'docker'
        - ansible_os_family == 'RedHat' or ansible_os_family == 'Debian'
    - name: list all services (FreeBSD service)
      # workaround ansible-lint: [303] service used in place of service module
      shell: "echo; service -l"
      changed_when: false
      when:
        - ansible_os_family == 'FreeBSD'
  vars:
```

# License

```
Copyright (c) 2020 Tomoyuki Sakurai <y@trombik.org>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <y@trombik.org>
