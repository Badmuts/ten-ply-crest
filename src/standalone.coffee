TenPlyServer = require "./server"


api = new TenPlyServer({ 
  address: process.env.ADVERTISE_ADDR || '0.0.0.0', 
  consul_addr: process.env.CONSUL_ADDR,
  letsencrypt_email: process.env.LETSENCRYPT_EMAIL
})
await api.register defer err
if err
  console.error err
  process.exit 1

api.listen()
