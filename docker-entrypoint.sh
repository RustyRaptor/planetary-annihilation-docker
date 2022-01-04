#!/bin/bash
set -eo pipefail

log() {
    time=$(date +%T)
    echo "[$time] STARTSCRIPT: $1"
}

COMMAND="${INSTALL_LOC}/server \
    --allow-lan \
    --enable-crash-reporting \
    --mt-enabled \
    --output-dir ${REPLAYS_LOC} \
    --replay-filename UTCTIMESTAMP \
    --port 20545 \
    --server-name ${PA_SERVER_NAME} \
    --max-players ${PA_MAX_PLAYERS} \
    --max-spectators ${PA_MAX_SPECTATORS} \
    --spectators ${PA_SPECTATORS}"

# Check for titans enabling
if [[ ${PA_TITANS_ENABLED} == "yes" ]]; then
    COMMAND="$COMMAND --game-mode PAExpansion1:config"
    log "TITANS enabled"
else
    COMMAND="$COMMAND --game-mode config"
    log "TITANS disabled"
fi

# Check for AI enabling
if [[ ${PA_AI_ENABLED} != "yes" ]]; then
    COMMAND="$COMMAND --disable-ai"
    log "AI disabled"
fi

# Check for password enabling
if [[ -n ${PA_SERVER_PASSWORD} ]]; then
    COMMAND="$COMMAND --server-password ${PA_SERVER_PASSWORD}"
    log "Password enabled"
fi

COMMAND="$COMMAND $@"

log "Starting server with command: $COMMAND"
log "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
/home/ziad/patserver/server     --allow-lan     --enable-crash-reporting     --mt-enabled     --output-dir /home/ziad/replays     --replay-filename UTCTIMESTAMP     --port 20545     --server-name HomeBoysUnited PA hangout     --max-players 24     --max-spectators 5     --spectators 5 --game-mode PAExpansion1:config --server-password e 
log "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA2"

