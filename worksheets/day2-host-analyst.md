# Day 2 — Host Analyst

Get the lab running in Docker, then hunt for files that leak information —
first inside the container, then in the web root.

## MORNING — get on the box, then hunt

**1. Clone and build**

    git clone <repo-url> CSTU_CYBERCAMP_2026_WEEK3_HOST_ANALYST
    cd CSTU_CYBERCAMP_2026_WEEK3_HOST_ANALYST
    docker build -t host-lab .
    docker run -d -p 8000:8000 --name host-lab host-lab
    docker ps

**2. Get "on the box"**

    docker exec -it host-lab bash
    cd /lab

**3. File hunting (inside the container)**

    ls -la
    find . -type f
    grep -R -i "password" .
    grep -R -i "todo" .
    grep -R -i "secret" .

- Q1. Which files look interesting, and why?
- Q2. One file is an internal note that was never meant to ship.
      Read it carefully, line by line. Anything in there that
      doesn't belong in a note? (Flag 1)

## AFTERNOON — web root / exposed files

Back on the host (type `exit` first):

    curl localhost:8000/
    curl localhost:8000/robots.txt

- Q3. robots.txt lists paths it does not want indexed.
      Write them down.
- Q4. Now request each of those paths yourself:

    curl localhost:8000/<path-from-robots>

      What did the site try to hide? (Flag 2)
- Q5. Which files should NOT be in a web root, and why?

## Stop the lab

    docker rm -f host-lab

## Problem log
Problem / What I tried / Fix / What I learned
