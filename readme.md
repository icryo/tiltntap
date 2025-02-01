# TiltNTap

A web-based aim trainer focused on simplicity and performance. Built with Godot 4.3.

## Features

- Browser-based aim training with no installation required
- Precise sensitivity control (up to 2 decimal places)
- Direct Counter-Strike 2 sensitivity conversion
- Clean, minimalist interface
- Multiple aim training modes:
  - Horizontal targets
  - Moving targets
  - Random targets
  - Tracking targets

## Usage

1. Visit the web version at [your-deployment-url]
2. Set your sensitivity:
   - Use the slider for quick adjustments
   - Type exact values (up to 2 decimal places)
   - Values automatically sync with settings menu
3. Select a training mode and start practicing

## Development

This project uses Godot 4.3. To develop locally:

1. Download Godot 4.3 Standard version
2. Import the project
3. Use the web export template for testing

### Web Export

The project is configured for web deployment with:
- Optimized HTML5/WebGL export settings
- Compressed assets for faster loading
- Mobile-friendly viewport configuration

## Deployment

For optimal web performance, we recommend:
- Using a CDN for static assets
- Enabling gzip compression for .pck and .wasm files
- Setting appropriate cache headers
- Using a modern web server (Nginx/Apache)

## Credits

TiltNTap is based on [LibreAim](https://github.com/Nokorpo/LibreAim), an open-source aim trainer. Modified for web-first deployment with streamlined features.
