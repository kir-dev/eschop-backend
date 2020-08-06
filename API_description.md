"https://auth.sch.bme.hu/site/login?client_id=12169940729283463587&response_type=code&scope=displayName+sn+mail+givenName" 
http://localhost:3000/callback

   Prefix Verb   URI Pattern                                                                              Controller#Action
purchases GET    /purchases(.:format)                                                                     purchases#index
          POST   /purchases(.:format)                                                                     purchases#create
 purchase GET    /purchases/:id(.:format)                                                                 purchases#show
          PATCH  /purchases/:id(.:format)                                                                 purchases#update
          PUT    /purchases/:id(.:format)                                                                 purchases#update
          DELETE /purchases/:id(.:format)                                                                 purchases#destroy
    users GET    /users(.:format)                                                                         users#index
          POST   /users(.:format)                                                                         users#create
     user GET    /users/:id(.:format)                                                                     users#show
          PATCH  /users/:id(.:format)                                                                     users#update
          PUT    /users/:id(.:format)                                                                     users#update
          DELETE /users/:id(.:format)                                                                     users#destroy
    goods GET    /goods(.:format)                                                                         goods#index
          POST   /goods(.:format)                                                                         goods#create
     good GET    /goods/:id(.:format)                                                                     goods#show
          PATCH  /goods/:id(.:format)                                                                     goods#update
          PUT    /goods/:id(.:format)                                                                     goods#update
          DELETE /goods/:id(.:format)                                                                     goods#destroy
 callback GET    /callback(.:format)                                                                      application#callback
     root GET    /                                                                                        goods#index
