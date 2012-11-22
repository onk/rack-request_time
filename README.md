Rack::RequestTime
========================================================================

Rack::RequestTime is a Rack middleware for using consistent time in request.

Usage
------------------------------------------------------------------------

Add this line to your application's Gemfile:

```ruby
gem "rack-request_time"
```

Add Rack::RequestTime in your application's Rack middleware stack:

```ruby
# sinatra
use Rack::RequestTime

# rails
config.middleware.use Rack::RequestTime
```

Write application code using `Rack::RequestTime.current` instead of `Time.current`

Author
------------------------------------------------------------------------

onk &lt;takafumi.onaka@gmail.com&gt; (@onk)

License
------------------------------------------------------------------------

Licensed under the MIT license.

