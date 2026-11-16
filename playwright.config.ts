import {defineConfig} from '@playwright/test';
const target=process.env.PLAYWRIGHT_BASE_URL;
export default defineConfig({testDir:'./e2e',timeout:30000,workers:1,use:{baseURL:target||'http://localhost:3187',browserName:'chromium',launchOptions:{executablePath:process.env.CHROME_PATH||'/usr/bin/google-chrome'},viewport:{width:1440,height:1000}},webServer:target?undefined:{command:'npm run build && npm run start -- --port 3187',url:'http://localhost:3187',reuseExistingServer:false,timeout:60000}});
