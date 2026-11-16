# Public demo deployment

GitHub Pages is configured to publish the `gh-pages` branch. The static build removes the server API and hides live AI controls. Build with `npm run build:pages`, then publish the contents of `out` to `gh-pages`; the optional Actions workflow can automate this if GitHub Actions is available. The project also supports a standard server deployment on Vercel:

1. Sign in to Vercel and import the existing public GitHub repository `MMR000/ManuscriptPilot`. Grant Vercel access to that repository when prompted. Do not commit `.env.local` or real manuscripts.
2. Select the Hobby account, choose the Next.js framework, leave the root directory at the repository root, and use Node.js 22. Use `npm ci` and `npm run build` (the framework defaults are normally sufficient). Disable deployment protection if it would require visitors to log in.
3. For a no-credential public demonstration, leave `OPENAI_API_KEY` unset. The synthetic demo does not require an account or API key from visitors. Optional live AI requires server-side environment variables listed in `.env.example`; this can incur provider costs and sends the selected text to that provider.
4. Deploy and run `PLAYWRIGHT_BASE_URL=https://YOUR-DEPLOYMENT.vercel.app npm run test:e2e` against the public URL. The Playwright test starts a fresh browser context, completes the demo, checks the downloaded DOCX, and checks the missing-key error. Also open the URL in an incognito window and confirm there is no login prompt. The browser test requires Chrome and `unzip`.
5. Record the verified URL in the competition submission. Local browser storage is per browser and origin; clearing it removes projects.

Never place API keys in client-side variables or the repository. Review hosting and provider data-handling settings before using unpublished research.
