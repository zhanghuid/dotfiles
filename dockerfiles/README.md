## Usage

### require
1. [make](https://www.ruanyifeng.com/blog/2015/02/make.html)
2. [docker](https://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)

### before use
```bash
chmod +x phpcli
chmod +x nginxcli
```

### cli

```bash
Usage: ./cli
    ./cli [lang] [action] [version]

lang:     [ nginx | golang | php]
action:   [ build | run | exec | clean | restart | logs | start ]
version:  
[ 
    eg:
    php     -> 71
    nginx   -> 1.12.0
    golang  -> 1.18  
]
```

### nginx

```bash
# help
./nginxcli
```

### phpcli
```bash
# help
./phpcli
```