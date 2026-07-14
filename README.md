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
| `webroot/`   | 2 | the site served to the browser (start at `robots.txt`) |
| `logs/`      | 3 | access.log, auth.log, system.log |
| `encoded/`   | 3 | Base64 + ASCII puzzles |
| `worksheets/`| 2–3 | student worksheets (repo only — not inside the container) |

Inside the container, `/lab` holds **only the evidence** (`webroot/`,
`logs/`, `encoded/`) — the Dockerfile, worksheets and docs stay out of the
image.
