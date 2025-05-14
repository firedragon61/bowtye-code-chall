# Framework
I use Flask as the API server.

## Benefits
1. easy to use
2. widely used - hence the community support is great, can always find documentation on how to do certain things
3. integration with pytest
4. integration with SQLAlchemy (ORM)

## Drawbacks
1. forces the code to be written in a certain way eg use Application Factories
2. not sure about the performance, although for this technical challenge use case it probably doesn't matter

# Potential Improvement
1. lots of untested input validation:
  - email format
  - allowable values for district
  - phone format
  - price range
  - ...etc
2. no non-functional features were implemented
  - no authentication on the API endpoints
  - no rate limiting functionality
3. not optimal database schema design
  - without knowing the actual business use case, some tables are probably designed incorrectly, for example business hours may need to be designed for filtering based on opening days or hours
  - no indices created on certain fields for performance
  - should use non-integer like uuid as ID's for security
4. test cases are not comprehensive that cover every column in each model
5. no error handling

# Production Consideration
1. Scalability
  - not sure about the business use case, but a production quality API server should be able to sustain high load, meaning a production quality WSGI server should be used instead
2. Hosting Platforms
  - ideally the code should be deployed in a headless cloud service that supports Python

# Assumptions
1. creating a doctor object with relationships to addresses, names etc is counterintuitive from the point of view of business
2. The "price policy" (eg include 5 days of Western medicine) is not predefined. Creating a new doctor object with any new price policy will result in a new price policy even though the description may be the same an an existing price policy. This looks wrong.
3. The "category" is not predefined (see point (1)) and is created for every new doctor object. It probably should be predefined and doctor objects are mapped to certain predefined categories.
4. Addresses are assumed to be unique to each doctor object so every time a new address is always created if it is defined.
5. The database is always up and available. There is no error handling in the code if the database is down.

# Technical Setup
## Install the code under Windows
    git clone https://github.com/firedragon61/necktie-code.git
    cd necktie-code
    pip -m venv .venv
    .\.venv\Scripts\activate
    install -r requirements.txt

## Create the MySQL database, tables and data
    sudo mysql -u root < db.sql

## Start the flask application in a vscode terminal under Windows
    $env:DEV_DATABASE_URL='mysql+mysqlconnector://necktie_admin:welcome1@localhost:3306/necktie'
    flask --app api run --debug

## Run the tests
    pytest -v

  