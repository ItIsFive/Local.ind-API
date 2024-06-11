const express = require('express');
const router = express.Router();
const knexConfig = require('../databases/knex')[process.env.NODE_ENV || 'development'];
const knex = require('knex')(knexConfig);
const { signToken, hashPassword, comparePassword } = require('../auth/authUtil');
const authMiddleware = require("../auth/middleware/authMiddleware");
const crypto = require('crypto'); 
const getSignedUrl = require('../databases/buckets/userImg')

const generateUUID = () => {
  return crypto.randomUUID();
};

// Registration route
router.post('/register', async (req, res) => {
  const { fullName, address, phone, email, password, isBrand} = req.body;
  const Email= email;

  try {
    // Check if the email already exists
    const existingCustomer = await knex('Customers').select('*').where({ Email }).first();
    if (existingCustomer) {
      return res.status(409).json({ error: 'Email already exists' });
    }

    // Hash the password
    const hashedPassword = hashPassword(password);

    // Generate a unique CustomerId using UUID
    const customerId = generateUUID();

    const pictureUrl = await getSignedUrl();

    // Create a new customer
    const newCustomer = {
      CustomerId: customerId,
      FullName:fullName,
      Address:address,
      Phone:phone,
      Email,
      Picture: pictureUrl ,
      Password: hashedPassword,
      CreatedAt: new Date(),
      UpdatedAt: new Date() ,
      isBrand: isBrand || false
    };

    // Insert the new customer
    await knex('Customers').insert(newCustomer);

    res.status(201).json({ message: 'Customer registered successfully' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Login route
router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const Email = email;
  const Password = password;

  try {
    // Find the customer by email
    const customer = await knex('Customers').select('*').where({ Email }).first();
    if (!customer) {
      return res.status(401).json({ error: 'Invalid email or password' });
    }

    // Compare the password
    const isPasswordValid = comparePassword(Password, customer.Password);
    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Invalid email or password' });
    }

    // Generate a JWT token
    const token = signToken({ customerId: customer.CustomerId });

    res.json({ token });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.get('/profile',authMiddleware, async(req, res) => {
  const customerId = req.customerId;

    try {
        const cart = await knex("Customers")
            .select(
              "Customers.FullName",
              "Customers.Email",
              "Customers.Picture",
              "Customers.Phone",
              "Customers.Address",
              "Customers.isBrand"
            ).where("CustomerId",customerId);
        if (!cart) {
            return res.status(404).send("Customer not found");
        }
        res.json(cart);
    } catch (error) {
        console.error(error);
        res.status(500).send("Server error");
    }
})

module.exports = router;    