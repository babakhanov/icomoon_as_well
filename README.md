## Installation

`gem install icomoon_as_well`

## Usage

#### From the command line:

`icomoon_as_well /path/to/icomoon.zip /path/to/your_project [OPTIONS]`

### OPTIONS

#### Command line options

```
  --rails                Put all files into a rails project (app/assets/stylesheets, and app/assets/fonts) 
```

## Important
If you use Rails, be sure you had added 
```ruby
Rails.application.config.assets.paths << "fonts"
```
into `config/initializers/assets.rb` to add a fonts with asset pipeline

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
