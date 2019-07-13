docker run \
  -p 27500:27500/udp \
  -e FO_IP=220.233.199.72 \
  -e FO_PORT=27500 \
  -e FO_HOSTNAME="FortressOne Dev" \
  -e FO_RCON_PASSWORD=revival \
  -e FO_ADMINPWD=revival \
  -e FO_PASSWORD=pineapple \
  -e FO_MODE=pub \
  -e FO_MAP=2fort5r \
  fortressonesv
