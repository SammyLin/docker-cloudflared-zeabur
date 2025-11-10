FROM busybox:1.36.1-uclibc as busybox
FROM cloudflare/cloudflared:latest
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/cat /bin/cat
ENTRYPOINT [ "/bin/sh", "-c", "cloudflared --no-autoupdate tunnel run" ]
