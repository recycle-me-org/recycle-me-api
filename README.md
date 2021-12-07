# Recycle Me Api
[![Build Status][circleci-image]][circleci-url]

## Table of contents
- [Overview](#overview)
- [Endpoints](#endpoints)
- [APIs](#apis)
- [Endpoint and Queries](#endpoint-and-queries)
- [Setup](#setup)
- [Schema](#schema)
- [Technologies](#technologies)
- [Contributors](#contributors)

### Overview

[Recycle Me]()

### APIs

The following are a list of APIs used:

[Earth911 Search API](https://api.earth911.com)

### Endpoint and Queries

All requests should be made in the form of a POST request to:

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
    lat
    long
  }
}
```

This query can also accept an address:

```
{
  searchLocations(materialId: "60", location: "1331 17th Street, Denver, CO, United States") {
    name
    lat
    long
  }
}
```

Example response:

```
{
    "data": {
        "searchLocations": [
            {
                "name": "City & County of Denver and Waste Management Recycle America",
                "lat": 39.74161317742318,
                "long": -104.95916446176378
            },
            {
                "name": "Altogether Recycling",
                "lat": 39.79759115400746,
                "long": -104.99434407038483
            },
            {
                "name": "Waste Management Franklin Street Materials Recovery Facility",
                "lat": 39.79484095659084,
                "long": -104.96936311051711
            },
            {
                "name": "Waste Management Recycle America Drop-off Site",
                "lat": 39.78303802601115,
                "long": -104.94340812239768
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - Fire Station #1",
                "lat": 39.828760058062585,
                "long": -105.03955044042064
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - Municipal Court",
                "lat": 39.83534907270659,
                "long": -105.0266588900302
            },
            {
                "name": "Go Green Recycling",
                "lat": 39.78624658966388,
                "long": -105.10578436153776
            },
            {
                "name": "Lakewood Recycling Center",
                "lat": 39.73227396536256,
                "long": -105.12091044732921
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - NorthStar Park ",
                "lat": 39.85631932800838,
                "long": -104.98798423885887
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Municipal Service Center",
                "lat": 39.86995572353249,
                "long": -104.98609347813493
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - Municipal Service Center",
                "lat": 39.85683499002399,
                "long": -105.06968802044452
            },
            {
                "name": "Waste Management Recycle America Drop-off Site",
                "lat": 39.6308604356244,
                "long": -105.01691860751298
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Margaret W. Carpenter Recreation Center ",
                "lat": 39.89688473990364,
                "long": -104.94243409414597
            },
            {
                "name": "Buckley",
                "lat": 39.72247638706582,
                "long": -104.78154754527323
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - West View Recreation Center",
                "lat": 39.894077246707496,
                "long": -105.11833213725113
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Fire Station #5",
                "lat": 39.8998068246588,
                "long": -104.86531397492135
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Fire Station #4",
                "lat": 39.92839741863583,
                "long": -104.93595967106098
            },
            {
                "name": "Denver Arapahoe Disposal / Recycling Site ",
                "lat": 39.651945282485215,
                "long": -104.7130790887551
            },
            {
                "name": "Eco-Cycle Recycling Drop-off Center - Erie",
                "lat": 40.046426724432784,
                "long": -105.05851534343947
            },
            {
                "name": "Town of Erie Recycling Center",
                "lat": 40.05519297869829,
                "long": -105.0494053144969
            },
            {
                "name": "Eco-Cycle Center For Hard to Recycle Materials",
                "lat": 40.01382542588984,
                "long": -105.20387473606417
            },
            {
                "name": "Boulder County Recycling Center",
                "lat": 40.017606947337704,
                "long": -105.20874487732277
            },
            {
                "name": "Western Disposal Transfer Station",
                "lat": 40.02751911719347,
                "long": -105.21665169489557
            },
            {
                "name": "CU Recycling Intermediate Processing Facility",
                "lat": 40.0105595664576,
                "long": -105.2662698399539
            }
        ]
    }
}
```

### Setup

### Schema
![Schema Screenshot](https://user-images.githubusercontent.com/826189/144720415-74ce5429-ad74-4936-bab8-0e249a388ce5.png)

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
