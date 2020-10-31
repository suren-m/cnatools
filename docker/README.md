## Docker

#### Docker commit

`docker commit --change "ENV DEBUG=true" cid image:tag`

#### Docker stop vs kill

* SIGTERM + SIGKILL vs SIGKILL

see: docker events

```docker start -a cid```