create table Car(
regno varchar(10) not null,
model varchar(10) not null,
year date not null,
primary key(regno)
);

create table Person(
driverid varchar(10) not null,
name varchar(10) not null,
address varchar(30),
owns varchar(10) not null,
primary key(driverid),
foreign key(owns) references Car(regno));


create table Accident(
reportNumber int not null,
accdDate date not null,
location varchar(30) not null,
damageAmount int not null,
carRegNo varchar(10),
participated varchar(10) not null,
primary key(carRegNo),
foreign key(carRegNo) references Car(regno),
foreign key(participated) references Person(driverid)
);


insert into Car values('ka123','2011',DATE '01-01-17');
insert into Car values('ka124','2009',DATE '01-01-18');
insert into Car values('ka125','2010',DATE '01-01-13');
insert into Car values('ka126','2001',DATE '01-01-15');
insert into Car values('ka127','2012',DATE '01-01-17');



insert into Person values('dr123','shubham','hubli','ka123');
insert into Person values('dr124','Arjun','sirsi','ka124');
insert into Person values('dr125','Anush','dharwad','ka125');
insert into Person values('dr126','Basavraj','hubli','ka126');
insert into Person values('dr127','Sayyada','dharwad','ka127');




insert into Accident values('12345',DATE '2011-10-21','dharwad','20000','ka123','dr123');
insert into Accident values('12346',DATE '2012-09-18','hubli','5000','ka124','dr124');
insert into Accident values('12347',DATE '2009-12-30','banglore','30000','ka125','dr125');

create database tm3;
use tm3;

create table Customer(
CusNo int primary key,
Cname varchar(20),
City varchar(30) not null);

create table Order1(
OrderNo int,
Odate date,
CusNo int not null,
OrderAmt int not null,
primary key(OrderNo),
foreign key(CusNo) references Customer(CusNo));


create table Item(
ItemNo int primary key,
UnitPrice int not null);


create table Order_Item(
OrderNo int not null,
ItemNo int not null,
Qty int not null,
foreign key(OrderNo) references Order1(OrderNo),
foreign key(ItemNo) references Item(ItemNo));


create table Warehouse(
Warehouse int primary key,
city varchar(30) not null);


create table Shipment(
OrderNo int not null,
Warehouse int,
ShipDate date not null,
foreign key(OrderNo) references Order1(OrderNo),
foreign key(Warehouse) references Warehouse(Warehouse));

insert into Customer values('123','Shubham','hubli');
insert into Customer values('124','Sayyeda','Dharwad');
insert into Customer values('125','Sunidi','hubli');
insert into Customer values('126','Vasuki','banglore');
insert into Customer values('127','Arjun','Sirsi');
insert into Customer values('128','Gourish','Unknown');
insert into Customer values('129','Shruti','hubli');
insert into Customer values('130','Sonali','Navanager');
insert into Customer values('131','Shraya kalli','hubli');



insert into Item values('1',2000);
insert into Item values('2',3000);
insert into Item values('3',4600);
insert into Item values('4',2050);
insert into Item values('5',1235);
insert into Item values('6',8200);
insert into Item values('7',2000);
insert into Item values('8',4000);
insert into Item values('9',3400);


insert into Warehouse values(1,'hubli');
insert into Warehouse values(2,'Dharwadi');
insert into Warehouse values(3'Banglore');
insert into Warehouse values(4,'Sirsi');
insert into Warehouse values(5,'mundgog');

insert into Order1 values(1,DATE '18-01-19',123,2000);
insert into Order1 values(2,DATE '18-02-01',124,4000);
insert into Order1 values(3,DATE '16-06-01',125,5000);
insert into Order1 values(4,DATE '17-12-19',126,1000);
insert into Order1 values(5,DATE '18-12-09',127,7000);
insert into Order1 values(6,DATE '09-01-19',128,9000);
insert into Order1 values(7,DATE '09-01-19',128,9000);

insert into Order_Item values(1,1,1);
insert into Order_Item values(2,4,2);
insert into Order_Item values(1,2,4);
insert into Order_Item values(2,3,3);
insert into Order_Item values(1,3,6);
insert into Order_Item values(3,6,22);
insert into Order_Item values(4,4,10);

insert into Shipment values(1,1,DATE '18-10-11');
insert into Shipment values(2,1,DATE '18-09-25');
insert into Shipment values(3,2,DATE '18-12-01');
insert into Shipment values(4,2,DATE '18-11-11');
insert into Shipment values(5,5,DATE '18-05-17');


select c.Cname,count(o.CusNo),AVG(o.OrderAmt) from Order1 o,Customer c where c.CusNo=o.CusNo group by o.CusNo ;

select s.OrderNo from Shipment s,Warehouse w where s.Warehouse=w.Warehouse and w.city='hubli';
