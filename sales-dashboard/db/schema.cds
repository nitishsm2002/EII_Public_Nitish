using { Country, Currency } from'@sap/cds/common';

namespace sales;

aspect KeyID{
    key ID: String(20);
}

entity Regions:KeyID{
    name:String(30);
}

entity SalesTeams : KeyID {
  name: String(50);
  region: Association to Regions;
  members: Association to many SalesReps on members.team = $self;
}

entity SalesReps : KeyID {
  name: String(80);
  email: String(100);
  team: Association to SalesTeams;
}


entity Products : KeyID {
  name : String(100);
  price : Decimal(13,2);
  currency : Currency;
}

entity Customers : KeyID {
  name: String(100);
  country : Country;
}


entity SalesOrders : KeyID {
  orderDate: Date;
  customer: Association to Customers;
  salesRep: Association to SalesReps;
  items: Composition of many SalesOrderItems on items.order = $self;
}


entity SalesOrderItems {
  key itemNo : Integer;
  order : Association to SalesOrders;
  product: Association to Products;
  quantity : Integer;
  netAmount: Decimal(13,2);
}

entity SalesFacts {
  key date: Date;
  region : Association to Regions;
  salesTeam: Association to SalesTeams;
  salesRep: Association to SalesReps;
  product : Association to Products;
  customer: Association to Customers;
  revenue: Decimal(15,2);
  currency: Currency;
}
