# Overview
This demo service is a vanilla implementation of a Rails application using [Crichton](https://github.com/mdsol/crichton). 
It exposes several resources representing Diagnostic Repair Drones (DRDs). 

The Crichton [resource_descriptor](api_descriptors/drds_descriptor_v1.yml) describes a simple state machine with
conditions on the various transitions. These conditions would typically be determined in the context of a request
and passed in as options in the response. In order to see Crichton's runtime generation of available transitions
based on both the state of resources and the satisfied conditions, a query parameter ?conditions=can_do_something
can be added in the browser to mimic this on the fly.

It further describes the semantics of the resources and the protocol-specific implementations used to generate
the responses.

## Setup

```
$ bundle install
$ rake setup
$ bundle exec rackup -p 3000
```

NOTE: You will need to run `rake update_drd` after `bundle update`

## Exploring

Take a look at the controllers and models to see the basic implementation for both single entities and resources that
embed other resources with meta-data.

So, enter the API by browsing to `localhost:3000/drds` in browser and and follow your nose. You can add the following 
conditions, either as a single value, or comma-separated list at any time to see what changes:

* can_do_anything
* can_create
* can_update
* can_delete
* can_activate
* can_deactivate
* airlock_open

E.g. `localhost:3000/drds?conditions=can_delete,can_activate`

## Curling
Crichton also supports out of the box a lighter xHTML response. You can play with this, as a machine client would,
using curl:

```
$ curl --header "Content-Type: application/xhtml+xml" GET localhost:3000/drds
```

You can add the conditions query parameter here as well.

```
$ curl --header "Content-Type: application/xhtml+xml" GET localhost:3000/drds?conditions=airlock_open
```

## ALPS
Don't miss the profile link when you view source in the head tag for responses. This ALPS profile is generated from
the resource descriptor and represents all the semantics and affordances that you will find in a response:
`localhost:3000/alps/DRDs`

## Default Rails HTML responses
If you are wondering what happens if I include an HTML view, change the name of the 
[index.html.orb](app/views/drds/index.html.orb) file to `index.html.erb` and then reload the URL `localhost:3000/drds`.

Hint: it works like it should.
