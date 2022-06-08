TINYPROXY_CONFIG_FILE="/etc/tinyproxy/tinyproxy.conf"

# Common configuration
sed -i \
    -e '/^#DisableViaHeader /s/^#//' \
    ${TINYPROXY_CONFIG_FILE}

# Flush security settings (allow access to proxy from everywhere)
sed -i \
    -e '/^Allow /s/^/#/' \
    -e '/^BasicAuth /s/^/#/' \
    ${TINYPROXY_CONFIG_FILE}

# Allow access to proxy with login/password only (BasicAuth)
if [[ "${PROXY_AUTH_USER}" ]]; then
  sed -i -e "/^#BasicAuth user password/s/$/\nBasicAuth ${PROXY_AUTH_USER} ${PROXY_AUTH_PASSWORD}/" \
    ${TINYPROXY_CONFIG_FILE}
fi

# Allow access to proxy from certain IPs only
if [[ "${PROXY_ALLOW_HOSTS}" ]]; then
  sed -i -e "/^#Allow ::1/s/$/\nAllow ${PROXY_ALLOW_HOSTS/,/"\nAllow "}/" \
    ${TINYPROXY_CONFIG_FILE}
fi

tinyproxy -d