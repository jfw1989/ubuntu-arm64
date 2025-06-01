# Ubuntu Docker Image

This image provides a standard ubuntu docker base image for other docker images to build on top of.

It is currently based on 24.04 LTS

## Extending this image

You can easily extend the behavour of this image in the following ways

* `/hooks/entrypoint-pre.d/`
  Executables placed in this directory are executed very early on, before anything else is done.

* `/hooks/entrypoint-run`
  If it exists, this is executed if the default command is not overridden. After it's execution completes the default command is executed.

* `/hooks/entrypoint-exec`
  If it exists, this is executed if default command is overridden. After it's execution completes the default command is executed.

* `/hooks/supervisord-pre.d/`
  Executables placed in this directory are executed just before supervisord is executed.

* `/hooks/supervisord-ready`
  If it exists, this is executed once supervisord is read. This is triggered from supervisord itself, when it fires the SUPERVISOR_STATE_CHANGE_RUNNING event.

