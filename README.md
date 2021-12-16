# Recycle Me Api
[![Build Status][circleci-image]][circleci-url]

## Table of contents
- [Overview](#overview)
- [APIs](#apis)
- [Setup](#setup)
- [Endpoints and Queries](#endpoints-and-queries)
- [Technologies](#technologies)
- [Contributors](#contributors)

### Overview

This repo consists of the back-end application for Recycle Me, a GraphQL API built with Ruby on Rails and PostgreSQL. This back-end provides data for recycling materials and recycling locations to a React front-end application: [recycle-me-ui](https://github.com/recycle-me-org/recycle-me-ui). Together, these applications provide a resource for where and how to recycle a variety of materials. Recycle Me was built by a team of students at Turing School of Software & Design for the Module 4 Capstone Project.

### APIs

The following are a list of APIs used:

[Earth911 Search API](https://api.earth911.com)

[Google Maps Places API](https://developers.google.com/maps/documentation/places/web-service/overview)

### Setup

1. Clone the repo
   ```sh
   git clone git@github.com:recycle-me-org/recycle-me-api.git
   ```
2. Install gem packages
   ```sh
   bundle install
   ```
3. Obtain API key from [Earth911 API](https://api.earth911.com/docs/chapter/1/) and install Figaro
   ```sh
   bundle exec figaro install
   ```
   Add your API key to `config/application.yml`
   ```yaml
   # config/application.yml
   EARTH911_KEY: YOUR_API-KEY
   ```
6. Test
   ```sh
   bundle exec rspec
   ```

### Endpoints and Queries

This application uses [GraphQL](https://graphql.org). All requests should be made in the form of a POST request to:

`https://recycle-me-api.herokuapp.com/graphql`

#### searchMaterials(search:) query:

Example query:

```
{
  searchMaterials(search: "battery") {
    id
    name
  }
}
```

Example response:
```
{
  "data": {
    "materials": [
      {
        "id": 503,
        "name": "Acids"
      },
      {
        "id": 104,
        "name": "Alkaline Batteries"
      },
      {
        "id": 127,
        "name": "Button Cell Batteries"
      },
      {
        "id": 368,
        "name": "Car Fluids"
      },
      {
        "id": 689,
        "name": "Lithium Batteries"
      },
      {
        "id": 6,
        "name": "Lithium-ion Batteries"
      },
      {
        "id": 126,
        "name": "Nickel-cadmium Batteries"
      },
      {
        "id": 685,
        "name": "Nickel-metal Hydride Batteries"
      },
      {
        "id": 687,
        "name": "Nickel-zinc Batteries"
      },
      {
        "id": 691,
        "name": "Zinc-carbon Batteries"
      }
    ]
  }
}
```

#### searchLocations(materialId:, location:) query:

Example query:

```
{
  searchLocations(materialId: "60", location: "80031, United States") {
    name
    long
    lat
    hours
    phone
    url
    distance
    address
  }
}
```

This query can also accept an address:

```
{
  searchLocations(materialId: "60", location: "1331 17th Street, Denver, CO, United States") {
    name
    long
    lat
    hours
    phone
    url
    distance
    address
  }
}
```

Example response:

```
{
    "data": {
        "searchLocations": [
            {
                "name": "Metech Recycling",
                "long": -104.99239601388138,
                "lat": 39.79466906925231,
                "hours": "Monday to Friday 8am to 5pm",
                "phone": "(720) 377-7700",
                "url": "http://www.metechrecycling.com/",
                "distance": 5.7,
                "address": "500 West 53rd Place, Denver, CO 80216"
            },
            {
                "name": "SustainAbility Recycling",
                "long": -104.9898749995828,
                "lat": 39.6934847226322,
                "hours": "Tuesday to Thursday: 10am - 6pm; Friday to Sunday: 9am - 3pm",
                "phone": "303-424-1719",
                "url": "https://www.sustainability-recycling.com/",
                "distance": 12.3,
                "address": "1270 S. Bannock St, Denver, CO 80223"
            },
            {
                "name": "Jefferson County Rooney Road Recycling Center",
                "long": -105.20175479222218,
                "lat": 39.711418301619794,
                "hours": "Please call for an appointment.",
                "phone": "(303) 316-6262 ",
                "url": "http://www.rooneyroadrecycling.org/recycling-disposal-services/hazardous-materials/",
                "distance": 13.6,
                "address": "151 S Rooney Rd, Golden, CO 80401"
            },
            {
                "name": "Genesis Electronics Recycling",
                "long": -104.8922429912925,
                "lat": 39.67996291866711,
                "hours": "Monday to Friday 9am to 4pm",
                "phone": "(720) 881-7238",
                "url": "http://www.genesisrecyclingco.com/",
                "distance": 15.3,
                "address": "2045 South Valentia Street  Unit 15, Denver, CO 80231"
            },
            {
                "name": "Weld County Household Hazardous Waste South Facility",
                "long": -104.95068468639585,
                "lat": 40.08676295320999,
                "hours": "First and Third Saturday of the month and Friday, 9am to 4pm",
                "phone": "(970) 304-6415 ",
                "url": "https://www.weldgov.com",
                "distance": 16.0,
                "address": "5500 Hwy 52, Dacono, CO 80514"
            },
            {
                "name": "Whole Foods Market",
                "long": -104.90163949913264,
                "lat": 39.65240364872132,
                "hours": "Monday to Sunday 7am to 10pm",
                "phone": "(303) 488-2000",
                "url": "https://www.preserve.eco/",
                "distance": 16.7,
                "address": "7400 E Hampden Ave, Denver, CO 80237"
            },
            {
                "name": "Gilpin County Recycling and Electonic Waste Drop-off Facility",
                "long": -105.46468512440771,
                "lat": 39.86972654041444,
                "hours": "Wednesday to Saturday 7am to 2:30pm",
                "phone": "(303) 582-5004",
                "url": "http://www.gilpincounty.org/cms/one.aspx?pageId=11605615",
                "distance": 22.2,
                "address": "234 Jankowski Drive, Black Hawk, CO 80422"
            },
            {
                "name": "Tree and Styrofoam Recycling (EAS+Y)",
                "long": -105.31881006976741,
                "lat": 39.60799941959868,
                "hours": "January 5th and 12th, 9am-4pm",
                "phone": "720-536-0069",
                "url": "http://easy4you.org",
                "distance": 23.0,
                "address": "Evergreen Lutheran Church, Evergreen, CO 80439"
            }
        ]
    }
}
```

Note: Response is limited to a list of 10 results or less.

#### materials query:

Example query:

```
{
  materials {
    id
    name
    description
    imageUrl
  }
}
```

Example response:

```
{
    "data": {
        "materials": [
            {
                "id": "445",
                "name": "#1 Plastic Bags",
                "description": "Plastic bags are used to transport products or to seal foods. #1 Plastic bags may be difficult to recycle because they have limited markets.",
                "imageUrl": "materials/1-plastic-bags.jpg"
            },
            {
                "id": "60",
                "name": "#1 Plastic Beverage Bottles",
                "description": "PETE bottles have a narrow neck and are included in state bottle deposit laws. They can be clear or colored.",
                "imageUrl": "materials/1-plastic-beverage-bottles.jpg"
            },
            {
                "id": "446",
                "name": "#1 Plastic Clamshells",
                "description": "Clamshells are wide-mouth containers used to package food or other products. They can be clear or colored.",
                "imageUrl": "materials/1-plastic-clamshells.jpg"
            },
            {
                "id": "447",
                "name": "#1 Plastic Film",
                "description": "Plastic film is a thin layer of plastic often used to seal foods. It has a limited recycling market once its come in contact with food.",
                "imageUrl": "materials/1-plastic-film.jpg"
            },
            ...
        ]
    }
}
```


### Technologies

#### Versions
- Ruby 2.7.2
- Rails 5.2.6

#### Development
![Ruby on Rails][ruby-on-rails-badge]
![GraphQl][graphql-badge]
![Geocoder][geocoder-badge]
![Atom][atom-badge]
![Figaro][figaro-badge]
![Git][git-badge]
![PostgreSQL][postgreSQL-badge]  
![Postico][postico-badge]
![Postman][postman-badge]
![Rubocop][rubocop-badge]

#### Languages
![Ruby][ruby-badge]
![ActiveRecord][activerecord-badge]

#### Deployment
![Heroku][heroku-badge]
![Travis CI][travis-ci-badge]
![Faraday][faraday-badge]

#### Testing
![RSpec][rspec-badge]
![Simplecov][simplecov-badge]
![VCR][vcr-badge]
![Webmock][webmock-badge]
![Pry][pry-badge]
![Capybara][capybara-badge]
![Shoulda Matchers][shoulda-matchers-badge]

#### Development Principles
![OOP][oop-badge]
![TDD][tdd-badge]

### Contributors

Backend | ![LinkedIn][linkedin-badge] | ![Github][github-badge]
---|---|---
Ezzedine Alwafai | [link](https://www.linkedin.com/in/ealwafai/)          | [link](https://github.com/ealwafai)
Henry Schmid     | [link](https://www.linkedin.com/in/henry-schmid/)      | [link](https://github.com/hschmid516)
Michael Mattson  | [link](https://www.linkedin.com/in/michael-p-mattson/) | [link](https://github.com/michaelpmattson)

Frontend | ![LinkedIn][linkedin-badge] | ![Github][github-badge]
---|---|---
Anthony Iacono  | [link](https://www.linkedin.com/in/anthony-iacono/) | [link](https://github.com/anthony-iacono)
Raquel Hill     | [link](https://www.linkedin.com/in/raquelhill/)     | [link](https://github.com/Raquelhill)
Sarah Rudy      | [link](https://www.linkedin.com/in/rudysarah/)      | [link](https://github.com/sarahrudy)


<!-- Markdown link & img dfn's -->
[Schema Screenshot]:      https://user-images.githubusercontent.com/826189/144720415-74ce5429-ad74-4936-bab8-0e249a388ce5.png

[circleci-image]:         https://circleci.com/gh/recycle-me-org/recycle-me-api/tree/main.svg?style=svg
[circleci-url]:           https://circleci.com/gh/recycle-me-org/recycle-me-api/tree/main

[linkedin-badge]:         https://img.shields.io/badge/LinkedIn-0077B5?style=flaste&logo=linkedin&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-100000?style=flaste&logo=github&logoColor=white

[atom-badge]:             https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white
[bootstrap-badge]:        https://img.shields.io/badge/Bootstrap-563D7C?style=flat&logo=bootstrap&logoColor=white
[figaro-badge]:           https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[git-badge]:              https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white
[markdown-badge]:         https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white
[postgreSQL-badge]:       https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white
[postico-badge]:          https://img.shields.io/badge/postico-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[postman-badge]:          https://img.shields.io/badge/Postman-FF6C37?style=flat&logo=Postman&logoColor=white
[rubocop-badge]:          https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[ruby-on-rails-badge]:    https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white
[graphql-badge]:          https://img.shields.io/badge/GraphQL-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[geocoder-badge]:         https://img.shields.io/badge/Geocoder-b81818.svg?&style=flaste&logo=rubygems&logoColor=white

<!-- Languages -->
[activerecord-badge]:     https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white
[css3-badge]:             https://img.shields.io/badge/CSS3-1572B6.svg?&style=flaste&logo=css3&logoColor=white
[html5-badge]:            https://img.shields.io/badge/HTML5-0EB201.svg?&style=flaste&logo=html5&logoColor=white
[ruby-badge]:             https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white

<!-- Deployment -->
[heroku-badge]:           https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white
[travis-ci-badge]:        https://badgen.net/badge/icon/travis?icon=travis&label
[faraday-badge]:          https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white


<!-- Testing -->
[capybara-badge]:         https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[launchy-badge]:          https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[pry-badge]:              https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[rspec-badge]:            https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[shoulda-matchers-badge]: https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[simplecov-badge]:        https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[vcr-badge]:              https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[webmock-badge]:          https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white

<!-- Development Principles -->
[oop-badge]:              https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white
[tdd-badge]:              https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white
[mvc-badge]:              https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white
[rest-badge]:             https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white
