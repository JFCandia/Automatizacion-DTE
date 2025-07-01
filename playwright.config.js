// @ts-check
const { defineConfig, devices } = require('@playwright/test');

// Load environment variables
require('dotenv').config({ path: '.env.local' });

/**
 * @see https://playwright.dev/docs/test-configuration
 */
module.exports = defineConfig({
  testDir: './tests',
  /* Run tests in files in parallel */
  fullyParallel: true,
  /* Fail the build on CI if you accidentally left test.only in the source code. */
  forbidOnly: !!process.env.CI,
  /* Retry on CI only */
  retries: process.env.CI ? 2 : 1,
  /* Opt out of parallel tests on CI. */
  workers: 1,
  /* Reporter to use. See https://playwright.dev/docs/test-reporters */
  reporter: [
    ['html'],
    ['json', { outputFile: 'test-results/results.json' }],
    ['junit', { outputFile: 'test-results/results.xml' }]
  ],
  /* Shared settings for all the projects below. See https://playwright.dev/docs/api/class-testoptions. */
  use: {
    /* Base URL to use in actions like `await page.goto('/')`. */
    baseURL: process.env.BASE_URL || 'https://asistenciadt.baplicada.cl',

    /* Collect trace when retrying the failed test. See https://playwright.dev/docs/trace-viewer */
    trace: 'retain-on-failure',
    
    /* Take screenshot on failure and success for daily monitoring */
    screenshot: 'on',
    
    /* Record video always for daily monitoring */
    video: 'on',
    
    /* Global timeout settings - aumentados para mayor robustez */
    navigationTimeout: parseInt(process.env.NAVIGATION_TIMEOUT || '60000'),
    actionTimeout: parseInt(process.env.PAGE_TIMEOUT || '30000'),
    
    /* Configuraciones adicionales para robustez */
    launchOptions: {
      slowMo: 500, // Ralentizar acciones para mayor estabilidad
    },
  },

  /* Configure projects for major browsers */
  projects: [
    {
      name: 'chromium',
      use: { 
        ...devices['Desktop Chrome'],
        // Configuraciones específicas para login automático
        viewport: { width: 1280, height: 720 },
        ignoreHTTPSErrors: true,
      },
    },
  ],

  /* Run your local dev server before starting the tests */
  // webServer: {
  //   command: 'npm run start',
  //   url: 'http://127.0.0.1:3000',
  //   reuseExistingServer: !process.env.CI,
  // },
});
