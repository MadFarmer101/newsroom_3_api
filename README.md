[![Build Status](https://semaphoreci.com/api/v1/emtalen/newsroom_3_api/branches/development/badge.svg)](https://semaphoreci.com/emtalen/newsroom_3_api)[![Coverage Status](https://coveralls.io/repos/github/CraftAcademy/newsroom_3_api/badge.svg?branch=development)](https://coveralls.io/github/CraftAcademy/newsroom_3_api?branch=development)
### Authors
[Emma-Maria Thalen](https://github.com/emtalen)  
[Philip Gaunitz](https://github.com/pgauntiz)  
[Carlos Delgado](https://github.com/Carltesio)  
[Janko Radakovic](https://github.com/MadFarmer101)  
[Lautaro Parra](https://github.com/dernathul) 

## Built with
**Back End:** Rails v.6.0.2.1 | Ruby v.2.5.1
**Testing framework:** RSpec
**Deployed at:** [Heroku](https://newsroom3api.herokuapp.com/).

## The code   
This is the API to our project Newspaper Mars Times. Here we are authenticating users, storing articles, saving all our data and also making calls to external APIs such as Stripe. This is built with Ruby on Rails. We are using Amazon Web Services to store our images.
The master repository for the visitors interface, mobile app and admin interface can be found here:
* [Mobile](https://github.com/CraftAcademy/newsroom_3_mobile_app.git)
* [Admin](https://github.com/CraftAcademy/newsroom_3_client_admin.git)
* [Visitor](https://github.com/CraftAcademy/newsroom_3_client_user.git)

### Dependencies  
* Ruby
* Rails
* RSpec
* Puma
* Pry
* Coveralls
* Factory Bot
* Shouda-Matchers
* Rack-cors 
* Active_model_serializers
* Devise_token_auth
* Stripe-rails
* Aws-sdk-s3
* Geocoder'
  
### Setup   
We are using encryped credentials for both Sripe and Amazon Web Services. Because of that, you can unfortunately not clone this repo down and run it locally without our masterkey. 
What you can do with this repo is look at the code and see the connection with out clients or find inspiration if needed. Enjoy. 

## Updates/Improvements   
- Refactoring code
- Adding all the functionality that the user interfaces provides

## License  
[MIT-license](https://en.wikipedia.org/wiki/MIT_License)

### Acknowledgement  
- Material provided by [Craft Academy](https://craftacademy.se)
- [Oliver Ochman](https://github.com/oliverochman/) for introducing us to AMS, stubbing out requests to Stripe and getting us out of messy situations
- [Thomas Ochman](https://github.com/tochman/) for helping us implement Stripe and using serializers in the right way.
- Big thanks to the others students in our cohort at Craft Academy. We have been stealing some of your code shamelessly, you have been great rubber ducks and our team internal competition in highest coverage has really helped us implement better skills in RSpec. 
