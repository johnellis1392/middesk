# Main Solution

This is my repository for the business verification API project
assessment for the software engineer interview track. I wrote
two separate solutions with their own trade-offs that can be found
on the corresponding branches of this repository:

- [`main`: My first solution](https://github.com/johnellis1392/middesk/tree/main)
- [`alternative`: My second solution](https://github.com/johnellis1392/middesk/tree/alternative)

The `README.md` on the `alternative` branch has a more thorough walkthrough
of the alternative approach (which may be the better approach, to be honest),
but I'll explain the primary approach here.

I ran into some issues when solving this problem in the interview because `sqlc`, the SQL
ORM code-generator I used along with Go to build my solution, didn't create
auto-incrementing columns by default. As well, there were a few other minor technical
hangups that prevented me from making sufficient progress. I decided to try
Ruby-on-Rails for this approach to more easily define the database in a
declarative way, which in my opinion is much better than my original Go approach.

My first instinct when I started the assignment during the interview was
to just make separate tables for all three entities: Businesses, Officers,
and Roles. The problem with this was that it lost the context that the tuple
of all three entities is also an important piece of data, and while merely
finding the associations between the different entities may have been good enough
for the prompt, losing this context meant any solution built on that couldn't scale
any further because of loss of data.

This new solution relies on four tables, loosely defined as follows:
```ruby
class Business < ApplicationRecord
  has_many :associations
end

class Officer < ApplicationRecord
  has_many :associations
end

class Role < ApplicationRecord
  has_many :associations
end

class Association < ApplicationRecord
  belongs_to :business
  belongs_to :officer
  belongs_to :role
end
```

The idea here is that `Association` maintains the correlation between
each datum in the original tuple, so we maintain the context of the data.
It is a bit verbose, which is why the simpler approach of the `alternative`
branch is likely better (3 tables rather than 4).

I made controllers and views for all three entities, with links to navigate
between them, since with this approach we basically get those links for free.

You can access the search route by loading the postman collection/environment
in the project root, or like this:
```bash
curl http://localhost:3000/search?name=<OFFICER_NAME>&business=<BUSINESS_NAME>&role=<ROLE_NAME>
```

NB. All three query parameters here are optional

Starting up the project can be done either through the rails cli like so:
```bash
bin/rails db:create db:migrate db:seed
bin/rails server
```

...or by using the project's Makefile:
```bash
make setup server
```

Also I added an extra target to the Makefile to do a hard-delete of the
database, in case you need it:
```bash
make destroy-db
```
