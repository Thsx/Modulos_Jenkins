── ansible
│   ├── nginx.yml
│   ├── roles
│   │   ├── nginx
│   │   │   └── tasks
│   │   │       └── main.yml
│   │   └── zabbix
│   │       └── tasks
│   │           └── main.yml
│   └── zabbix.yml
├── desenvolvimento
│   └── terraform
│       ├── env
│       │   └── develop
│       │       ├── instancia_t2
│       │       │   ├── main.tf
│       │       │   └── variables.tf
│       │       └── vpc
│       │           ├── output.tf
│       │           └── vpc.tf
│       └── modules
│           ├── ec2-instance
│           │   ├── main.tf
│           │   └── variables.tf
│           ├── security_group_db
│           │   ├── security.tf
│           │   └── vars.tf
│           └── vpc
│               ├── main.tf
│               ├── output.tf
│               └── variables.tf
├── Jenkinsfile
├── php56.yml
├── README.md
└── roles
    ├── app_dev
    │   ├── defaults
    │   ├── handlers
    │   ├── meta
    │   ├── tasks
    │   │   └── main.yml
    │   ├── templates
    │   └── vars
    ├── nginx
    │   ├── defaults
    │   │   └── main.yml
    │   ├── handlers
    │   ├── meta
    │   ├── tasks
    │   │   └── main.yml
    │   ├── templates
    │   │   └── ssl.conf.j2
    │   └── vars
    ├── php56
    │   ├── defaults
    │   │   └── main.yml
    │   ├── handlers
    │   │   └── main.yml
    │   ├── meta
    │   │   └── main.yml
    │   ├── tasks
    │   │   └── main.yml
    │   ├── templates
    │   │   └── www.conf.j2
    │   └── vars
    │       └── main.yml
    └── zabbix
        ├── files
        ├── handlers
        ├── meta
        ├── tasks
        │   └── main.yml
        ├── templates
        └── vars

45 directories, 29 files
