create database project;
use project;

create table olympics2
(
ID int,
Name varchar(300),
Sex char(2),
Age int,
Height int,
Weight int,
Team varchar(200),
NOC varchar(300),
Games varchar(300),
Year int,
Season varchar(300),
City varchar(300),
Sport varchar(300),
Event varchar(300),
Medal varchar(300)
);


select * from olympics2;


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.3/Uploads/Athletes_Cleaned.csv'
into table olympics2
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics2;

-- 1. Show how many medal counts present for entire data

select Medal,count(Medal) as M_Count from olympics2
group by Medal
order by M_count asc;

-- 2. Show count of unique sports present in Olympics
select count(distinct(sport)) as Count_of_Sports from olympics2;


-- 3. Show how many different medals won by team India
select Medal,count(Medal) as M_count from olympics2
where Team ='India'
group by Medal
order by M_count asc;



-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select 	Event,count(Medal) as M_Count from olympics2
where Team = 'India' and medal<>'NoMedal'
group by Event
order by count(Medal) desc;


-- 5. Show event wise medals won by India in order of year
select 	Event,count(Medal) as M_Count,year from olympics2
where Team = 'India' and Medal != 'NoMedal'
group by Event,year
order by year desc;


-- 6. show country who won maximum medals.

select Team, count(Medal) as M_count from olympics2
where Medal != 'NoMedal'
group by team
order by M_count desc
limit 1;


select * from olympics2;

-- 7.show top 10 countries who won gold
select Team,count(Medal) as GoldM_count from olympics2 
where Medal = 'Gold'
group by team
order by GoldM_count desc
limit 10; 


--  8. show in which year did United states won most gold medal
select NOC,Year,count(Medal) as USA_GoldM_count from olympics2
where NOC = 'USA' and Medal='Gold'
group by year
order by Usa_GoldM_count desc
limit 1;


-- 9. In which sports United States has most medals.
select NOC,Sport,count(Medal) as M_Count from olympics2
where NOC='USA' and Medal <> 'NoMedal'
group by sport
order by M_Count desc
limit 1;


-- 10. Find top three players who won most medals along with their sports and country
select name,sport,team,count(Medal) as M_count from olympics2
where Medal <> 'NoMedal'
group by name,sport,team
order by M_Count desc
limit 3;

-- 11. Find player with most gold medals in cycling along with his country.
select name,Sport,Team,count(Medal) as M_Count from olympics
where sport='Cycling' and medal = 'Gold'
group by name,sport,team
order by M_count desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select Name,sport,team,count(Medal) as Medal_Count from olympics
where Sport='Basketball' and Medal != 'NoMedal'
group by Name,sport,team
order by Medal_count;

select * from olympics;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
Select name,medal,count(Medal) as M_Count from olympics2
where name= 'Teresa Edwards' and medal<>'NoMedal'
group by name,medal
order by M_count;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select sex,year,count(Medal) as M_Count from olympics2
where Medal<> 'NoMedal'
group by year,sex
order by year;
