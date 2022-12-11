FROM alpine:3.16

RUN apk add --no-cache chromium xvfb xvfb-run

# Add Chrome as a user
RUN mkdir -p /usr/src/app \
    && adduser -D chrome \
    && chown -R chrome:chrome /usr/src/app
# Run Chrome as non-privileged
USER chrome
WORKDIR /usr/src/app

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Autorun chrome headless
ENTRYPOINT ["xvfb-run", "chromium-browser", "--use-gl=swiftshader", "--disable-software-rasterizer", "--disable-dev-shm-usage"]