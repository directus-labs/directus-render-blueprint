# Official Directus image + startup script (PUBLIC_URL from RENDER_EXTERNAL_URL).
FROM directus/directus:11.17.4

USER root
COPY render-start.sh /usr/local/bin/render-start.sh
RUN chmod +x /usr/local/bin/render-start.sh

USER node
WORKDIR /directus

CMD ["/usr/local/bin/render-start.sh"]
