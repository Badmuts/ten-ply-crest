require "source-map-support/register"
Skeleton = require "nextorigin-express-skeleton"
TenPly   = require "./middleware"


class TenPlyServer extends Skeleton
  logPrefix: "(TenPlyCrest)"
  port: 16000

  constructor: ({@address, @consul_addr, @letsencrypt_email}) ->
    @address or= "127.0.0.1"
    @letsencrypt_email or= null
    super address: @address

  bindRoutes: ->
    tpc =
      logger:         @Flannel.shirt()
      advertise_addr: @address
      advertise_port: @port
      consul_addr:    @consul_addr or "127.0.0.1"
      email:          @letsencrypt_email

    @tpc = new TenPly tpc
    @app.use @tpc.middleware()

  # graceful shutdown
  end: ->
    @tpc.end()
    super


module.exports = TenPlyServer
