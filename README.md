# Tenancy

There are , basically, 3 types to create an multi-tenant application.  
  *Same Database and shared 'namespace' to all tenants   
  * **Same Database with distinct 'namespace' to every tenants**        
  *Database per Tenant   

This example will show you the second approach.   
Using Distinct 'namespace', instead of use tenant_id in every database column ( IMHO isn´t appropriate to a nice SaaS product ), every client will have your own database schema.   
   

## Installation  

To continue, your machine must have installed the [POSTGRESQL](http://www.postgresql.org/)

```
Install [Bundler] (http://gembundler.com/)   
git clone git://github.com/tdantas/Tenancy.git   
bundle install   
update *config/database.yml* username and password   
rake db:create   
rake db:migrate   
rails s   
```

