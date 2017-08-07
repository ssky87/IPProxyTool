DELIMITER $$
CREATE PROCEDURE randRow()  
BEGIN 
declare tip varchar(100);
declare tid int;   
SELECT 
a.id,CONCAT(a.ip,':',a.port)  into tid,tip 
FROM httpbin a left join ts b on a.id = b.id where a.anonymity < 3 and https='yes' order by times limit 1;
insert into ts(id) values (tid);
select tip; 
end
$$
