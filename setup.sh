#!/usr/bin/env bash
# Host Analyst lab — no-Docker fallback. No root needed.
set -e
PORT="${1:-8000}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

if ! command -v python3 >/dev/null 2>&1; then
  echo "[!] python3 not found. Install it, then re-run."
  exit 1
fi

echo "[*] Starting web server on port $PORT (serving ./webroot)"
nohup python3 -m http.server "$PORT" --directory webroot \
  > logs/live-access.log 2>&1 &
echo $! > .webserver.pid

IP="$(hostname -I 2>/dev/null | awk '{print $1}')"
echo "[+] Running (PID $(cat .webserver.pid))"
echo "[+] Local:   http://localhost:$PORT"
[ -n "$IP" ] && echo "[+] Network: http://$IP:$PORT   (on EC2 use your PUBLIC IP)"
echo "[*] Stop with: kill \$(cat .webserver.pid)"
