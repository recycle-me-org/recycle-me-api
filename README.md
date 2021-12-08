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
    lat
    long
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
                "name": "City & County of Denver and Waste Management Recycle America",
                "long": -104.95916446176378,
                "lat": 39.74161317742318,
                "hours": "Wednesday 3pm - 6pm and Saturday 9am - NOON",
                "phone": "3-1-1 or (720) 377-7710",
                "url": "https://www.denvergov.org/content/denvergov/en/trash-and-recycling/recycling.html",
                "distance": 2.1,
                "address": "16th Ave. & Josephine, Denver, CO 80206"
            },
            {
                "name": "Altogether Recycling",
                "long": -104.99434407038483,
                "lat": 39.79759115400746,
                "hours": "Please call for hours of operation.",
                "phone": "(303) 744-9881",
                "url": "http://www.altogetherrecycling.com/",
                "distance": 3.2,
                "address": "645 W 53rd Pl, Denver, CO 80216"
            },
            {
                "name": "Waste Management Franklin Street Materials Recovery Facility",
                "long": -104.96936311051711,
                "lat": 39.79484095659084,
                "hours": "Monday to Friday 7am to 4pm and Saturday 8am to noon",
                "phone": "(303) 296-4124",
                "url": "https://www.wm.com/find-a-facility.jsp",
                "distance": 3.4,
                "address": "5395 Franklin St, Denver, CO 80216"
            },
            {
                "name": "Waste Management Recycle America Drop-off Site",
                "long": -104.94340812239768,
                "lat": 39.78303802601115,
                "hours": "Please call for hours of operation.",
                "phone": "303-355-2609",
                "url": "https://www.denvergov.org/content/denvergov/en/trash-and-recycling/recycling.html",
                "distance": 3.6,
                "address": "3730 E 48th Ave, Denver, CO 80216"
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - Fire Station #1",
                "long": -105.03955044042064,
                "lat": 39.828760058062585,
                "hours": "This is a 24 hour drop-off site.",
                "phone": "(303) 706-3362",
                "url": "https://www.cityofwestminster.us",
                "distance": 5.8,
                "address": "3948 W 73rd Ave, Westminster, CO 80030"
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - Municipal Court",
                "long": -105.0266588900302,
                "lat": 39.83534907270659,
                "hours": "This is a 24 hour drop-off site.",
                "phone": "(303) 706-3362",
                "url": "https://www.cityofwestminster.us",
                "distance": 6.0,
                "address": "3030 Turnpike Dr, Westminster, CO 80030"
            },
            {
                "name": "Go Green Recycling",
                "long": -105.10578436153776,
                "lat": 39.78624658966388,
                "hours": "Please call for hours of operation.",
                "phone": "(720) 271-6490",
                "url": "",
                "distance": 6.3,
                "address": "4930 Iris St, Wheat Ridge, CO 80033"
            },
            {
                "name": "Lakewood Recycling Center",
                "long": -105.12091044732921,
                "lat": 39.73227396536256,
                "hours": "Winter hours: October through April, 7am to 5pm  Summer hours: May through September, 7am to 7pm",
                "phone": "(303) 987-7190",
                "url": "https://www.lakewood.org/Home",
                "distance": 6.7,
                "address": "1050 Quail Street, Denver, CO 80215"
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - NorthStar Park ",
                "long": -104.98798423885887,
                "lat": 39.85631932800838,
                "hours": "This is a 24 Hour Drop-off Location. ",
                "phone": "(720) 977-6200",
                "url": "https://www.thorntonco.gov/Pages/default.aspx",
                "distance": 7.3,
                "address": "1 W 88th Ave, Thornton, CO 80260"
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Municipal Service Center",
                "long": -104.98609347813493,
                "lat": 39.86995572353249,
                "hours": "This is a 24 Hour Drop-off Location. ",
                "phone": "(720) 977-6200",
                "url": "https://www.thorntonco.gov/Pages/default.aspx",
                "distance": 8.2,
                "address": "9551 Civic Center Drive, Thornton, CO  80233 "
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - Municipal Service Center",
                "long": -105.06968802044452,
                "lat": 39.85683499002399,
                "hours": "This is a 24 hour drop-off site.",
                "phone": "(303) 706-3362",
                "url": "https://www.cityofwestminster.us/",
                "distance": 8.3,
                "address": "6575 W 88th Ave, Westminster, CO 80031"
            },
            {
                "name": "Waste Management Recycle America Drop-off Site",
                "long": -105.01691860751298,
                "lat": 39.6308604356244,
                "hours": "Please call for hours of operation. ",
                "phone": "(303) 797-9085",
                "url": "https://www.denvergov.org/content/denvergov/en.html",
                "distance": 8.4,
                "address": "2400 W Union Ave, Denver, CO 80210"
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Margaret W. Carpenter Recreation Center ",
                "long": -104.94243409414597,
                "lat": 39.89688473990364,
                "hours": "This is a 24 Hour Drop-off Location. ",
                "phone": "(303) 255-7800",
                "url": "https://www.thorntonco.gov/Pages/default.aspx",
                "distance": 10.5,
                "address": "11151 Colorado Blvd., Thornton, CO  80233 "
            },
            {
                "name": "Buckley",
                "long": -104.78154754527323,
                "lat": 39.72247638706582,
                "hours": "Please call for hours of operation.",
                "phone": "(720) 859-9628",
                "url": "",
                "distance": 11.6,
                "address": "N Telluride St, Aurora, CO 80011"
            },
            {
                "name": "City of Westminster Recycling Drop-off Site - West View Recreation Center",
                "long": -105.11833213725113,
                "lat": 39.894077246707496,
                "hours": "This is a 24 hour drop-off site.",
                "phone": "(303) 706-3362",
                "url": "https://www.cityofwestminster.us",
                "distance": 11.8,
                "address": "10747 W 108th Ave, Westminster, CO 80021"
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Fire Station #5",
                "long": -104.86531397492135,
                "lat": 39.8998068246588,
                "hours": "This is a 24 Hour Drop-off Location. ",
                "phone": "(720) 977-6200",
                "url": "https://www.thorntonco.gov/Pages/default.aspx",
                "distance": 12.4,
                "address": "Havana Street , Thornton, CO  80601"
            },
            {
                "name": "City of Thornton Recycling Drop-off Location - Fire Station #4",
                "long": -104.93595967106098,
                "lat": 39.92839741863583,
                "hours": "This is a 24 Hour Drop-off Location. ",
                "phone": "(720) 977-6200",
                "url": "https://www.thorntonco.gov/Pages/default.aspx",
                "distance": 12.7,
                "address": "128th Ave. West Lafayette St., Thornton, CO  80601"
            },
            {
                "name": "Denver Arapahoe Disposal / Recycling Site ",
                "long": -104.7130790887551,
                "lat": 39.651945282485215,
                "hours": "Monday to Friday 6am to 8:30pm and Saturday 7am to 5pm",
                "phone": "(720) 876-2650",
                "url": "https://www.auroragov.org/",
                "distance": 16.5,
                "address": "3500 S Gun Club Rd, Aurora, CO 80018"
            },
            {
                "name": "Eco-Cycle Recycling Drop-off Center - Erie",
                "long": -105.05851534343947,
                "lat": 40.046426724432784,
                "hours": "24 hour drop-off site",
                "phone": "(303) 665-3555",
                "url": "http://www.ecocycle.org/",
                "distance": 20.7,
                "address": "1149 Telleen Avenue, Erie, CO 80516"
            },
            {
                "name": "Town of Erie Recycling Center",
                "long": -105.0494053144969,
                "lat": 40.05519297869829,
                "hours": "Please call for hours of operation.",
                "phone": "(303) 926-2880",
                "url": "https://www.erieco.gov/282/Erie-Recycling-Center",
                "distance": 21.2,
                "address": "1000 Briggs St, Erie, CO 80516"
            },
            {
                "name": "Eco-Cycle Center For Hard to Recycle Materials",
                "long": -105.20387473606417,
                "lat": 40.01382542588984,
                "hours": "Monday to Saturday 9am to 4pm",
                "phone": "(303) 444-6634",
                "url": "http://www.ecocycle.org/charm",
                "distance": 21.2,
                "address": "6400 Arapahoe Road, Boulder, CO 80303"
            },
            {
                "name": "Boulder County Recycling Center",
                "long": -105.20874487732277,
                "lat": 40.017606947337704,
                "hours": "This is a 24 hour drop-off site.",
                "phone": "(303) 444-6634",
                "url": "http://ecocycle.org",
                "distance": 21.6,
                "address": "1901 63rd Street, Boulder, CO 80303"
            },
            {
                "name": "Western Disposal Transfer Station",
                "long": -105.21665169489557,
                "lat": 40.02751911719347,
                "hours": "(Summer Hours) Monday to Saturday, 7am to 5pm. (Winter hours) Monday to Friday, 7am to 5pm; Saturday, 7am to 2pm",
                "phone": "(303) 444-2037",
                "url": "https://www.westerndisposal.com/",
                "distance": 22.4,
                "address": "5880 Butte Mill Road, Boulder, CO 80301"
            },
            {
                "name": "CU Recycling Intermediate Processing Facility",
                "long": -105.2662698399539,
                "lat": 40.0105595664576,
                "hours": "Monday to Friday 7:30am to 4pm",
                "phone": "(303) 492-5321",
                "url": "https://www.colorado.edu",
                "distance": 22.9,
                "address": "Stadium Drive, Boulder, CO 80303"
            }
        ]
    }
}
```

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
