# Username OSINT Tool

A lightweight Bash tool that checks whether a given username exists across multiple social media and web platforms, built as a practical exercise in ethical OSINT (Open Source Intelligence) reconnaissance.

## Overview

Given a single username, the tool queries the profile URL of each supported platform and inspects the HTTP response to determine whether that username is registered. It's a foundational example of automated username enumeration — the same core technique used by tools like Sherlock.

## Supported Platforms

- GitHub
- Instagram
- TikTok
- Twitter / X
- Reddit
- Pinterest

## Usage

```bash
chmod +x osint_tool.sh
./osint_tool.sh <username>
```

**Example:**

```bash
./osint_tool.sh johndoe
```

**Sample Output:**
[*] Checking username: johndoe

[+] Instagram: FOUND -> https://www.instagram.com/johndoe
[-] GitHub: not found (404)
[+] TikTok: FOUND -> https://www.tiktok.com/@johndoe
[-] Reddit: not found (403)


## Ethical Use Policy

This tool only surfaces **publicly available** information — it does not access private data, bypass authentication, or perform any form of unauthorized access. It was developed and tested exclusively on usernames belonging to individuals who gave **explicit consent** for OSINT testing.

Running reconnaissance tools against any individual without their knowledge or permission is a privacy violation and, depending on jurisdiction, may be unlawful. Always obtain consent before testing.

## Known Limitations

During testing, several real-world constraints of automated OSINT were identified:

- **JavaScript-rendered platforms:** Sites like TikTok and Instagram load core content client-side via JavaScript. A raw HTTP status code can therefore be misleading — during testing, TikTok returned a `FOUND` result for a username that a manual browser check confirmed did not exist.
- **Bot detection:** Platforms such as GitHub and Reddit actively block non-browser (`curl`) requests, returning `403`/`406` errors even for accounts that may exist.
- **Verification is essential:** Automated status-code checks are a starting point, not a conclusion. Every positive result should be manually verified before being treated as fact.

These limitations mirror real challenges faced by professional OSINT tooling and informed the tool's design and documentation.

## Tech Stack

- Bash, `curl`
- Experimented with Python + Selenium for deeper scraping of JavaScript-rendered pages (headless Chrome)

## Author

**Arhum**
BS Cyber Security, NUTECH
[GitHub](https://github.com/arhum-dev) 
