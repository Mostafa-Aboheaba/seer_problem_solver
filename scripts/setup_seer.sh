#!/bin/bash

# Seer Setup Script
# This script helps you set up Seer and Cursor Cloud Agent integration

set -e

echo "🔍 Seer + Cursor Cloud Agent Setup"
echo "=================================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "   Visit: https://docs.flutter.dev/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"
echo ""

# Install dependencies
echo "📦 Installing Flutter dependencies..."
flutter pub get
echo "✅ Dependencies installed"
echo ""

# Check if .env exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file from .env.example..."
    if [ -f .env.example ]; then
        cp .env.example .env
        echo "✅ .env file created"
        echo "⚠️  Please edit .env and add your Sentry DSN and configuration"
    else
        echo "⚠️  .env.example not found. Creating basic .env file..."
        cat > .env << EOF
# Sentry Configuration
SENTRY_DSN=
SENTRY_ENVIRONMENT=development
SENTRY_RELEASE=1.0.0+1
SENTRY_DEBUG=false
EOF
        echo "✅ Basic .env file created"
    fi
else
    echo "✅ .env file already exists"
fi
echo ""

# Check if sentry.properties exists
if [ ! -f sentry.properties ]; then
    echo "⚠️  sentry.properties not found. Please create it with your Sentry configuration."
else
    echo "✅ sentry.properties found"
fi
echo ""

echo "📋 Next Steps:"
echo "=============="
echo ""
echo "1. Edit .env file and add your Sentry DSN:"
echo "   - Get it from: Settings > Projects > [Your Project] > Client Keys (DSN)"
echo ""
echo "2. Edit sentry.properties with your Sentry org and project:"
echo "   - defaults.org=your-org-slug"
echo "   - defaults.project=your-project-slug"
echo ""
echo "3. Set up GitHub Secrets (for CI/CD):"
echo "   - SENTRY_AUTH_TOKEN"
echo "   - SENTRY_ORG"
echo "   - SENTRY_PROJECT"
echo ""
echo "4. Follow the complete setup guide in SEER_SETUP.md:"
echo "   - Connect GitHub repository to Sentry"
echo "   - Install Cursor Cloud Agent integration"
echo "   - Configure Seer automation settings"
echo ""
echo "✨ Setup script completed!"
echo ""
echo "For detailed instructions, see: SEER_SETUP.md"

