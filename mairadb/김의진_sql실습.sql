create table flight (
	`no` INT,
	`flightName` VARCHAR(50),
	`aircraftCode` VARCHAR(50),
	`departure` VARCHAR(50),
	`destination` VARCHAR(50),
	`departTime` DATETIME,
	`arrivalTime` DATETIME
	);


create table aircraft (
	`no` INT,
	`aircraftName` VARCHAR(50),
	`aircraftCode` VARCHAR(50),
	`seats` INT
	);

	
insert into flight (`no`, `flightName`, `aircraftCode`, `departure`,
							 `destination`, `departTime`, `arrivalTime`)
	values
	(1, 'OZ800', 'A1', 'SEOUL', 'JEJU', '2018-04-24 14:25:00', '2018-04-24 15:30:00'),
	(2, 'YE750', 'B3', 'PUSAN', 'SEOUL', '2018-04-24 11:00:00', '2018-04-24 12:00:00'),
	(3, 'DE323', 'B2', 'SEOUL', 'GWANGJU', '2018-04-24 11:30:00', '2018-04-24 13:00:00'),
	(4, 'ZE472', 'A1', 'SEOUL', 'YEOSU', '2018-04-24 09:50:00', '2018-04-24 11:00:00'),
	(5, 'SB385', 'B2', 'GWANGJU', 'SACHEON', '2018-04-24 12:20:00', '2018-04-24 14:00:00'),
	(6, 'DB218', 'B3', 'YEOSU', 'PUSAN', '2018-04-24 15:15:00', '2018-04-24 16:30:00'),
	(7, 'ZQ448', 'A2', 'DAEGU', 'JEJU', '2018-04-24 09:30:00', '2018-04-24 11:00:00'),
	(8, 'PQ124', 'A2', 'SEOUL', 'DAEGU', '2018-04-24 17:20:00', '2018-04-24 18:50:00'),
	(9, 'GJ141', 'B1', 'JEJU', 'IKSAN', '2018-04-24 19:00:00', '2018-04-24 20:00:00'),
	(10, 'LG124', 'B2', 'SEOUL', 'DAEGU', '2018-04-24 21:00:00',' 2018-04-24 22:20:00');
	
	
insert into	aircraft (`no`, `aircraftName`, `aircraftCode`, `seats`)
	values
	(1, 'A380', 'A1', 600),
	(2, 'A312', 'A2',	500),
	(3, 'B787', 'B1',	450),
	(4, 'B747', 'B2',	550),
	(5, 'B800', 'B3',	800);


select * from flight
	where departure = 'SEOUL';


select * from aircraft
	where seats >= 600;


select * from flight
	where aircraftCode in
	(select aircraftCode from aircraft where seats >= 550); 


select * from flight
	where (arrivalTime - departTime) = (select max(arrivalTime - departTime) from flight);

	
select * from flight
	where timestampdiff(minute, departTime, arrivalTime)
	= (select max(timestampdiff(minute, departTime, arrivalTime)) from flight);
