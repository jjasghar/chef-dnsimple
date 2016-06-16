## Description

A Light-weight Resource and Provider (LWRP) supporting
automatic DNS configuration via DNSimple's API.

[![Build Status](https://travis-ci.org/dnsimple/chef-dnsimple.png?branch=master)](https://travis-ci.org/dnsimple/chef-dnsimple)

## Requirements

* A DNSimple account at https://dnsimple.com
* Chef 11 or newer (Feel free to send a pull request for Chef 10.x support)

## Attributes

- `default["dnsimple"]["version"]`: The version of the DNSimple gem to install

## Resources/Providers

dnsimple\_record
----------------

Manage a DNS resource record through the DNSimple API. This resource uses
the [dnsimple Ruby library](http://rubygems.org/gems/dnsimple) to connect and
use the DNSimple API.

### Actions:

    | Action    | Description          | Default |
    |-----------|----------------------|---------|
    | *create*  | Create the record.   | Yes     |
    | *destroy* | Destroy the record.  |         |

### Parameter Attributes:

The type of record can be one of the following: A, CNAME, ALIAS, MX,
SPF, URL, TXT, NS, SRV, NAPTR, PTR, AAA, SSHFP, or HFINO.

    | Parameter    | Description                        | Default   |
    | ------------ | ---------------------------------  | --------- |
    | *domain*     | Domain to manage                   |           |
    | *name*       | _Name_: Name of the record         |           |
    | *type*       | Type of DNS record                 |           |
    | *content*    | String/Array content of records    |           |
    | *ttl*        | Time to live.                      | 3600      |
    | *priority*   | Priorty of update                  |           |
    | *username*   | DNSimple username                  |           |
    | *password*   | DNSimple password (**DEPRECATED**) |           |
    | *token*      | DNSimple API token                 |           |
    | *test*       | Unused at this time                | false     |

**Note**: For token based authentication you must provide an [api token][] for
the account with access to the domain you are providing in the resource. User
access tokens are also not supported at this time.  Domain based tokens will be
supported in a future release.

### Examples

Note that these examples assume you have the username, domain, and token
attributes set as they are implied in these examples. You can always specify
those attributes directly if you want to use other domains or access contexts.

```ruby
    dnsimple_record "create an A record using the DEPRECATED username/password authentication" do
      name     "test"
      content  "16.8.4.2"
      type     "A"
      domain   "example.com"
      username chef_vault_item("secrets", "dnsimple_username")
      password chef_vault_item("secrets", "dnsimple_password")
      action   :create
    end

    dnsimple_record "create an A record" do
      name     "test"
      content  "16.8.4.2"
      type     "A"
      domain   "example.com"
      username chef_vault_item("secrets", "dnsimple_username")
      token    chef_vault_item("secrets", "dnsimple_token")
      action   :create
    end

    dnsimple_record "create a CNAME record for a Google Apps site calendar" do
      name     "calendar"
      content  "ghs.google.com"
      type     "CNAME"
      domain   "example.com"
      username chef_vault_item("secrets", "dnsimple_username")
      token    chef_vault_item("secrets", "dnsimple_token")
      action   :create
    end

    dnsimple_record "create a A record with multiple content values" do
      name     "multiple"
      content  ["1.1.1.1", "2.2.2.2"]
      type     "A"
      domain   "example.com"
      username chef_vault_item("secrets", "dnsimple_username")
      token    chef_vault_item("secrets", "dnsimple_token")
      action   :create
    end
```

## Usage

Add the dnsimple cookbook to your cookbook's metadata and it will automatically
install the dnsimple gem and make the dnsimple\_record resource available.

## Testing

To run the tests across all platforms, you want to grab the latest [ChefDK][]
<<<<<<< 54643d8b9c01c94a6dd0864a6c94969cc820c8ea
install [VirtualBox][], [Vagrant][], and the [Chefstyle][] gem into your ChefDK
then run `chef exec kitchen test`.
=======
install [VirtualBox][], [Vagrant][], and the following gems into your ChefDK:

* [Chefstyle][]
* [dnsimple][dnsimple-gem]
* [webmock][]

Then run `chef exec rake quick` for unit and style tests.
>>>>>>> Cleanup and update README

## License and Authors

* Author:: [Aaron Kalin](https://github.com/martinisoft)
<<<<<<< 54643d8b9c01c94a6dd0864a6c94969cc820c8ea
* Author:: [David Aronsohn](https://github.com/tbunnyman)
=======
>>>>>>> Cleanup and update README
* Author:: [Darrin Eden](https://github.com/dje)
* Author:: [Joshua Timberman](https://github.com/jtimberman)
* Author:: [Jose Luis Salas](https://github.com/josacar)

Copyright:: 2014-2016 Aetrion, LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[ChefDK]: https://downloads.chef.io/chef-dk/
[VirtualBox]: https://www.virtualbox.org/wiki/Downloads
[Vagrant]: https://www.vagrantup.com/downloads.html
[Chefstyle]: https://github.com/chef/chefstyle
<<<<<<< 54643d8b9c01c94a6dd0864a6c94969cc820c8ea
[api token]: https://developer.dnsimple.com/v1/authentication/#api-token
=======
[dnsimple-gem]: https://rubygems.org/gems/dnsimple
[webmock]: https://rubygems.org/gems/webmock
>>>>>>> Cleanup and update README
