FROM cloudflare/cloudflared:latest
ENTRYPOINT ["cloudflared", "tunnel", "--no-autoupdate", "run", "--token"]
CMD ["${TUNNEL_TOKEN}"] 

