## Models
- Good
  - name (presence)
  - price (>=0)
  - quantity (>0)
  - description 
- Purchase
  - good (present in db)
  - quantity  (0> && <= Good.quantitiy)
  - buyer (present in db)
- User
  - name 
  - email 
  - roomnumber

## Auth 

- get access_code for clint(e-schop) scope
  - user gets redirected to au``tsch
  - after login the **code** gets sent to the callbeck address (specifed on AuthSch)
- get access token 
 - post the code to authsch with client-id and client-secret 
     - specifie grant_type
 - access_token and refresser_token get sended back with the requested scope
 - get the data with the acces token
 - if the access token expiered we can request another with the refresh_token
 
 ## Authentication service

- callback 
 - input: authcode from AuthSCH
 - output: JWT token
 
- check token 
 - input: jwt token
 - output: boolean 
 
 - login 
  - jwt_token
  - user
 
 - remove authsch redirect, give error 
 
 c5901892-6161-098d-922f-2d1c050e6fd9
 
 User id: 34,