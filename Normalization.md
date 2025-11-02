#Normalization of our Core Tables#

##Markets##

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There was transitive dependency because state can be derived from zip code, therefore we
moved attributes zip code, city, state, and location address to a seperate junction table called MarketLocation.
There is no transitive depency after the change.

##Vendors##

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute.

##Products##

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute.

##Orders##

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute. We did remove attribute "total_amount" because this may cause redundancy as a similar attribute
already exists in another table. We can be calculate total amount using junction table "Order_Items" instead.

##Customers##

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute.