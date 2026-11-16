# Public demo deployment

GitHub Actions deploys a static demo to GitHub Pages from `main`. The static build removes the server API and hides live AI controls. The project also supports a standard server deployment on Vercel:

1. Push the `manuscriptpilot` directory to a new repository under your control. Do not commit `.env.local` or real manuscripts.
2. Import the repository into Vercel, select Next.js and set the root directory to `manuscriptpilot` if the repository contains a parent directory. Use `npm ci` and `npm run build` (Vercel defaults are normally sufficient).
3. For a no-credential public demonstration, leave `OPENAI_API_KEY` unset. The synthetic demo does not require an account or API key from visitors. Optional live AI requires server-side environment variables listed in `.env.example`; this can incur provider costs and sends the selected text to that provider.
4. Deploy and open the resulting URL in a private/incognito window. Complete the steps in MVP_TEST_RU.md, download the DOCX and inspect the changed text. Confirm the URL is publicly accessible without login and contains only synthetic sample data. Check that failed live AI requests show an error.
5. Record the verified URL in the competition submission. Local browser storage is per browser and origin; clearing it removes projects.

Never place API keys in client-side variables or the repository. Review hosting and provider data-handling settings before using unpublished research.
