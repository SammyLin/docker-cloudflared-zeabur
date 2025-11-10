# Cloudflare Tunnel for Zeabur

Deploy [Cloudflare Tunnel](https://www.cloudflare.com/products/tunnel/) on [Zeabur](https://zeabur.com/) with minimal configuration.

## Overview

This project provides a Docker image optimized for running Cloudflare Tunnel (cloudflared) on Zeabur's platform. It handles the necessary adjustments required for Zeabur's deployment environment.

## Prerequisites

- A Cloudflare account
- A Cloudflare Tunnel created with a tunnel token
- A Zeabur account

## Docker Image

The pre-built Docker image is available on Docker Hub:

```bash
docker pull sammylin/cloudflared-zeabur:latest
```

Or simply use `sammylin/cloudflared-zeabur:latest` when deploying to Zeabur.

## Setup Instructions

### 1. Create a Cloudflare Tunnel

1. Log in to your [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Navigate to **Zero Trust** → **Networks** → **Tunnels**
3. Click **Create a tunnel**
4. Choose **Cloudflared** as the connector
5. Give your tunnel a name and save it
6. Copy the tunnel token (it will look like: `eyJhIjoiXXXXXXX...`)

### 2. Deploy to Zeabur

1. Create a new service in your Zeabur project
2. Use the Docker image: `sammylin/cloudflared-zeabur:latest`
3. In your Zeabur service settings, add the following environment variable:
   - **Key**: `TUNNEL_TOKEN`
   - **Value**: Your Cloudflare tunnel token from step 1

**Important Notes:**

- ✅ **Only** the `TUNNEL_TOKEN` environment variable is required
- ❌ No additional environment variables needed
- ❌ No custom startup commands needed
- The service will automatically start the tunnel on deployment

### 3. Configure Your Tunnel

After deployment, configure your tunnel routes in the Cloudflare Dashboard:

1. Go back to your tunnel in **Zero Trust** → **Networks** → **Tunnels**
2. Click on your tunnel and go to the **Public Hostname** tab
3. Add routes to map your domains to services

## How It Works

This Docker image uses the official Cloudflare cloudflared image with additional shell utilities from BusyBox to ensure compatibility with Zeabur's deployment environment. The tunnel automatically connects using the provided token.

## Troubleshooting

- **Tunnel not connecting**: Verify your `TUNNEL_TOKEN` is correct and hasn't expired
- **Service failing to start**: Check Zeabur logs for any error messages
- **Routes not working**: Ensure your tunnel routes are properly configured in Cloudflare Dashboard

## License

MIT
