# Tenancy

There are , basically, 3 types to create an multi-tenant application.  

  * Same Database and shared 'namespace' to all tenants *Use tenant_id in every column to identify the  client data*_  
  * **Same Database with distinct 'namespace' to every tenants** *Use Database schema*       
  * Database per Tenant   

This example will show you the second approach.   
Using Distinct 'namespace', instead of use tenant_id in every database column ( IMHO isn´t appropriate to a nice SaaS product ), every client will have your own database schema.   
   

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
rails s   
```


## Where is the code ?

The code is embedded in the lib/tenantable folder   
There are two modules: *model.rb and controller.rb*

The *Account* model will work like a *tenant switcher* (I don´t know the correct way to say this).   
The *ApplicationController* will setup the correct schema for every request, based on the User Account.




### Contacts
email: thiago.teixeira.dantas@gmail.com   
gtalk: thiagochapa@gmail.com


