<div align="center">

# 🏛️ BhoomiAI

### Predictive Analytics for Early Detection of Land Acquisition Delays

An intelligent **Django + Machine Learning** platform that predicts land-acquisition delays, uncovers the risk factors behind them, and helps programme managers intervene **before** a delay becomes unavoidable — presented through a premium, interactive analytics dashboard.

<br>

![Python](https://img.shields.io/badge/Python-3.12-D97736?style=for-the-badge&logo=python&logoColor=white)
![Django](https://img.shields.io/badge/Django-6.1-4A2522?style=for-the-badge&logo=django&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-ML-8B5A2B?style=for-the-badge&logo=scikitlearn&logoColor=white)
![Chart.js](https://img.shields.io/badge/Chart.js-Analytics-D97736?style=for-the-badge&logo=chartdotjs&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Ready-4A2522?style=for-the-badge&logo=postgresql&logoColor=white)

![Status](https://img.shields.io/badge/Status-Active-8B5A2B?style=flat-square)
![Theme](https://img.shields.io/badge/Theme-Orange%20%7C%20Peach%20%7C%20Maroon-D97736?style=flat-square)
![Mode](https://img.shields.io/badge/Mode-Light%20%26%20Dark-4A2522?style=flat-square)

</div>

---

## 📖 Overview

Land acquisition is a critical dependency for infrastructure and development projects. Delays are almost always caused by a familiar set of risk factors — ownership disputes, pending compensation, approval bottlenecks, legal cases, environmental clearance and incomplete rehabilitation. **BhoomiAI** turns those signals into a delay probability, a risk band, an expected delay duration and a set of preventive actions.

The entire pipeline — **data → model → dashboard → reports** — runs on a clearly labelled synthetic dataset, so the full system can be demonstrated without exposing any real landowner or personal information.

> **Category:** Smart Automation · **Brand:** BhoomiAI · **Status:** Working academic prototype (synthetic data)

---

## ✨ What's New (Latest Update)

This release focuses on a complete **UI/UX and theme overhaul** plus verified end-to-end functionality:

- 🎨 **Premium warm theme** — a rich **Orange / Peach / Maroon** palette (`#D97736`, `#FDF4ED`, `#FFE5D9`, `#4A2522`, `#8B5A2B`) replaces the old cold palette. No blue, no CSS gradients — solid, premium tones throughout.
- 🌗 **Dark / Light mode toggle** — a one-click theme switch with persisted preference (`localStorage`). Every page, input, chart, sidebar item and icon is tuned for both modes.
- 🖼️ **Fixed hero & section images** — the homepage hero now uses a fixed-attachment highway image with clear white text, and all banner/section images render correctly in **both** themes (no more blank panels).
- 📊 **Interactive dashboard** — KPI cards plus responsive Chart.js charts (progress, phases, risk distribution, analytics) that fill their containers and animate in view.
- 🧭 **Refined navigation** — theme-aware sidebar with active-state highlighting, inverted icons in dark mode and a brand logo that swaps with the theme.
- ✅ **Fully tested** — every page, form, button and chart verified (0 errors, 0 broken links, 0 broken images); ML pipeline runs dummy predictions end-to-end.

---

## 🧩 Features

| Module | Highlights |
|---|---|
| **Overview Dashboard** | KPI cards, planned vs. actual progress, predicted project end, live risk profile and monitoring table. |
| **Project Management** | Create, view, edit, archive and delete projects; search, filter and sort by state, status and risk level. |
| **Delay Prediction** | Saved-model inference producing delay probability, risk band, expected delay days, contributing factors and mitigation suggestions. |
| **Data Import** | Validated CSV import, downloadable CSV template, and one-click rebuild of the 2,400-row synthetic workspace. |
| **Risk Analytics** | Overall risk distribution, state- and district-wise exposure, compensation / approval / legal bottleneck analysis, progress and feature importance. |
| **Project Monitoring** | Acquisition and compensation progress with risk and delay estimates. |
| **Mitigation Plans** | System-suggested preventive actions with a user-controlled workflow status. |
| **Model Performance** | Accuracy, precision, recall, F1, confusion matrices, ROC curves and feature importance for all candidate models. |
| **Prediction History** | Full audit trail of every stored prediction with its model version. |
| **Reports & Exports** | CSV, PDF and Excel exports generated from live data and persisted metrics. |
| **Documents & OCR** | Upload land documents and extract fields via the OCR engine, with validation and duplicate detection. |
| **Notifications & Settings** | Unread notification badge and theme preference. |
| **Authentication** | Email-based login / signup with a custom user model and Django admin panel. |

---

## 🛠️ Tech Stack

**Backend**
- **Python 3.12** · **Django 6.1**
- Django REST Framework
- Custom email-based authentication (`CustomUser`)

**Machine Learning**
- **scikit-learn** — Random Forest, Decision Tree, Logistic Regression
- **pandas** · **numpy** — data processing
- **joblib** — model serialization (`ml_artifacts/`)
- Trained artifacts loaded once and cached in memory for fast inference

**Data & Storage**
- **SQLite** locally (zero-config)
- **PostgreSQL** in production (via `DATABASE_URL`)

**Frontend**
- Django Templates
- Custom CSS design system (premium warm theme + dark/light modes)
- **Chart.js** for interactive analytics
- Vanilla JavaScript (`analytics.js`, `dashboard.js`, `theme.js`, `app.js`)

**Reports & Documents**
- `reportlab` (PDF) · `openpyxl` (Excel) · standard-library CSV
- `pytesseract` + `pymupdf` (OCR) · `Pillow`

**Tooling & Deployment**
- `whitenoise` (static files) · `gunicorn` (WSGI server) · `dj-database-url`
- `pytest` + `pytest-django` · `python-dotenv`
- Ready for **Render** (`render.yaml`, `build.sh`)

---

## 🏗️ Architecture

```
manage.py
bhoomiai_project/          <- settings, root URLs, WSGI/ASGI
│
├── core/                  <- landing page, health / live endpoints
├── accounts/              <- custom user model, signup, login, profile
├── dashboard/             <- overview dashboard + KPIs
├── predictions/           <- ML pipeline, projects, analytics, monitoring
│   ├── synthetic.py       <- documented synthetic data generator
│   ├── ml.py              <- training, evaluation, serialization, inference
│   ├── services.py        <- import, prediction persistence, analytics
│   ├── models.py          <- LandAcquisitionProject, ProjectPrediction, ...
│   └── views.py / forms.py / urls.py
├── documents/             <- upload + management of land documents
├── ocr_engine/            <- OCR extraction service
├── validation/            <- rule-based validation of extracted data
├── duplicates/            <- duplicate candidate detection
├── reports/               <- CSV / PDF / Excel exports
├── notifications/         <- in-app notification centre
│
├── templates/             <- base, base_app and all page templates
├── static/                <- css/ · js/ · images/ (themed SVG & photos)
├── data/                  <- synthetic dataset (land_acquisition_projects.csv)
├── ml_artifacts/          <- trained models + metrics.json
├── media/                 <- uploaded documents (git-ignored)
└── screenshots/           <- application screenshots
```

All analytics values come from the database or `ml_artifacts/metrics.json`. **Nothing on the dashboard or in the reports is hardcoded.**

---

## 🚀 Getting Started

### Prerequisites
- **Python 3.11+** (3.12 recommended)
- **pip** and **venv**
- *(Optional, for OCR)* **Tesseract OCR** installed and on your `PATH`

### 1. Clone the repository
```bash
git clone https://github.com/sachin-gautam-12/BhoomiAI-Smart-Land-Record-System.git
cd BhoomiAI-Smart-Land-Record-System
```

### 2. Create and activate a virtual environment
```bash
# Windows (PowerShell)
python -m venv venv
.\venv\Scripts\activate

# macOS / Linux
python3 -m venv venv
source venv/bin/activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Configure environment variables *(optional for local use)*
Create a `.env` file in the project root (this file is git-ignored):
```env
SECRET_KEY=your-long-random-secret-key
DEBUG=True
ALLOWED_HOSTS=127.0.0.1,localhost
```
> If you skip this step, sensible development defaults are used automatically.

### 5. Apply database migrations
```bash
python manage.py migrate
```

### 6. Seed the demo workspace *(recommended — builds the dashboard data)*
```bash
# Generates the 2,400-row synthetic dataset and seeds projects + predictions
python manage.py generate_synthetic_data --seed-db

# (optional) Generate demo land documents for the Documents / OCR pages
python manage.py seed_dummy_data
```

### 7. Start the development server
```bash
python manage.py runserver
```
Then open **http://127.0.0.1:8000/** and sign in.

---

## 🔑 Default Accounts

A superuser and a demo account can be used to explore the platform immediately.

| Role | Email | Password | Access |
|---|---|---|---|
| **Admin (superuser)** | `admin@bhoomiai.com` | `Admin@Bhoomi2026` | Full app **+ Django admin panel** (`/admin/`) |
| **Demo (standard user)** | `demo@bhoomiai.com` | `Demo@Bhoomi2026` | Standard application access |

> Login is **email-based**. To (re)create the admin from scratch:
> ```bash
> python manage.py createsuperuser
> ```
>
> ⚠️ **Security note:** change these default passwords before deploying to a public environment.

---

## 🧠 Machine Learning

### Pipeline
- Dataset loading & cleaning (`predictions/synthetic.py`, `predictions/ml.py`)
- Missing-value handling (`SimpleImputer`) → categorical encoding (`OneHotEncoder`) → scaling (`StandardScaler`)
- Stratified **80 / 20** train–test split
- Three candidate classifiers trained on the same preprocessing pipeline
- A separate Random Forest regressor for delay duration (delayed projects only)
- Serialization with `joblib` into `ml_artifacts/`

### Candidate models
1. Random Forest Classifier
2. Decision Tree Classifier
3. Logistic Regression

**Selection rule:** the candidate with the highest **ROC-AUC** on the test split is activated. On the current dataset this is **Logistic Regression**.

### Persisted metrics (`ml_artifacts/metrics.json`)

| Algorithm | Accuracy | Precision | Recall | F1 | ROC-AUC |
|---|---:|---:|---:|---:|---:|
| Logistic Regression *(selected)* | 0.715 | 0.774 | 0.703 | 0.737 | 0.784 |
| Random Forest | 0.706 | — | — | 0.749 | 0.761 |
| Decision Tree | 0.637 | — | — | 0.672 | 0.668 |

Delay-duration regressor (Random Forest, delayed projects only): **MAE 50.37 days · RMSE 77.65 days · R² 0.622**.

### Risk bands
| Delay probability | Risk level |
|---|---|
| `< 0.35` | 🟢 Low |
| `0.35 – 0.649` | 🟠 Medium |
| `≥ 0.65` | 🔴 High |

Delay outcome threshold `≥ 0.50` → *Delayed*. Six rule-based risk cards (Land Ownership, Compensation, Legal, Approval, Environmental, Rehabilitation) are computed deterministically and shown **alongside** — but separately from — the ML probability.

---

## 🗂️ Synthetic Dataset

- **File:** `data/land_acquisition_projects.csv`
- **Rows:** 2,400 · **Delay rate:** 56.87 % (1,365 delayed)
- **Coverage:** multiple Indian states and districts
- **Clearly labelled synthetic** — intended for academic demonstration only

Key features include: `land_area_acres`, `total_land_parcels`, `acquired_land_parcels`, `ownership_disputes`, `compensation_status`, `compensation_completion_percentage`, `approval_status`, `environmental_clearance_status`, `legal_case_count`, `rehabilitation_status`, `project_budget`, `allocated_budget`, `project_duration_months`, `elapsed_months`, `stakeholder_issues`, plus the `delay_status` / `delay_days` targets.

**Leakage-safe by design:** IDs, dates and the target columns are never used as model inputs.

Regenerate at any time:
```bash
python manage.py generate_synthetic_data
python manage.py generate_synthetic_data --seed-db
python manage.py train_delay_model        # retrain + compare + write ml_artifacts/
```

---

## 🧪 Testing

```bash
python manage.py check
python manage.py test
```

The suite covers synthetic dataset size and relationships, model metrics and artifacts, project CRUD, prediction persistence and dashboard/report endpoints. **Current status: 12/12 tests passing.**

---

## ☁️ Deployment (Render + PostgreSQL)

The project is pre-configured for **Render** using PostgreSQL while keeping SQLite locally.

1. Push `main` to GitHub.
2. In Render, create a **Blueprint** or **Web Service** from the repository — `render.yaml` provisions it automatically.
3. Create a **PostgreSQL** database (free tier) and link it (sets `DATABASE_URL`).
4. Build command: `./build.sh` — installs deps → `collectstatic` → `migrate` → **seeds 2,400 projects** → `bootstrap_accounts`.
5. Start command: `gunicorn bhoomiai_project.wsgi:application`.

**Required environment variables**

| Variable | Value |
|---|---|
| `SECRET_KEY` | long random string |
| `DEBUG` | `False` |
| `ALLOWED_HOSTS` | your Render hostname |
| `CSRF_TRUSTED_ORIGINS` | `https://<your-app>.onrender.com` |
| `DATABASE_URL` | provided by the linked PostgreSQL database |

### Automatic data setup on deploy (no Shell required)

`build.sh` seeds the database for you, so **no Render Shell is needed** (important on the
free plan, which has no Shell):

- `python manage.py generate_synthetic_data --seed-db` — loads the **2,400-row synthetic
  demo workspace** (projects + predictions) right after migrations.
- `python manage.py bootstrap_accounts` — creates the default **admin** and **demo** accounts.

Both steps are **idempotent**: seeding skips projects whose `project_id` already exists
(first deploy imports 2,400; later deploys import 0), and account bootstrap never resets an
existing password. So every deploy is safe and never creates duplicates.

> If you ever have Shell access (paid plans), you can re-run either command manually:
> ```bash
> python manage.py generate_synthetic_data --seed-db
> python manage.py bootstrap_accounts
> ```

> ML artifacts (`ml_artifacts/`) and the synthetic dataset (`data/`) are committed and loaded at runtime. Render's filesystem is ephemeral, so reports are generated on demand. **Never copy the local SQLite database to production** — run migrations on the empty PostgreSQL database.

---

## ⚠️ Limitations & Disclaimer

- The dataset is **synthetic** and intended for **academic demonstration only**.
- Risk scores and mitigation suggestions are heuristic indicators — **not** legal or financial advice.
- The delay-duration regressor is trained only on delayed projects.
- Python-side aggregation is used for some analytics (fine at ~2,400 rows).

<div align="center">

**All project records, delay labels and predictions in this repository are generated from a documented synthetic process. No real landowner, parcel owner or personal information is used. This system must not be used as the sole basis for legal, financial or acquisition decisions.**

<br>

Made with 🌾 &nbsp;for smarter land acquisition.

</div>
