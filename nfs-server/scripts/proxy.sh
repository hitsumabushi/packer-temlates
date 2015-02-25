# if PROXY is not null string, set proxy
if [ -n "${PROXY}" ]; then
  echo "Set proxy"

  # set env
  export http_proxy=${PROXY}
  export https_proxy=${PROXY}

  # shell proxy setting
  echo "http_proxy=${PROXY}" >> ~/.bashrc
  echo "https_proxy=${PROXY}" >> ~/.bashrc

  # APT proxy setting
  echo "Acquire::http::proxy \"${PROXY}\";" >> /etc/apt/apt.conf.d/90proxy
  echo "Acquire::https::proxy \"${PROXY}\";" >> /etc/apt/apt.conf.d/90proxy
  cat /etc/apt/apt.conf.d/90proxy
else
  echo "Proxy not need"
fi
