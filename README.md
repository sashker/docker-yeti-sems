# What is YETI?

YETI is an open source project based on SBC module of SEMS. The main goal is to move routing logic and entire softswitch behaviour to a separated layer. This approach provides flexibility, ability to quickly add a non-trivial features and simply integrate it with other systems. It is possible to completely change the business logic by changing only the management layer component.
YETI consists of few separate parts:
* Core - modified SEMS and YETI SEMS module binaries.
* Management layer - set of tables and appropriate PL/pgSQL stored procedures. As a database system we have chosen PostgreSQL.
* Web-interface to manage YETI on Rails.

![logo](https://yeti-switch.org/img/logo.png)

# How to use this image

## Start a `sems` node instance

Starting a SEMS node is simple:

```console
$ docker run --name some-sems -d sashker/docker-yeti-sems:tag
```

... where `some-sems` is the name you want to assign to your container and `tag` is the tag specifying the SEMS version you want. See the list above for relevant tags.

## Connect to SEMS from an application in another Docker container

This image exposes the next ports (5601) for SIP traffic and (7080) for XML-RPC interface, so container linking makes the SEMS instance available to other application containers. Start your application container like this in order to link it to the SEMS container:

```console
$ docker run --name some-app --link some-sems:sems -d application-that-uses-sems
```
