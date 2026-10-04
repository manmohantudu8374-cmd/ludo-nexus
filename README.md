# LUDO NEXUS — Web + PWA + Google Play (TWA)

Static site, no build step. Game engine lives in `play/index.html`.

## Run locally
`npx serve .`  (or `python3 -m http.server 8080`) → open http://localhost:8080
(Service worker needs localhost or HTTPS.)

## 1. Set your domain & email
`./set-domain.sh yourdomain.com` then edit `YOUR-EMAIL@example.com` in `privacy.html`.

## 2. Deploy (needs HTTPS at the domain ROOT)
- **Cloudflare Pages / Netlify / Vercel:** connect the repo, no build command, output dir `.`
- **GitHub Pages:** works with a custom domain (project sub-paths will break absolute URLs). `.nojekyll` is included so `.well-known` is served.

## 3. SEO / Google search
1. Verify the site in **Google Search Console** (Domain property).
2. Submit `https://yourdomain.com/sitemap.xml` and request indexing for `/` and `/play/`.
3. Included: title/description, canonical, Open Graph, Twitter cards, JSON-LD (WebSite, VideoGame, FAQPage), robots.txt, sitemap, semantic HTML. Ranking takes weeks and is not guaranteed; backlinks and Play Store listing help.
4. Test with Rich Results Test and Lighthouse (aim for PWA + SEO 100).

## 4. Google Play (Trusted Web Activity)
1. Create a Play Console developer account (one-time fee; check current new-account testing requirements).
2. `npm i -g @bubblewrap/cli` (needs JDK 17 + Android SDK; Bubblewrap offers to install them).
3. `bubblewrap init --manifest=https://yourdomain.com/manifest.webmanifest` (or reuse `twa-manifest.json`) → `bubblewrap build`. Keep `android.keystore` + passwords safe forever.
4. Get the SHA-256 fingerprint (`bubblewrap fingerprint` or Play Console → App integrity → App signing key) and paste into `.well-known/assetlinks.json`; redeploy. Verify at `https://yourdomain.com/.well-known/assetlinks.json`.
5. Upload the `.aab` to a Play Console release; fill listing from `store/listing.md`, upload `store/` graphics + your screenshots, add privacy policy URL, complete Data safety, content rating and target audience.
6. Without correct assetlinks the app shows a browser address bar instead of fullscreen.

## Known scope
Online rooms, Chaos Mode and translations are marked "Coming Soon" in the game.
