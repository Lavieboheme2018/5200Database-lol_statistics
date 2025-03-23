# 5200Database-lol_statistics
# 🎮 League of Legends Game Analytics Web App

This is a PHP & MySQL-based web application that provides interactive analytics for League of Legends players.  
It supports viewing, analyzing, and managing player statistics, match data, achievements, and session trends.

---

## 📂 Project Structure
lol-analytics/

├── index.php                   # Landing home page

├── styles.css                  # Optional global styles

├── README.md                   # Project overview and setup

├── create_tables.sql           # SQL schema (DDL)

├── insert_data.sql             # Data population (DML)

├── queries.pdf                 # SQL + results (for Milestone 3)

├── config/

│   └── db.php                  # Database connection config

├── pages/

│   ├── leaderboard.php         # Top players by gold

│   ├── player_achievements.php# Player achievements (JOIN)

│   ├── analytics.php           # Aggregated stats (AVG, COUNT)

│   ├── update_profile.php      # Player profile update

│   ├── delete_player.php       # Player deletion (cascade)

│   ├── dashboard.php           # Chart.js visualizations

│   ├── trend_data.php          # AJAX endpoint for line chart

│   └── navbar.php              # Shared nav bar for all pages

└── assets/                     # (optional) for future charts/images/css

    └── screenshots/            # Dashboard and query screenshots for PDF


---

## 🚀 How to Run the Application

### 📦 Prerequisites

- XAMPP / MAMP / Local Apache + MySQL environment
- PHP 7.x or higher
- MySQL or MariaDB
- Web browser

### 🛠 Setup Instructions

1. **Start Apache and MySQL** from your control panel (XAMPP, MAMP, etc.)
2. **Import database:**
   - Open `phpMyAdmin`
   - Create a database named: `lol_analytics_cs5200`
   - Run `create_tables.sql` to create tables
   - Run `insert_data.sql` to populate sample data
3. **Set up folder:**
   - Place `lol-analytics/` folder into your web root (e.g., `htdocs/`)
4. **Configure database (if needed):**
   - Update DB credentials in `config/db.php` if different from default
5. **Run the app:**
   - Open browser and go to: `http://localhost/lol_analytics/index.php`

---

## 🖥️ Application Features

| Page | Description |
|------|-------------|
| 🏆 `leaderboard.php` | View top 5 players by total gold earned |
| 🎯 `player_achievements.php` | List player achievements (JOIN query) |
| 📊 `analytics.php` | Aggregated stats (AVG, COUNT, GROUP BY) |
| 🛠 `update_profile.php` | Update player profile (form + UPDATE) |
| 🗑 `delete_player.php` | Delete player & cascade related records |
| 📈 `dashboard.php` | Chart.js visualizations (bar, pie, line) |
| 🧭 `navbar.php` | Shared navigation menu for all pages |
| 🏠 `index.php` | Landing page linking to all features |

---

## 📈 Bonus Features Implemented (✓)

- ✅ AJAX-powered dynamic line chart (player match duration trend)
- ✅ Navigation bar modularized across all pages
- ✅ 20+ rows of realistic data per table

---

## 📋 Analytical Queries (see `queries.pdf`)

| Query Type | Example |
|------------|---------|
| Join Query | Top players with their achievements |
| Aggregation | AVG playtime, COUNT achievements |
| Nested Aggregation with GROUP BY | Total duration per player per week |
| Filtered Query | Top 5 by score |
| Update Operation | Profile editing |
| Delete Operation | Player delete with cascade |

---

## 👥 Team Members

- Wanyi Jiang
- [Your Name 1] 
- [Your Name 2] 
- [Your Name 3] 

(*Please update this section with your actual team names*)

---

## 📅 Milestone 3 Deliverables

- ✅ `create_tables.sql`
- ✅ `insert_data.sql`
- ✅ Full Web App Code
- ✅ README.md
- ⬜ `queries.pdf` (with screenshots)
- ✅ Peer Evaluation Form [Fill Here](https://forms.office.com/r/vy40EU9SWF)

---
## 剩余任务⚠️重要
- 1️⃣创建 styles.css，让 UI 更演示友好
- 2️⃣网站截图,填充queries.docs,完成后上传为queries.pdf
- 3️⃣检查每个功能是否能运行，修复路径或逻辑 bug
- 4️⃣检查项目要求文件，查漏补缺

- ‼️此项目采用xampp（以前上课用过的myadminphp）与vscode（可以用你习惯的任意代码编辑器）部署，在本地运行时db.php文件中的密码应该改为你自己的密码
- readme是用g老师生成的，如果有和项目文件要求不符的地方请修改
- 若在本地部署失败，无法看到网页，请与我联系


