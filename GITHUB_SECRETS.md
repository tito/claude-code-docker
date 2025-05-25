# Required GitHub Secrets for Docker Build and Push Action

To enable the automated Docker build and push workflow, you need to configure the following secrets in your GitHub repository:

## Required Secrets

### `DOCKER_USERNAME`
- **Description**: Your Docker Hub username
- **Value**: Your Docker Hub account username (e.g., `john-doe`)

### `DOCKER_PASSWORD`
- **Description**: Your Docker Hub password or access token
- **Value**: Your Docker Hub password or preferably a Docker Hub access token
- **Note**: For security, use a Docker Hub access token instead of your password

### `DOCKER_IMAGE_NAME`
- **Description**: The name of your Docker image (without the username prefix)
- **Value**: The image name (e.g., `claude-code-docker`)

## How to Set Up Secrets

1. Go to your GitHub repository
2. Click on **Settings** tab
3. In the left sidebar, click **Secrets and variables** → **Actions**
4. Click **New repository secret**
5. Add each secret with the name and value as specified above

## Docker Hub Access Token Setup (Recommended)

Instead of using your Docker Hub password, create an access token:

1. Log in to Docker Hub
2. Go to **Account Settings** → **Security**
3. Click **New Access Token**
4. Give it a descriptive name (e.g., "GitHub Actions")
5. Set appropriate permissions (Read, Write, Delete)
6. Copy the generated token and use it as the `DOCKER_PASSWORD` secret

## Workflow Trigger

The workflow will:
- Run automatically every 12 hours (00:00 and 12:00 UTC)
- Can be triggered manually from the Actions tab
- Automatically increment the patch version from the latest git tag
- Build and push with both the new version tag and `latest` tag