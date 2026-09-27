# Markdown Live Preview — local (offline)

Same app as [markdownlivepreview.com](https://markdownlivepreview.com/) ([upstream source](https://github.com/tanabe/markdown-live-preview)), without sending your markdown to that site. Google Analytics is removed from `index.html`.

## Recommended: portable `.exe` (no Node to run)

You only need Node.js **once**, on a machine that can run `npm install`, to **build** the executable. After that, the `.exe` runs by itself from any folder (Desktop, USB, etc.).

1. On a build PC: install [Node.js LTS](https://nodejs.org/).
2. Double-click **`Build-Portable-Exe.bat`** (or run `npm install` then `npm run pack:win` in this folder).
3. Take **`release\MarkdownLivePreview-Portable.exe`** — copy it anywhere and double-click.
   - No Node.js on the PC where you use the editor.
   - All traffic stays on `127.0.0.1`; drafts live in local app storage on that PC.

First portable launch may take a few seconds while Windows unpacks the app; later launches are faster.

## Other options (need Node each time)

- **`Start-Local-Browser.bat`** — `http://127.0.0.1:5001/` in your browser.
- **`Start-Local-Desktop.bat`** — dev-style Electron window.

## Build without a working corporate npm

If `npm install` fails on your office PC (e.g. `UNABLE_TO_GET_ISSUER_CERT_LOCALLY`):

1. Push this repo to GitHub.
2. Open **Actions** → **Build Markdown Live Preview (portable exe)** → **Run workflow**.
3. Download the **MarkdownLivePreview-Portable** artifact and use the `.exe` anywhere (no Node).

## Build troubleshooting

| Issue | What to do |
|--------|------------|
| `UNABLE_TO_GET_ISSUER_CERT_LOCALLY` during `npm install` | Use the GitHub Actions workflow above, or build on a home PC and copy `release\MarkdownLivePreview-Portable.exe`. |
| Antivirus quarantines new `.exe` | Allow the file; it is an unsigned local build (no code signing cert). |

## License

Upstream AGPL-3.0 — see [LICENSE](LICENSE).
