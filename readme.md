## Build Account Service Stub
docker build -t iklymchuk/account-service-stub --build-arg service=account-service-stub .

### Start Account Service Stub (Test Profile)
docker run -it -p 2525:2525 -p 6800:6800 -e profile='test' iklymchuk/account-service-stub 
### Testing Account Service Stub (Test Profile)
curl -k -X POST https://localhost:6800/user/create -H 'Content-Type: application/json'

``
    {
        "User":"Test User",
        "Email":"test@test.com"
    }
``

curl -k -X POST https://localhost:6800/profile/create -H 'Content-Type: application/json'

``
    {
        "FirstName":"Lisa",
        "LastName":"Simpson"
    }
``

### Start Account Service Stub (Development Profile)
docker run -it -p 2525:2525 -p 6801:6801 -e profile='dev' iklymchuk/account-service-stub 
### Testing Account Service Stub (Development Profile)
curl -k -X POST https://localhost:6801/user/create -H 'Content-Type: application/json'

``
    {
        "User":"Test User",
        "Email":"test@test.com",
        "Role":"Administrator"
    }
``

curl -k -X POST https://localhost:6801/profile/create -H 'Content-Type: application/json'

``
    {
       "FirstName":"Lisa",
       "LastName":"Simpson",
       "Position":"Manager"
    }
``

## Build Payment Service Stub
docker build -t iklymchuk/payment-service-stub --build-arg service=payment-service-stub .

### Start Payment Service Stub (Test Profile)
docker run -it -p 2525:2525 -p 7800:7800 -e profile='test' iklymchuk/payment-service-stub 
### Testing Payment Service Stub (Test Profile)
curl -k -X GET https://localhost:7800/user/balance -H 'Content-Type: application/json'

``
    {
        "Amount":500,
        "Сurrency":"USD"
    }
``

### Start Payment Service Stub (Development Profile)
docker run -it -p 2525:2525 -p 7801:7801 -e profile='dev' iklymchuk/payment-service-stub 
### Testing Payment Service Stub (Development Profile)
curl -k -X GET https://localhost:7801/user/balance -H 'Content-Type: application/json'

``
    {
        "Amount":500,
        "Сurrency":"USD",
        "Limit":1000
    }
``
