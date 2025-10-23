# Hogwarts Gryffindor Ansible Project

## Included content/ Directory Structure

The directory structure follows best practices recommended by the Ansible
community. Feel free to customize this template according to your specific
project requirements.

```shell
ansible-playground/
├── ansible.cfg
├── inventory/
│   ├── dev/
│   │   ├── hosts.ini
│   │   └── group_vars/
│   │       └── all.yml
│   ├── staging/
│   │   ├── hosts.ini
│   │   └── group_vars/
│   │       └── all.yml
│   └── production/
│       ├── hosts.ini
│       └── group_vars/
│           └── all.yml
│
├── playbooks/
│   ├── site.yml
│   ├── setup.yml
│   ├── deploy.yml
│   └── cleanup.yml
│
├── roles/
│   ├── common/
│   │   ├── defaults/
│   │   │   └── main.yml
│   │   ├── files/
│   │   ├── handlers/
│   │   │   └── main.yml
│   │   ├── meta/
│   │   │   └── main.yml
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── templates/
│   │   └── vars/
│   │       └── main.yml
│   └── webserver/
│       ├── defaults/
│       ├── handlers/
│       ├── tasks/
│       ├── templates/
│       ├── vars/
│       └── meta/
│
├── collections/
│   └── requirements.yml
│
├── group_vars/
│   ├── all.yml
│   ├── webservers.yml
│   └── dbservers.yml
│
├── host_vars/
│   ├── host1.yml
│   └── host2.yml
│
├── vars/
│   └── global.yml
│
├── filter_plugins/
│   └── custom_filters.py
│
├── library/
│   └── custom_module.py
│
├── files/
│   └── sample.conf
│
└── README.md

```

## Compatible with Ansible-lint

Tested with ansible-lint >=24.2.0 releases and the current development version
of ansible-core.
