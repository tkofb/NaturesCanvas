WITH c_ids AS (
	INSERT INTO customer(first_name, last_name, email, phone_number)
	VALUES ('fred','murphy', 'wallytally568@gmail.com', '443-523-9232')
	RETURNING customer_id
), r_ids AS (
	INSERT INTO request(customer_id, customer_status, request_date)
	SELECT c_ids.customer_id,'Complete', '2022-09-02'
	FROM c_ids
	RETURNING service_id
), o_ids AS (
	INSERT INTO origin(customer_id, found_us_from)
	SELECT c_ids.customer_id, 'Friend'
	FROM c_ids
)
INSERT INTO coupon (service_id , coupon)
SELECT r_ids.service_id, '2'
FROM r_ids; 