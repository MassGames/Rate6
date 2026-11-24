<div align="center">

# Rate6

**Note chaque mission principale de GTA VI. Vois la moyenne de la communauté en direct.**  
**Rate every main mission of GTA VI. Watch the community average live.**

[![Live Demo](https://img.shields.io/badge/Live_Site-massgames.github.io%2FRate6-FF2E93?style=for-the-badge)](https://massgames.github.io/Rate6/)

[English](#-english) • [Français](#-français)

</div>

---

## 🇬🇧 English

**Rate6** is a lightweight, community-driven web app built to rate all **91 main story missions** of **Grand Theft Auto VI** across its 5 chapters and follow live community ratings without spoilers.

### ✨ Features
- **91 Main Missions:** Organized across all 5 chapters (*Just Like Paradise*, *Paradise Lost*, *Tits, Ass, Drug Money*, *Vice City, baby*, *Top of the World, Ma*) with playable character tags (`Lucia`, `Jason`, `Duo`).
- **Live Community Ratings:** Half-star rating system (`0.5` to `5.0`) powered by **Supabase** with real-time updates and optimistic UI.
- **Anti-Spoiler Mode:** Automatically blurs mission titles and descriptions for unrated missions until you click to reveal or vote.
- **Instant Search & Filtering:** Filter by chapter or search by mission title, character, or keyword (shortcut: `/`).
- **Bilingual Interface:** Seamless **FR / EN** language switcher built into the navigation bar.
- **Zero-Account Voting:** One vote per mission and per visitor using an anonymous browser identifier—no sign-up required.

### 🛠️ Tech Stack
- **Frontend:** Standalone `index.html` using Tailwind CSS, Lucide Icons, and Google Fonts (*Outfit* & *Plus Jakarta Sans*).
- **Backend & Database:** Supabase (PostgreSQL, Row Level Security, aggregated SQL view `mission_stats`, and Realtime subscriptions).
- **Hosting:** Static deployment on **GitHub Pages**.

### 🚀 Quick Setup
1. Create a free project on [Supabase](https://supabase.com).
2. Open the **SQL Editor** and run the contents of `supabase.sql` to create the `votes` table, RLS policies, and `mission_stats` view.
3. Copy your **Project URL** and **anon/publishable key** from **Project Settings → API** and paste them into `SUPABASE_URL` and `SUPABASE_ANON_KEY` at the top of the `<script>` tag in `index.html`.
4. Push `index.html` and `logo.png` to your GitHub repository and enable **GitHub Pages** on the `main` branch.

---

## 🇫🇷 Français

**Rate6** est une application web légère et communautaire permettant de noter les **91 missions principales** de **Grand Theft Auto VI** réparties sur ses 5 chapitres et de suivre la moyenne des joueurs en temps réel, sans se faire spoiler.

### ✨ Fonctionnalités
- **91 missions principales :** Classées sur les 5 chapitres (*Just Like Paradise*, *Paradise Lost*, *Tits, Ass, Drug Money*, *Vice City, baby*, *Top of the World, Ma*) avec indication du protagoniste (`Lucia`, `Jason`, `Duo`).
- **Notes communautaires en direct :** Notation à la demi-étoile près (de `0,5` à `5,0`) propulsée par **Supabase** avec mise à jour instantanée.
- **Mode Anti-spoiler :** Floute automatiquement les titres et résumés des missions que tu n'as pas encore notées.
- **Recherche & Filtres rapides :** Filtrage par chapitre ou recherche instantanée par mot-clé, personnage ou titre (raccourci clavier : `/`).
- **Interface bilingue :** Sélecteur de langue **FR / EN** intégré directement dans la barre de navigation.
- **Vote sans inscription :** Un vote par mission et par visiteur via un identifiant anonyme local, aucun compte requis.

### 🛠️ Stack technique
- **Frontend :** Fichier autonome `index.html` avec Tailwind CSS, Lucide Icons et les typographies *Outfit* & *Plus Jakarta Sans*.
- **Base de données :** Supabase (PostgreSQL, règles Row Level Security, vue SQL `mission_stats` et synchronisation Realtime).
- **Hébergement :** Déploiement statique gratuit sur **GitHub Pages**.

### 🚀 Installation rapide
1. Crée un projet gratuit sur [Supabase](https://supabase.com).
2. Ouvre le **SQL Editor** et exécute le script `supabase.sql` pour créer la table `votes`, les politiques de sécurité et la vue `mission_stats`.
3. Récupère ton **Project URL** et ta clé publique (**anon / publishable key**) dans **Project Settings → API**, puis renseigne `SUPABASE_URL` et `SUPABASE_ANON_KEY` en haut du `<script>` dans `index.html`.
4. Importe `index.html` et `logo.png` à la racine de ton dépôt GitHub et active **GitHub Pages** sur la branche `main`.

---

<div align="center">
<sub>Rate6 is an independent fan project, not affiliated with Rockstar Games or Take-Two Interactive.</sub>
</div>
