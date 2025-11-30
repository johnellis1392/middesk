# Alternative Solution

While the solution on the main branch is robust, I realized while implementing
it that I could easily memoize much of the data links, and negate the need
for the `Association` model, by changing the data structure to be more linear.
My new approach looks like this:

```ruby
class Business < ApplicationRecord
  has_many :roles
end

class Officer < ApplicationRecord
  has_many :roles
end

# Use Role as a virtual join table
class Role < ApplicationRecord
  validates :name, presence: true
  belongs_to :business
  belongs_to :officer
end
```

The idea is that since each row of the CSV is one unique relationship between
the three entities in question, and the officers and businesses are ostensibly the
more important data here, we can just use one join table between them that has
the de-normalized role name on it. This does add some extra space cost for storing
the same copy of a limited set of strings in multiple places, but the overall data
structure is massively simplified. This also has the added benefit of simplifying the
seed logic, because the call to `Role.find_or_create_by!(...)` doesn't fail on
duplicate records.

To start up the server, do one of the following:

Start via Rails cli:
```bash
bin/rails db:create db:migrate db:seed
bin/rails server
```

Start via Makefile:
```bash
make setup server
```

I also included a Makefile target for doing a hard-delete of the database, in case
you need it:
```bash
make destroy-db
```
