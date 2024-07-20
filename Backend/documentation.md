# Auth
## POST /api/auth/signup
req = 
username, email, password, fullname, phone_number

req
{
    "username": "john_doe",
    "email": "john.doe@example.com",
    "password": "password123",
    "fullname": "John Doe",
    "phone_number": "1234567890"
}

response
{
    "message": "User created successfully",
    "user": {
        "id": null,
        "username": "john_doe",
        "email": "john.doe@example.com",
        "password_hash": "$2b$10$QrAMR62Qq2jEMtfs/Jacpu.Wb1aB74nqystP1h.sb7u5GBxy/GrXi",
        "fullname": "John Doe",
        "phone_number": "1234567890"
    }
}

## POST /api/auth/login
req = username, password

req
{
    "username": "john_doe",
    "password": "password123"
}

response 
{
    "message": "Login successful"
}

## POST /api/auth/logout

no req

# dashboard

req = tidak ada

response 
{
    "total_uang_masuk": "4096000.00",
    "total_uang_keluar": "0.00",
    "total_pengunjung": 2,
    "total_order": 16
}