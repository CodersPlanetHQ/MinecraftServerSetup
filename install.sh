#!/bin/bash

#Configuration
SERVER_DIR="minecraft_server"
SERVER_JAR="paper-1.21.4-226.jar"
INITIAL_MEMORY="1024M"
MAX_MEMORY="2048M"
SERVER_PORT="25565"
NGROK_AUTHTOKEN="YOUR_NGROK_AUTHTOKEN"

#Using the PaperMC download link
SERVER_DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.4/builds/226/downloads/paper-1.21.4-226.jar"

#Helper functions
log_info() {
  echo "[INFO] $(date) - $1"
}

log_error() {
  echo "[ERROR] $(date) - $1" >&2
}

#Dependency check
check_dependencies() {
  if ! command -v java &> /dev/null; then
    log_error "Java missing. Install Java 17+."
    exit 1
  fi

  if ! command -v screen &> /dev/null; then
    log_info "Installing screen..."
    sudo apt update && sudo apt install -y screen
  fi

  if ! command -v wget &> /dev/null; then
    log_info "Installing wget..."
    sudo apt update && sudo apt install -y wget
  fi

  log_info "Dependencies OK."
}

#Download server
download_server() {
  if [ ! -f "$SERVER_JAR" ]; then
    log_info "Downloading server.jar..."
    wget "$SERVER_DOWNLOAD_URL" -O "$SERVER_JAR"

    if [ ! -f "$SERVER_JAR" ]; then
      log_error "Download failed. Check URL."
      exit 1
    fi
  else
    log_info "server.jar exists."
  fi
}

#Prepare server directory
prepare_server_directory() {
  if [ ! -d "$SERVER_DIR" ]; then
    mkdir "$SERVER_DIR"
  fi
  cd "$SERVER_DIR" || exit 1

  if [ ! -f "eula.txt" ]; then
    echo "eula=true" > eula.txt
  fi
}

#Start server
start_server() {
  screen -dmS mcserver java -Xmx"$MAX_MEMORY" -Xms"$INITIAL_MEMORY" -jar "$SERVER_JAR" nogui
  log_info "Server started in 'mcserver' screen."
}

#Ngrok tunnel setup
setup_ngrok_tunnel() {
  if [ -z "$NGROK_AUTHTOKEN" ]; then
    log_info "Ngrok not configured."
    return
  fi

  if ! command -v ngrok &> /dev/null; then
    log_error "ngrok missing.  Install manually."
    log_info "Get it from https://ngrok.com/download"
    exit 1
  fi

  ngrok config add-authtoken "$NGROK_AUTHTOKEN"
  ngrok tcp "$SERVER_PORT" &
  log_info "ngrok running. Check its interface for the address."
}

#Main script
check_dependencies
download_server
prepare_server_directory
start_server
setup_ngrok_tunnel

log_info "Minecraft server setup done!"
exit 0
