# Normalization Analysis for MN MarketLink Database

We introduced the `Market_Address` table to resolve a transitive dependency in `Markets` (zip_code → city/state/location_address). We also removed `total_amount` from `Orders` as it can be derived from summing `Order_Items.subtotal`, avoiding redundancy. All tables were checked against 1NF, 2NF, and 3NF.

## General Principles Applied
- **1NF**: All attributes are atomic (single-valued, no lists). Enums ensure controlled values.
- **2NF**: Non-key attributes fully depend on the entire primary key (no partial dependencies). Most PKs are single-column, so inherent.
- **3NF**: No transitive dependencies (non-key attributes depend only on the PK).

## Table-Specific Analysis

### Markets

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There was transitive dependency because state can be derived from zip code, therefore we
moved attributes zip code, city, state, and location address to a seperate junction table called MarketLocation.
There is no transitive depency after the change.

### Vendors

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute.

### Products (Core Table)

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute.

### Orders (Core Table)

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute. We did remove attribute "total_amount" because this may cause redundancy as a similar attribute
already exists in another table. We can be calculate total amount using junction table "Order_Items" instead.

### Customers

**1NF** - Each column contains atomic values, there are no repeating groups.
**2NF** - A single primary key is used, therefore only full dependencies are present.
**3NF** - There are no transitive dependency, as no non-primary attribute derives from another non-primary
attribute.

### Other Tables (For Completeness)
- **Market_Address**: 1NF/2NF/3NF achieved; simple lookup table.
- **Market_Vendors**: 1NF/2NF/3NF; attributes depend on the junction.
- **Order_Items**: 1NF/2NF/3NF; subtotal = quantity * unit_price, no transitives.
