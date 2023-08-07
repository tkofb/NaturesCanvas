const express = require("express");
const app = express();
const pool = require("./db")

app.use(express.json()) // => req.body

app.post("/question", async(req, res) => {
    try{
        const {name} = req.body;
        const {phone_number} = req.body;
        const {email} = req.body;
        const {subject} = req.body;
        const {description} = req.body;
        
        const newQuestion = await pool.query("INSERT INTO question(name,phone_number,email,subject,description) VALUES ($1,$2,$3,$4,$5) RETURNING *",
        [name,phone_number,email,subject,description]);
         //RETURNING * is part of the pg library so keep that in mind

        res.json(newQuestion.rows[0])
    }catch (err) {
        console.log(err.message)
    }
})

app.post("/customer", async(req, res) => {
    try{
        // Customer Information
        const {first_name} = req.body;
        const {last_name} = req.body;
        const {email} = req.body;
        const {phone_number} = req.body;
        // Customer Status
        const {customer_status} = req.body;
        // Customer Coupon
        const {coupon} = req.body;
        // Customer Address
        const {street_1} = req.body;
        const {street_2} = req.body;
        const {city} = req.body;
        const {state} = req.body;
        const {zip_code} = req.body;
        // Customer Origin
        const {found_us_from} = req.body;
        // Customer Service Requested
        const {service} = req.body;
        // Customer Date Requested
        const {request_date} = req.body;
        
        const newQuestion = await pool.query("INSERT INTO customer(first_name,last_name,email,phone_number) VALUES ($1,$2,$3,$4) RETURNING *",
        [first_name,last_name,email,phone_number]);
         //RETURNING * is part of the pg library so keep that in mind



        res.json(newQuestion.rows[0])
    }catch (err) {
        console.log(err.message)
    }
})



// CREATE TABLE question (
//     "id" SERIAL NOT NULL
//     "name" VARCHAR(100)   NOT NULL,
//     "phone_number" VARCHAR(15) ,
//     "email" VARCHAR(100),
//     "subject" TEXT   NOT NULL,
//     "description" TEXT   NOT NULL
//  );

app.listen(5000, () => {
    console.log("server is listening on port 5000")
})