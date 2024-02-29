## pg

This is convenience script that makes postgres docker containers using the normal `postgres` docker image.

### Prerequisites

- You need docker installed. Go to [docker.com](https://docker.com) to install it

### How to use

1. You need to clone this repo into whatever directory you .

```
$ git clone https://github.com/michasowata/pg.git
```

2. Change to the directory that you cloned it into and make it an executable

```
$ cd pg
$ sudo chmod +x pg.sh
```

3. Move it into your system path

```
$ sudo mv pg /usr/local/bin/
```

4. Anywhere you need to create a postgres container with postgres simply run

```
$ pg
```

The magic would begin.

Happy hacking.
