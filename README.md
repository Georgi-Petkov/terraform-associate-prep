# Terraform Associate 004 — hands-on prep

Daily hands-on practice building toward the HashiCorp Certified: Terraform Associate (004) exam.

## Structure

- `week1-local-docker/` — core workflow (`init/plan/apply/destroy`), state, variables, dependency references, and drift detection using only local and Docker providers (zero cloud cost).
- More weeks added as I progress: modules, remote state, `azurerm` resources, HCP Terraform workspaces.

## Live site

[`live-site/`](./live-site) — the always-on project. An `azurerm_static_web_app` (Free SKU, verified $0-billing tier — not a discount on a metered service) serving this repo's study plan at https://gentle-moss-078e18203.7.azurestaticapps.net. Never destroyed between sessions; used for ongoing hands-on practice (modules, custom domains, drift, etc.) instead of a one-off lab.

## Study plan

[`study-plan.html`](./study-plan.html) — 17-day day-by-day plan with progress checkboxes. Open it locally in a browser (checkbox state saves to that browser only).

## Exam objectives reference

Official exam content outline: https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-review-004
