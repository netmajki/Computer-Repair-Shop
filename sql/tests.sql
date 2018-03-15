--- Tests for Customer Bill
@tables
@procedures
@triggers

INSERT INTO Customers VALUES ('408-663-7143','Deen Aarif');
INSERT INTO RepairItem VALUES ('001','Samsung',40.00,2017,'SINGLE','COMPUTER');
INSERT INTO RepairItem VALUES ('002','iPhone',50.00,2017,'SINGLE','COMPUTER');
INSERT INTO CustomerBill VALUES ('001','408-663-7143',DATE '2018-03-10',20.00,40.00,5);
INSERT INTO ServiceContract VALUES('S01',DATE '2018-03-10',DATE '2018-03-17','408-663-7143','001',NULL,'SINGLE');
INSERT INTO ServiceContract VALUES('S02',DATE '2018-03-10',DATE '2018-03-17','408-663-7143','001',NULL,'SINGLE');
INSERT INTO RepairPerson VALUES('e01','john smith','408-666-6666');
INSERT INTO RepairJob VALUES('002','S02','408-663-7143','e01',DATE '2018-03-10','UNDER_REPAIR');
INSERT INTO RepairLog VALUES('001','S01','No Problems','408-663-7143','e01',DATE '2018-03-10',DATE '2018-03-17','DONE');


declare
	msg  VARCHAR2(60);
begin
	acceptMachine('Deen Aarif','408-663-7143','002','Samsung', 'S02', DATE '2015-12-11',msg);
end;
/

-- should output 40.00
-- currently outputing 0.00
declare
	output number := 0;
begin
	output := getRevenueGenerated(DATE '2018-03-08', DATE '2018-03-17');
	dbms_output.put_line('getRevenueGenerated() : ' || output);
end;
/

-- should output ?
-- currently outputing 0.00
declare
	output number := 0;
begin
	output := getRevenueNoWarranty(DATE '2018-03-08', DATE '2018-03-17');
	dbms_output.put_line('getRevenueNoWarranty() : ' || output);
end;
/

-- should output ?
-- currently outputing 0.00
declare
	output number := 0;
begin
	output := getRevenueWarranty(DATE '2018-03-08', DATE '2018-03-17');
	dbms_output.put_line('getRevenueWarranty() : ' || output);
end;
/


commit;
