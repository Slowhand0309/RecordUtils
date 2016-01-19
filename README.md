# RecordUtils

Database of utility tool by ActiveRecord<br>
During implementation.

## Description

It is a little handy utility tool for Database.<br>
dump of data and get the current state and etc...

## Usage


#### Clean data

```ruby
require 'record_utils'

r = RecordUtils::RecordClear.new
r.connect
r.clear_all
```
* delete all table data
* delete specific table data

#### Dump data

```ruby
require 'record_utils'

r = RecordUtils::RecordDump.new
r.connect
r.dump(:json)
```

* support dump format

  1. json
  2. xml
  3. csv => not yet
  4. yaml => not yet


## Licence

  [MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

  [slowhand0309](https://github.com/Slowhand0309)
