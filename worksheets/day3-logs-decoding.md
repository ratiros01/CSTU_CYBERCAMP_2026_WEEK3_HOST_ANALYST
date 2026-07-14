# Day 3 — Logs & Decoding (Host side)

## A. Log reading
Inside the container (`docker exec -it host-lab bash`, then `cd /lab`):

    grep "GET"  logs/access.log
    grep "POST" logs/access.log
    grep -i "failed" logs/auth.log

- Q1. Which IP looks like a normal user? Which looks suspicious, and why?
- Q2. In auth.log, what happened after the failed logins?
- Q3. One auth.log line has an odd `note=` field. Decode it. (Flag 3)

Base64 on the command line:

    echo "<string>" | base64 -d

## B. Decoding puzzles

- `encoded/message_parts.txt` — decode each piece, put them in order.
  Final sentence: ______________________________  (Flag 4)
- `encoded/ascii_code.txt` — convert the numbers to text.
  Instruction: ______________________________

## C. Evidence type table
| Evidence | What it shows | Best for answering |
|----------|---------------|--------------------|
| server log |  |  |
| web access log |  |  |
| file evidence |  |  |

## Problem log
Problem / What I tried / Fix / What I learned
