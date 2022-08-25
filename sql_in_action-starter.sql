-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

-- SELECT * FROM final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"

-- SELECT COUNT(*) FROM final_airbnb;

-- OUTPUT: 146


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613

-- SELECT host_name FROM final_airbnb
-- WHERE host_id = 63613;

-- OUTPUT: Patricia


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighborhoods listed

-- SELECT DISTINCT neighbourhood FROM final_airbnb;

-- OUTPUT: 40 neighborhoods listed

-- To count them:
-- SELECT COUNT(DISTINCT neighbourhood) FROM final_airbnb;

-- OUTPUT: 40


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>
-- Find both the highest price listing and the lowest price listing, displaying the entire row for each

-- SELECT MAX(price) FROM final_airbnb;
-- SELECT MIN(price) FROM final_airbnb;

-- OUTPUT: Highest = 785, Lowest = 55


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)

-- SELECT AVG(availability_365) FROM final_airbnb;

-- OUTPUT: 165.3904


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review

-- SELECT * FROM final_airbnb
-- WHERE number_of_reviews = 0;

-- OUTPUT: 6 rows


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 

-- SELECT id FROM final_airbnb
-- WHERE room_type = "Private room"
-- ORDER BY number_of_reviews DESC
-- LIMIT 1;

-- OUTPUT: 58059


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighborhood for listings 

-- returns both top neighbourhoods with have the same number of listings by count:
-- SELECT neighbourhood, COUNT(neighbourhood) FROM final_airbnb
-- GROUP BY neighbourhood
-- ORDER BY COUNT(neighbourhood) DESC
-- LIMIT 2;

-- OUTPUT: Williamsburg, Harlem

-- returns 'top' neighbourhood as ordered in list:
-- SELECT neighbourhood FROM final_airbnb
-- GROUP BY neighbourhood
-- ORDER BY COUNT(*) DESC
-- LIMIT 1;

-- OUTPUT: Williamsburg



-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7

-- SELECT id FROM final_airbnb
-- WHERE minimum_nights < 7
-- ORDER BY reviews_per_month DESC
-- LIMIT 1;

-- OUTPUT: 58059

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 

-- SELECT host_name, COUNT(host_name) AS NumberofListings FROM final_airbnb
-- GROUP BY host_name
-- ORDER BY COUNT(host_name) DESC
-- LIMIT 1;

-- OUTPUT: The Box House Hotel with 6 listings


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentences and include them with your project submission in the README file 


-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the the percent above or below each listing is compared to the average price for that neighborhood.

-- see progression of code of testing for specific data and modifying as needed

-- SELECT neighbourhood AS Neighbourhood, 
-- 		COUNT(neighbourhood) AS RentalsPerNeighbourhood, 
--         AVG(price) AS AvgPrice 
--         
--         FROM final_airbnb
-- GROUP BY neighbourhood;

-- SELECT final_airbnb.*, 
-- 		neigh_price.NeighAvgPrice,
--         (((final_airbnb.price - neigh_price.NeighAvgPrice) / neigh_price.NeighAvgPrice) * 100) AS PriceComp
-- 	FROM final_airbnb
-- JOIN (SELECT neighbourhood, AVG(price) AS NeighAvgPrice FROM final_airbnb GROUP BY neighbourhood) neigh_price
-- ON(final_airbnb.neighbourhood = neigh_price.neighbourhood);

SELECT id, final_airbnb.neighbourhood, price, 
		a.neigh_avg_price,
        concat((((price - a.neigh_avg_price) / a.neigh_avg_price) * 100),'%') AS price_comp
	FROM final_airbnb
JOIN (SELECT neighbourhood, AVG(price) AS neigh_avg_price FROM final_airbnb GROUP BY neighbourhood) a
ON(final_airbnb.neighbourhood = a.neighbourhood);

