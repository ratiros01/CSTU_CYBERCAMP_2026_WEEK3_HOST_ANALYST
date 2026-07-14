# CSTU_CYBERCAMP_2026_WEEK3_HOST_ANALYST

Host Analyst lab — you work "on the box": filesystem, web root, logs,
decoding. The evidence tree ships inside a Docker container.

> ⚠️ All credentials, tokens, IPs and logs are **fake/dummy training data**.
> RFC-5737 documentation IPs are used on purpose.

## Start — Docker (primary)

    git clone <repo-url> CSTU_CYBERCAMP_2026_WEEK3_HOST_ANALYST
    cd CSTU_CYBERCAMP_2026_WEEK3_HOST_ANALYST
    docker build -t host-lab .
    docker run -d -p 8000:8000 --name host-lab host-lab
    docker exec -it host-lab bash        # you are now "on the box" -> cd /lab

- Web check (from the host):  `curl localhost:8000/robots.txt`
- Stop:                       `docker rm -f host-lab`

## Start — no Docker (fallback)

    bash setup.sh

## Layout

| Folder | Day | What's inside |
|--------|-----|----------------|
| `webroot/`   | 2 | served site: index, robots.txt, notes, config, admin-notes |
| `logs/`      | 3 | access.log, auth.log, system.log |
| `encoded/`   | 3 | Base64 + ASCII puzzles |
| `worksheets/`| 2–3 | student worksheets |

There are **4 flags** in this repo (2 plaintext, 2 encoded). The paired
NETWORK_ANALYST repo holds the 5th.
