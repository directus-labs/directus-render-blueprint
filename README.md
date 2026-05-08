# Deploy Directus on Render

One-click deploy of **Directus** on [Render](https://render.com) — includes **PostgreSQL**, **Redis cache**, and all
environment wiring. Everything runs on Render's **free** tier by default.

---

## Just trying it out

Click the button to start the blueprint deploy. You need a Render account, and Render will guide you through the rest of
the setup.

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/directus-labs/directus-render-blueprint)

1. Sign up or log in at [render.com](https://render.com) when prompted.
2. Confirm the Blueprint and create the stack.
3. Wait for the build and deploy to finish, then open the service URL from the Render dashboard (a `*.onrender.com`
   address).
4. Complete Directus first-time setup in the browser and you're in.

---

## Customizing it

Fork this repo to GitHub, make your changes to `render.yaml` or `Dockerfile`, then deploy from your fork:

1. Fork this repo on GitHub.
2. Update the `repo=` URL in the **Deploy to Render** button in your fork's README to point to your repo.
3. Click the button to deploy from your fork.

Common things to change in `render.yaml`: instance `plan`, adding a `disk` (requires a paid web tier), or adjusting env
vars. See [Render's Blueprint docs](https://render.com/docs/blueprint-spec) for the full spec.

## To update the Directus version, change the image tag in [`Dockerfile`](Dockerfile) (e.g. `directus/directus:11.17.4`) and redeploy.

## Free tier limits

All services default to Render's free plans — fine for trying Directus or small hobby projects.

| Goal                               | Notes                                                                                                                                                                                              |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Hobby / evaluation**             | Use the Blueprint as-is — all **Free** instance types.                                                                                                                                             |
| **Uploads that survive restarts**  | Free web services can't attach a disk; local uploads are ephemeral. Use a paid web instance + persistent disk, or configure [S3-compatible storage](https://directus.io/docs/configuration/files). |
| **No idle spin-down / more power** | Upgrade the Directus web service to a [paid instance](https://render.com/pricing).                                                                                                                 |
| **Long-lived Postgres**            | Free Postgres has trial-style limits; long-term use means upgrading the database plan.                                                                                                             |
| **Durable cache**                  | Free Key Value is in-memory only; upgrade if you need persistence.                                                                                                                                 |

---

## After deploy

- **Custom domain** — Add `PUBLIC_URL` (e.g. `https://www.example.com`) in the web service **Environment** tab on Render
  to override the default `*.onrender.com` URL.
- **Admin account** — Created in the Directus UI on first launch.
- **Docs** — [Directus](https://directus.io/docs) · [Render Blueprints](https://render.com/docs/infrastructure-as-code)
  · [Render pricing](https://render.com/pricing)
