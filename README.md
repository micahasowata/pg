## pg

pg makes it easy to create new postgres docker containers using the `postgres:latest` image

### Prerequisites

- You need docker installed. Go to [docker.com](https://docker.com) to install it
- You need it running for the docker container and volume to be created

### How to use

1. You need to clone this repo into whatever directory you .

```
git clone https://github.com/michasowata/pg.git
```

2. Change to the directory that you cloned it into and make it an executable

```
cd pg
sudo chmod +x pg.sh
```

3. Move it into your system path

```
sudo mv pg.sh /usr/local/bin/
```

4. Alias the `pg.sh` script

```
alias pg="pg.sh"
```

5. Anywhere you need to create a postgres container with postgres simply run...

```
pg
```

...and let the magic happen

Happy hacking.
