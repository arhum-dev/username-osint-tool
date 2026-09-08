# Username OSINT Tool

A Bash-based tool to check username availability/existence across multiple social media and web platforms — built as part of an ethical OSINT learning exercise.

## What it does

Given a username, the tool checks whether that username exists on the following platforms:
- GitHub
- Instagram
- TikTok
- Twitter/X
- Reddit
- Pinterest

It sends an HTTP request to each platform's profile URL pattern and checks the response status code to determine if the username is registered.

## Usage

```bash
chmod +x osint_tool.sh
./osint_tool.sh <username>
```

## Ethical Note

This tool only checks **publicly available** information (whether a username exists). It was built and tested with **explicit consent** from individuals whose usernames were used for testing. Running OSINT tools against someone without their permission is a privacy violation — always get consent first.

## Known Limitations

- **JavaScript-rendered platforms (TikTok, Instagram):** Since
these sites load content dynamically via JavaScript, simple HTTP status codes can produce false positives (e.g., TikTok returned "FOUND" for a username that didn't actually exist, confirmed via manual browser check).
- **Bot-detection (GitHub, Reddit):** Some platforms block non-browser requests (`curl`), returning error codes like 403/406 even when the profile might exist.
- Status-code-based detection is a starting point, not a guarantee — manual verification is always required for accurate OSINT results.

## Tools/Tech Used

- Bash, curl
- (Experimented with Selenium for deeper scraping of JS-rendered pages)

## Author

Arhum — BS Cyber Security student, NUTECH
