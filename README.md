# Repository Search GraphQl

<p align="center">

  <p align="left">
    <a href="https://ruby.ci/aranhaqg/repo-search-api"><img src="https://ruby.ci/badges/558d6f7d-2090-48eb-bf13-9d84448fd2dc/rspec"></a>
    <a href="https://ruby.ci/aranhaqg/repo-search-api"><img src="https://ruby.ci/badges/558d6f7d-2090-48eb-bf13-9d84448fd2dc/ruby_critic"></a>
    <a href="https://ruby.ci/aranhaqg/repo-search-api"><img src="https://ruby.ci/badges/558d6f7d-2090-48eb-bf13-9d84448fd2dc/rubocop"></a>
    <a href="https://ruby.ci/aranhaqg/repo-search-api"><img src="https://ruby.ci/badges/558d6f7d-2090-48eb-bf13-9d84448fd2dc/brakeman"></a>
    <a href="https://ruby.ci/aranhaqg/repo-search-api"><img src="https://ruby.ci/badges/558d6f7d-2090-48eb-bf13-9d84448fd2dc/reek"></a>
    <a href="https://ruby.ci/aranhaqg/repo-search-api"><img src="https://ruby.ci/badges/558d6f7d-2090-48eb-bf13-9d84448fd2dc/bundler_audit"></a>
  </p>
</p>

<!-- [![SourceLevel](https://app.sourcelevel.io/github/aranhaqg/-/contentful-recipes.svg)](https://app.sourcelevel.io/github/aranhaqg/-/contentful-recipes)  -->
<!-- [![Maintainability](https://api.codeclimate.com/v1/badges/0f46ce2dd832c2015eb5/maintainability)](https://codeclimate.com/github/aranhaqg/contentful-recipes/maintainability) -->

This is a GraphQL API that searches Github API repositories by a provided query. To understand how to build the query read the [Github API Documentation](https://docs.github.com/en/search-github/searching-on-github/searching-for-repositories)

This app uses:

* Ruby version 2.7.4
* Rails 6.1.4
* GraphQL 1.12.17
* HTTParty 0.20

For more details check [Gemfile](Gemfile).

This app is watched by SourceLevel, Code Climate and Travis.
## How to tun the app
To run this project you need to have Docker and Docker Compose installed. After that just run on your terminal:

```
docker-compose up
```
And then visit localhost:300/graphiql

This is a query example to search for repositories from username aranhaqg:
````
{
  searchRepositories(query: "user:aranhaqg"){
    id
    name
    fullName
    description 
    url
  }
}
```

## Running the tests

```
docker-compose run web bundle exec rspec
```
## Future Improvements

* Add pagination do the list of repositories.
* Implement authentication.
* Add a Web UI to the app.
* Improve security with Rack Attack to protect from bad clients. Can be used to prevent brute-force passwords attacks, scrapers and throttling requests from IP addresses for example.
* Scan code to look for security vulnerabilities with Brakeman.
* Add performance monitoring with New Relic or AppSignal.  
* Add error and exception monitoring with Airbrake or Sentry.  
