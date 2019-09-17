# `trombik.qemu_user_static`

Install `qemu_user_static` and enable binary image activators on FreeBSD.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `qemu_user_static_package` | Package name of `qemu_user_static` | `emulators/qemu-user-static` |
| `qemu_user_static_service` | Service name of `qemu_user_static` | `qemu_user_static` |
| `qemu_user_static_conf_dir` | Path to configuration directory | `/usr/local/etc` |
| `qemu_user_static_flags` | Flags for `rc.subr` | `""` |

# Dependencies

None

# Example Playbook

```yaml
---
- hosts: localhost
  roles:
    - ansible-role-qemu_user_static
  vars:
```

# License

```
Copyright (c) 2019 Tomoyuki Sakurai <y@trombik.org>

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

This README was created by [qansible](https://github.com/trombik/qansible)
