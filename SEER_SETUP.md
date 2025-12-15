# Seer + Cursor Cloud Agent Setup Guide

This guide will help you set up Seer (Sentry's AI-powered debugging agent) with Cursor Cloud Agents to automatically detect bugs and create pull requests with fixes for both production and test environments.

## Overview

[Seer](https://sentry.io/product/seer/) is Sentry's AI-powered debugging agent that:
- Automatically detects and analyzes bugs in your application
- Performs root cause analysis using stack traces, breadcrumbs, and commit history
- Can automatically create pull requests with fixes via Cursor Cloud Agents

## Prerequisites

1. A [Sentry account](https://sentry.io/signup/) (free tier available)
2. A [Cursor account](https://cursor.sh/) with API access
3. A GitHub repository connected to your Sentry project
4. Flutter SDK installed locally

## Step 1: Install Sentry SDK

The Sentry SDK has already been added to `pubspec.yaml`. Install dependencies:

```bash
flutter pub get
```

## Step 2: Configure Sentry DSN

1. **Get your Sentry DSN:**
   - Log in to [Sentry](https://sentry.io)
   - Navigate to **Settings > Projects > [Your Project] > Client Keys (DSN)**
   - Copy your DSN

2. **Set up environment variables:**
   - Copy `.env.example` to `.env`
   - Fill in your `SENTRY_DSN` value
   - Set `SENTRY_ENVIRONMENT` to `production`, `test`, or `development`

3. **For production/test builds:**
   - Set GitHub Secrets:
     - `SENTRY_DSN`: Your Sentry DSN
     - `SENTRY_AUTH_TOKEN`: Your Sentry auth token (Settings > Account > Auth Tokens)
     - `SENTRY_ORG`: Your Sentry organization slug
     - `SENTRY_PROJECT`: Your Sentry project slug

## Step 3: Connect GitHub Repository to Sentry

1. In Sentry, go to **Settings > Integrations**
2. Find and install the **GitHub** integration
3. Authorize Sentry to access your repository
4. In your project settings, go to **Seer > Working Repositories**
5. Add your repository to enable Seer to create PRs

## Step 4: Set Up Cursor Cloud Agent Integration

1. **Get your Cursor API key:**
   - Log in to [Cursor](https://cursor.sh)
   - Go to **Account Settings > Integrations > User API Keys**
   - Create a new API key and copy it

2. **Install Cursor Agent in Sentry:**
   - In Sentry, navigate to **Settings > Integrations**
   - Find **Cursor Agent** and click **Install**
   - Provide your Cursor API key when prompted

## Step 5: Configure Seer Automation

1. **Navigate to Seer settings:**
   - Go to **Settings > Projects > [Your Project] > Seer**

2. **Configure automation:**
   - **Automate Issue Scans**: Enable to automatically scan incoming issues
   - **Automate Issue Fixes**: Set minimum actionability score (recommended: 0.7-0.8)
   - **Stopping Point**: Select **"Hand off to Cursor Cloud Agent"**

3. **Set up environment-specific rules:**
   - For **production** issues: Set higher actionability threshold (0.8+)
   - For **test** issues: Set lower threshold (0.6+) for faster fixes

## Step 6: Configure GitHub Actions

The repository includes GitHub Actions workflows:

- **`.github/workflows/sentry-release.yml`**: Tracks releases in Sentry
- **`.github/workflows/test.yml`**: Runs tests and linting

Make sure to add these GitHub Secrets:
- `SENTRY_AUTH_TOKEN`
- `SENTRY_ORG`
- `SENTRY_PROJECT`

## Step 7: Test the Integration

1. **Trigger a test error:**
   ```dart
   // Add this to your code temporarily
   throw Exception('Test error for Seer');
   ```

2. **Deploy to test environment** and trigger the error

3. **Check Sentry:**
   - The error should appear in your Sentry dashboard
   - Seer will analyze it and show Root Cause Analysis

4. **Trigger Cursor Agent manually:**
   - Go to the issue in Sentry
   - Click the dropdown next to **Find Solution**
   - Select **Launch Cursor Cloud Agent**

5. **Verify automated workflow:**
   - For issues matching your automation rules, Seer will automatically:
     - Analyze the root cause
     - Hand off to Cursor Cloud Agent
     - Create a PR with the fix

## How It Works

### Manual Trigger
- From any issue's Seer Root Cause Analysis card
- Click dropdown next to **Find Solution**
- Launch Cursor Cloud Agent
- Agent creates PR with fix

### Automated Workflow
1. Error occurs in your app (production or test)
2. Sentry captures the error with full context
3. Seer analyzes the issue and finds root cause
4. If actionability score meets threshold, Seer hands off to Cursor Cloud Agent
5. Cursor Cloud Agent:
   - Receives full issue context (stack traces, breadcrumbs, user impact)
   - Gets Seer's Root Cause Analysis
   - Has access to your full codebase
   - Runs type checks, lint, and tests
   - Creates a PR with the fix

## Environment Configuration

### Production Environment
- **Environment**: `production`
- **Actionability Threshold**: Higher (0.8+) to avoid false positives
- **Release Tracking**: Enabled via GitHub Actions

### Test Environment
- **Environment**: `test`
- **Actionability Threshold**: Lower (0.6+) for faster iteration
- **Release Tracking**: Enabled via GitHub Actions

## Monitoring PRs

- PRs created by Cursor Cloud Agent will appear in your GitHub repository
- They'll be prefixed with something like `[Seer]` or `[Cursor Agent]`
- Review the PRs before merging
- The agent runs tests and linting, but always review the changes

## Troubleshooting

### Seer not analyzing issues
- Ensure your Sentry DSN is correctly configured
- Check that errors are being sent to Sentry
- Verify Seer is enabled for your project

### Cursor Agent not creating PRs
- Verify Cursor API key is correct
- Check that GitHub integration is connected
- Ensure repository is added to "Working Repositories"
- Verify stopping point is set to "Hand off to Cursor Cloud Agent"

### PRs not appearing
- Check GitHub repository permissions
- Verify Sentry has write access to your repo
- Check GitHub Actions logs for errors

## Resources

- [Seer Documentation](https://docs.sentry.io/product/seer/)
- [Cursor Cloud Agent Integration](https://blog.sentry.io/seer-can-now-trigger-cursor-agents-to-fix-your-bugs/)
- [Sentry Flutter SDK](https://docs.sentry.io/platforms/flutter/)
- [Sentry GitHub Integration](https://docs.sentry.io/product/integrations/source-code-mgmt/github/)

## Next Steps

1. Set up your Sentry project and get your DSN
2. Configure environment variables
3. Connect GitHub repository
4. Set up Cursor Cloud Agent integration
5. Configure Seer automation settings
6. Test with a sample error
7. Monitor PRs created by the agent

Happy debugging! 🐛✨

