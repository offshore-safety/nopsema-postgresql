# nopsema-postgresql

This is a cookbook for provisioning a Postgres server.

## Supported Platforms

Currently the only tested platform is Ubuntu 14.04.

## Attributes

The following are the attributes available for tweaking the configuration of a Postgres sever.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['postgresql']['password']['postgres']</tt></td>
    <td>String</td>
    <td>The password for the user <tt>postgres</tt>.</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['postgresql']['listen_addresses']</tt></td>
    <td>String</td>
    <td>Controls which IPs the server will answer on.</td>
    <td><tt>\*</tt></td>
  </tr>
  <tr>
    <td><tt>['postgresql']['pg_hba']</tt></td>
    <td>Array</td>
    <td>List of config for the <tt>/etc/postgresql/<version>/main/pg_hba.conf</tt> file.</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

This cookbook makes use of the [Database](https://supermarket.chef.io/cookbooks/database/versions/4.0.9) cookbook, which in turn is using the [Postgresql](https://supermarket.chef.io/cookbooks/postgresql) cookbook.

## Sample config
We leverage the Postgresql cookbook to do the heavy lifting and it is driven by config. Configuration for our boxes is similar to:

```
...
"postgresql":{
  "password":{
    "postgres":"<insert DB password here>"
  },
  "config":{
    "listen_addresses":"*"
  },
  "pg_hba":[
    {
      "type":"host",
      "db":"<insert DB name here>",
      "user":"postgres",
      "addr":"0.0.0.0/0",
      "method":"md5"
    },
    {
      "type":"host",
      "db":"all",
      "user":"all",
      "addr":"127.0.0.1/32",
      "method":"md5"
    }
  ]
}
...
```

## Usage

### nopsema-postgresql::default
This is will only generate a cookbook for a Postgres server.


## License and Authors

Author:: National Offshore Petroleum Safety and Environmental Management Authority ([NOPSEMA](http://www.nopsema.gov.au/))
