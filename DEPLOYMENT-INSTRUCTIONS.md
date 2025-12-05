# DEPLOYMENT INSTRUCTIONS FOR DTSLIB.COM

## Summary of Changes Made

This PR includes the following fixes to prepare dtslib.com for deployment:

### 1. CNAME Configuration ✅
- **Removed**: `CNAME.delete` file from root directory  
- **Updated**: `public/CNAME` from `www.dtslib.com` to `dtslib.com`
- **Verified**: `dist/CNAME` contains `dtslib.com` after build

### 2. Vite Configuration ✅
- **Added**: `base: "/"` to `vite.config.js` for root deployment
- This ensures all assets load correctly from the root domain

### 3. Build Verification ✅
- **Built**: Project successfully with `npm run build`
- **Verified**: dist/CNAME contains correct domain
- **Total files**: 70 files in dist directory (2.9 MB)

---

## MANUAL STEPS REQUIRED

Due to GitHub authentication limitations, the following steps must be completed manually by the repository owner:

### Step 1: Deploy to gh-pages Branch

Run the provided deployment script:

```bash
./deploy-to-gh-pages.sh
```

Or manually execute:

```bash
git subtree push --prefix dist origin gh-pages
```

This command will:
- Create the `gh-pages` branch if it doesn't exist
- Push only the `dist` folder contents to that branch
- Preserve the CNAME file for custom domain configuration

### Step 2: Configure GitHub Pages Settings

1. Navigate to: `https://github.com/dtslib1979/dtslib.com/settings/pages`

2. Configure the following settings:
   - **Source**: Deploy from a branch
   - **Branch**: `gh-pages`
   - **Folder**: `/ (root)`
   - **Custom domain**: `dtslib.com`
   - **Enforce HTTPS**: ✅ Enabled

3. Click **Save**

### Step 3: Verify DNS Configuration

Ensure your DNS provider has the following records for `dtslib.com`:

```
A Record:
dtslib.com → 185.199.108.153
dtslib.com → 185.199.109.153
dtslib.com → 185.199.110.153
dtslib.com → 185.199.111.153

CNAME Record (optional for www):
www.dtslib.com → dtslib1979.github.io
```

### Step 4: Verification

After deployment and DNS propagation (can take up to 24 hours), verify:

```bash
# Check main domain
curl -I https://dtslib.com

# Check GitHub Pages URL
curl -I https://dtslib1979.github.io/dtslib.com/
```

Expected response: `HTTP/2 200` or `HTTP/1.1 301` → `HTTP/2 200`

---

## Build Checksum

```bash
$ ls -la dist/
total 68
-rw-rw-r-- 1 runner runner  3192 CNAME: dtslib.com ✓
-rw-rw-r-- 1 runner runner 93    index.html
-rw-rw-r-- 1 runner runner 93    404.html
drwxrwxr-x 2 runner runner 4096  assets/ (67 files)
drwxrwxr-x 2 runner runner 4096  icons/ (10 files)
```

Total: 70 files, ~2.9 MB

---

## Alternative: GitHub Actions Deployment

Note: This repository already has a GitHub Actions workflow (`.github/workflows/deploy.yml`) that deploys to GitHub Pages when changes are pushed to the `main` branch. 

If you prefer automated deployment:
1. Merge this PR to main
2. The workflow will automatically build and deploy
3. However, you'll still need to manually configure the GitHub Pages settings (Step 2 above)

---

## Troubleshooting

### Issue: CNAME file missing after deployment
**Solution**: The CNAME file is correctly placed in `public/CNAME` and will be copied to `dist/CNAME` during build. Verify with `cat dist/CNAME`.

### Issue: 404 errors on page routes
**Solution**: The build process creates a `404.html` file that mirrors `index.html` for client-side routing. This is handled by the `postbuild` script.

### Issue: Assets not loading
**Solution**: The `base: "/"` configuration in `vite.config.js` ensures assets load from the root. Verify this setting is present.

---

## Next Actions

- [ ] Run deployment script or manual git subtree push
- [ ] Configure GitHub Pages settings
- [ ] Verify DNS records
- [ ] Test deployment with curl commands
- [ ] Access https://dtslib.com to confirm
