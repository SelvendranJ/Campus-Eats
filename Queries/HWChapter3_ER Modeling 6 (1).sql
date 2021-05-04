/* Assignment - Murach Chapter 3 Project
   Name - Selvendran Jayaprakasam
   Group - ER Modeling 6
*/

/* 1 - SELECT statement that returns these columns from the INVOICES table where the Balance_Due 
is between 100 and 1000 inclusive */

SELECT * FROM (
SELECT invoice_number AS Inv_Number,
invoice_date AS Inv_Date,
invoice_Total AS Inv_Total,
(payment_total + credit_total) AS Payment_plus_Credit,
(invoice_total-(payment_total+credit_total)) AS Balance_Due
FROM INVOICES ) AS inv
WHERE Balance_Due BETWEEN 100 and 1000;

/*2 - SELECT statement that returns these columns from the VENDOR table where the vendor_state is "NV" and "NY" but not "NC" or "NJ" -
 use a REGEXP and concat vendor_city and vendor_state with a comma in between */
 
SELECT vendor_id,
vendor_city,
vendor_state,
concat(vendor_city,',',vendor_state) AS city_state
FROM vendors
WHERE vendor_state REGEXP 'N[VY]';

/*3 -SELECT statement that returns these columns from the INVOICE table, 
format the Invoice Date as DD-Mon-YYYY order by invoice_date descending. */

SELECT invoice_number AS Inv_Number,
DATE_FORMAT(invoice_date, '%e-%b-%Y') AS 'Inv_Date',
 invoice_Total AS Inv_Total 
FROM invoices ORDER BY
invoice_date DESC;

/* 4 - SELECT statement that returns these columns from the INVOICES table
 - return only the rows where payment_date is not null */
 
SELECT invoice_number AS Inv_Number,
invoice_date AS Inv_Date,
invoice_Total AS Inv_Total,
payment_date AS Date_of_payment,
payment_total AS Total_payment
FROM invoices
WHERE payment_date IS NOT NULL;