# Quick Start Guide

## 🚀 Setup in 5 Minutes

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Configure Sentry
```bash
# Copy the example env file
cp .env.example .env

# Edit .env and add your Sentry DSN
# Get it from: Sentry Dashboard > Settings > Projects > [Your Project] > Client Keys (DSN)
```

### 3. Run Setup Script (Optional)
```bash
./scripts/setup_seer.sh
```

### 4. Configure Sentry Dashboard

#### A. Connect GitHub Repository
1. Go to **Sentry Dashboard > Settings > Integrations**
2. Install **GitHub** integration
3. Authorize and connect your repository
4. Go to **Settings > Projects > [Your Project] > Seer**
5. Add repository to **Working Repositories**

#### B. Install Cursor Cloud Agent
1. Go to **Settings > Integrations**
2. Find **Cursor Agent** and click **Install**
3. Enter your Cursor API key (from Cursor Account Settings > Integrations > User API Keys)

#### C. Configure Seer Automation
1. Go to **Settings > Projects > [Your Project] > Seer**
2. Enable **Automate Issue Scans**
3. Set **Automate Issue Fixes** threshold (recommended: 0.7)
4. Set **Stopping Point** to **"Hand off to Cursor Cloud Agent"**

### 5. Set GitHub Secrets (for CI/CD)
Go to your GitHub repository > Settings > Secrets and variables > Actions, and add:
- `SENTRY_AUTH_TOKEN` - From Sentry (Settings > Account > Auth Tokens)
- `SENTRY_ORG` - Your Sentry organization slug
- `SENTRY_PROJECT` - Your Sentry project slug

## ✅ You're Done!

Now when errors occur:
1. Sentry captures them automatically
2. Seer analyzes and finds root cause
3. Cursor Cloud Agent creates a PR with the fix
4. You review and merge!

## 📚 Next Steps

- Read [SEER_SETUP.md](SEER_SETUP.md) for detailed configuration
- Test with a sample error (see SEER_SETUP.md)
- Monitor PRs created by the agent

## 🆘 Need Help?

- [Seer Documentation](https://docs.sentry.io/product/seer/)
- [Cursor Cloud Agent Blog Post](https://blog.sentry.io/seer-can-now-trigger-cursor-agents-to-fix-your-bugs/)
- [Sentry Flutter SDK Docs](https://docs.sentry.io/platforms/flutter/)

