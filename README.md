# Tenancy


There are , basically, 3 types to create an multi-tenant application.  

  * Same Database and shared 'namespace' to all tenants (*Using tenant_id on every table to identify the client data*)  
  * **Same Database with distinct 'namespace' to every tenants** (*Using Database schema*)       
  * Database per Tenant (*Every Tenant will provisioning your all database*)   

This example will show you the second approach.   
Using Distinct 'namespace', instead of use tenant_id in every database table ( IMHO isn´t appropriate to a nice SaaS product ), every client will have your own database schema.   
   

## Installation  

To continue, your machine must have installed the [POSTGRESQL](http://www.postgresql.org/) and  [Bundler] (http://gembundler.com/)   

```
git clone git://github.com/tdantas/Tenancy.git   
bundle install
```   
Update config/database.yml username and password 

```
development:
  adapter: postgresql
  encoding: unicode
  database: tenancy_db
  username: YOUR_USER_HERE
  password: YOUR_PASSWORD_HERE
  host: localhost
```   

Create the Database and migrate before run
```
rake db:create   
rake db:migrate   
```
And now, **Ready ??**

```
bundle exec rails s   
```

## Where is the code ?

Better than try to explain the code, clone this repository and look close to:

ApplicationController
    responsibility: Change the schema context between requests.
  
Account
    responsibility: The model that will contain the schema.
    


email: thiago.teixeira.dantas@gmail.com   
gtalk: thiagochapa@gmail.com


