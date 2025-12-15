# seer_problem_solver

A Flutter project integrated with Seer (Sentry's AI-powered debugging agent) and Cursor Cloud Agents for automated bug detection and fix generation.

## Features

- 🔍 **Automatic Bug Detection**: Seer analyzes errors and performs root cause analysis
- 🤖 **Automated Fixes**: Cursor Cloud Agents automatically create PRs with fixes
- 🚀 **Production & Test Environments**: Separate configurations for different environments
- 📊 **Error Tracking**: Comprehensive error tracking with Sentry
- 🔄 **CI/CD Integration**: GitHub Actions workflows for automated testing and release tracking

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Sentry account ([Sign up for free](https://sentry.io/signup/))
- Cursor account with API access
- GitHub repository

### Quick Setup

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Configure Sentry:**
   - Copy `.env.example` to `.env`
   - Add your Sentry DSN and configuration
   - See [SEER_SETUP.md](SEER_SETUP.md) for detailed instructions

3. **Set up Seer + Cursor Cloud Agent:**
   - Follow the comprehensive guide in [SEER_SETUP.md](SEER_SETUP.md)
   - This includes:
     - Sentry project configuration
     - GitHub repository connection
     - Cursor Cloud Agent integration
     - Seer automation setup

## Documentation

- **[SEER_SETUP.md](SEER_SETUP.md)**: Complete setup guide for Seer and Cursor Cloud Agent integration
- [Sentry Flutter Documentation](https://docs.sentry.io/platforms/flutter/)
- [Seer Documentation](https://docs.sentry.io/product/seer/)
- [Cursor Cloud Agent Integration](https://blog.sentry.io/seer-can-now-trigger-cursor-agents-to-fix-your-bugs/)

## How It Works

1. **Error Detection**: When an error occurs, Sentry captures it with full context
2. **Root Cause Analysis**: Seer analyzes the error and identifies the root cause
3. **Automated Fix**: Cursor Cloud Agent receives the analysis and creates a PR with the fix
4. **Review & Merge**: Review the PR and merge when ready

## Environment Configuration

- **Production**: Higher actionability threshold for critical fixes
- **Test**: Lower threshold for faster iteration and testing
- **Development**: Local development with debug mode enabled

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
