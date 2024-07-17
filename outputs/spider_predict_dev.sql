SELECT COUNT(*) FROM singer	concert_singer
SELECT COUNT(*) FROM singer	concert_singer
SELECT singer.Name, singer.Country, singer.Age  FROM singer  ORDER BY singer.Age DESC	concert_singer
SELECT singer.Name, singer.Country, singer.Age  FROM singer  ORDER BY singer.Age DESC	concert_singer
SELECT AVG(singer.Age), MIN(singer.Age), MAX(singer.Age)  FROM singer  WHERE singer.Country = 'France'	concert_singer
SELECT AVG(singer.Age), MIN(singer.Age), MAX(singer.Age)  FROM singer  WHERE singer.Country = 'France'	concert_singer
SELECT singer.Name, singer.Song_release_year  FROM singer  ORDER BY singer.Age ASC  LIMIT 1	concert_singer
SELECT singer.Name, singer.Song_release_year  FROM singer  ORDER BY singer.Age ASC  LIMIT 1	concert_singer
SELECT DISTINCT singer.Country  FROM singer  WHERE singer.Age > 20	concert_singer
SELECT singer.Country  FROM singer  WHERE singer.Age > 20  GROUP BY singer.Country	concert_singer
SELECT singer.Country, COUNT(singer.Singer_ID)  FROM singer  GROUP BY singer.Country	concert_singer
SELECT singer.Country, COUNT(*)  FROM singer  GROUP BY singer.Country	concert_singer
SELECT singer.Song_Name  FROM singer  WHERE singer.Age > (SELECT AVG(singer.Age) FROM singer)	concert_singer
SELECT singer.Song_Name  FROM singer  WHERE singer.Age > (SELECT AVG(singer.Age) FROM singer)	concert_singer
SELECT stadium.Name, stadium.Location  FROM stadium  WHERE stadium.Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT stadium.Name, stadium.Location  FROM stadium  WHERE stadium.Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT MAX(stadium.Capacity), AVG(stadium.Capacity) FROM stadium	concert_singer
SELECT AVG(stadium.Capacity), MAX(stadium.Capacity) FROM stadium	concert_singer
SELECT stadium.Name, stadium.Capacity  FROM stadium  ORDER BY stadium.Average DESC  LIMIT 1	concert_singer
SELECT stadium.Name, stadium.Capacity  FROM stadium  ORDER BY stadium.Average DESC  LIMIT 1	concert_singer
SELECT COUNT(*)  FROM concert  WHERE concert.Year IN ('2014', '2015')	concert_singer
SELECT COUNT(*) FROM concert WHERE Year = '2014' OR Year = '2015'	concert_singer
SELECT stadium.Name, COUNT(concert.concert_ID)  FROM concert  INNER JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID  GROUP BY stadium.Name	concert_singer
SELECT stadium.Name, COUNT(concert.concert_ID)  FROM stadium  INNER JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID  GROUP BY stadium.Name	concert_singer
SELECT stadium.Name, stadium.Capacity FROM stadium INNER JOIN (     SELECT concert.Stadium_ID     FROM concert     WHERE concert.Year >= '2014'     GROUP BY concert.Stadium_ID     ORDER BY COUNT(*) DESC     LIMIT 1 ) AS subquery ON stadium.Stadium_ID = subquery.Stadium_ID	concert_singer
SELECT stadium.Name, stadium.Capacity FROM stadium INNER JOIN (     SELECT concert.Stadium_ID     FROM concert     WHERE concert.Year > '2013'     GROUP BY concert.Stadium_ID     ORDER BY COUNT(*) DESC     LIMIT 1 ) AS df ON stadium.Stadium_ID = df.Stadium_ID	concert_singer
SELECT concert.Year FROM concert GROUP BY concert.Year ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT concert.Year FROM concert GROUP BY concert.Year ORDER BY COUNT(*) DESC LIMIT 1	concert_singer
SELECT stadium.Name  FROM stadium  WHERE stadium.Stadium_ID NOT IN (SELECT concert.Stadium_ID FROM concert)	concert_singer
SELECT stadium.Name  FROM stadium  LEFT JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID  WHERE concert.Stadium_ID IS NULL	concert_singer
SELECT singer.Country  FROM singer  WHERE singer.Age > 40  INTERSECT  SELECT singer.Country  FROM singer  WHERE singer.Age < 30	concert_singer
SELECT stadium.Name  FROM stadium  WHERE stadium.Stadium_ID NOT IN (     SELECT concert.Stadium_ID      FROM concert      WHERE concert.Year = '2014' )	concert_singer
SELECT stadium.Name FROM stadium WHERE stadium.Stadium_ID NOT IN (     SELECT concert.Stadium_ID     FROM concert     WHERE concert.Year = '2014' )	concert_singer
SELECT concert.concert_Name, concert.Theme, COUNT(singer_in_concert.Singer_ID)  FROM concert  INNER JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID  GROUP BY concert.concert_ID, concert.concert_Name, concert.Theme	concert_singer
SELECT concert.concert_Name, concert.Theme, COUNT(singer_in_concert.Singer_ID) FROM concert INNER JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID, concert.concert_Name, concert.Theme	concert_singer
SELECT singer.Name, COUNT(concert.concert_ID)  FROM singer  INNER JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID  INNER JOIN concert ON singer_in_concert.concert_ID = concert.concert_ID  GROUP BY singer.Name	concert_singer
SELECT singer.Name, COUNT(concert.concert_ID)  FROM singer  INNER JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID  INNER JOIN concert ON singer_in_concert.concert_ID = concert.concert_ID  GROUP BY singer.Name	concert_singer
SELECT singer.Name  FROM singer  INNER JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID  INNER JOIN concert ON singer_in_concert.concert_ID = concert.concert_ID  WHERE concert.Year = '2014'	concert_singer
SELECT singer.Name  FROM singer  INNER JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID  INNER JOIN concert ON singer_in_concert.concert_ID = concert.concert_ID  WHERE concert.Year = '2014'	concert_singer
SELECT singer.Name, singer.Country  FROM singer  WHERE singer.Song_Name LIKE '%Hey%'	concert_singer
SELECT singer.Name, singer.Country  FROM singer  WHERE singer.Song_Name LIKE '%Hey%'	concert_singer
SELECT stadium.Name, stadium.Location  FROM stadium  WHERE stadium.Stadium_ID IN      (SELECT concert.Stadium_ID      FROM concert      WHERE concert.Year = '2014'      INTERSECT      SELECT concert.Stadium_ID      FROM concert      WHERE concert.Year = '2015')	concert_singer
SELECT stadium.Name, stadium.Location  FROM stadium  INNER JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID  WHERE concert.Year = '2014' INTERSECT SELECT stadium.Name, stadium.Location  FROM stadium  INNER JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID  WHERE concert.Year = '2015'	concert_singer
SELECT COUNT(*) FROM concert WHERE concert.Stadium_ID IN (     SELECT stadium.Stadium_ID     FROM stadium     ORDER BY stadium.Capacity DESC     LIMIT 1 )	concert_singer
SELECT COUNT(*) FROM concert WHERE concert.Stadium_ID IN (     SELECT stadium.Stadium_ID     FROM stadium     ORDER BY stadium.Capacity DESC     LIMIT 1 )	concert_singer
SELECT COUNT(*)  FROM Pets  WHERE weight > 10	pets_1
SELECT COUNT(*)  FROM Pets  WHERE weight > 10	pets_1
SELECT Pets.weight FROM Pets WHERE Pets.PetType = 'dog' ORDER BY Pets.pet_age ASC LIMIT 1	pets_1
SELECT Pets.weight FROM Pets WHERE Pets.PetType = 'dog' ORDER BY Pets.pet_age ASC LIMIT 1	pets_1
SELECT Pets.PetType, MAX(Pets.weight) FROM Pets GROUP BY Pets.PetType	pets_1
SELECT Pets.PetType, MAX(Pets.weight) FROM Pets GROUP BY Pets.PetType	pets_1
SELECT COUNT(Has_Pet.PetID)  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  WHERE Student.Age > 20	pets_1
SELECT COUNT(Has_Pet.PetID) FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID WHERE Student.Age > 20	pets_1
SELECT COUNT(*) FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'	pets_1
SELECT COUNT(*) FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'	pets_1
SELECT COUNT(DISTINCT Pets.PetType) FROM Pets	pets_1
SELECT COUNT(DISTINCT Pets.PetType) FROM Pets	pets_1
SELECT Student.Fname FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType IN ('dog', 'cat')	pets_1
SELECT Student.Fname  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Pets.PetType IN ('dog', 'cat')	pets_1
SELECT Student.Fname FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'dog' INTERSECT SELECT Student.Fname FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat'	pets_1
SELECT Student.Fname  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Pets.PetType = 'dog' INTERSECT  SELECT Student.Fname  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Pets.PetType = 'cat'	pets_1
SELECT Student.Major, Student.Age FROM Student WHERE Student.StuID NOT IN (     SELECT Has_Pet.StuID     FROM Has_Pet     INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE Pets.PetType = 'cat' )	pets_1
SELECT Student.Major, Student.Age  FROM Student  WHERE Student.StuID NOT IN (     SELECT Has_Pet.StuID      FROM Has_Pet      INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID      WHERE Pets.PetType = 'cat' )	pets_1
SELECT Student.StuID  FROM Student  WHERE Student.StuID NOT IN (     SELECT Has_Pet.StuID      FROM Has_Pet      INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID      WHERE Pets.PetType = 'cat' )	pets_1
SELECT Student.StuID  FROM Student  EXCEPT  SELECT Has_Pet.StuID  FROM Has_Pet  INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Pets.PetType = 'cat'	pets_1
SELECT Student.Fname, Student.Age FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.StuID IN (     SELECT Has_Pet.StuID     FROM Has_Pet     INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE Pets.PetType = 'dog' ) AND Student.StuID NOT IN (     SELECT Has_Pet.StuID     FROM Has_Pet     INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE Pets.PetType = 'cat' )	pets_1
SELECT Student.Fname  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Pets.PetType = 'dog'  EXCEPT  SELECT Student.Fname  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID  WHERE Pets.PetType = 'cat'	pets_1
SELECT Pets.PetType, Pets.weight FROM Pets ORDER BY Pets.pet_age ASC LIMIT 1	pets_1
SELECT Pets.PetType, Pets.weight FROM Pets ORDER BY Pets.pet_age ASC LIMIT 1	pets_1
SELECT Pets.PetID, Pets.weight  FROM Pets  WHERE Pets.pet_age > 1	pets_1
SELECT Pets.PetID, Pets.weight FROM Pets WHERE Pets.pet_age > 1	pets_1
SELECT Pets.PetType, AVG(Pets.pet_age), MAX(Pets.pet_age) FROM Pets GROUP BY Pets.PetType	pets_1
SELECT Pets.PetType, AVG(Pets.pet_age), MAX(Pets.pet_age) FROM Pets GROUP BY Pets.PetType	pets_1
SELECT Pets.PetType, AVG(Pets.weight) FROM Pets GROUP BY Pets.PetType	pets_1
SELECT Pets.PetType, AVG(Pets.weight) FROM Pets GROUP BY Pets.PetType	pets_1
SELECT Student.Fname, Student.Age  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID	pets_1
SELECT Student.Fname, Student.Age  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID	pets_1
SELECT Has_Pet.PetID  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  WHERE Student.LName = 'Smith'	pets_1
SELECT Has_Pet.PetID FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID WHERE Student.LName = 'Smith'	pets_1
SELECT Student.StuID, COUNT(Pets.PetID)  FROM Has_Pet  INNER JOIN Student ON Has_Pet.StuID = Student.StuID  INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID  GROUP BY Student.StuID	pets_1
SELECT Has_Pet.StuID, COUNT(Has_Pet.PetID)  FROM Has_Pet  GROUP BY Has_Pet.StuID	pets_1
SELECT Student.Fname, Student.Sex  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  GROUP BY Has_Pet.StuID  HAVING COUNT(Has_Pet.PetID) > 1	pets_1
SELECT Student.Fname, Student.Sex  FROM Student  INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID  GROUP BY Has_Pet.StuID  HAVING COUNT(Has_Pet.PetID) > 1	pets_1
SELECT Student.LName FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' AND Pets.pet_age = 3	pets_1
SELECT Student.LName FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' AND Pets.pet_age = 3	pets_1
SELECT AVG(Student.Age)  FROM Student  WHERE Student.StuID NOT IN (SELECT Has_Pet.StuID FROM Has_Pet)	pets_1
SELECT AVG(Student.Age)  FROM Student  WHERE Student.StuID NOT IN (SELECT Has_Pet.StuID FROM Has_Pet)	pets_1
SELECT COUNT(DISTINCT continents.Continent) FROM continents	car_1
SELECT COUNT(DISTINCT continents.Continent) FROM continents	car_1
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) FROM continents INNER JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent	car_1
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) FROM continents INNER JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent	car_1
SELECT COUNT(*) FROM countries	car_1
SELECT COUNT(*) FROM countries	car_1
SELECT car_makers.FullName, car_makers.Id, COUNT(model_list.Model) FROM car_makers INNER JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Maker, car_makers.FullName, car_makers.Id	car_1
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.Model)  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  GROUP BY car_makers.Maker	car_1
SELECT model_list.Model  FROM cars_data  INNER JOIN model_list ON cars_data.Id = model_list.ModelId  ORDER BY cars_data.Horsepower ASC  LIMIT 1	car_1
SELECT car_names.Model  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  ORDER BY cars_data.Horsepower ASC  LIMIT 1	car_1
SELECT car_names.Model  FROM car_names  INNER JOIN cars_data ON car_names.MakeId = cars_data.Id  WHERE cars_data.Weight < (SELECT AVG(cars_data.Weight) FROM cars_data)	car_1
SELECT car_names.Model FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Weight < (SELECT AVG(cars_data.Weight) FROM cars_data)	car_1
SELECT car_makers.Maker FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId INNER JOIN car_makers ON car_names.Model = car_makers.Id WHERE cars_data.Year = 1970	car_1
SELECT car_makers.Maker  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  INNER JOIN car_makers ON car_names.Make = car_makers.Id  WHERE cars_data.Year = 1970	car_1
SELECT car_names.Make, cars_data.Year FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId ORDER BY cars_data.Year ASC LIMIT 1	car_1
SELECT car_makers.Maker, cars_data.Year  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  INNER JOIN car_makers ON car_names.Make = car_makers.Id  ORDER BY cars_data.Year ASC  LIMIT 1	car_1
SELECT DISTINCT car_names.Model  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  WHERE cars_data.Year > 1980	car_1
SELECT model_list.Model  FROM cars_data  INNER JOIN model_list ON cars_data.Id = model_list.ModelId  WHERE cars_data.Year > 1980	car_1
SELECT continents.Continent, COUNT(DISTINCT car_makers.Id) FROM continents INNER JOIN countries ON continents.ContId = countries.Continent INNER JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent	car_1
SELECT continents.Continent, COUNT(car_makers.Id) FROM continents INNER JOIN countries ON continents.ContId = countries.Continent INNER JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent	car_1
SELECT countries.CountryName  FROM      (SELECT car_makers.Country      FROM car_makers      GROUP BY car_makers.Country      ORDER BY COUNT(car_makers.Id) DESC      LIMIT 1) AS df1  INNER JOIN countries ON df1.Country = countries.CountryId	car_1
SELECT countries.CountryName  FROM      (SELECT car_makers.Country      FROM car_makers      GROUP BY car_makers.Country      ORDER BY COUNT(*) DESC      LIMIT 1) AS df1  INNER JOIN countries  ON df1.Country = countries.CountryId	car_1
SELECT car_makers.FullName, COUNT(model_list.Model)  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  GROUP BY car_makers.FullName	car_1
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.Model)  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  GROUP BY car_makers.Maker, car_makers.Id, car_makers.FullName	car_1
SELECT cars_data.Accelerate FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Make = 'amc hornet sportabout (sw)'	car_1
SELECT cars_data.Accelerate FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Make = 'amc hornet sportabout (sw)'	car_1
SELECT COUNT(car_makers.Maker)  FROM car_makers  WHERE car_makers.Country = 'france'	car_1
SELECT COUNT(car_makers.Maker)  FROM car_makers  WHERE car_makers.Country = 'France'	car_1
SELECT COUNT(model_list.Model) FROM model_list INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Country = 'usa'	car_1
SELECT COUNT(model_list.Model)  FROM model_list  INNER JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE car_makers.Country = 'United States'	car_1
SELECT AVG(cars_data.MPG)  FROM cars_data  WHERE cars_data.Cylinders = 4	car_1
SELECT AVG(cars_data.MPG)  FROM cars_data  WHERE cars_data.Cylinders = 4	car_1
SELECT cars_data.Weight FROM cars_data WHERE cars_data.Cylinders = 8 AND cars_data.Year = 1974 ORDER BY cars_data.Weight ASC LIMIT 1	car_1
SELECT cars_data.Weight FROM cars_data WHERE cars_data.Cylinders = 8 AND cars_data.Year = 1974 ORDER BY cars_data.Weight ASC LIMIT 1	car_1
SELECT model_list.Maker, model_list.Model FROM model_list	car_1
SELECT model_list.Maker, model_list.Model FROM model_list	car_1
SELECT countries.CountryName, countries.CountryId  FROM countries  INNER JOIN car_makers ON countries.CountryId = car_makers.Country  GROUP BY car_makers.Country	car_1
SELECT countries.CountryName, countries.CountryId  FROM countries  INNER JOIN car_makers ON countries.CountryId = car_makers.Country  GROUP BY car_makers.Country  HAVING COUNT(car_makers.Maker) > 0	car_1
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150	car_1
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150	car_1
SELECT cars_data.Year, AVG(cars_data.Weight) FROM cars_data GROUP BY cars_data.Year	car_1
SELECT AVG(cars_data.Weight), cars_data.Year FROM cars_data GROUP BY cars_data.Year	car_1
SELECT countries.CountryName FROM countries INNER JOIN car_makers ON countries.CountryId = car_makers.Country INNER JOIN continents ON countries.Continent = continents.ContId WHERE continents.Continent = 'europe' GROUP BY countries.CountryName HAVING COUNT(car_makers.Id) >= 3	car_1
SELECT countries.CountryName  FROM countries  INNER JOIN continents ON countries.Continent = continents.ContId  INNER JOIN car_makers ON countries.CountryId = car_makers.Country  WHERE continents.Continent = 'europe'  GROUP BY countries.CountryName  HAVING COUNT(car_makers.Id) >= 3	car_1
SELECT car_names.Make, MAX(cars_data.Horsepower)  FROM car_names  INNER JOIN cars_data ON car_names.MakeId = cars_data.Id  WHERE cars_data.Cylinders = 3  GROUP BY car_names.Make  ORDER BY MAX(cars_data.Horsepower) DESC  LIMIT 1	car_1
SELECT car_names.Make, cars_data.Horsepower FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 3 ORDER BY cars_data.Horsepower DESC LIMIT 1	car_1
SELECT car_names.Model  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  ORDER BY cars_data.MPG DESC  LIMIT 1	car_1
SELECT car_names.Model  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  ORDER BY cars_data.MPG DESC  LIMIT 1	car_1
SELECT AVG(cars_data.Horsepower)  FROM cars_data  WHERE cars_data.Year < 1980	car_1
SELECT AVG(cars_data.Horsepower)  FROM cars_data  WHERE cars_data.Year < 1980	car_1
SELECT AVG(cars_data.Edispl)  FROM car_names  INNER JOIN cars_data ON car_names.MakeId = cars_data.Id  WHERE car_names.Model = 'volvo'	car_1
SELECT AVG(cars_data.Edispl)  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  WHERE car_names.Make = 'volvo'	car_1
SELECT cars_data.Cylinders, MAX(cars_data.Accelerate)  FROM cars_data  GROUP BY cars_data.Cylinders	car_1
SELECT cars_data.Cylinders, MAX(cars_data.Accelerate)  FROM cars_data  GROUP BY cars_data.Cylinders	car_1
SELECT model_list.Model FROM model_list INNER JOIN car_names ON model_list.Model = car_names.Model GROUP BY model_list.Model ORDER BY COUNT(*) DESC LIMIT 1	car_1
SELECT model_list.Model FROM model_list GROUP BY model_list.Model ORDER BY COUNT(*) DESC LIMIT 1	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(cars_data.Id)  FROM cars_data  WHERE cars_data.Year = 1980	car_1
SELECT COUNT(cars_data.Id)  FROM cars_data  WHERE cars_data.Year = 1980	car_1
SELECT COUNT(model_list.Model)  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  WHERE car_makers.FullName = 'American Motor Company'	car_1
SELECT COUNT(model_list.Model)  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  WHERE car_makers.FullName = 'American Motor Company'	car_1
SELECT car_makers.FullName, car_makers.Id FROM car_makers INNER JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY model_list.Maker HAVING COUNT(model_list.Model) > 3	car_1
SELECT car_makers.Id, car_makers.Maker  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  GROUP BY model_list.Maker  HAVING COUNT(model_list.Model) > 3	car_1
SELECT model_list.Model  FROM model_list  INNER JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE car_makers.FullName = 'General Motors'   UNION   SELECT model_list.Model  FROM model_list  INNER JOIN cars_data ON model_list.ModelId = cars_data.Id  WHERE cars_data.Weight > 3500	car_1
SELECT model_list.Model  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  WHERE car_makers.FullName = 'General Motors'   UNION   SELECT model_list.Model  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  INNER JOIN model_list ON car_names.Model = model_list.Model  WHERE cars_data.Weight > 3500	car_1
SELECT cars_data.Year FROM cars_data WHERE cars_data.Weight >= 3000 AND cars_data.Weight <= 4000	car_1
SELECT cars_data.Year  FROM cars_data  WHERE cars_data.Weight < 4000  INTERSECT  SELECT cars_data.Year  FROM cars_data  WHERE cars_data.Weight > 3000	car_1
SELECT cars_data.Horsepower  FROM cars_data  ORDER BY cars_data.Accelerate DESC  LIMIT 1	car_1
SELECT cars_data.Horsepower  FROM cars_data  ORDER BY cars_data.Accelerate DESC  LIMIT 1	car_1
SELECT cars_data.Cylinders FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE car_names.Model = 'volvo' ORDER BY cars_data.Accelerate ASC LIMIT 1	car_1
SELECT cars_data.Cylinders FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE car_names.Model = 'volvo' ORDER BY cars_data.Accelerate ASC LIMIT 1	car_1
SELECT COUNT(*)  FROM cars_data  WHERE Accelerate > (SELECT Accelerate FROM cars_data ORDER BY Horsepower DESC LIMIT 1)	car_1
SELECT COUNT(*)  FROM cars_data  WHERE Accelerate > (SELECT Accelerate FROM cars_data ORDER BY Horsepower DESC LIMIT 1)	car_1
SELECT COUNT(country) FROM (SELECT car_makers.Country, COUNT(car_makers.Maker) FROM car_makers GROUP BY car_makers.Country HAVING COUNT(car_makers.Maker) > 2) AS subquery	car_1
SELECT COUNT(*)  FROM (     SELECT car_makers.Country      FROM car_makers      GROUP BY car_makers.Country      HAVING COUNT(car_makers.Maker) > 2 ) AS subquery	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6	car_1
SELECT model_list.Model  FROM cars_data  INNER JOIN model_list ON cars_data.Id = model_list.ModelId  WHERE cars_data.Cylinders = 4  ORDER BY cars_data.Horsepower DESC  LIMIT 1	car_1
SELECT model_list.Model  FROM cars_data  INNER JOIN model_list ON cars_data.Id = model_list.ModelId  WHERE cars_data.Cylinders = 4  GROUP BY model_list.Model  ORDER BY MAX(cars_data.Horsepower) DESC  LIMIT 1	car_1
SELECT car_names.MakeId, car_names.Make  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  WHERE cars_data.Horsepower > (SELECT MIN(cars_data.Horsepower) FROM cars_data)  AND cars_data.Cylinders <= 3	car_1
SELECT car_names.MakeId, car_names.Make  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  WHERE cars_data.Horsepower != (SELECT MIN(cars_data.Horsepower) FROM cars_data)  AND cars_data.Cylinders < 4	car_1
SELECT MAX(cars_data.MPG)  FROM cars_data  WHERE cars_data.Cylinders = 8  UNION  SELECT MAX(cars_data.MPG)  FROM cars_data  WHERE cars_data.Year < 1980	car_1
SELECT MAX(cars_data.MPG)  FROM cars_data  WHERE cars_data.Cylinders = 8 OR cars_data.Year < 1980	car_1
SELECT model_list.Model  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  INNER JOIN model_list ON car_names.Model = model_list.Model  INNER JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE cars_data.Weight < 3500 AND car_makers.Maker != 'Ford Motor Company'	car_1
SELECT car_names.Model  FROM cars_data  INNER JOIN car_names ON cars_data.Id = car_names.MakeId  INNER JOIN model_list ON car_names.Model = model_list.Model  INNER JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE cars_data.Weight < 3500 AND car_makers.FullName != 'Ford Motor Company'	car_1
SELECT countries.CountryName  FROM countries  LEFT JOIN car_makers ON countries.CountryId = car_makers.Country  WHERE car_makers.Id IS NULL	car_1
SELECT countries.CountryName  FROM countries  LEFT JOIN car_makers ON countries.CountryId = car_makers.Country  WHERE car_makers.Id IS NULL	car_1
SELECT car_makers.Id, car_makers.Maker FROM car_makers INNER JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY model_list.Maker HAVING COUNT(model_list.Model) >= 2 INTERSECT SELECT car_makers.Id, car_makers.Maker FROM car_makers GROUP BY car_makers.Maker HAVING COUNT(*) > 3	car_1
SELECT car_makers.Id, car_makers.Maker  FROM car_makers  INNER JOIN model_list ON car_makers.Id = model_list.Maker  INNER JOIN car_names ON model_list.Model = car_names.Model  INNER JOIN cars_data ON car_names.MakeId = cars_data.Id  GROUP BY car_makers.Id  HAVING COUNT(DISTINCT model_list.Model) >= 2 AND COUNT(cars_data.Id) > 3	car_1
SELECT countries.CountryId, countries.CountryName  FROM countries  INNER JOIN car_makers ON countries.CountryId = car_makers.Country  GROUP BY car_makers.Country  HAVING COUNT(car_makers.Id) > 3   UNION   SELECT countries.CountryId, countries.CountryName  FROM countries  INNER JOIN car_makers ON countries.CountryId = car_makers.Country  WHERE car_makers.Maker = 'fiat'	car_1
SELECT countries.CountryId, countries.CountryName  FROM car_makers  INNER JOIN countries ON car_makers.Country = countries.CountryId  GROUP BY car_makers.Country  HAVING COUNT(car_makers.Id) > 3   UNION   SELECT countries.CountryId, countries.CountryName  FROM model_list  INNER JOIN car_makers ON model_list.Maker = car_makers.Id  INNER JOIN countries ON car_makers.Country = countries.CountryId  WHERE model_list.Model = 'fiat'	car_1
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'	flight_2
SELECT airlines.Abbreviation FROM airlines WHERE airlines.Airline = 'JetBlue Airways'	flight_2
SELECT airlines.Abbreviation FROM airlines WHERE airlines.Airline = 'Jetblue Airways'	flight_2
SELECT airlines.Airline, airlines.Abbreviation  FROM airlines  WHERE airlines.Country = 'USA'	flight_2
SELECT airlines.Airline, airlines.Abbreviation FROM airlines WHERE airlines.Country = 'USA'	flight_2
SELECT airports.AirportCode, airports.AirportName  FROM airports  WHERE airports.City = 'Anthony'	flight_2
SELECT airports.AirportCode, airports.AirportName  FROM airports  WHERE airports.City = 'Anthony'	flight_2
SELECT COUNT(airlines.uid) FROM airlines	flight_2
SELECT COUNT(DISTINCT airlines.Airline) FROM airlines	flight_2
SELECT COUNT(*) FROM airports	flight_2
SELECT COUNT(*) FROM airports	flight_2
SELECT COUNT(*) FROM flights	flight_2
SELECT COUNT(*) FROM flights	flight_2
SELECT airlines.Airline FROM airlines WHERE airlines.Abbreviation = 'UAL'	flight_2
SELECT airlines.Airline FROM airlines WHERE airlines.Abbreviation = 'UAL'	flight_2
SELECT COUNT(DISTINCT airlines.Airline)  FROM airlines  WHERE airlines.Country = 'USA'	flight_2
SELECT COUNT(airlines.Airline)  FROM airlines  WHERE airlines.Country = 'USA'	flight_2
SELECT airports.City, airports.Country  FROM airports  WHERE airports.AirportName = 'Alton'	flight_2
SELECT airports.City, airports.Country  FROM airports  WHERE airports.AirportName = 'Alton'	flight_2
SELECT airports.AirportName FROM airports WHERE airports.AirportCode = 'AKO'	flight_2
SELECT airports.AirportName FROM airports WHERE airports.AirportCode = 'AKO'	flight_2
SELECT airports.AirportName FROM airports WHERE airports.City = 'Aberdeen'	flight_2
SELECT airports.AirportName FROM airports WHERE airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights  WHERE SourceAirport = 'APG'	flight_2
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT COUNT(*)  FROM flights  WHERE DestAirport = 'ATO'	flight_2
SELECT COUNT(*)  FROM flights  WHERE DestAirport = 'ATO'	flight_2
SELECT COUNT(flights.SourceAirport)  FROM airports  INNER JOIN flights ON airports.AirportCode = flights.SourceAirport  WHERE airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights  WHERE SourceAirport = 'AHD'	flight_2
SELECT COUNT(flights.DestAirport)  FROM flights  INNER JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights INNER JOIN airports AS source_airports ON flights.SourceAirport = source_airports.AirportCode INNER JOIN airports AS dest_airports ON flights.DestAirport = dest_airports.AirportCode WHERE source_airports.City = 'Aberdeen' AND dest_airports.City = 'Ashley'	flight_2
SELECT COUNT(*) FROM flights WHERE flights.SourceAirport = 'Aberdeen' AND flights.DestAirport = 'Ashley'	flight_2
SELECT COUNT(flights.Airline)  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'JetBlue Airways'	flight_2
SELECT COUNT(*) FROM flights INNER JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'Jetblue Airways'	flight_2
SELECT COUNT(*) FROM flights INNER JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'	flight_2
SELECT COUNT(flights.Airline)  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'	flight_2
SELECT COUNT(*) FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline WHERE airlines.Airline = 'United Airlines' AND flights.SourceAirport = 'AHD'	flight_2
SELECT COUNT(*) FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline WHERE airlines.Airline = 'United Airlines' AND flights.SourceAirport = 'AHD'	flight_2
SELECT COUNT(flights.Airline)  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  INNER JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'Aberdeen'	flight_2
SELECT airports.City FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode GROUP BY flights.DestAirport ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT airports.City  FROM flights  INNER JOIN airports ON flights.DestAirport = airports.AirportCode  GROUP BY flights.DestAirport  ORDER BY COUNT(*) DESC  LIMIT 1	flight_2
SELECT airports.City FROM flights INNER JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY flights.SourceAirport ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT airports.City FROM airports INNER JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY airports.City ORDER BY COUNT(flights.SourceAirport) DESC LIMIT 1	flight_2
SELECT flights.DestAirport FROM flights GROUP BY flights.DestAirport ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT flights.DestAirport FROM flights GROUP BY flights.DestAirport ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT flights.DestAirport FROM flights GROUP BY flights.DestAirport ORDER BY COUNT(*) ASC LIMIT 1	flight_2
SELECT airports.AirportCode FROM airports INNER JOIN (     SELECT flights.DestAirport     FROM flights     GROUP BY flights.DestAirport     ORDER BY COUNT(flights.FlightNo) ASC     LIMIT 1 ) AS df1 ON airports.AirportCode = df1.DestAirport	flight_2
SELECT airlines.Airline  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  GROUP BY flights.Airline  ORDER BY COUNT(*) DESC  LIMIT 1	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN (     SELECT flights.Airline      FROM flights      GROUP BY flights.Airline      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON airlines.uid = df1.Airline	flight_2
SELECT airlines.Abbreviation, airlines.Country  FROM airlines  INNER JOIN (     SELECT flights.Airline      FROM flights      GROUP BY flights.Airline      ORDER BY COUNT(*) ASC      LIMIT 1 ) AS df1  ON airlines.uid = df1.Airline	flight_2
SELECT airlines.Abbreviation, airlines.Country  FROM airlines  INNER JOIN (     SELECT flights.Airline      FROM flights      GROUP BY flights.Airline      ORDER BY COUNT(*) ASC      LIMIT 1 ) AS df1  ON airlines.uid = df1.Airline	flight_2
SELECT airlines.Airline  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE flights.SourceAirport = 'AHD'	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  WHERE flights.SourceAirport = 'AHD'	flight_2
SELECT airlines.Airline  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE flights.DestAirport = 'AHD'	flight_2
SELECT airlines.Airline  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE flights.DestAirport = 'AHD'	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  WHERE flights.SourceAirport = 'APG' INTERSECT SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  WHERE flights.SourceAirport = 'CVO'	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  WHERE flights.SourceAirport = 'APG' INTERSECT  SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  WHERE flights.SourceAirport = 'CVO'	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  WHERE flights.SourceAirport = 'CVO'  EXCEPT  SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  WHERE flights.SourceAirport = 'APG'	flight_2
SELECT a.Airline FROM airlines a INNER JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'CVO' AND a.Airline NOT IN (     SELECT a.Airline     FROM airlines a     INNER JOIN flights f ON a.uid = f.Airline     WHERE f.SourceAirport = 'APG' )	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN (     SELECT flights.Airline      FROM flights      GROUP BY flights.Airline      HAVING COUNT(flights.FlightNo) >= 10 ) AS df1  ON airlines.uid = df1.Airline	flight_2
SELECT airlines.Airline  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  GROUP BY flights.Airline  HAVING COUNT(flights.FlightNo) >= 10	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN flights ON airlines.uid = flights.Airline  GROUP BY flights.Airline  HAVING COUNT(flights.FlightNo) < 200	flight_2
SELECT airlines.Airline  FROM airlines  INNER JOIN (     SELECT flights.Airline      FROM flights      GROUP BY flights.Airline      HAVING COUNT(flights.FlightNo) < 200 ) AS df1  ON airlines.uid = df1.Airline	flight_2
SELECT flights.FlightNo  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines'	flight_2
SELECT flights.FlightNo  FROM flights  INNER JOIN airlines ON flights.Airline = airlines.uid  WHERE airlines.Airline = 'United Airlines'	flight_2
SELECT flights.FlightNo FROM flights WHERE flights.SourceAirport = 'APG'	flight_2
SELECT flights.FlightNo  FROM flights  WHERE flights.SourceAirport = 'APG'	flight_2
SELECT flights.FlightNo FROM flights WHERE flights.DestAirport = 'APG'	flight_2
SELECT flights.FlightNo FROM flights WHERE flights.DestAirport = 'APG'	flight_2
SELECT flights.FlightNo  FROM flights  INNER JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen '	flight_2
SELECT flights.FlightNo FROM flights WHERE flights.SourceAirport = 'AHD'	flight_2
SELECT flights.FlightNo FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'	flight_2
SELECT flights.FlightNo FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen'	flight_2
SELECT COUNT(flights.DestAirport) FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City IN ('Aberdeen', 'Abilene')	flight_2
SELECT COUNT(flights.DestAirport)  FROM flights  INNER JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.AirportName IN ('Aberdeen', 'Abilene')	flight_2
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT DestAirport FROM flights UNION SELECT SourceAirport FROM flights)	flight_2
SELECT AirportName FROM airports  EXCEPT  (SELECT DestAirport FROM flights  UNION  SELECT SourceAirport FROM flights)	flight_2
SELECT COUNT(employee.Employee_ID) FROM employee	employee_hire_evaluation
SELECT COUNT(*) FROM employee	employee_hire_evaluation
SELECT employee.Name  FROM employee  ORDER BY employee.Age ASC	employee_hire_evaluation
SELECT employee.Name  FROM employee  ORDER BY employee.Age ASC	employee_hire_evaluation
SELECT employee.City, COUNT(*)  FROM employee  GROUP BY employee.City	employee_hire_evaluation
SELECT employee.City, COUNT(employee.Employee_ID)  FROM employee  GROUP BY employee.City	employee_hire_evaluation
SELECT employee.City FROM employee WHERE employee.Age < 30 GROUP BY employee.City HAVING COUNT(employee.Employee_ID) > 1	employee_hire_evaluation
SELECT employee.City  FROM employee  WHERE employee.Age < 30  GROUP BY employee.City  HAVING COUNT(employee.Employee_ID) > 1	employee_hire_evaluation
SELECT shop.Location, COUNT(*)  FROM shop  GROUP BY shop.Location	employee_hire_evaluation
SELECT shop.Location, COUNT(shop.Shop_ID)  FROM shop  GROUP BY shop.Location	employee_hire_evaluation
SELECT shop.Manager_name, shop.District  FROM shop  ORDER BY shop.Number_products DESC  LIMIT 1	employee_hire_evaluation
SELECT shop.Manager_name, shop.District  FROM shop  ORDER BY shop.Number_products DESC  LIMIT 1	employee_hire_evaluation
SELECT MIN(shop.Number_products), MAX(shop.Number_products) FROM shop	employee_hire_evaluation
SELECT MIN(shop.Number_products), MAX(shop.Number_products) FROM shop	employee_hire_evaluation
SELECT shop.Name, shop.Location, shop.District  FROM shop  ORDER BY shop.Number_products DESC	employee_hire_evaluation
SELECT shop.Name, shop.Location, shop.District  FROM shop  ORDER BY shop.Number_products DESC	employee_hire_evaluation
SELECT shop.Name  FROM shop  WHERE shop.Number_products > (SELECT AVG(shop.Number_products) FROM shop)	employee_hire_evaluation
SELECT shop.Name  FROM shop  WHERE shop.Number_products > (SELECT AVG(shop.Number_products) FROM shop)	employee_hire_evaluation
SELECT employee.Name  FROM employee  INNER JOIN (     SELECT evaluation.Employee_ID      FROM evaluation      GROUP BY evaluation.Employee_ID      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON employee.Employee_ID = df1.Employee_ID	employee_hire_evaluation
SELECT employee.Name  FROM employee  INNER JOIN (     SELECT evaluation.Employee_ID      FROM evaluation      GROUP BY evaluation.Employee_ID      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON employee.Employee_ID = df1.Employee_ID	employee_hire_evaluation
SELECT employee.Name  FROM employee  INNER JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID  ORDER BY evaluation.Bonus DESC  LIMIT 1	employee_hire_evaluation
SELECT employee.Name  FROM employee  INNER JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID  ORDER BY evaluation.Bonus DESC  LIMIT 1	employee_hire_evaluation
SELECT employee.Name  FROM employee  WHERE employee.Employee_ID NOT IN (SELECT evaluation.Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT employee.Name  FROM employee  WHERE employee.Employee_ID NOT IN (SELECT evaluation.Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT shop.Name  FROM shop  INNER JOIN (     SELECT hiring.Shop_ID      FROM hiring      GROUP BY hiring.Shop_ID      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON shop.Shop_ID = df1.Shop_ID	employee_hire_evaluation
SELECT shop.Name  FROM shop  INNER JOIN (     SELECT hiring.Shop_ID      FROM hiring      GROUP BY hiring.Shop_ID      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON shop.Shop_ID = df1.Shop_ID	employee_hire_evaluation
SELECT shop.Name  FROM shop  WHERE shop.Shop_ID NOT IN (SELECT hiring.Shop_ID FROM hiring)	employee_hire_evaluation
SELECT shop.Name  FROM shop  WHERE shop.Shop_ID NOT IN (SELECT hiring.Shop_ID FROM hiring)	employee_hire_evaluation
SELECT shop.Name, COUNT(employee.Employee_ID)  FROM hiring  INNER JOIN shop ON hiring.Shop_ID = shop.Shop_ID  GROUP BY shop.Name	employee_hire_evaluation
SELECT shop.Name, COUNT(employee.Employee_ID)  FROM shop  INNER JOIN hiring ON shop.Shop_ID = hiring.Shop_ID  GROUP BY shop.Name	employee_hire_evaluation
SELECT SUM(evaluation.Bonus) FROM evaluation	employee_hire_evaluation
SELECT SUM(evaluation.Bonus) FROM evaluation	employee_hire_evaluation
SELECT hiring.* FROM hiring	employee_hire_evaluation
SELECT hiring.* FROM hiring	employee_hire_evaluation
SELECT shop.District  FROM shop  WHERE shop.Number_products < 3000  INTERSECT  SELECT shop.District  FROM shop  WHERE shop.Number_products > 10000	employee_hire_evaluation
SELECT shop.District  FROM shop  WHERE shop.Number_products < 3000  INTERSECT  SELECT shop.District  FROM shop  WHERE shop.Number_products > 10000	employee_hire_evaluation
SELECT COUNT(DISTINCT shop.Location) FROM shop	employee_hire_evaluation
SELECT COUNT(DISTINCT shop.Location) FROM shop	employee_hire_evaluation
SELECT COUNT(Documents.Document_ID) FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Documents	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Document_Name, Documents.Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Document_Name, Documents.Document_Description FROM Documents	cre_Doc_Template_Mgt
SELECT Documents.Document_Name, Documents.Template_ID  FROM Documents  WHERE Documents.Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Documents.Document_Name, Documents.Template_ID  FROM Documents  WHERE Documents.Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Template_ID, Documents.Document_Description  FROM Documents  WHERE Documents.Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Template_ID, Documents.Document_Description  FROM Documents  WHERE Documents.Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Documents.Template_ID) FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Documents.Template_ID) FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(Documents.Template_ID) FROM Documents INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT COUNT(Documents.Template_ID)  FROM Documents  INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID  WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, COUNT(Documents.Document_ID)  FROM Templates  INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID  GROUP BY Templates.Template_ID	cre_Doc_Template_Mgt
SELECT Documents.Template_ID, COUNT(*)  FROM Documents  GROUP BY Documents.Template_ID	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, Templates.Template_Type_Code  FROM Templates  INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID  GROUP BY Documents.Template_ID  ORDER BY COUNT(*) DESC  LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, Templates.Template_Type_Code  FROM Templates  INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID  GROUP BY Templates.Template_ID, Templates.Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_ID FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Documents.Template_ID HAVING COUNT(Documents.Document_ID) > 1	cre_Doc_Template_Mgt
SELECT Templates.Template_ID  FROM Templates  INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID  GROUP BY Documents.Template_ID  HAVING COUNT(Documents.Document_ID) > 1	cre_Doc_Template_Mgt
SELECT Templates.Template_ID  FROM Templates  WHERE Templates.Template_ID NOT IN (SELECT Documents.Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT Templates.Template_ID  FROM Templates  WHERE Templates.Template_ID NOT IN (SELECT Documents.Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Templates.Template_ID) FROM Templates	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Templates	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, Templates.Template_Type_Code, Templates.Version_Number FROM Templates	cre_Doc_Template_Mgt
SELECT Templates.Template_ID, Templates.Template_Type_Code, Templates.Version_Number FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Templates.Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Ref_Template_Types.Template_Type_Code FROM Ref_Template_Types;	cre_Doc_Template_Mgt
SELECT Templates.Template_ID  FROM Templates  WHERE Templates.Template_Type_Code = 'PP'  UNION  SELECT Templates.Template_ID  FROM Templates  WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT Templates.Template_ID  FROM Templates  WHERE Templates.Template_Type_Code = 'PP'  UNION  SELECT Templates.Template_ID  FROM Templates  WHERE Templates.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Templates  WHERE Templates.Template_Type_Code = 'CV'	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Templates  WHERE Templates.Template_Type_Code = 'CV'	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, Templates.Version_Number  FROM Templates  WHERE Templates.Version_Number > 5	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, Templates.Version_Number  FROM Templates  WHERE Templates.Version_Number > 5	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, COUNT(*)  FROM Templates  GROUP BY Templates.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, COUNT(Templates.Template_ID)  FROM Templates  GROUP BY Templates.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Templates GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Templates GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Templates GROUP BY Templates.Template_Type_Code HAVING COUNT(Templates.Template_ID) < 3	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Templates GROUP BY Templates.Template_Type_Code HAVING COUNT(Templates.Template_ID) < 3	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, Templates.Version_Number FROM Templates ORDER BY Templates.Version_Number ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, Templates.Version_Number FROM Templates ORDER BY Templates.Version_Number ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code  FROM Documents  INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID  WHERE Documents.Document_Name = 'Data base'	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code  FROM Documents  INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID  WHERE Documents.Document_Name = 'Data base'	cre_Doc_Template_Mgt
SELECT Documents.Document_Name  FROM Documents  INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID  WHERE Templates.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT Documents.Document_Name  FROM Documents  INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID  WHERE Templates.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, COUNT(Documents.Document_ID) FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code, COUNT(Documents.Document_ID)  FROM Templates  INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID  GROUP BY Templates.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code FROM Documents INNER JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Templates.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code  FROM Ref_Template_Types  EXCEPT  SELECT Templates.Template_Type_Code  FROM Templates	cre_Doc_Template_Mgt
SELECT Templates.Template_Type_Code  FROM Templates  EXCEPT  SELECT Templates.Template_Type_Code  FROM Templates  INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code, Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code, Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Description  FROM Ref_Template_Types  WHERE Ref_Template_Types.Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Description  FROM Ref_Template_Types  WHERE Ref_Template_Types.Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code  FROM Ref_Template_Types  WHERE Ref_Template_Types.Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT Ref_Template_Types.Template_Type_Code  FROM Ref_Template_Types  WHERE Ref_Template_Types.Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT DISTINCT Ref_Template_Types.Template_Type_Description  FROM Templates  INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID  INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Templates.Template_Details  FROM Templates  WHERE Templates.Template_ID IN (SELECT Documents.Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT Templates.Template_ID  FROM Templates  INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code  WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT Templates.Template_ID  FROM Templates  INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code  WHERE Ref_Template_Types.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT COUNT(Paragraphs.Document_ID)  FROM Paragraphs  INNER JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT COUNT(Paragraphs.Document_ID)  FROM Documents  INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  WHERE Documents.Document_Name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_Text FROM Paragraphs WHERE Paragraphs.Paragraph_Text = 'Korea'	cre_Doc_Template_Mgt
SELECT Paragraphs.Other_Details  FROM Paragraphs  WHERE Paragraphs.Paragraph_Text LIKE '%Korea%'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_ID, Paragraphs.Paragraph_Text  FROM Paragraphs  INNER JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_ID, Paragraphs.Paragraph_Text  FROM Paragraphs  INNER JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_Text  FROM Documents  INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  WHERE Documents.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT Paragraphs.Paragraph_Text  FROM Paragraphs  INNER JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID, COUNT(Paragraphs.Paragraph_ID)  FROM Paragraphs  GROUP BY Paragraphs.Document_ID  ORDER BY Paragraphs.Document_ID	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID, COUNT(Paragraphs.Paragraph_ID)  FROM Paragraphs  GROUP BY Paragraphs.Document_ID  ORDER BY Paragraphs.Document_ID	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID)  FROM Documents  INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  GROUP BY Documents.Document_ID, Documents.Document_Name	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID)  FROM Documents  INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  GROUP BY Documents.Document_ID, Documents.Document_Name	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID FROM Paragraphs GROUP BY Paragraphs.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT Documents.Document_ID FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Paragraphs.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Document_Name  FROM Documents  INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID  GROUP BY Paragraphs.Document_ID  ORDER BY COUNT(*) DESC  LIMIT 1	cre_Doc_Template_Mgt
SELECT Documents.Document_ID, Documents.Document_Name  FROM Documents  INNER JOIN (     SELECT Paragraphs.Document_ID      FROM Paragraphs      GROUP BY Paragraphs.Document_ID      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON Documents.Document_ID = df1.Document_ID	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID FROM Paragraphs GROUP BY Paragraphs.Document_ID ORDER BY COUNT(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID FROM Paragraphs GROUP BY Paragraphs.Document_ID ORDER BY COUNT(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID FROM Paragraphs GROUP BY Paragraphs.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT Documents.Document_ID FROM Documents INNER JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Paragraphs.Document_ID HAVING COUNT(Paragraphs.Paragraph_ID) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID  FROM Paragraphs  WHERE Paragraphs.Paragraph_Text = 'Brazil' INTERSECT  SELECT Paragraphs.Document_ID  FROM Paragraphs  WHERE Paragraphs.Paragraph_Text = 'Ireland'	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID  FROM Paragraphs  WHERE Paragraphs.Paragraph_Text = 'Brazil' INTERSECT  SELECT Paragraphs.Document_ID  FROM Paragraphs  WHERE Paragraphs.Paragraph_Text = 'Ireland'	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM teacher	course_teach
SELECT COUNT(*) FROM teacher	course_teach
SELECT teacher.Name  FROM teacher  ORDER BY teacher.Age ASC	course_teach
SELECT teacher.Name  FROM teacher  ORDER BY teacher.Age ASC	course_teach
SELECT teacher.Hometown, teacher.Age FROM teacher	course_teach
SELECT teacher.Hometown, teacher.Age FROM teacher	course_teach
SELECT teacher.Name FROM teacher WHERE teacher.Hometown != 'Little Lever Urban District'	course_teach
SELECT teacher.Name FROM teacher WHERE teacher.Hometown != 'Little Lever Urban District'	course_teach
SELECT teacher.Name  FROM teacher  WHERE teacher.Age IN ('32', '33')	course_teach
SELECT teacher.Name FROM teacher WHERE teacher.Age = '32' UNION SELECT teacher.Name FROM teacher WHERE teacher.Age = '33'	course_teach
SELECT teacher.Hometown  FROM teacher  ORDER BY teacher.Age ASC  LIMIT 1	course_teach
SELECT teacher.Hometown  FROM teacher  ORDER BY teacher.Age ASC  LIMIT 1	course_teach
SELECT teacher.Hometown, COUNT(*)  FROM teacher  GROUP BY teacher.Hometown	course_teach
SELECT teacher.Hometown, COUNT(*)  FROM teacher  GROUP BY teacher.Hometown	course_teach
SELECT teacher.Hometown FROM teacher GROUP BY teacher.Hometown ORDER BY COUNT(*) DESC LIMIT 1	course_teach
SELECT teacher.Hometown FROM teacher GROUP BY teacher.Hometown ORDER BY COUNT(*) DESC LIMIT 1	course_teach
SELECT teacher.Hometown FROM teacher GROUP BY teacher.Hometown HAVING COUNT(*) > 1	course_teach
SELECT teacher.Hometown FROM teacher GROUP BY teacher.Hometown HAVING COUNT(teacher.Teacher_ID) >= 2	course_teach
SELECT teacher.Name, course.Course  FROM course_arrange  INNER JOIN teacher ON course_arrange.Teacher_ID = teacher.Teacher_ID  INNER JOIN course ON course_arrange.Course_ID = course.Course_ID	course_teach
SELECT teacher.Name, course.Course  FROM course_arrange  INNER JOIN teacher ON course_arrange.Teacher_ID = teacher.Teacher_ID  INNER JOIN course ON course_arrange.Course_ID = course.Course_ID	course_teach
SELECT teacher.Name, course.Course  FROM teacher  INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  INNER JOIN course ON course.Course_ID = course_arrange.Course_ID  ORDER BY teacher.Name ASC	course_teach
SELECT teacher.Name, course.Course  FROM teacher  INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  INNER JOIN course ON course.Course_ID = course_arrange.Course_ID  ORDER BY teacher.Name ASC	course_teach
SELECT teacher.Name  FROM teacher  INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  INNER JOIN course ON course.Course_ID = course_arrange.Course_ID  WHERE course.Course = 'Math'	course_teach
SELECT teacher.Name  FROM teacher  INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  INNER JOIN course ON course.Course_ID = course_arrange.Course_ID  WHERE course.Course = 'Math'	course_teach
SELECT teacher.Name, COUNT(course.Course_ID) FROM teacher INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID INNER JOIN course ON course.Course_ID = course_arrange.Course_ID GROUP BY teacher.Name	course_teach
SELECT teacher.Name, COUNT(course.Course)  FROM teacher  INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  INNER JOIN course ON course_arrange.Course_ID = course.Course_ID  GROUP BY teacher.Name	course_teach
SELECT teacher.Name  FROM teacher  INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  GROUP BY course_arrange.Teacher_ID  HAVING COUNT(course_arrange.Course_ID) >= 2	course_teach
SELECT teacher.Name  FROM teacher  INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID  GROUP BY course_arrange.Teacher_ID  HAVING COUNT(course_arrange.Course_ID) >= 2	course_teach
SELECT teacher.Name  FROM teacher  WHERE teacher.Teacher_ID NOT IN (SELECT course_arrange.Teacher_ID FROM course_arrange)	course_teach
SELECT teacher.Name  FROM teacher  WHERE teacher.Teacher_ID NOT IN (SELECT course_arrange.Teacher_ID FROM course_arrange)	course_teach
SELECT COUNT(*)  FROM visitor  WHERE Age < 30	museum_visit
SELECT visitor.Name  FROM visitor  WHERE visitor.Level_of_membership > 4  ORDER BY visitor.Level_of_membership DESC	museum_visit
SELECT AVG(visitor.Age)  FROM visitor  WHERE visitor.Level_of_membership <= 4	museum_visit
SELECT visitor.Name, visitor.Level_of_membership  FROM visitor  WHERE visitor.Level_of_membership > 4  ORDER BY visitor.Age ASC	museum_visit
SELECT museum.Museum_ID, museum.Name  FROM museum  ORDER BY museum.Num_of_Staff DESC  LIMIT 1	museum_visit
SELECT AVG(museum.Num_of_Staff) FROM museum WHERE museum.Open_Year < '2009'	museum_visit
SELECT museum.Open_Year, museum.Num_of_Staff  FROM museum  WHERE museum.Name = 'Plaza Museum'	museum_visit
SELECT museum.Name  FROM museum  WHERE museum.Num_of_Staff > (SELECT MIN(museum.Num_of_Staff) FROM museum WHERE museum.Open_Year > '2010')	museum_visit
SELECT visitor.ID, visitor.Name, visitor.Age FROM visitor INNER JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visit.visitor_ID HAVING COUNT(visit.Museum_ID) > 1	museum_visit
SELECT visitor.ID, visitor.Name, visitor.Level_of_membership FROM visitor INNER JOIN (     SELECT visit.visitor_ID, SUM(visit.Total_spent) as total_spent     FROM visit     GROUP BY visit.visitor_ID     ORDER BY total_spent DESC     LIMIT 1 ) AS subquery ON visitor.ID = subquery.visitor_ID	museum_visit
SELECT museum.Museum_ID, museum.Name FROM museum INNER JOIN visit ON museum.Museum_ID = visit.Museum_ID GROUP BY visit.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1	museum_visit
SELECT museum.Name  FROM museum  WHERE museum.Museum_ID NOT IN (SELECT visit.Museum_ID FROM visit)	museum_visit
SELECT visitor.Name, visitor.Age  FROM visitor  INNER JOIN visit ON visitor.ID = visit.visitor_ID  ORDER BY visit.Num_of_Ticket DESC  LIMIT 1	museum_visit
SELECT AVG(visit.Num_of_Ticket), MAX(visit.Num_of_Ticket) FROM visit	museum_visit
SELECT SUM(visit.Total_spent)  FROM visit  INNER JOIN visitor ON visit.visitor_ID = visitor.ID  WHERE visitor.Level_of_membership = '1'	museum_visit
SELECT visitor.Name  FROM museum  INNER JOIN visit ON museum.Museum_ID = visit.Museum_ID  INNER JOIN visitor ON visit.visitor_ID = visitor.ID  WHERE museum.Open_Year < '2009' INTERSECT SELECT visitor.Name  FROM museum  INNER JOIN visit ON museum.Museum_ID = visit.Museum_ID  INNER JOIN visitor ON visit.visitor_ID = visitor.ID  WHERE museum.Open_Year > '2011'	museum_visit
SELECT COUNT(DISTINCT visitor.ID)  FROM visitor  WHERE visitor.ID NOT IN (     SELECT visit.visitor_ID      FROM visit      INNER JOIN museum ON visit.Museum_ID = museum.Museum_ID      WHERE museum.Open_Year > '2010' )	museum_visit
SELECT (SELECT COUNT(*) FROM museum WHERE Open_Year > '2013') + (SELECT COUNT(*) FROM museum WHERE Open_Year < '2008')	museum_visit
SELECT COUNT(*) FROM players	wta_1
SELECT COUNT(DISTINCT player_id) FROM players	wta_1
SELECT COUNT(*) FROM matches	wta_1
SELECT COUNT(*) FROM matches	wta_1
SELECT players.first_name, players.birth_date  FROM players  WHERE players.country_code = 'USA'	wta_1
SELECT players.first_name, players.birth_date FROM players WHERE players.country_code = 'USA'	wta_1
SELECT AVG(matches.winner_age), AVG(matches.loser_age) FROM matches	wta_1
SELECT AVG(matches.winner_age), AVG(matches.loser_age) FROM matches	wta_1
SELECT AVG(matches.winner_rank) FROM matches	wta_1
SELECT AVG(matches.winner_rank) FROM matches	wta_1
SELECT matches.loser_rank FROM matches ORDER BY matches.loser_rank DESC LIMIT 1	wta_1
SELECT matches.loser_rank FROM matches ORDER BY matches.loser_rank ASC LIMIT 1	wta_1
SELECT COUNT(DISTINCT players.country_code) FROM players	wta_1
SELECT COUNT(DISTINCT players.country_code) FROM players	wta_1
SELECT COUNT(DISTINCT loser_name) FROM matches	wta_1
SELECT COUNT(DISTINCT loser_name) FROM matches	wta_1
SELECT matches.tourney_name  FROM matches  GROUP BY matches.tourney_name  HAVING COUNT(*) > 10	wta_1
SELECT matches.tourney_name  FROM matches  GROUP BY matches.tourney_name  HAVING COUNT(matches.match_num) > 10	wta_1
SELECT matches.winner_name  FROM matches  WHERE matches.year = 2013  INTERSECT  SELECT matches.winner_name  FROM matches  WHERE matches.year = 2016	wta_1
SELECT players.first_name, players.last_name FROM players WHERE players.player_id IN (     SELECT matches.winner_id     FROM matches     WHERE matches.year = 2013     INTERSECT     SELECT matches.winner_id     FROM matches     WHERE matches.year = 2016 )	wta_1
SELECT COUNT(*)  FROM matches  WHERE year = '2013' OR year = '2016'	wta_1
SELECT COUNT(*)  FROM matches  WHERE year = '2013' OR year = '2016'	wta_1
SELECT players.country_code, players.first_name FROM players INNER JOIN (     SELECT matches.winner_id     FROM matches     WHERE matches.tourney_name = 'WTA Championships'     INTERSECT     SELECT matches.winner_id     FROM matches     WHERE matches.tourney_name = 'Australian Open' ) AS winners ON players.player_id = winners.winner_id	wta_1
SELECT players.first_name, players.country_code FROM players INNER JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'WTA Championships' INTERSECT SELECT players.first_name, players.country_code FROM players INNER JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'Australian Open'	wta_1
SELECT players.first_name, players.country_code  FROM players  ORDER BY players.birth_date ASC  LIMIT 1	wta_1
SELECT players.first_name, players.country_code  FROM players  ORDER BY players.birth_date ASC  LIMIT 1	wta_1
SELECT players.first_name, players.last_name FROM players ORDER BY players.birth_date	wta_1
SELECT players.first_name, players.last_name  FROM players  ORDER BY players.birth_date	wta_1
SELECT players.first_name, players.last_name  FROM players  WHERE players.hand = 'L'  ORDER BY players.birth_date	wta_1
SELECT players.first_name, players.last_name  FROM players  WHERE players.hand = 'L'  ORDER BY players.birth_date	wta_1
SELECT players.first_name, players.country_code  FROM players  INNER JOIN      (SELECT rankings.player_id, SUM(rankings.tours) as total_tours      FROM rankings      GROUP BY rankings.player_id      ORDER BY total_tours DESC      LIMIT 1) as df1  ON players.player_id = df1.player_id	wta_1
SELECT players.first_name, players.country_code  FROM players  INNER JOIN      (SELECT rankings.player_id      FROM rankings      GROUP BY rankings.player_id      ORDER BY SUM(rankings.tours) DESC      LIMIT 1) AS df1  ON players.player_id = df1.player_id	wta_1
SELECT matches.year FROM matches GROUP BY matches.year ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT matches.year FROM matches GROUP BY matches.year ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT players.first_name, players.last_name, matches.winner_rank_points  FROM matches  INNER JOIN players ON matches.winner_id = players.player_id  GROUP BY matches.winner_id  ORDER BY COUNT(*) DESC  LIMIT 1	wta_1
SELECT players.first_name, players.last_name, rankings.ranking_points FROM players INNER JOIN matches ON players.player_id = matches.winner_id INNER JOIN rankings ON players.player_id = rankings.player_id GROUP BY matches.winner_id ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT matches.winner_name  FROM matches  WHERE matches.tourney_name = 'Australian Open'  ORDER BY matches.winner_rank_points DESC  LIMIT 1	wta_1
SELECT matches.winner_name  FROM matches  WHERE matches.tourney_name = 'Australian Open'  ORDER BY matches.winner_rank_points DESC  LIMIT 1	wta_1
SELECT matches.winner_name, matches.loser_name  FROM matches  ORDER BY matches.minutes DESC  LIMIT 1	wta_1
SELECT matches.winner_name, matches.loser_name  FROM matches  ORDER BY matches.minutes DESC  LIMIT 1	wta_1
SELECT players.first_name, AVG(rankings.ranking) FROM players INNER JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name	wta_1
SELECT players.first_name, AVG(rankings.ranking) FROM players INNER JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id	wta_1
SELECT players.first_name, SUM(rankings.ranking_points)  FROM players  INNER JOIN rankings  ON players.player_id = rankings.player_id  GROUP BY players.player_id, players.first_name	wta_1
SELECT players.first_name, SUM(rankings.ranking_points)  FROM players  INNER JOIN rankings ON players.player_id = rankings.player_id  GROUP BY players.player_id	wta_1
SELECT players.country_code, COUNT(*)  FROM players  GROUP BY players.country_code	wta_1
SELECT players.country_code, COUNT(players.player_id)  FROM players  GROUP BY players.country_code	wta_1
SELECT players.country_code FROM players GROUP BY players.country_code ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT players.country_code FROM players GROUP BY players.country_code ORDER BY COUNT(*) DESC LIMIT 1	wta_1
SELECT players.country_code  FROM players  GROUP BY players.country_code  HAVING COUNT(players.player_id) > 50	wta_1
SELECT players.country_code FROM players GROUP BY players.country_code HAVING COUNT(players.player_id) > 50	wta_1
SELECT rankings.ranking_date, SUM(rankings.tours) FROM rankings GROUP BY rankings.ranking_date	wta_1
SELECT rankings.ranking_date, SUM(rankings.tours) FROM rankings GROUP BY rankings.ranking_date	wta_1
SELECT matches.year, COUNT(*)  FROM matches  GROUP BY matches.year	wta_1
SELECT matches.year, COUNT(*)  FROM matches  GROUP BY matches.year	wta_1
SELECT players.first_name, players.last_name, matches.winner_rank FROM matches INNER JOIN players ON matches.winner_id = players.player_id ORDER BY matches.winner_age ASC LIMIT 3	wta_1
SELECT matches.winner_name, matches.winner_rank  FROM matches  ORDER BY matches.winner_age ASC  LIMIT 3	wta_1
SELECT COUNT(DISTINCT matches.winner_id)  FROM matches  WHERE matches.tourney_name = 'WTA Championships'  AND matches.winner_hand = 'L'	wta_1
SELECT COUNT(matches.winner_id)  FROM players  INNER JOIN matches ON players.player_id = matches.winner_id  WHERE players.hand = 'L' AND matches.tourney_name = 'WTA Championships'	wta_1
SELECT players.first_name, players.country_code, players.birth_date  FROM matches  INNER JOIN players ON matches.winner_id = players.player_id  ORDER BY matches.winner_rank_points DESC  LIMIT 1	wta_1
SELECT players.first_name, players.country_code, players.birth_date  FROM players  INNER JOIN      (SELECT matches.winner_id, SUM(matches.winner_rank_points) as total_points      FROM matches      GROUP BY matches.winner_id      ORDER BY total_points DESC      LIMIT 1) as df1  ON players.player_id = df1.winner_id	wta_1
SELECT players.hand, COUNT(*)  FROM players  GROUP BY players.hand	wta_1
SELECT players.hand, COUNT(*)  FROM players  GROUP BY players.hand	wta_1
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'	battle_death
SELECT ship.name, ship.tonnage FROM ship ORDER BY ship.name DESC	battle_death
SELECT battle.name, battle.date, battle.result FROM battle	battle_death
SELECT MAX(death.killed), MIN(death.killed) FROM death	battle_death
SELECT AVG(death.injured) FROM death	battle_death
SELECT death.injured, death.killed  FROM death  INNER JOIN ship ON death.caused_by_ship_id = ship.id  WHERE ship.tonnage = 't'	battle_death
SELECT battle.name, battle.result  FROM battle  WHERE battle.bulgarian_commander != 'Boril'	battle_death
SELECT battle.id, battle.name  FROM battle  INNER JOIN ship ON battle.id = ship.lost_in_battle  WHERE ship.ship_type = 'Brig' AND ship.lost_in_battle > 0	battle_death
SELECT battle.id, battle.name  FROM death  INNER JOIN ship ON death.caused_by_ship_id = ship.id  INNER JOIN battle ON ship.lost_in_battle = battle.id  WHERE death.killed > 10	battle_death
SELECT ship.id, ship.name  FROM ship  INNER JOIN      (SELECT death.caused_by_ship_id      FROM death      GROUP BY death.caused_by_ship_id      ORDER BY SUM(death.injured) DESC      LIMIT 1) AS df1  ON ship.id = df1.caused_by_ship_id	battle_death
SELECT DISTINCT battle.name  FROM battle  WHERE battle.latin_commander = 'Baldwin I'  AND battle.bulgarian_commander = 'Kaloyan';	battle_death
SELECT COUNT(DISTINCT battle.result) FROM battle	battle_death
SELECT COUNT(battle.id)  FROM ship  INNER JOIN battle ON ship.lost_in_battle = battle.id  WHERE ship.tonnage = '225' AND ship.lost_in_battle = 0	battle_death
SELECT battle.name, battle.date  FROM battle  INNER JOIN ship ON battle.id = ship.lost_in_battle  WHERE ship.name IN ('Lettice', 'HMS Atalanta')	battle_death
SELECT battle.name, battle.result, battle.bulgarian_commander  FROM ship  INNER JOIN battle ON ship.lost_in_battle = battle.id  WHERE ship.location = 'English Channel' AND ship.lost_in_battle = 0	battle_death
SELECT death.note FROM death WHERE death.note LIKE '%East%'	battle_death
SELECT Addresses.line_1, Addresses.line_2 FROM Addresses	student_transcripts_tracking
SELECT Addresses.line_1, Addresses.line_2 FROM Addresses	student_transcripts_tracking
SELECT COUNT(*) FROM Courses	student_transcripts_tracking
SELECT COUNT(DISTINCT Courses.course_id) FROM Courses	student_transcripts_tracking
SELECT Courses.course_description  FROM Courses  WHERE Courses.course_name = 'math'	student_transcripts_tracking
SELECT Courses.course_description FROM Courses WHERE Courses.course_name = 'math'	student_transcripts_tracking
SELECT Addresses.zip_postcode FROM Addresses WHERE Addresses.city = 'Port Chelsea'	student_transcripts_tracking
SELECT Addresses.zip_postcode FROM Addresses WHERE Addresses.city = 'Port Chelsea'	student_transcripts_tracking
SELECT Departments.department_name, Departments.department_id FROM Departments INNER JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id GROUP BY Departments.department_id ORDER BY COUNT(Degree_Programs.degree_program_id) DESC LIMIT 1	student_transcripts_tracking
SELECT Departments.department_name, Departments.department_id FROM Departments INNER JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id GROUP BY Degree_Programs.department_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT COUNT(DISTINCT Degree_Programs.department_id) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT Degree_Programs.department_id) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT Degree_Programs.degree_summary_name) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT Degree_Programs.degree_program_id) FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(Degree_Programs.department_id)  FROM Departments  INNER JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id  WHERE Departments.department_name = 'engineer'	student_transcripts_tracking
SELECT COUNT(Degree_Programs.department_id)  FROM Departments  INNER JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id  WHERE Departments.department_name = 'engineer'	student_transcripts_tracking
SELECT Sections.section_name, Sections.section_description FROM Sections	student_transcripts_tracking
SELECT Sections.section_name, Sections.section_description FROM Sections	student_transcripts_tracking
SELECT Courses.course_name, Courses.course_id  FROM Courses  INNER JOIN Sections ON Courses.course_id = Sections.course_id  GROUP BY Courses.course_id  HAVING COUNT(Sections.section_id) <= 2	student_transcripts_tracking
SELECT Courses.course_name, Courses.course_id  FROM Courses  INNER JOIN Sections ON Courses.course_id = Sections.course_id  GROUP BY Courses.course_id  HAVING COUNT(Sections.section_id) < 2	student_transcripts_tracking
SELECT Sections.section_name  FROM Sections  ORDER BY Sections.section_name DESC	student_transcripts_tracking
SELECT Sections.section_name  FROM Sections  ORDER BY Sections.section_name DESC	student_transcripts_tracking
SELECT Semesters.semester_name, Semesters.semester_id FROM Semesters INNER JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id GROUP BY Student_Enrolment.semester_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Semesters.semester_name, Semesters.semester_id FROM Semesters INNER JOIN (     SELECT Student_Enrolment.semester_id, COUNT(Student_Enrolment.student_id) AS student_count     FROM Student_Enrolment     GROUP BY Student_Enrolment.semester_id     ORDER BY student_count DESC     LIMIT 1 ) AS df1 ON Semesters.semester_id = df1.semester_id	student_transcripts_tracking
SELECT Departments.department_description  FROM Departments  WHERE Departments.department_name LIKE '%computer%'	student_transcripts_tracking
SELECT Departments.department_description  FROM Departments  WHERE Departments.department_name LIKE '%computer%'	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name, Students.student_id FROM Students INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id GROUP BY Student_Enrolment.student_id HAVING COUNT(Student_Enrolment.degree_program_id) = 2	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name, Students.student_id  FROM Students  INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id  GROUP BY Student_Enrolment.student_id  HAVING COUNT(Student_Enrolment.degree_program_id) = 2	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT Degree_Programs.degree_summary_name FROM Degree_Programs INNER JOIN (     SELECT Student_Enrolment.degree_program_id     FROM Student_Enrolment     GROUP BY Student_Enrolment.degree_program_id     ORDER BY COUNT(*) DESC     LIMIT 1 ) AS df1 ON Degree_Programs.degree_program_id = df1.degree_program_id	student_transcripts_tracking
SELECT Degree_Programs.degree_summary_name FROM Degree_Programs  INNER JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id ORDER BY COUNT(Student_Enrolment.student_id) DESC LIMIT 1	student_transcripts_tracking
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name  FROM Degree_Programs  INNER JOIN (     SELECT Student_Enrolment.degree_program_id      FROM Student_Enrolment      GROUP BY Student_Enrolment.degree_program_id      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON Degree_Programs.degree_program_id = df1.degree_program_id	student_transcripts_tracking
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name FROM Degree_Programs INNER JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Student_Enrolment.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Students.student_id, Students.first_name, Students.middle_name, Students.last_name, COUNT(Student_Enrolment.student_id) AS number_of_enrollments FROM Students INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id GROUP BY Students.student_id, Students.first_name, Students.middle_name, Students.last_name ORDER BY number_of_enrollments DESC LIMIT 1	student_transcripts_tracking
SELECT Students.last_name, Students.first_name, Students.middle_name, Students.student_id, COUNT(Student_Enrolment.student_id)  FROM Students  INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id  GROUP BY Student_Enrolment.student_id  ORDER BY COUNT(Student_Enrolment.student_id) DESC  LIMIT 1	student_transcripts_tracking
SELECT Semesters.semester_name  FROM Semesters  WHERE Semesters.semester_id NOT IN (SELECT Student_Enrolment.semester_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT Semesters.semester_name  FROM Semesters  WHERE Semesters.semester_id NOT IN      (SELECT Student_Enrolment.semester_id      FROM Student_Enrolment	student_transcripts_tracking
SELECT Courses.course_name  FROM Courses  INNER JOIN Student_Enrolment_Courses  ON Courses.course_id = Student_Enrolment_Courses.course_id  WHERE Student_Enrolment_Courses.course_id IS NOT NULL	student_transcripts_tracking
SELECT Courses.course_name  FROM Courses  INNER JOIN Student_Enrolment_Courses  ON Courses.course_id = Student_Enrolment_Courses.course_id  WHERE Student_Enrolment_Courses.course_id IS NOT NULL	student_transcripts_tracking
SELECT Courses.course_name  FROM Courses  INNER JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id  GROUP BY Courses.course_name  ORDER BY COUNT(*) DESC  LIMIT 1	student_transcripts_tracking
SELECT Courses.course_name  FROM Courses  INNER JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id  GROUP BY Courses.course_name  ORDER BY COUNT(*) DESC  LIMIT 1	student_transcripts_tracking
SELECT Students.last_name  FROM Students  INNER JOIN Addresses ON Students.current_address_id = Addresses.address_id  WHERE Addresses.state_province_county = 'North Carolina'  EXCEPT  SELECT Students.last_name  FROM Students  INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id  WHERE Student_Enrolment.degree_program_id IS NULL	student_transcripts_tracking
SELECT Students.last_name  FROM Students  INNER JOIN Addresses ON Students.current_address_id = Addresses.address_id  WHERE Addresses.state_province_county = 'North Carolina'  AND Students.student_id NOT IN (     SELECT Student_Enrolment.student_id      FROM Student_Enrolment      WHERE Student_Enrolment.degree_program_id IS NULL )	student_transcripts_tracking
SELECT Transcripts.transcript_date, Transcripts.transcript_id  FROM Transcripts  INNER JOIN Transcript_Contents ON Transcripts.transcript_id = Transcript_Contents.transcript_id  GROUP BY Transcript_Contents.transcript_id  HAVING COUNT(Transcript_Contents.student_course_id) >= 2	student_transcripts_tracking
SELECT Transcripts.transcript_id, Transcripts.transcript_date FROM Transcripts INNER JOIN Transcript_Contents ON Transcripts.transcript_id = Transcript_Contents.transcript_id GROUP BY Transcript_Contents.transcript_id HAVING COUNT(Transcript_Contents.student_course_id) >= 2	student_transcripts_tracking
SELECT Students.cell_mobile_number  FROM Students  WHERE Students.first_name = 'Timmothy' AND Students.last_name = 'Ward'	student_transcripts_tracking
SELECT Students.cell_mobile_number  FROM Students  WHERE Students.first_name = 'Timmothy' AND Students.last_name = 'Ward'	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name  FROM Students  ORDER BY Students.date_first_registered  LIMIT 1	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name  FROM Students  ORDER BY Students.date_first_registered  LIMIT 1	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name  FROM Students  ORDER BY Students.date_left ASC  LIMIT 1	student_transcripts_tracking
SELECT Students.first_name, Students.middle_name, Students.last_name FROM Students INNER JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id ORDER BY Student_Enrolment.semester_id ASC LIMIT 1	student_transcripts_tracking
SELECT Students.first_name  FROM Students  WHERE Students.permanent_address_id != Students.current_address_id	student_transcripts_tracking
SELECT Students.first_name  FROM Students  WHERE Students.permanent_address_id != Students.current_address_id	student_transcripts_tracking
SELECT Addresses.address_id, Addresses.line_1, Addresses.line_2, Addresses.line_3 FROM Addresses INNER JOIN Students ON Addresses.address_id = Students.current_address_id GROUP BY Students.current_address_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Addresses.address_id, Addresses.line_1, Addresses.line_2  FROM Addresses  INNER JOIN Students ON Addresses.address_id = Students.current_address_id  GROUP BY Students.current_address_id  ORDER BY COUNT(*) DESC  LIMIT 1	student_transcripts_tracking
SELECT AVG(Transcripts.transcript_date) FROM Transcripts	student_transcripts_tracking
SELECT AVG(Transcripts.transcript_date) FROM Transcripts	student_transcripts_tracking
SELECT Transcripts.transcript_date, Transcripts.other_details  FROM Transcripts  ORDER BY Transcripts.transcript_date ASC  LIMIT 1	student_transcripts_tracking
SELECT Transcripts.transcript_date, Transcripts.other_details  FROM Transcripts  ORDER BY Transcripts.transcript_date ASC  LIMIT 1	student_transcripts_tracking
SELECT COUNT(*) FROM Transcripts	student_transcripts_tracking
SELECT COUNT(*) FROM Transcripts	student_transcripts_tracking
SELECT Transcripts.transcript_date FROM Transcripts ORDER BY Transcripts.transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT Transcripts.transcript_date FROM Transcripts ORDER BY Transcripts.transcript_date DESC LIMIT 1	student_transcripts_tracking
SELECT Transcript_Contents.student_course_id, COUNT(*)  FROM Transcript_Contents  GROUP BY Transcript_Contents.student_course_id  ORDER BY COUNT(*) DESC  LIMIT 1	student_transcripts_tracking
SELECT Courses.course_id, Student_Enrolment_Courses.course_id FROM Courses INNER JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_id ORDER BY COUNT(*) DESC LIMIT 1	student_transcripts_tracking
SELECT Transcripts.transcript_date, Transcripts.transcript_id FROM Transcripts INNER JOIN Transcript_Contents ON Transcripts.transcript_id = Transcript_Contents.transcript_id GROUP BY Transcripts.transcript_id ORDER BY COUNT(Transcript_Contents.student_course_id) ASC LIMIT 1	student_transcripts_tracking
SELECT Transcripts.date, Transcripts.transcript_id  FROM Transcripts  ORDER BY COUNT(Transcript_Contents.result) ASC  LIMIT 1	student_transcripts_tracking
SELECT Semesters.semester_name FROM Semesters INNER JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Master' INTERSECT SELECT Semesters.semester_name FROM Semesters INNER JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT Student_Enrolment.semester_id FROM Student_Enrolment INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Master' INTERSECT SELECT Student_Enrolment.semester_id FROM Student_Enrolment INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor'	student_transcripts_tracking
SELECT COUNT(DISTINCT Students.current_address_id) FROM Students	student_transcripts_tracking
SELECT DISTINCT Addresses.address_id, Addresses.country, Addresses.line_3, Addresses.line_1, Addresses.zip_postcode, Addresses.city, Addresses.state_province_county, Addresses.line_2  FROM Students  INNER JOIN Addresses ON Students.permanent_address_id = Addresses.address_id OR Students.current_address_id = Addresses.address_id	student_transcripts_tracking
SELECT Students.last_name, Students.first_name, Students.middle_name  FROM Students  ORDER BY Students.last_name DESC, Students.first_name DESC, Students.middle_name DESC	student_transcripts_tracking
SELECT Students.other_student_details FROM Students ORDER BY Students.last_name DESC	student_transcripts_tracking
SELECT Sections.section_description  FROM Sections  WHERE Sections.section_name = 'h'	student_transcripts_tracking
SELECT Sections.section_description  FROM Sections  WHERE Sections.section_name = 'h'	student_transcripts_tracking
SELECT Students.first_name  FROM Students  INNER JOIN Addresses ON Students.permanent_address_id = Addresses.address_id  WHERE Addresses.country = 'Haiti'  UNION  SELECT Students.first_name  FROM Students  WHERE Students.cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT Students.first_name  FROM Students  INNER JOIN Addresses ON Students.permanent_address_id = Addresses.address_id  WHERE Addresses.country = 'Haiti'  UNION  SELECT Students.first_name  FROM Students  WHERE Students.cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT Cartoon.Title FROM Cartoon ORDER BY Cartoon.Title ASC	tvshow
SELECT Cartoon.Title FROM Cartoon ORDER BY Cartoon.Title ASC	tvshow
SELECT Cartoon.Title FROM Cartoon WHERE Cartoon.Directed_by = 'Ben Jones'	tvshow
SELECT Cartoon.Title FROM Cartoon WHERE Cartoon.Directed_by = 'Ben Jones'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT Cartoon.Title, Cartoon.Directed_by FROM Cartoon ORDER BY Cartoon.Original_air_date	tvshow
SELECT Cartoon.Title, Cartoon.Directed_by FROM Cartoon ORDER BY Cartoon.Original_air_date	tvshow
SELECT Cartoon.Title  FROM Cartoon  WHERE Cartoon.Directed_by = 'Ben Jones'  UNION  SELECT Cartoon.Title  FROM Cartoon  WHERE Cartoon.Directed_by = 'Brandon Vietti'	tvshow
SELECT Cartoon.Title  FROM Cartoon  WHERE Cartoon.Directed_by = 'Ben Jones'  UNION  SELECT Cartoon.Title  FROM Cartoon  WHERE Cartoon.Directed_by = 'Brandon Vietti'	tvshow
SELECT TV_Channel.Country, COUNT(*)  FROM TV_Channel  GROUP BY TV_Channel.Country  ORDER BY COUNT(*) DESC  LIMIT 1	tvshow
SELECT TV_Channel.Country, COUNT(*)  FROM TV_Channel  GROUP BY TV_Channel.Country  ORDER BY COUNT(*) DESC  LIMIT 1	tvshow
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel	tvshow
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel	tvshow
SELECT TV_Channel.Content  FROM TV_Channel  WHERE TV_Channel.series_name = 'Sky Radio'	tvshow
SELECT TV_Channel.Content FROM TV_Channel WHERE TV_Channel.series_name = 'Sky Radio'	tvshow
SELECT TV_Channel.Package_Option  FROM TV_Channel  WHERE TV_Channel.series_name = 'Sky Radio'	tvshow
SELECT TV_Channel.Package_Option FROM TV_Channel WHERE TV_Channel.series_name = 'Sky Radio'	tvshow
SELECT COUNT(*)  FROM TV_Channel  WHERE Language = 'English'	tvshow
SELECT COUNT(*)  FROM TV_Channel  WHERE Language = 'English'	tvshow
SELECT TV_Channel.Language, COUNT(*)  FROM TV_Channel  GROUP BY TV_Channel.Language  ORDER BY COUNT(*) ASC  LIMIT 1	tvshow
SELECT TV_Channel.Language, COUNT(TV_Channel.id)  FROM TV_Channel  GROUP BY TV_Channel.Language  ORDER BY COUNT(TV_Channel.id) ASC  LIMIT 1	tvshow
SELECT TV_Channel.Language, COUNT(TV_Channel.id)  FROM TV_Channel  GROUP BY TV_Channel.Language	tvshow
SELECT TV_Channel.Language, COUNT(TV_Channel.id)  FROM TV_Channel  GROUP BY TV_Channel.Language	tvshow
SELECT TV_Channel.series_name  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Title = 'The Rise of the Blue Beetle!'	tvshow
SELECT TV_Channel.series_name  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Title = 'The Rise of the Blue Beetle'	tvshow
SELECT Cartoon.Title  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE TV_Channel.series_name = 'Sky Radio'	tvshow
SELECT Cartoon.Title  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE TV_Channel.series_name = 'Sky Radio'	tvshow
SELECT TV_series.Episode FROM TV_series ORDER BY TV_series.Rating DESC	tvshow
SELECT TV_series.Episode FROM TV_series ORDER BY TV_series.Rating DESC	tvshow
SELECT TV_series.Episode, TV_series.Rating FROM TV_series ORDER BY TV_series.Rating DESC LIMIT 3	tvshow
SELECT TV_series.Episode, TV_series.Rating  FROM TV_series  ORDER BY TV_series.Rating DESC  LIMIT 3	tvshow
SELECT MIN(TV_series.Share), MAX(TV_series.Share) FROM TV_series	tvshow
SELECT MAX(TV_series.Share), MIN(TV_series.Share) FROM TV_series	tvshow
SELECT TV_series.Air_Date FROM TV_series WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_series.Air_Date FROM TV_series WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_series.Weekly_Rank FROM TV_series WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_series.Weekly_Rank FROM TV_series WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_Channel.series_name  FROM TV_series  INNER JOIN TV_Channel ON TV_series.Channel = TV_Channel.id  WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_series.name FROM TV_series WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_series.Episode  FROM TV_series  INNER JOIN TV_Channel ON TV_series.Channel = TV_Channel.id  WHERE TV_Channel.series_name = 'Sky Radio'	tvshow
SELECT TV_series.Episode FROM TV_series WHERE TV_series.name = 'Sky Radio'	tvshow
SELECT Cartoon.Directed_by, COUNT(*) FROM Cartoon GROUP BY Cartoon.Directed_by	tvshow
SELECT Cartoon.Directed_by, COUNT(Cartoon.id)  FROM Cartoon  GROUP BY Cartoon.Directed_by	tvshow
SELECT Cartoon.Production_code, Cartoon.Channel  FROM Cartoon  ORDER BY Cartoon.Original_air_date DESC  LIMIT 1	tvshow
SELECT Cartoon.Production_code, Cartoon.Channel  FROM Cartoon  ORDER BY Cartoon.Original_air_date DESC  LIMIT 1	tvshow
SELECT TV_Channel.Package_Option, TV_Channel.series_name  FROM TV_Channel  WHERE TV_Channel.Hight_definition_TV = 'yes'	tvshow
SELECT TV_Channel.Package_Option, TV_Channel.series_name  FROM TV_Channel  WHERE TV_Channel.Hight_definition_TV = 'yes'	tvshow
SELECT TV_Channel.Country  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Written_by = 'Todd Casey'	tvshow
SELECT TV_Channel.Country  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Written_by = 'Todd Casey'	tvshow
SELECT TV_Channel.Country  FROM TV_Channel  WHERE TV_Channel.id NOT IN      (SELECT Cartoon.Channel      FROM Cartoon      WHERE Cartoon.Written_by = 'Todd Casey')	tvshow
SELECT TV_Channel.Country  FROM TV_Channel  WHERE TV_Channel.id NOT IN (     SELECT Cartoon.Channel      FROM Cartoon      WHERE Cartoon.Written_by = 'Todd Casey' )	tvshow
SELECT TV_Channel.series_name, TV_Channel.Country  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Directed_by = 'Ben Jones'  UNION  SELECT TV_Channel.series_name, TV_Channel.Country  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Directed_by = 'Michael Chang'	tvshow
SELECT TV_Channel.series_name, TV_Channel.Country  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Directed_by = 'Ben Jones'  UNION  SELECT TV_Channel.series_name, TV_Channel.Country  FROM Cartoon  INNER JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Directed_by = 'Michael Chang'	tvshow
SELECT TV_Channel.Pixel_aspect_ratio_PAR, TV_Channel.Country  FROM TV_Channel  WHERE TV_Channel.Language != 'English'	tvshow
SELECT TV_Channel.Pixel_aspect_ratio_PAR, TV_Channel.Country  FROM TV_Channel  WHERE TV_Channel.Language != 'English'	tvshow
SELECT TV_Channel.id FROM TV_Channel WHERE TV_Channel.Country IN (     SELECT TV_Channel.Country     FROM TV_Channel     GROUP BY TV_Channel.Country     HAVING COUNT(TV_Channel.id) > 2 )	tvshow
SELECT TV_Channel.id  FROM TV_Channel  INNER JOIN TV_series ON TV_Channel.id = TV_series.Channel  GROUP BY TV_series.Channel  HAVING COUNT(TV_series.Channel) > 2	tvshow
SELECT TV_Channel.id  FROM TV_Channel  WHERE TV_Channel.id NOT IN (     SELECT Cartoon.Channel      FROM Cartoon      WHERE Cartoon.Directed_by = 'Ben Jones' )	tvshow
SELECT TV_Channel.id  FROM TV_Channel  WHERE TV_Channel.id NOT IN (     SELECT Cartoon.Channel      FROM Cartoon      WHERE Cartoon.Directed_by = 'Ben Jones' )	tvshow
SELECT TV_Channel.Package_Option  FROM TV_Channel  WHERE TV_Channel.id NOT IN (     SELECT Cartoon.Channel      FROM Cartoon      WHERE Cartoon.Directed_by = 'Ben Jones' )	tvshow
SELECT TV_Channel.Package_Option  FROM TV_Channel  INNER JOIN Cartoon ON TV_Channel.id = Cartoon.Channel  WHERE Cartoon.Directed_by != 'Ben Jones'	tvshow
SELECT COUNT(DISTINCT poker_player.Poker_Player_ID) FROM poker_player	poker_player
SELECT COUNT(*) FROM poker_player	poker_player
SELECT poker_player.Earnings FROM poker_player ORDER BY poker_player.Earnings DESC	poker_player
SELECT poker_player.Earnings FROM poker_player ORDER BY poker_player.Earnings DESC	poker_player
SELECT poker_player.Best_Finish, poker_player.Final_Table_Made FROM poker_player	poker_player
SELECT poker_player.Best_Finish, poker_player.Final_Table_Made FROM poker_player	poker_player
SELECT AVG(poker_player.Earnings) FROM poker_player	poker_player
SELECT AVG(poker_player.Earnings) FROM poker_player	poker_player
SELECT poker_player.Money_Rank  FROM poker_player  ORDER BY poker_player.Earnings DESC  LIMIT 1	poker_player
SELECT poker_player.Money_Rank  FROM poker_player  ORDER BY poker_player.Earnings DESC  LIMIT 1	poker_player
SELECT MAX(poker_player.Final_Table_Made)  FROM poker_player  WHERE poker_player.Earnings < 200000	poker_player
SELECT MAX(poker_player.Final_Table_Made)  FROM poker_player  WHERE poker_player.Earnings < 200000	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player  ON people.People_ID = poker_player.People_ID	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player  ON people.People_ID = poker_player.People_ID	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player ON people.People_ID = poker_player.People_ID  WHERE poker_player.Earnings > 300000	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player ON people.People_ID = poker_player.People_ID  WHERE poker_player.Earnings > 300000	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player ON people.People_ID = poker_player.People_ID  ORDER BY poker_player.Final_Table_Made ASC	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player ON people.People_ID = poker_player.People_ID  ORDER BY poker_player.Final_Table_Made ASC	poker_player
SELECT people.Birth_Date  FROM poker_player  INNER JOIN people ON poker_player.People_ID = people.People_ID  ORDER BY poker_player.Earnings  LIMIT 1	poker_player
SELECT people.Birth_Date  FROM poker_player  INNER JOIN people ON poker_player.People_ID = people.People_ID  ORDER BY poker_player.Earnings  LIMIT 1	poker_player
SELECT poker_player.Money_Rank  FROM poker_player  INNER JOIN people ON poker_player.People_ID = people.People_ID  ORDER BY people.Height DESC  LIMIT 1	poker_player
SELECT poker_player.Money_Rank  FROM poker_player  INNER JOIN people ON poker_player.People_ID = people.People_ID  ORDER BY people.Height DESC  LIMIT 1	poker_player
SELECT AVG(poker_player.Earnings) FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200	poker_player
SELECT AVG(poker_player.Earnings) FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player  ON people.People_ID = poker_player.People_ID  ORDER BY poker_player.Earnings DESC	poker_player
SELECT people.Name  FROM people  INNER JOIN poker_player ON people.People_ID = poker_player.People_ID  ORDER BY poker_player.Earnings DESC	poker_player
SELECT people.Nationality, COUNT(people.People_ID)  FROM people  GROUP BY people.Nationality	poker_player
SELECT people.Nationality, COUNT(people.People_ID)  FROM people  GROUP BY people.Nationality	poker_player
SELECT people.Nationality FROM people GROUP BY people.Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT people.Nationality FROM people GROUP BY people.Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT people.Nationality FROM people GROUP BY people.Nationality HAVING COUNT(people.People_ID) >= 2	poker_player
SELECT people.Nationality  FROM people  GROUP BY people.Nationality  HAVING COUNT(people.People_ID) >= 2	poker_player
SELECT people.Name, people.Birth_Date  FROM people  ORDER BY people.Name ASC	poker_player
SELECT people.Name, people.Birth_Date FROM people ORDER BY people.Name ASC	poker_player
SELECT people.Name FROM people WHERE people.Nationality != 'Russia'	poker_player
SELECT people.Name FROM people WHERE people.Nationality != 'Russia'	poker_player
SELECT people.Name  FROM people  WHERE people.People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT people.Name  FROM people  WHERE people.People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT COUNT(DISTINCT people.Nationality) FROM people	poker_player
SELECT COUNT(DISTINCT people.Nationality) FROM people	poker_player
SELECT COUNT(DISTINCT AREA_CODE_STATE.state) FROM AREA_CODE_STATE	voter_1
SELECT CONTESTANTS.contestant_number, CONTESTANTS.contestant_name  FROM CONTESTANTS  ORDER BY CONTESTANTS.contestant_name DESC	voter_1
SELECT VOTES.vote_id, VOTES.phone_number, VOTES.state FROM VOTES	voter_1
SELECT MAX(AREA_CODE_STATE.area_code), MIN(AREA_CODE_STATE.area_code) FROM AREA_CODE_STATE	voter_1
SELECT VOTES.created FROM VOTES WHERE VOTES.state = 'CA' ORDER BY VOTES.created DESC LIMIT 1	voter_1
SELECT CONTESTANTS.contestant_name FROM CONTESTANTS WHERE CONTESTANTS.contestant_name != 'Jessie Alloway'	voter_1
SELECT DISTINCT VOTES.state, VOTES.created FROM VOTES	voter_1
SELECT CONTESTANTS.contestant_number, CONTESTANTS.contestant_name  FROM CONTESTANTS  INNER JOIN VOTES ON CONTESTANTS.contestant_number = VOTES.contestant_number  GROUP BY VOTES.contestant_number  HAVING COUNT(VOTES.vote_id) >= 2	voter_1
SELECT CONTESTANTS.contestant_number, CONTESTANTS.contestant_name  FROM CONTESTANTS  INNER JOIN VOTES ON CONTESTANTS.contestant_number = VOTES.contestant_number  GROUP BY VOTES.contestant_number  ORDER BY COUNT(VOTES.vote_id) ASC  LIMIT 1	voter_1
SELECT COUNT(*)  FROM VOTES  WHERE VOTES.state IN ('NY', 'CA')	voter_1
SELECT COUNT(*)  FROM CONTESTANTS  WHERE CONTESTANTS.contestant_number NOT IN (SELECT VOTES.contestant_number FROM VOTES)	voter_1
SELECT AREA_CODE_STATE.area_code  FROM AREA_CODE_STATE  INNER JOIN VOTES ON AREA_CODE_STATE.state = VOTES.state  GROUP BY VOTES.state  ORDER BY COUNT(VOTES.vote_id) DESC  LIMIT 1	voter_1
SELECT VOTES.created, VOTES.state, VOTES.phone_number  FROM VOTES  INNER JOIN CONTESTANTS ON VOTES.contestant_number = CONTESTANTS.contestant_number  WHERE CONTESTANTS.contestant_name = 'Tabatha Gehling'	voter_1
SELECT AREA_CODE_STATE.area_code  FROM CONTESTANTS  INNER JOIN VOTES ON CONTESTANTS.contestant_number = VOTES.contestant_number  INNER JOIN AREA_CODE_STATE ON VOTES.state = AREA_CODE_STATE.state  WHERE CONTESTANTS.contestant_name = 'Tabatha Gehling' INTERSECT SELECT AREA_CODE_STATE.area_code  FROM CONTESTANTS  INNER JOIN VOTES ON CONTESTANTS.contestant_number = VOTES.contestant_number  INNER JOIN AREA_CODE_STATE ON VOTES.state = AREA_CODE_STATE.state  WHERE CONTESTANTS.contestant_name = 'Kelly Clauss'	voter_1
SELECT CONTESTANTS.contestant_name  FROM CONTESTANTS  WHERE CONTESTANTS.contestant_name LIKE '%Al%'	voter_1
SELECT country.Name FROM country WHERE country.IndepYear > 1950	world_1
SELECT country.Name FROM country WHERE country.IndepYear > 1950	world_1
SELECT COUNT(*)  FROM country  WHERE GovernmentForm = 'Republic'	world_1
SELECT COUNT(*)  FROM country  WHERE GovernmentForm = 'Republic'	world_1
SELECT SUM(country.SurfaceArea)  FROM country  WHERE country.Region = 'Caribbean'	world_1
SELECT SUM(country.SurfaceArea)  FROM country  WHERE country.Region = 'Carribean'	world_1
SELECT country.Continent FROM country WHERE country.Name = 'Anguilla'	world_1
SELECT country.Continent FROM country WHERE country.Name = 'Anguilla'	world_1
SELECT country.Region  FROM city  INNER JOIN country ON city.CountryCode = country.Code  WHERE city.Name = 'Kabul';	world_1
SELECT country.Region  FROM city  INNER JOIN country ON city.CountryCode = country.Code  WHERE city.Name = 'Kabul';	world_1
SELECT countrylanguage.Language FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba' GROUP BY countrylanguage.Language ORDER BY SUM(countrylanguage.Percentage) DESC LIMIT 1	world_1
SELECT countrylanguage.Language FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba' ORDER BY countrylanguage.Percentage DESC LIMIT 1	world_1
SELECT country.Population, country.LifeExpectancy  FROM country  WHERE country.Name = 'Brazil'	world_1
SELECT country.Population, country.LifeExpectancy  FROM country  WHERE country.Name = 'Brazil'	world_1
SELECT country.Region, country.Population FROM country WHERE country.Name = 'Angola'	world_1
SELECT country.Region, country.Population  FROM country  WHERE country.Name = 'Angola'	world_1
SELECT AVG(country.LifeExpectancy)  FROM country  WHERE country.Region = 'Central Africa'	world_1
SELECT AVG(country.LifeExpectancy)  FROM country  WHERE country.Region = 'Central Africa'	world_1
SELECT country.Name  FROM country  WHERE country.Continent = 'Asia'  ORDER BY country.LifeExpectancy ASC  LIMIT 1	world_1
SELECT country.Name  FROM country  WHERE country.Continent = 'Asia'  ORDER BY country.LifeExpectancy ASC  LIMIT 1	world_1
SELECT SUM(country.Population), MAX(country.GNP)  FROM country  WHERE country.Continent = 'Asia'	world_1
SELECT MAX(country.GNP), SUM(country.Population)  FROM country  WHERE country.Continent = 'Asia'	world_1
SELECT AVG(country.LifeExpectancy)  FROM country  WHERE country.Continent = 'Africa'  AND country.GovernmentForm = 'Republic'	world_1
SELECT AVG(country.LifeExpectancy)  FROM country  WHERE country.Continent = 'Africa'  AND country.GovernmentForm = 'Republic'	world_1
SELECT (SUM(case when `country`.`Continent` = 'Asia' then `country`.`SurfaceArea` else 0 end) +  SUM(case when `country`.`Continent` = 'Europe' then `country`.`SurfaceArea` else 0 end)) as total_surface_area FROM `country`	world_1
SELECT (SUM(case when `country`.`Continent` = 'Asia' then `country`.`SurfaceArea` else 0 end) +  SUM(case when `country`.`Continent` = 'Europe' then `country`.`SurfaceArea` else 0 end)) as Total_SurfaceArea FROM `country`	world_1
SELECT SUM(city.Population) FROM city WHERE city.District = 'Gelderland'	world_1
SELECT SUM(city.Population)  FROM city  WHERE city.District = 'Gelderland'	world_1
SELECT AVG(country.GNP), SUM(country.Population)  FROM country  WHERE country.GovernmentForm = 'US territory'	world_1
SELECT AVG(country.GNP), SUM(country.Population)  FROM country  WHERE country.GovernmentForm = 'US territory'	world_1
SELECT COUNT(DISTINCT countrylanguage.Language) FROM countrylanguage	world_1
SELECT COUNT(DISTINCT countrylanguage.Language) FROM countrylanguage	world_1
SELECT COUNT(DISTINCT country.GovernmentForm)  FROM country  WHERE country.Continent = 'Africa'	world_1
SELECT COUNT(DISTINCT country.GovernmentForm)  FROM country  WHERE country.Continent = 'Africa'	world_1
SELECT COUNT(countrylanguage.Language)  FROM countrylanguage  INNER JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.Name = 'Aruba'	world_1
SELECT COUNT(countrylanguage.Language) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba'	world_1
SELECT COUNT(countrylanguage.Language) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Afghanistan' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT COUNT(countrylanguage.Language) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Afghanistan' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT country.Name  FROM country  INNER JOIN (     SELECT countrylanguage.CountryCode      FROM countrylanguage      GROUP BY countrylanguage.CountryCode      ORDER BY COUNT(countrylanguage.Language) DESC      LIMIT 1 ) AS df1  ON country.Code = df1.CountryCode	world_1
SELECT country.Name  FROM country  INNER JOIN      (SELECT countrylanguage.CountryCode      FROM countrylanguage      GROUP BY countrylanguage.CountryCode      ORDER BY COUNT(countrylanguage.Language) DESC      LIMIT 1) AS df1  ON country.Code = df1.CountryCode	world_1
SELECT country.Continent FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Continent, countrylanguage.Language ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT country.Continent FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Continent ORDER BY COUNT(DISTINCT countrylanguage.Language) DESC LIMIT 1	world_1
SELECT COUNT(*)  FROM (     SELECT countrylanguage.CountryCode      FROM countrylanguage      WHERE countrylanguage.Language = 'English'     INTERSECT      SELECT countrylanguage.CountryCode      FROM countrylanguage      WHERE countrylanguage.Language = 'Dutch' ) AS res	world_1
SELECT COUNT(*)  FROM      (SELECT country.Code      FROM countrylanguage      INNER JOIN country ON countrylanguage.CountryCode = country.Code      WHERE countrylanguage.Language = 'English'          INTERSECT           SELECT country.Code      FROM countrylanguage      INNER JOIN country ON countrylanguage.CountryCode = country.Code      WHERE countrylanguage.Language = 'Dutch') AS res	world_1
SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English' INTERSECT SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'French'	world_1
SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'  INTERSECT   SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'French'	world_1
SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' INTERSECT SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' INTERSECT SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT country.Continent) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language = 'Chinese'	world_1
SELECT COUNT(DISTINCT country.Continent) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language = 'Chinese'	world_1
SELECT country.Region  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'  UNION  SELECT country.Region  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'Dutch'	world_1
SELECT country.Region  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'Dutch'  UNION  SELECT country.Region  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'	world_1
SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T'  UNION  SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'Dutch' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' UNION SELECT country.Name  FROM country  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'Dutch' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT countrylanguage.Language FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY countrylanguage.Language ORDER BY SUM(countrylanguage.Percentage) DESC LIMIT 1	world_1
SELECT countrylanguage.Language FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' GROUP BY countrylanguage.Language ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT countrylanguage.Language FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.GovernmentForm LIKE '%republic%' GROUP BY countrylanguage.Language HAVING COUNT(countrylanguage.CountryCode) = 1	world_1
SELECT countrylanguage.Language FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.GovernmentForm = 'Republic' GROUP BY countrylanguage.Language HAVING COUNT(*) = 1	world_1
SELECT city.Name  FROM city  INNER JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'  ORDER BY city.Population DESC  LIMIT 1	world_1
SELECT city.Name  FROM city  INNER JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'  ORDER BY city.Population DESC  LIMIT 1	world_1
SELECT country.Name, country.Population, country.LifeExpectancy FROM country WHERE country.Continent = 'Asia' ORDER BY country.SurfaceArea DESC LIMIT 1	world_1
SELECT country.Name, country.Population, country.LifeExpectancy  FROM country  WHERE country.Continent = 'Asia'  ORDER BY country.SurfaceArea DESC  LIMIT 1	world_1
SELECT AVG(country.LifeExpectancy) FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F'	world_1
SELECT AVG(country.LifeExpectancy)  FROM country  INNER JOIN countrylanguage  ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'  AND countrylanguage.IsOfficial = 'F'	world_1
SELECT SUM(country.Population)  FROM country  WHERE country.Code NOT IN      (SELECT countrylanguage.CountryCode      FROM countrylanguage      WHERE countrylanguage.Language = 'English')	world_1
SELECT SUM(country.Population)  FROM country  WHERE country.Code IN (     SELECT country.Code      FROM country      INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode      WHERE countrylanguage.Language != 'English')	world_1
SELECT countrylanguage.Language  FROM countrylanguage  INNER JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.HeadOfState = 'Beatrix' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT countrylanguage.Language  FROM countrylanguage  INNER JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.HeadOfState = 'Beatrix' AND countrylanguage.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT countrylanguage.Language) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'	world_1
SELECT COUNT(DISTINCT countrylanguage.Language) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'	world_1
SELECT country.Name  FROM country  WHERE country.SurfaceArea > (SELECT MAX(country.SurfaceArea) FROM country WHERE country.Continent = 'Europe')	world_1
SELECT country.Name  FROM country  WHERE country.SurfaceArea > (SELECT MAX(country.SurfaceArea) FROM country WHERE country.Continent = 'Europe')	world_1
SELECT country.Name  FROM country  WHERE country.Continent = 'Africa'  AND country.Population < (SELECT MIN(country.Population) FROM country WHERE country.Continent = 'Asia')	world_1
SELECT country.Name  FROM country  WHERE country.Continent = 'Africa'  AND country.Population < (SELECT MIN(country.Population) FROM country WHERE country.Continent = 'Asia')	world_1
SELECT country.Name  FROM country  WHERE country.Continent = 'Asia'  AND country.Population > (SELECT MAX(country.Population) FROM country WHERE country.Continent = 'Africa')	world_1
SELECT country.Name  FROM country  WHERE country.Continent = 'Asia'  AND country.Population > (SELECT MAX(country.Population) FROM country WHERE country.Continent = 'Africa')	world_1
SELECT countrylanguage.CountryCode  FROM countrylanguage  WHERE countrylanguage.Language != 'English'	world_1
SELECT countrylanguage.CountryCode  FROM countrylanguage  WHERE countrylanguage.Language != 'English'	world_1
SELECT countrylanguage.CountryCode FROM countrylanguage WHERE countrylanguage.Language != 'English'	world_1
SELECT countrylanguage.CountryCode  FROM countrylanguage  WHERE countrylanguage.Language != 'English'	world_1
SELECT country.Code FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language != 'English' AND country.GovernmentForm != 'Republic'	world_1
SELECT country.Code FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language != 'English' AND country.GovernmentForm NOT LIKE '%Republic%'	world_1
SELECT city.Name  FROM city  INNER JOIN country ON city.CountryCode = country.Code  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'English'  AND countrylanguage.IsOfficial = 'F'  AND country.Continent = 'Europe'	world_1
SELECT city.Name  FROM city  INNER JOIN country ON city.CountryCode = country.Code  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE country.Continent = 'Europe' AND countrylanguage.Language != 'English'	world_1
SELECT DISTINCT city.Name  FROM city  INNER JOIN country ON city.CountryCode = country.Code  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'Chinese'  AND countrylanguage.IsOfficial = 'T'  AND country.Continent = 'Asia'	world_1
SELECT city.Name  FROM city  INNER JOIN country ON city.CountryCode = country.Code  INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode  WHERE countrylanguage.Language = 'Chinese'  AND countrylanguage.IsOfficial = 'T'  AND country.Continent = 'Asia'	world_1
SELECT country.Name, country.IndepYear, country.SurfaceArea  FROM country  ORDER BY country.Population ASC  LIMIT 1	world_1
SELECT country.Name, country.IndepYear, country.SurfaceArea  FROM country  ORDER BY country.Population ASC  LIMIT 1	world_1
SELECT country.Population, country.Name, country.HeadOfState  FROM country  ORDER BY country.SurfaceArea DESC  LIMIT 1	world_1
SELECT country.Name, country.Population, country.HeadOfState  FROM country  ORDER BY country.SurfaceArea DESC  LIMIT 1	world_1
SELECT country.Name, COUNT(countrylanguage.Language)  FROM countrylanguage  INNER JOIN country ON countrylanguage.CountryCode = country.Code  GROUP BY countrylanguage.CountryCode  HAVING COUNT(countrylanguage.Language) >= 3	world_1
SELECT country.Name, COUNT(countrylanguage.Language)  FROM countrylanguage  INNER JOIN country ON countrylanguage.CountryCode = country.Code  GROUP BY countrylanguage.CountryCode  HAVING COUNT(countrylanguage.Language) > 2	world_1
SELECT city.District, COUNT(city.ID) FROM city WHERE city.Population > (SELECT AVG(city.Population) FROM city) GROUP BY city.District	world_1
SELECT city.District, COUNT(*)  FROM city  WHERE city.Population > (SELECT AVG(city.Population) FROM city)  GROUP BY city.District	world_1
SELECT country.GovernmentForm, SUM(country.Population)  FROM country  GROUP BY country.GovernmentForm  HAVING AVG(country.LifeExpectancy) > 72	world_1
SELECT country.GovernmentForm, SUM(country.Population) FROM country GROUP BY country.GovernmentForm HAVING AVG(country.LifeExpectancy) > 72	world_1
SELECT country.Continent, AVG(country.LifeExpectancy), SUM(country.Population) FROM country GROUP BY country.Continent HAVING AVG(country.LifeExpectancy) < 72	world_1
SELECT country.Continent, SUM(country.Population), AVG(country.LifeExpectancy) FROM country GROUP BY country.Continent HAVING AVG(country.LifeExpectancy) < 72	world_1
SELECT country.Name, country.SurfaceArea FROM country ORDER BY country.SurfaceArea DESC LIMIT 5	world_1
SELECT country.Name, country.SurfaceArea  FROM country  ORDER BY country.SurfaceArea DESC  LIMIT 5	world_1
SELECT country.Name  FROM country  ORDER BY country.Population DESC  LIMIT 3	world_1
SELECT country.Name  FROM country  ORDER BY country.Population DESC  LIMIT 3	world_1
SELECT country.Name  FROM country  ORDER BY country.Population ASC  LIMIT 3	world_1
SELECT country.Name  FROM country  ORDER BY country.Population ASC  LIMIT 3	world_1
SELECT COUNT(*)  FROM country  WHERE country.Continent = 'Asia'	world_1
SELECT COUNT(*)  FROM country  WHERE country.Continent = 'Asia'	world_1
SELECT country.Name FROM country WHERE country.Continent = 'Europe' AND country.Population = 80000	world_1
SELECT country.Name FROM country WHERE country.Continent = 'Europe' AND country.Population = 80000	world_1
SELECT SUM(country.Population), AVG(country.SurfaceArea)  FROM country  WHERE country.Continent = 'North America' AND country.SurfaceArea > 3000	world_1
SELECT SUM(country.Population), AVG(country.SurfaceArea)  FROM country  WHERE country.Continent = 'North America' AND country.SurfaceArea > 3000	world_1
SELECT city.Name FROM city WHERE city.Population BETWEEN 160000 AND 900000	world_1
SELECT city.Name FROM city WHERE city.Population BETWEEN 160000 AND 900000	world_1
SELECT countrylanguage.Language FROM countrylanguage GROUP BY countrylanguage.Language ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT countrylanguage.Language FROM countrylanguage GROUP BY countrylanguage.Language ORDER BY COUNT(*) DESC LIMIT 1	world_1
SELECT countrylanguage.Language FROM countrylanguage INNER JOIN (     SELECT CountryCode, MAX(Percentage) as max_percentage     FROM countrylanguage     GROUP BY CountryCode ) as max_table ON countrylanguage.CountryCode = max_table.CountryCode AND countrylanguage.Percentage = max_table.max_percentage	world_1
SELECT country.Code, countrylanguage.Language FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code GROUP BY countrylanguage.CountryCode ORDER BY countrylanguage.Percentage DESC LIMIT 1	world_1
SELECT COUNT(DISTINCT countrylanguage.CountryCode) FROM countrylanguage WHERE countrylanguage.Language = 'Spanish' GROUP BY countrylanguage.CountryCode ORDER BY MAX(countrylanguage.Percentage) DESC	world_1
SELECT COUNT(*)  FROM countrylanguage  WHERE Language = 'Spanish' AND Percentage > 50	world_1
SELECT country.Code FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish' ORDER BY countrylanguage.Percentage DESC LIMIT 1	world_1
SELECT country.Code FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.Percentage > 50	world_1
SELECT COUNT(*) FROM conductor	orchestra
SELECT COUNT(*) FROM conductor	orchestra
SELECT conductor.Name FROM conductor ORDER BY conductor.Age ASC	orchestra
SELECT conductor.Name FROM conductor ORDER BY conductor.Age	orchestra
SELECT conductor.Name  FROM conductor  WHERE conductor.Nationality != 'USA'	orchestra
SELECT conductor.Name  FROM conductor  WHERE conductor.Nationality != 'USA'	orchestra
SELECT orchestra.Record_Company  FROM orchestra  ORDER BY orchestra.Year_of_Founded DESC	orchestra
SELECT orchestra.Record_Company  FROM orchestra  ORDER BY orchestra.Year_of_Founded DESC	orchestra
SELECT AVG(show.Attendance) FROM show	orchestra
SELECT AVG(show.Attendance) FROM show	orchestra
SELECT MAX(performance.Official_ratings_(millions)), MIN(performance.Official_ratings_(millions))  FROM performance  WHERE performance.Type != 'Live final'	orchestra
SELECT MAX(performance.Share), MIN(performance.Share)  FROM performance  WHERE performance.Type != 'Live final'	orchestra
SELECT COUNT(DISTINCT conductor.Nationality) FROM conductor	orchestra
SELECT COUNT(DISTINCT conductor.Nationality) FROM conductor	orchestra
SELECT conductor.Name FROM conductor ORDER BY conductor.Year_of_Work DESC	orchestra
SELECT conductor.Name FROM conductor ORDER BY conductor.Year_of_Work DESC	orchestra
SELECT conductor.Name  FROM conductor  ORDER BY conductor.Year_of_Work DESC  LIMIT 1	orchestra
SELECT conductor.Name  FROM conductor  ORDER BY conductor.Year_of_Work DESC  LIMIT 1	orchestra
SELECT conductor.Name, orchestra.Orchestra FROM conductor INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID	orchestra
SELECT conductor.Name, orchestra.Orchestra FROM conductor INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID	orchestra
SELECT conductor.Name FROM conductor INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID HAVING COUNT(DISTINCT orchestra.Orchestra) > 1	orchestra
SELECT conductor.Name FROM conductor INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID GROUP BY conductor.Conductor_ID HAVING COUNT(DISTINCT orchestra.Orchestra_ID) > 1	orchestra
SELECT conductor.Name  FROM conductor  INNER JOIN (     SELECT orchestra.Conductor_ID      FROM orchestra      GROUP BY orchestra.Conductor_ID      ORDER BY COUNT(orchestra.Orchestra_ID) DESC      LIMIT 1 ) AS df1  ON conductor.Conductor_ID = df1.Conductor_ID	orchestra
SELECT conductor.Name  FROM conductor  INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID  GROUP BY orchestra.Conductor_ID  ORDER BY COUNT(orchestra.Orchestra_ID) DESC  LIMIT 1	orchestra
SELECT conductor.Name FROM conductor INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID WHERE orchestra.Year_of_Founded > 2008	orchestra
SELECT conductor.Name  FROM conductor  INNER JOIN orchestra ON conductor.Conductor_ID = orchestra.Conductor_ID  WHERE orchestra.Year_of_Founded > 2008	orchestra
SELECT orchestra.Record_Company, COUNT(orchestra.Orchestra)  FROM orchestra  GROUP BY orchestra.Record_Company	orchestra
SELECT orchestra.Record_Company, COUNT(orchestra.Orchestra_ID)  FROM orchestra  GROUP BY orchestra.Record_Company	orchestra
SELECT orchestra.Major_Record_Format FROM orchestra GROUP BY orchestra.Major_Record_Format ORDER BY COUNT(*) ASC	orchestra
SELECT orchestra.Major_Record_Format FROM orchestra  GROUP BY orchestra.Major_Record_Format  ORDER BY COUNT(*) DESC	orchestra
SELECT orchestra.Record_Company FROM orchestra GROUP BY orchestra.Record_Company ORDER BY COUNT(orchestra.Orchestra) DESC LIMIT 1	orchestra
SELECT orchestra.Record_Company FROM orchestra GROUP BY orchestra.Record_Company ORDER BY COUNT(orchestra.Orchestra) DESC LIMIT 1	orchestra
SELECT orchestra.Orchestra  FROM orchestra  LEFT JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID  WHERE performance.Orchestra_ID IS NULL	orchestra
SELECT orchestra.Orchestra  FROM orchestra  WHERE orchestra.Orchestra_ID NOT IN (SELECT performance.Orchestra_ID FROM performance)	orchestra
SELECT orchestra.Record_Company  FROM orchestra  WHERE orchestra.Year_of_Founded < 2003 INTERSECT SELECT orchestra.Record_Company  FROM orchestra  WHERE orchestra.Year_of_Founded > 2003	orchestra
SELECT orchestra.Record_Company  FROM orchestra  WHERE orchestra.Year_of_Founded < 2003 INTERSECT SELECT orchestra.Record_Company  FROM orchestra  WHERE orchestra.Year_of_Founded > 2003	orchestra
SELECT COUNT(DISTINCT orchestra.Orchestra)  FROM orchestra  WHERE orchestra.Major_Record_Format IN ('CD', 'DVD')	orchestra
SELECT COUNT(DISTINCT orchestra.Orchestra)  FROM orchestra  WHERE orchestra.Major_Record_Format IN ('CD', 'DVD')	orchestra
SELECT orchestra.Year_of_Founded  FROM orchestra  INNER JOIN (     SELECT performance.Orchestra_ID      FROM performance      GROUP BY performance.Orchestra_ID      HAVING COUNT(performance.Performance_ID) > 1 ) AS df1  ON orchestra.Orchestra_ID = df1.Orchestra_ID	orchestra
SELECT orchestra.Year_of_Founded FROM orchestra INNER JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID GROUP BY performance.Orchestra_ID HAVING COUNT(performance.Performance_ID) > 1	orchestra
SELECT COUNT(Highschooler.ID) FROM Highschooler	network_1
SELECT COUNT(*) FROM Highschooler;	network_1
SELECT Highschooler.name, Highschooler.grade FROM Highschooler	network_1
SELECT Highschooler.name, Highschooler.grade FROM Highschooler	network_1
SELECT Highschooler.grade FROM Highschooler	network_1
SELECT Highschooler.grade FROM Highschooler	network_1
SELECT Highschooler.grade  FROM Highschooler  WHERE Highschooler.name = 'Kyle'	network_1
SELECT Highschooler.grade  FROM Highschooler  WHERE Highschooler.name = 'Kyle'	network_1
SELECT Highschooler.name FROM Highschooler WHERE Highschooler.grade = 10	network_1
SELECT Highschooler.name FROM Highschooler WHERE Highschooler.grade = 10	network_1
SELECT Highschooler.ID FROM Highschooler WHERE Highschooler.name = 'Kyle'	network_1
SELECT Highschooler.ID FROM Highschooler WHERE Highschooler.name = 'Kyle'	network_1
SELECT COUNT(*)  FROM Highschooler  WHERE grade IN (9, 10);	network_1
SELECT COUNT(*)  FROM Highschooler  WHERE grade IN (9, 10);	network_1
SELECT Highschooler.grade, COUNT(Highschooler.ID)  FROM Highschooler  GROUP BY Highschooler.grade	network_1
SELECT Highschooler.grade, COUNT(*)  FROM Highschooler  GROUP BY Highschooler.grade	network_1
SELECT Highschooler.grade FROM Highschooler GROUP BY Highschooler.grade ORDER BY COUNT(*) DESC LIMIT 1	network_1
SELECT Highschooler.grade FROM Highschooler GROUP BY Highschooler.grade ORDER BY COUNT(*) DESC LIMIT 1	network_1
SELECT Highschooler.grade FROM Highschooler GROUP BY Highschooler.grade HAVING COUNT(Highschooler.ID) >= 4	network_1
SELECT Highschooler.grade FROM Highschooler GROUP BY Highschooler.grade HAVING COUNT(Highschooler.ID) >= 4	network_1
SELECT Friend.student_id, COUNT(Friend.friend_id)  FROM Friend  GROUP BY Friend.student_id	network_1
SELECT Friend.student_id, COUNT(Friend.friend_id)  FROM Friend  GROUP BY Friend.student_id	network_1
SELECT Highschooler.name, COUNT(Friend.friend_id)  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  GROUP BY Highschooler.name	network_1
SELECT Highschooler.name, COUNT(Friend.friend_id)  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  GROUP BY Highschooler.name	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  GROUP BY Friend.student_id  ORDER BY COUNT(Friend.friend_id) DESC  LIMIT 1	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN (     SELECT Friend.student_id      FROM Friend      GROUP BY Friend.student_id      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON Highschooler.ID = df1.student_id	network_1
SELECT Highschooler.name FROM Highschooler INNER JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Friend.student_id HAVING COUNT(Friend.friend_id) >= 3	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  GROUP BY Friend.student_id  HAVING COUNT(*) >= 3	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.friend_id  WHERE Friend.student_id IN (     SELECT Highschooler.ID      FROM Highschooler      WHERE Highschooler.name = 'Kyle' )	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.friend_id  WHERE Friend.student_id IN (     SELECT Highschooler.ID      FROM Highschooler      WHERE Highschooler.name = 'Kyle' )	network_1
SELECT COUNT(*)  FROM Friend  INNER JOIN Highschooler ON Friend.student_id = Highschooler.ID  WHERE Highschooler.name = 'Kyle'	network_1
SELECT COUNT(Friend.friend_id)  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  WHERE Highschooler.name = 'Kyle'	network_1
SELECT Highschooler.ID  FROM Highschooler  EXCEPT  SELECT Friend.student_id  FROM Friend	network_1
SELECT Highschooler.ID  FROM Highschooler  EXCEPT  SELECT Friend.student_id  FROM Friend	network_1
SELECT Highschooler.name  FROM Highschooler  WHERE Highschooler.ID NOT IN (SELECT Friend.student_id FROM Friend)	network_1
SELECT Highschooler.name FROM Highschooler WHERE Highschooler.ID NOT IN (SELECT Friend.student_id FROM Friend)	network_1
SELECT Friend.student_id  FROM Friend  INTERSECT  SELECT Likes.liked_id  FROM Likes	network_1
SELECT Friend.student_id  FROM Friend  INTERSECT  SELECT Likes.student_id  FROM Likes	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  INNER JOIN Likes ON Highschooler.ID = Likes.liked_id  WHERE Friend.student_id IS NOT NULL AND Likes.liked_id IS NOT NULL	network_1
SELECT Highschooler.name  FROM Highschooler  WHERE Highschooler.ID IN (SELECT Friend.student_id FROM Friend)  AND Highschooler.ID IN (SELECT Likes.student_id FROM Likes)	network_1
SELECT Likes.student_id, COUNT(Likes.liked_id)  FROM Likes  GROUP BY Likes.student_id	network_1
SELECT Likes.student_id, COUNT(*)  FROM Likes  GROUP BY Likes.student_id	network_1
SELECT Highschooler.name, COUNT(Likes.liked_id)  FROM Highschooler  INNER JOIN Likes ON Highschooler.ID = Likes.student_id  GROUP BY Highschooler.name	network_1
SELECT Highschooler.name, COUNT(Likes.liked_id)  FROM Highschooler  INNER JOIN Likes ON Highschooler.ID = Likes.student_id  GROUP BY Highschooler.ID, Highschooler.name	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN (     SELECT Likes.student_id      FROM Likes      GROUP BY Likes.student_id      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON Highschooler.ID = df1.student_id	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN (     SELECT Likes.student_id      FROM Likes      GROUP BY Likes.student_id      ORDER BY COUNT(*) DESC      LIMIT 1 ) AS df1  ON Highschooler.ID = df1.student_id	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Likes ON Highschooler.ID = Likes.student_id  GROUP BY Likes.student_id  HAVING COUNT(*) >= 2	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Likes ON Highschooler.ID = Likes.student_id  GROUP BY Likes.student_id  HAVING COUNT(*) >= 2	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  WHERE Highschooler.grade > 5  GROUP BY Highschooler.ID  HAVING COUNT(Friend.student_id) >= 2	network_1
SELECT Highschooler.name  FROM Highschooler  INNER JOIN Friend ON Highschooler.ID = Friend.student_id  WHERE Highschooler.grade > 5  GROUP BY Highschooler.ID  HAVING COUNT(Friend.friend_id) >= 2	network_1
SELECT COUNT(*) FROM Likes WHERE student_id IN (     SELECT ID     FROM Highschooler     WHERE name = 'Kyle' )	network_1
SELECT COUNT(*)  FROM Likes  INNER JOIN Highschooler ON Likes.student_id = Highschooler.ID  WHERE Highschooler.name = 'Kyle'	network_1
SELECT AVG(Highschooler.grade) FROM Highschooler WHERE Highschooler.ID IN (SELECT Friend.student_id FROM Friend)	network_1
SELECT AVG(Highschooler.grade) FROM Highschooler WHERE Highschooler.ID IN (SELECT Friend.student_id FROM Friend)	network_1
SELECT MIN(Highschooler.grade)  FROM Highschooler  WHERE Highschooler.ID NOT IN (SELECT Friend.student_id FROM Friend)	network_1
SELECT MIN(Highschooler.grade) FROM Highschooler WHERE Highschooler.ID NOT IN (SELECT Friend.student_id FROM Friend)	network_1
SELECT Owners.state  FROM Owners  INTERSECT  SELECT Professionals.state  FROM Professionals	dog_kennels
SELECT Owners.state  FROM Owners  INTERSECT  SELECT Professionals.state  FROM Professionals	dog_kennels
SELECT AVG(Dogs.age)  FROM Dogs  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id	dog_kennels
SELECT AVG(Dogs.age)  FROM Dogs  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id	dog_kennels
SELECT Professionals.professional_id, Professionals.last_name, Professionals.cell_number FROM Professionals WHERE Professionals.state = 'Indiana'  UNION  SELECT Professionals.professional_id, Professionals.last_name, Professionals.cell_number FROM Professionals INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id GROUP BY Treatments.professional_id HAVING COUNT(Treatments.treatment_id) > 2	dog_kennels
SELECT Professionals.professional_id, Professionals.last_name, Professionals.cell_number  FROM Professionals  WHERE Professionals.state = 'Indiana'   UNION   SELECT Professionals.professional_id, Professionals.last_name, Professionals.cell_number  FROM Professionals  INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id  GROUP BY Treatments.professional_id  HAVING COUNT(*) > 2	dog_kennels
SELECT Dogs.name  FROM Dogs  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  WHERE Treatments.cost_of_treatment <= 1000	dog_kennels
SELECT Dogs.name  FROM Dogs  INNER JOIN (     SELECT Treatments.dog_id      FROM Treatments      GROUP BY Treatments.dog_id      HAVING SUM(Treatments.cost_of_treatment) <= 1000 ) AS df1  ON Dogs.dog_id = df1.dog_id	dog_kennels
SELECT Owners.first_name  FROM Owners  UNION  SELECT Professionals.first_name  FROM Professionals  EXCEPT  SELECT Dogs.name  FROM Dogs	dog_kennels
SELECT Owners.first_name  FROM Owners  UNION  SELECT Professionals.first_name  FROM Professionals  EXCEPT  SELECT Dogs.name  FROM Dogs	dog_kennels
SELECT Professionals.professional_id, Professionals.role_code, Professionals.email_address FROM Professionals WHERE Professionals.professional_id NOT IN      (SELECT Treatments.professional_id FROM Treatments)	dog_kennels
SELECT Professionals.professional_id, Professionals.role_code, Professionals.email_address  FROM Professionals  WHERE Professionals.professional_id NOT IN (SELECT Treatments.professional_id FROM Treatments)	dog_kennels
SELECT Owners.owner_id, Owners.first_name, Owners.last_name FROM Owners INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id GROUP BY Owners.owner_id ORDER BY COUNT(Dogs.dog_id) DESC LIMIT 1	dog_kennels
SELECT Owners.owner_id, Owners.first_name, Owners.last_name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id  GROUP BY Dogs.owner_id  ORDER BY COUNT(*) DESC  LIMIT 1	dog_kennels
SELECT Professionals.professional_id, Professionals.role_code, Professionals.first_name  FROM Professionals  INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id  GROUP BY Treatments.professional_id  HAVING COUNT(Treatments.treatment_id) >= 2	dog_kennels
SELECT Professionals.professional_id, Professionals.role_code, Professionals.first_name  FROM Professionals  INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id  GROUP BY Treatments.professional_id  HAVING COUNT(Treatments.treatment_id) >= 2	dog_kennels
SELECT Breeds.breed_name FROM Dogs INNER JOIN Breeds ON Dogs.breed_code = Breeds.breed_code GROUP BY Dogs.breed_code ORDER BY COUNT(*) DESC LIMIT 1	dog_kennels
SELECT Breeds.breed_name FROM Dogs INNER JOIN Breeds ON Dogs.breed_code = Breeds.breed_code GROUP BY Dogs.breed_code ORDER BY COUNT(*) DESC LIMIT 1	dog_kennels
SELECT Owners.owner_id, Owners.last_name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  GROUP BY Dogs.owner_id  ORDER BY COUNT(Treatments.treatment_id) DESC  LIMIT 1	dog_kennels
SELECT Owners.owner_id, Owners.last_name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  GROUP BY Dogs.owner_id  ORDER BY SUM(Treatments.cost_of_treatment) DESC  LIMIT 1	dog_kennels
SELECT Treatment_Types.treatment_type_description FROM Treatment_Types INNER JOIN (     SELECT Treatments.treatment_type_code, SUM(Treatments.cost_of_treatment) as total_cost     FROM Treatments     GROUP BY Treatments.treatment_type_code     ORDER BY total_cost ASC     LIMIT 1 ) AS df1 ON Treatment_Types.treatment_type_code = df1.treatment_type_code	dog_kennels
SELECT Treatment_Types.treatment_type_description  FROM Treatment_Types  INNER JOIN (     SELECT Treatments.treatment_type_code      FROM Treatments      GROUP BY Treatments.treatment_type_code      ORDER BY SUM(Treatments.cost_of_treatment) ASC      LIMIT 1 ) AS df1  ON Treatment_Types.treatment_type_code = df1.treatment_type_code	dog_kennels
SELECT Owners.owner_id, Owners.zip_code FROM Owners INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY Owners.owner_id ORDER BY SUM(Treatments.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT Owners.owner_id, Owners.zip_code  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  GROUP BY Owners.owner_id  ORDER BY SUM(Treatments.cost_of_treatment) DESC  LIMIT 1	dog_kennels
SELECT Professionals.professional_id, Professionals.cell_number FROM Professionals INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id GROUP BY Treatments.professional_id HAVING COUNT(DISTINCT Treatments.treatment_type_code) >= 2	dog_kennels
SELECT Professionals.professional_id, Professionals.cell_number  FROM Professionals  INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id  GROUP BY Treatments.professional_id  HAVING COUNT(DISTINCT Treatments.treatment_type_code) >= 2	dog_kennels
SELECT Professionals.first_name, Professionals.last_name  FROM Professionals  INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id  WHERE Treatments.cost_of_treatment < (SELECT AVG(Treatments.cost_of_treatment) FROM Treatments)	dog_kennels
SELECT Professionals.first_name, Professionals.last_name  FROM Professionals  INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id  WHERE Treatments.cost_of_treatment < (SELECT AVG(Treatments.cost_of_treatment) FROM Treatments)	dog_kennels
SELECT Treatments.date_of_treatment, Professionals.first_name  FROM Treatments  INNER JOIN Professionals ON Treatments.professional_id = Professionals.professional_id	dog_kennels
SELECT Treatments.date_of_treatment, Professionals.first_name  FROM Treatments  INNER JOIN Professionals ON Treatments.professional_id = Professionals.professional_id	dog_kennels
SELECT Treatments.cost_of_treatment, Treatment_Types.treatment_type_description FROM Treatments INNER JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code	dog_kennels
SELECT Treatments.cost_of_treatment, Treatment_Types.treatment_type_description FROM Treatments INNER JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code	dog_kennels
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Dogs INNER JOIN Owners ON Dogs.owner_id = Owners.owner_id INNER JOIN Sizes ON Dogs.size_code = Sizes.size_code	dog_kennels
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Dogs INNER JOIN Owners ON Dogs.owner_id = Owners.owner_id INNER JOIN Sizes ON Dogs.size_code = Sizes.size_code	dog_kennels
SELECT Owners.first_name, Dogs.name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id	dog_kennels
SELECT Owners.first_name, Dogs.name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id	dog_kennels
SELECT Dogs.name, Treatments.date_of_treatment  FROM Dogs  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  WHERE Dogs.breed_code IN (     SELECT Dogs.breed_code      FROM Dogs      GROUP BY Dogs.breed_code      ORDER BY COUNT(*) ASC      LIMIT 1 )	dog_kennels
SELECT Dogs.name, Treatments.date_of_treatment  FROM Dogs  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  WHERE Dogs.breed_code IN (     SELECT Dogs.breed_code      FROM Dogs      GROUP BY Dogs.breed_code      ORDER BY COUNT(*) ASC      LIMIT 1 )	dog_kennels
SELECT Owners.first_name, Dogs.name FROM Owners INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Owners.state = 'Virginia'	dog_kennels
SELECT Owners.first_name, Dogs.name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id  WHERE Owners.state = 'Virginia'	dog_kennels
SELECT Dogs.date_arrived, Dogs.date_departed  FROM Dogs  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  WHERE Treatments.dog_id IS NOT NULL	dog_kennels
SELECT Dogs.date_arrived, Dogs.date_departed  FROM Dogs  INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  WHERE Treatments.dog_id IS NOT NULL	dog_kennels
SELECT Owners.last_name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id  ORDER BY Dogs.date_of_birth DESC  LIMIT 1	dog_kennels
SELECT Owners.last_name  FROM Owners  INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id  ORDER BY Dogs.date_of_birth DESC  LIMIT 1	dog_kennels
SELECT Professionals.email_address  FROM Professionals  WHERE Professionals.state = 'Hawaii'  UNION  SELECT Professionals.email_address  FROM Professionals  WHERE Professionals.state = 'Wisconsin'	dog_kennels
SELECT Professionals.email_address  FROM Professionals  WHERE Professionals.state IN ('Hawaii', 'Wisconsin')	dog_kennels
SELECT Dogs.date_departed, Dogs.date_arrived FROM Dogs	dog_kennels
SELECT Dogs.date_departed, Dogs.date_arrived FROM Dogs	dog_kennels
SELECT COUNT(DISTINCT Treatments.dog_id) FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT Treatments.dog_id) FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT Treatments.professional_id)  FROM Treatments  WHERE Treatments.professional_id IS NOT NULL	dog_kennels
SELECT COUNT(DISTINCT Treatments.professional_id)  FROM Treatments  WHERE Treatments.dog_id IS NOT NULL	dog_kennels
SELECT Professionals.role_code, Professionals.street, Professionals.city, Professionals.state  FROM Professionals  WHERE Professionals.city LIKE '%West%'	dog_kennels
SELECT Professionals.role_code, Professionals.street, Professionals.city, Professionals.state  FROM Professionals  WHERE Professionals.city LIKE '%West%'	dog_kennels
SELECT Owners.first_name, Owners.last_name, Owners.email_address  FROM Owners  WHERE Owners.state LIKE '%North%';	dog_kennels
SELECT Owners.first_name, Owners.last_name, Owners.email_address  FROM Owners  WHERE Owners.state LIKE '%North%'	dog_kennels
SELECT COUNT(*)  FROM Dogs  WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT Treatments.cost_of_treatment FROM Treatments ORDER BY Treatments.date_of_treatment DESC LIMIT 1	dog_kennels
SELECT Treatments.cost_of_treatment  FROM Treatments  ORDER BY Treatments.date_of_treatment DESC  LIMIT 1	dog_kennels
SELECT COUNT(*) FROM Dogs WHERE Dogs.dog_id NOT IN (SELECT dog_id FROM Treatments)	dog_kennels
SELECT Dogs.dog_id  FROM Dogs  LEFT JOIN Treatments ON Dogs.dog_id = Treatments.dog_id  WHERE Treatments.treatment_id IS NULL	dog_kennels
SELECT COUNT(Owners.owner_id)  FROM Owners  LEFT JOIN Dogs ON Owners.owner_id = Dogs.owner_id  GROUP BY Owners.owner_id  HAVING COUNT(Dogs.owner_id) = 0	dog_kennels
SELECT COUNT(DISTINCT Owners.owner_id) FROM Owners WHERE Owners.owner_id NOT IN (SELECT Dogs.owner_id FROM Dogs)	dog_kennels
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT Professionals.professional_id FROM Professionals  EXCEPT  SELECT Treatments.professional_id FROM Treatments	dog_kennels
SELECT Dogs.name, Dogs.age, Dogs.weight  FROM Dogs  WHERE Dogs.abandoned_yn = '1'	dog_kennels
SELECT Dogs.name, Dogs.age, Dogs.weight FROM Dogs WHERE Dogs.abandoned_yn = '1'	dog_kennels
SELECT AVG(Dogs.age) FROM Dogs	dog_kennels
SELECT AVG(Dogs.age) FROM Dogs	dog_kennels
SELECT Dogs.age FROM Dogs ORDER BY Dogs.age DESC LIMIT 1	dog_kennels
SELECT Dogs.age FROM Dogs ORDER BY Dogs.age DESC LIMIT 1	dog_kennels
SELECT Charges.charge_type, Charges.charge_amount FROM Charges GROUP BY Charges.charge_type	dog_kennels
SELECT Charges.charge_type, Charges.charge_amount FROM Charges	dog_kennels
SELECT Charges.charge_amount FROM Charges ORDER BY Charges.charge_amount DESC LIMIT 1	dog_kennels
SELECT MAX(Charges.charge_amount)  FROM Charges  ORDER BY Charges.charge_amount DESC  LIMIT 1	dog_kennels
SELECT Professionals.email_address, Professionals.cell_number, Professionals.home_phone FROM Professionals	dog_kennels
SELECT Professionals.home_phone, Professionals.cell_number, Professionals.email_address FROM Professionals	dog_kennels
SELECT DISTINCT Dogs.breed_code, Dogs.size_code  FROM Dogs;	dog_kennels
SELECT DISTINCT Dogs.breed_code, Dogs.size_code  FROM Dogs	dog_kennels
SELECT Treatment_Types.treatment_type_description, Professionals.first_name  FROM Treatment_Types  INNER JOIN Treatments ON Treatment_Types.treatment_type_code = Treatments.treatment_type_code  INNER JOIN Professionals ON Treatments.professional_id = Professionals.professional_id	dog_kennels
SELECT Professionals.first_name, Treatment_Types.treatment_type_description  FROM Treatment_Types  INNER JOIN Treatments ON Treatment_Types.treatment_type_code = Treatments.treatment_type_code  INNER JOIN Professionals ON Professionals.professional_id = Treatments.professional_id	dog_kennels
SELECT COUNT(*) FROM singer	singer
SELECT COUNT(*) FROM singer	singer
SELECT singer.Name  FROM singer  ORDER BY singer.Net_Worth_Millions ASC	singer
SELECT singer.Name FROM singer ORDER BY singer.Net_Worth_Millions ASC	singer
SELECT singer.Birth_Year, singer.Citizenship FROM singer	singer
SELECT singer.Birth_Year, singer.Citizenship FROM singer	singer
SELECT singer.Name FROM singer WHERE singer.Citizenship != 'France'	singer
SELECT singer.Name  FROM singer  WHERE singer.Citizenship != 'France'	singer
SELECT singer.Name  FROM singer  WHERE singer.Birth_Year IN (1948, 1949)	singer
SELECT singer.Name  FROM singer  WHERE singer.Birth_Year IN (1948, 1949)	singer
SELECT singer.Name  FROM singer  ORDER BY singer.Net_Worth_Millions DESC  LIMIT 1	singer
SELECT singer.Name  FROM singer  ORDER BY singer.Net_Worth_Millions DESC  LIMIT 1	singer
SELECT singer.Citizenship, COUNT(*)  FROM singer  GROUP BY singer.Citizenship	singer
SELECT singer.Citizenship, COUNT(singer.Singer_ID)  FROM singer  GROUP BY singer.Citizenship	singer
SELECT singer.Citizenship FROM singer GROUP BY singer.Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
SELECT singer.Citizenship FROM singer GROUP BY singer.Citizenship ORDER BY COUNT(*) DESC LIMIT 1	singer
SELECT singer.Citizenship, MAX(singer.Net_Worth_Millions) FROM singer GROUP BY singer.Citizenship	singer
SELECT singer.Citizenship, MAX(singer.Net_Worth_Millions) FROM singer GROUP BY singer.Citizenship	singer
SELECT singer.Name, song.Title  FROM singer  INNER JOIN song ON singer.Singer_ID = song.Singer_ID	singer
SELECT singer.Name, song.Title FROM singer INNER JOIN song ON singer.Singer_ID = song.Singer_ID	singer
SELECT DISTINCT singer.Name  FROM singer  INNER JOIN song ON singer.Singer_ID = song.Singer_ID  WHERE song.Sales > 300000	singer
SELECT singer.Name  FROM singer  INNER JOIN song ON singer.Singer_ID = song.Singer_ID  WHERE song.Sales > 300000	singer
SELECT singer.Name  FROM singer  INNER JOIN song ON singer.Singer_ID = song.Singer_ID  GROUP BY song.Singer_ID  HAVING COUNT(song.Song_ID) > 1	singer
SELECT singer.Name  FROM singer  INNER JOIN song ON singer.Singer_ID = song.Singer_ID  GROUP BY song.Singer_ID  HAVING COUNT(song.Song_ID) > 1	singer
SELECT singer.Name, SUM(song.Sales)  FROM singer  INNER JOIN song ON singer.Singer_ID = song.Singer_ID  GROUP BY singer.Name	singer
SELECT singer.Name, SUM(song.Sales)  FROM singer  INNER JOIN song ON singer.Singer_ID = song.Singer_ID  GROUP BY singer.Name	singer
SELECT singer.Name  FROM singer  LEFT JOIN song ON singer.Singer_ID = song.Singer_ID  WHERE song.Song_ID IS NULL	singer
SELECT singer.Name  FROM singer  LEFT JOIN song ON singer.Singer_ID = song.Singer_ID  WHERE song.Song_ID IS NULL	singer
SELECT singer.Citizenship  FROM singer  WHERE singer.Birth_Year < 1945 INTERSECT  SELECT singer.Citizenship  FROM singer  WHERE singer.Birth_Year > 1955	singer
SELECT singer.Citizenship  FROM singer  WHERE singer.Birth_Year < 1945 INTERSECT SELECT singer.Citizenship  FROM singer  WHERE singer.Birth_Year > 1955	singer
SELECT COUNT(*) FROM Other_Available_Features	real_estate_properties
SELECT Ref_Feature_Types.feature_type_name  FROM Other_Available_Features  INNER JOIN Ref_Feature_Types ON Other_Available_Features.feature_type_code = Ref_Feature_Types.feature_type_code  WHERE Other_Available_Features.feature_name = 'AirCon'	real_estate_properties
SELECT Ref_Property_Types.property_type_description  FROM Properties  INNER JOIN Ref_Property_Types  ON Properties.property_type_code = Ref_Property_Types.property_type_code	real_estate_properties
SELECT Properties.property_name  FROM Properties  WHERE Properties.property_type_code = 'House' AND Properties.room_count > 1 UNION SELECT Properties.property_name  FROM Properties  WHERE Properties.property_type_code = 'Apartment' AND Properties.room_count > 1	real_estate_properties
