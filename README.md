# Dashing!

Run the development environment for OCTO's dashboard!

The docker-compose.yml file contains all the necessary configurations in order to run the environment, so you just need to run docker-compse up. 

Nevertheless, here's a little description on how to use the image:

## Run

```
docker run -d -p 8080:3030 sebiwi/dashing
```

This runs dashing on port 8080 on your localhost.

### Mounting ressources
#### Dashboards
```docker run -v $PATH_TO_DASHBOARDS:/dashboards -d -p 8080:3030 sebiwi/dashing```
#### Widgets
```docker run -v $PATH_TO_WIDGETSS:/widgets -d -p 8080:3030 sebiwi/dashing```
#### Jobs
```docker run -v $PATH_TO_JOBS:/jobs -d -p 8080:3030 sebiwi/dashing```
#### Assets
```docker run -v $PATH_TO_ASSETS:/assets -d -p 8080:3030 sebiwi/dashing```
#### Config
```docker run -v $PATH_TO_CONFIG:/config -d -p 8080:3030 sebiwi/dashing```
#### Gems

You can add gems by supplying the gem names as environment variables when running the container.

```docker run -e GEMS="oa-openid ruby-trello" -d -p 8080:3030 sebiwi/dashing```

The 'base' image only contains the gems needed to run dashing. The latest contains every gem needed for the OCTO dashboard.

# Thanks

* [Fredrik Wihlborg](https://registry.hub.docker.com/u/frvi/dashing/)

