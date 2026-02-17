using { sales as my } from '../db/schema';

service SalesService {

  entity Regions    as projection on my.Regions;
  entity SalesTeams as projection on my.SalesTeams;
  entity SalesReps  as projection on my.SalesReps;
  entity Products   as projection on my.Products;
  entity Customers  as projection on my.Customers;
}
 
