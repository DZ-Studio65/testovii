<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="theme-color" content="#070a0f">
<title>OXIDE:DROPS</title>
<style>
*{
  box-sizing:border-box;
  margin:0;
  padding:0
}
html{background:#070a0f}
body::before,body::after{content:"";position:fixed;inset:auto;z-index:-1;pointer-events:none;border-radius:50%;filter:blur(2px);opacity:.45}
body::before{width:220px;height:220px;left:-80px;top:16%;background:radial-gradient(circle,rgba(83,180,255,.22),transparent 68%);animation:orb 16s ease-in-out infinite alternate}
body::after{width:260px;height:260px;right:-100px;bottom:8%;background:radial-gradient(circle,rgba(170,105,255,.18),transparent 68%);animation:orb2 20s ease-in-out infinite alternate}
@keyframes orb{to{transform:translate(120px,80px) scale(1.25)}}
@keyframes orb2{to{transform:translate(-110px,-70px) scale(1.18)}}

body{
  background:radial-gradient(circle at 50% -10%,#1c2938,#070a0f 48%);
  color:#fff;
  font-family:Arial,sans-serif;
  min-height:100vh
}
button{
  font:inherit;
  cursor:pointer
}
button:disabled{
  opacity:.45;
  cursor:not-allowed
}
.bubbles{position:fixed;inset:0;overflow:hidden;pointer-events:none;z-index:-1}.bubble{position:absolute;border-radius:50%;background:radial-gradient(circle at 35% 30%,rgba(255,255,255,.14),rgba(120,180,255,.035) 45%,transparent 70%);animation:float 18s ease-in-out infinite}.bubble:nth-child(1){width:90px;height:90px;left:7%;bottom:-100px}.bubble:nth-child(2){width:45px;height:45px;left:65%;bottom:-60px;animation-duration:14s;animation-delay:-4s}.bubble:nth-child(3){width:130px;height:130px;left:38%;bottom:-150px;animation-duration:24s;animation-delay:-8s}.bubble:nth-child(4){width:60px;height:60px;right:4%;bottom:-80px;animation-duration:17s;animation-delay:-2s}@keyframes float{0%{transform:translateY(0) translateX(0);opacity:0}15%{opacity:.65}50%{transform:translateY(-55vh) translateX(28px)}85%{opacity:.35}100%{transform:translateY(-115vh) translateX(-25px);opacity:0}}
.app{
  width:min(100%,480px);
  min-height:100vh;
  margin:auto;
  padding-bottom:90px
}
/* ================= HEADER ================= */
header{
  height:70px;
  padding:14px 16px;
  display:flex;
  align-items:center;
  justify-content:space-between;
  position:sticky;
  top:0;
  z-index:20;
  background:rgba(7,10,15,.94);
  backdrop-filter:blur(15px)
}
.logo{
  display:flex;
  align-items:center;
  gap:9px;
  font-size:21px;
  font-weight:1000
}
.logo img{
  width:42px;
  height:42px;
  border-radius:10px;
  object-fit:cover;
  display:block
}
.balance-area{
  display:flex;
  align-items:center;
  gap:7px
}
.balance{
  background:#151d28;
  border:1px solid #293443;
  border-radius:14px;
  padding:9px 12px;
  color:#ffd84d;
  font-weight:900
}
.plus-balance{
  width:37px;
  height:37px;
  border:1px solid #3a4655;
  border-radius:12px;
  background:#171f2a;
  color:#fff;
  font-size:22px;
  font-weight:1000;
  line-height:1
}
/* ================= GENERAL ================= */
.page{
  padding:0 15px
}
.hidden{
  display:none!important
}
.title{
  font-size:21px;
  font-weight:900;
  margin:24px 0 12px
}
.card{
  background:#111720;
  border:1px solid #263140;
  border-radius:20px;
  padding:17px
}
.page-brand{
  display:flex;
  align-items:center;
  gap:10px;
  margin-top:17px;
  margin-bottom:4px
}
.page-brand img{
  width:36px;
  height:36px;
  border-radius:10px;
  object-fit:cover
}
.page-brand-name{
  font-size:17px;
  font-weight:1000
}
/* ================= HOME ================= */
.hero{
  margin-top:12px;
  padding:20px;
  border:1px solid #344456;
  border-radius:23px;
  background:
    radial-gradient(
      circle at 85% 20%,
      rgba(255,216,77,.16),
      transparent 30%
    ),
    linear-gradient(135deg,#1d2c3d,#0e141c);
  position:relative;
  overflow:hidden
}
.hero-logo{
  width:58px;
  height:58px;
  border-radius:16px;
  object-fit:cover;
  border:1px solid #435467;
  margin-bottom:12px;
  box-shadow:0 8px 30px rgba(0,0,0,.4)
}
.hero small{
  color:#ffd84d;
  font-weight:900
}
.hero h1{
  font-size:28px;
  margin:8px 0
}
.hero p{
  color:#8995a6;
  line-height:1.45
}
.hero::after{
  content:"";
  position:absolute;
  width:180px;
  height:180px;
  right:-80px;
  bottom:-100px;
  border-radius:50%;
  background:rgba(255,216,77,.08)
}
/* SEARCH */
.home-tools{
  display:grid;
  grid-template-columns:1fr auto;
  gap:8px;
  margin-top:17px
}
.search{
  width:100%;
  border:1px solid #303c4b;
  background:#111720;
  color:#fff;
  border-radius:13px;
  padding:12px 13px;
  outline:none
}
.filter-button{
  border:1px solid #303c4b;
  background:#171f2a;
  color:#fff;
  border-radius:13px;
  padding:0 14px;
  font-weight:900
}
.active-filter{
  margin-top:8px;
  color:#8995a6;
  font-size:12px
}
/* CASES */
.cases{
  display:grid;
  gap:12px
}
.case{
  display:flex;
  align-items:center;
  gap:13px;
  padding:14px;
  border:1px solid #263140;
  background:#111720;
  border-radius:19px
}
.case-icon{
  width:68px;
  height:68px;
  border-radius:17px;
  background:#202a37;
  display:grid;
  place-items:center;
  font-size:34px;
  flex-shrink:0
}
.case-info{
  flex:1;
  min-width:0
}
.case-name{
  font-weight:900;
  font-size:17px
}
.case-type{
  color:#8995a6;
  font-size:11px;
  margin-top:3px
}
.case-price{
  margin-top:6px;
  color:#ffd84d;
  font-weight:800
}
.open{
  border:0;
  background:#fff;
  color:#080a0e;
  border-radius:12px;
  padding:11px 13px;
  font-weight:900;
  flex-shrink:0
}
/* ================= CASE MODAL ================= */
.case-modal,
.confirm-modal,
.category-modal,
.home-filter-modal,
.skin-selector,
.topup-modal{
  position:fixed;
  inset:0;
  background:rgba(0,0,0,.84);
  display:none;
  align-items:center;
  justify-content:center;
  z-index:100
}
.case-modal.show,
.confirm-modal.show,
.category-modal.show,
.home-filter-modal.show,
.skin-selector.show,
.topup-modal.show{
  display:flex
}
.case-window{
  width:min(470px,94%);
  background:#10161e;
  border:1px solid #303c4c;
  border-radius:24px;
  padding:18px 12px 22px;
  overflow:hidden;
  box-shadow:0 25px 80px rgba(0,0,0,.65)
}
.case-window h2{
  text-align:center;
  margin-bottom:17px
}
.roulette{
  position:relative;
  width:100%;
  height:132px;
  overflow:hidden;
  border-radius:17px;
  background:#090d13;
  border:1px solid #27313e
}
.roulette::before{
  content:"";
  position:absolute;
  top:0;
  bottom:0;
  left:50%;
  width:2px;
  background:#fff;
  box-shadow:0 0 14px rgba(255,255,255,.8);
  z-index:20
}
.pointer{
  position:absolute;
  top:-1px;
  left:50%;
  transform:translateX(-50%);
  z-index:30;
  width:0;
  height:0;
  border-left:11px solid transparent;
  border-right:11px solid transparent;
  border-top:23px solid #ffd84d;
  filter:drop-shadow(0 2px 5px #000)
}
.roulette-track{
  height:100%;
  display:flex;
  align-items:center;
  gap:9px;
  padding-left:50%;
  will-change:transform
}
.roulette-item{
  flex:0 0 94px;
  height:102px;
  border-radius:14px;
  border:1px solid #303b49;
  background:#1b2430;
  display:flex;
  flex-direction:column;
  align-items:center;
  justify-content:center;
  gap:8px
}
.roulette-item.win-item{
  border-color:#ffd84d;
  box-shadow:
    0 0 20px rgba(255,216,77,.35),
    inset 0 0 20px rgba(255,216,77,.08)
}
.roulette-item .icon{
  width:53px;
  height:53px;
  border-radius:11px;
  background:#283341;
  display:grid;
  place-items:center;
  font-size:29px
}
.roulette-item span{
  font-size:10px;
  color:#9ba6b5;
  text-align:center
}
.result{
  text-align:center;
  margin-top:17px;
  min-height:25px;
  font-size:18px;
  font-weight:900
}
.close-case{
  width:100%;
  margin-top:14px;
  border:0;
  border-radius:13px;
  padding:13px;
  background:#fff;
  font-weight:1000
}
/* ================= INVENTORY ================= */
.inventory-tools{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:8px;
  margin-bottom:10px
}
.inventory-filter{
  border:1px solid #303c4b;
  background:#171f2a;
  color:#fff;
  border-radius:12px;
  padding:11px;
  font-weight:900
}
.sell-all{
  border:0;
  background:#fff;
  color:#000;
  border-radius:12px;
  padding:11px;
  font-weight:1000
}
.inventory-grid{
  display:grid;
  grid-template-columns:repeat(4,minmax(0,1fr));
  gap:7px
}
.item{
  background:#111720;
  border:1px solid #263140;
  border-radius:14px;
  padding:7px;
  min-width:0
}
.item-img{
  height:76px;
  border-radius:10px;
  background:#202a36;
  display:grid;
  place-items:center;
  font-size:29px
}
.item-name{
  font-weight:900;
  margin-top:7px;
  font-size:11px;
  line-height:1.15;
  min-height:26px
}
.item-price{
  margin-top:4px;
  font-weight:900;
  font-size:11px
}
.sell{
  width:100%;
  margin-top:7px;
  border:0;
  border-radius:8px;
  padding:7px 2px;
  background:#fff;
  color:#000;
  font-size:10px;
  font-weight:900
}
.common{color:#bfc5cc}
.rare{color:#4d8dff}
.superrare{color:#46d8ff}
.epic{color:#b86cff}
.mythic{color:#ff4545}
.legendary{color:#ffd21f}
/* ================= UPGRADE ================= */
.upgrade-shell{margin-top:10px;background:linear-gradient(180deg,#151d27,#0d131b);border:1px solid #2b3745;border-radius:24px;padding:14px;box-shadow:0 18px 55px rgba(0,0,0,.24)}
.upgrade-top{display:flex;justify-content:space-between;align-items:center;margin-bottom:12px}.upgrade-badge{font-size:12px;color:#8d9aac}.upgrade-badge b{color:#fff}.upgrade-grid{display:grid;grid-template-columns:1fr 42px 1fr;gap:8px;align-items:center}.upgrade-slot{min-height:180px;border:1px solid #303d4d;border-radius:18px;background:linear-gradient(145deg,#111923,#0a0f15);display:flex;flex-direction:column;align-items:center;justify-content:center;padding:12px;text-align:center}.upgrade-slot.target{border-color:#465668}.upgrade-slot .slot-icon{font-size:58px;line-height:1;margin-bottom:10px}.upgrade-slot .slot-name{font-size:13px;font-weight:900}.upgrade-slot .slot-value{font-size:11px;color:#7f8b9b;margin-top:5px}.upgrade-arrow{width:42px;height:42px;border-radius:50%;background:#1b2632;border:1px solid #344252;display:grid;place-items:center;font-size:20px;color:#ffd84d;font-weight:1000}.selected-skins{display:grid;grid-template-columns:repeat(3,1fr);gap:7px;margin-top:10px}.selected-skin{border:1px solid #2e3a48;background:#111923;border-radius:12px;padding:8px;text-align:center}.selected-skin span{display:block;font-size:27px}.selected-skin b{display:block;font-size:10px;margin-top:4px}.selected-skin small{color:#8c98a8;font-size:9px}.selected-empty{min-height:72px;display:grid;place-items:center;border:1px dashed #334151;border-radius:13px;color:#6f7c8d;font-size:11px;grid-column:1/-1}.chance-row{display:grid;grid-template-columns:repeat(3,1fr);gap:7px;margin-top:12px}.chance{border:1px solid #303c4b;background:#141c26;color:#fff;border-radius:12px;padding:11px 5px;font-weight:900;font-size:12px}.chance.active{border-color:#ffd84d;color:#ffd84d;box-shadow:0 0 16px rgba(255,216,77,.12)}.strength{margin-top:12px}.strength-title{display:flex;justify-content:space-between;color:#8995a6;font-size:11px;margin-bottom:5px}.strength-bar{height:9px;border-radius:10px;background:#202a35;overflow:hidden}.strength-fill{height:100%;width:20%;background:#ffd84d;transition:width .08s}.upgrade-button{width:100%;margin-top:13px;border:0;border-radius:15px;padding:14px;background:#fff;color:#080a0e;font-weight:1000}.upgrade-hint{text-align:center;color:#707d8e;font-size:10px;margin-top:8px}
/* ================= PROFILE ================= */
.profile-card{margin-top:16px;background:linear-gradient(145deg,#151e29,#0f151d);border:1px solid #2e3b4a;border-radius:23px;padding:18px}.profile-head{display:flex;align-items:center;gap:13px}.avatar{width:62px;height:62px;border-radius:18px;background:#202b38;display:grid;place-items:center;font-size:30px;overflow:hidden}.avatar img{width:100%;height:100%;object-fit:cover}.profile-name{font-size:20px;font-weight:1000}.profile-id{color:#748092;font-size:11px;margin-top:3px}.rank{margin-left:auto;text-align:right}.rank small{display:block;color:#758194;font-size:9px}.rank b{color:#ffd84d;font-size:12px}.xp{margin-top:15px}.xp-top{display:flex;justify-content:space-between;color:#8995a6;font-size:10px;margin-bottom:5px}.xp-bar{height:9px;background:#202a35;border-radius:10px;overflow:hidden}.xp-fill{height:100%;background:#ffd84d;width:0;transition:width .3s}.stats{display:grid;grid-template-columns:repeat(3,1fr);gap:7px;margin-top:13px}.stat{background:#111923;border:1px solid #2b3745;border-radius:14px;padding:10px;text-align:center}.stat b{display:block;font-size:16px}.stat span{color:#748092;font-size:9px;margin-top:3px;display:block}.leaderboard{margin-top:10px}.admin-button{width:100%;margin-top:10px;border:1px solid #344252;background:#151e29;color:#fff;border-radius:13px;padding:11px;font-weight:900}.admin-modal{position:fixed;inset:0;background:rgba(0,0,0,.86);display:none;align-items:center;justify-content:center;z-index:150}.admin-modal.show{display:flex}.admin-window{width:min(470px,94%);max-height:85vh;overflow:auto;background:#10161e;border:1px solid #303c4c;border-radius:23px;padding:16px}.admin-row{display:flex;align-items:center;gap:6px;border-bottom:1px solid #283442;padding:10px 0}.admin-row span{flex:1;font-size:11px}.admin-row button{border:1px solid #344252;background:#171f2a;color:#fff;border-radius:9px;padding:7px;font-size:10px}.admin-input{width:100%;margin-top:7px;border:1px solid #303c4b;background:#111923;color:#fff;border-radius:10px;padding:10px;outline:none}.admin-create{width:100%;border:0;background:#fff;color:#000;border-radius:11px;padding:11px;margin-top:8px;font-weight:900}
/* ================= EARN ================= */
.earn-card{margin-top:16px}.energy{display:flex;align-items:center;justify-content:space-between;background:#151e29;border:1px solid #2d3948;border-radius:15px;padding:13px}.energy b{color:#7dd7ff}.coin-zone{margin-top:14px;min-height:230px;border-radius:21px;border:1px solid #2f3c4b;background:radial-gradient(circle at center,#253344,#111821 58%,#0c1117);display:grid;place-items:center;position:relative;overflow:hidden}.big-coin{width:150px;height:150px;border-radius:50%;border:6px solid #f1b91e;background:radial-gradient(circle at 35% 30%,#ffe78a,#ffc928 38%,#d28b00 100%);box-shadow:0 20px 60px rgba(255,200,40,.2),inset 0 0 0 8px rgba(255,255,255,.15);display:grid;place-items:center;font-size:68px;user-select:none;touch-action:none}.big-coin:active{transform:scale(.94)}.float-coin{position:fixed;z-index:300;color:#ffd84d;font-weight:1000;pointer-events:none;animation:coinfloat .8s ease-out forwards}@keyframes coinfloat{from{opacity:1;transform:translateY(0) scale(1)}to{opacity:0;transform:translateY(-65px) scale(1.2)}}.ref-card{margin-top:12px}.ref-link{font-size:10px;color:#7e8a9b;word-break:break-all;background:#0e141c;border-radius:10px;padding:10px;margin-top:8px}.copy-ref{width:100%;border:0;background:#fff;color:#000;border-radius:11px;padding:11px;margin-top:8px;font-weight:900}.earn-note{color:#778496;font-size:10px;line-height:1.5;margin-top:10px}
/* ================= DAILY ================= */
.daily{margin-top:12px}.days{display:grid;grid-template-columns:repeat(7,1fr);gap:5px;margin-top:10px}.day{background:#161f2a;border:1px solid #2b3745;border-radius:10px;padding:7px 2px;text-align:center;font-size:9px;color:#778496}.day b{display:block;color:#fff;font-size:10px;margin-top:3px}.day.today{border-color:#ffd84d;color:#ffd84d}.day.claimed{opacity:.45}.claim-daily{width:100%;margin-top:9px;border:0;background:#fff;color:#000;border-radius:12px;padding:12px;font-weight:1000}.daily-status{text-align:center;color:#778496;font-size:10px;margin-top:7px}
/* ================= TOPUP ================= */
.topup-window{width:min(420px,92%);background:#111821;border:1px solid #303c4c;border-radius:22px;padding:18px}.topup-grid{display:grid;gap:8px;margin-top:12px}.topup-option{border:1px solid #303c4b;background:#171f2a;color:#fff;border-radius:13px;padding:13px;text-align:left}.topup-option b{color:#ffd84d}.topup-close{width:100%;border:0;background:#fff;color:#000;border-radius:12px;padding:12px;margin-top:10px;font-weight:900}
/* ================= BOTTOM ================= */
.bottom{
  position:fixed;
  left:50%;
  bottom:0;
  transform:translateX(-50%);
  width:min(100%,480px);
  height:76px;
  background:rgba(10,14,20,.96);
  border-top:1px solid #202b38;
  backdrop-filter:blur(18px);
  display:grid;
  grid-template-columns:repeat(5,1fr);
  z-index:50
}
.bottom button{
  border:0;
  background:none;
  color:#667384;
  display:flex;
  flex-direction:column;
  align-items:center;
  justify-content:center;
  gap:5px;
  font-size:10px
}
.bottom button span{
  font-size:21px
}
.bottom button.active{
  color:#fff
}
.dot{
  width:6px;
  height:6px;
  border-radius:50%;
  background:#ff4b4b;
  position:absolute;
  top:7px;
  margin-left:24px
}
/* ================= MODALS ================= */
.confirm-window{
  width:min(400px,90%);
  background:#111821;
  border:1px solid #303c4c;
  border-radius:21px;
  padding:19px
}
.confirm-window h3{
  font-size:19px;
  margin-bottom:8px
}
.confirm-window p{
  color:#8995a6;
  font-size:13px;
  line-height:1.45
}
.confirm-actions{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:8px;
  margin-top:15px
}
.confirm-actions button{
  border-radius:12px;
  padding:11px;
  border:1px solid #303c4c
}
.cancel{
  background:#171f2a;
  color:#fff
}
.yes{
  background:#fff;
  color:#000;
  font-weight:900
}
.win-modal{
  position:fixed;
  inset:0;
  display:none;
  align-items:center;
  justify-content:center;
  background:rgba(0,0,0,.88);
  z-index:200
}
.win-modal.show{
  display:flex
}
.win-window{
  width:min(390px,90%);
  text-align:center;
  background:linear-gradient(145deg,#192433,#0e141b);
  border:1px solid #3a4858;
  border-radius:25px;
  padding:28px 20px
}
.win-icon{
  width:110px;
  height:110px;
  border-radius:25px;
  margin:auto;
  display:grid;
  place-items:center;
  background:#263343;
  font-size:60px;
  box-shadow:0 0 40px rgba(255,216,77,.15)
}
.win-name{
  font-size:22px;
  font-weight:1000;
  margin-top:15px
}
.win-rarity{
  margin-top:5px;
  color:#ffd84d;
  font-weight:900
}
.win-value{
  margin-top:10px;
  font-size:18px;
  font-weight:900
}
.win-actions{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:8px;
  margin-top:18px
}
.win-actions button{
  border-radius:12px;
  padding:12px;
  border:1px solid #344252
}
.take{
  background:#fff;
  color:#000;
  font-weight:1000
}
.sell-win{
  background:#171f2a;
  color:#fff
}
/* ================= TOAST ================= */
#toast{
  position:fixed;
  left:50%;
  bottom:88px;
  transform:translateX(-50%) translateY(15px);
  background:#fff;
  color:#000;
  border-radius:12px;
  padding:10px 15px;
  font-size:12px;
  font-weight:900;
  opacity:0;
  pointer-events:none;
  transition:.25s;
  z-index:400;
  max-width:90%;
  text-align:center
}
#toast.show{
  opacity:1;
  transform:translateX(-50%) translateY(0)
}
@media(max-width:360px){
  .inventory-grid{
    grid-template-columns:repeat(3,1fr)
  }
  .upgrade-grid{
    grid-template-columns:1fr 32px 1fr
  }
  .upgrade-arrow{
    width:32px;
    height:32px
  }
}
</style>
</head>
<body>
<div class="bubbles">
  <div class="bubble"></div>
  <div class="bubble"></div>
  <div class="bubble"></div>
  <div class="bubble"></div>
</div>

<div class="app">

<header>
  <div class="logo">
    <img src="oxide-avatar.jpeg" alt="OXIDE">
    <span>OXIDE:DROPS</span>
  </div>
  <div class="balance-area">
    <div class="balance">
      <span id="coins">250</span> 🪙
    </div>
    <button class="plus-balance" onclick="openTopup()">+</button>
  </div>
</header>

<!-- HOME -->
<section id="home" class="page">
  <div class="hero">
    <img class="hero-logo" src="oxide-avatar.jpeg" alt="OXIDE">
    <small>OXIDE:DROPS</small>
    <h1>Кейсы и награды</h1>
    <p>
      Открывай кейсы, получай предметы,
      собирай инвентарь и улучшай свои скины.
    </p>
  </div>

  <div class="home-tools">
    <input
      id="homeSearch"
      class="search"
      placeholder="Поиск..."
      oninput="renderHomeItems()"
    >
    <button class="filter-button" onclick="openHomeFilter()">
      Фильтр
    </button>
  </div>

  <div id="homeFilterText" class="active-filter">
    Показываются: всё
  </div>

  <div class="title">Кейсы</div>

  <div id="homeItems" class="cases"></div>
</section>

<!-- INVENTORY -->
<section id="inventory" class="page hidden">
  <div class="page-brand">
    <img src="oxide-avatar.jpeg" alt="OXIDE">
    <div class="page-brand-name">Мой инвентарь</div>
  </div>

  <div class="title">Предметы</div>

  <div class="inventory-tools">
    <button
      class="inventory-filter"
      onclick="setInventoryFilter('all')"
    >
      Все
    </button>
    <button
      class="sell-all"
      onclick="sellSelected()"
    >
      Продать выбранные
    </button>
  </div>

  <div id="inventoryItems" class="inventory-grid"></div>
</section>

<!-- UPGRADE -->
<section id="upgrade" class="page hidden">
  <div class="title">Улучшение</div>

  <div class="upgrade-shell">
    <div class="upgrade-top">
      <div class="upgrade-badge">
        Выбери предметы
      </div>
      <div class="upgrade-badge">
        Шанс: <b id="upgradeChanceText">75%</b>
      </div>
    </div>

    <div class="upgrade-grid">
      <div class="upgrade-slot">
        <div class="slot-icon">📦</div>
        <div class="slot-name">Твои предметы</div>
        <div class="slot-value">до 3 предметов</div>
      </div>

      <div class="upgrade-arrow">→</div>

      <div class="upgrade-slot target">
        <div class="slot-icon">🎁</div>
        <div class="slot-name">Результат</div>
        <div class="slot-value">увеличенная стоимость</div>
      </div>
    </div>

    <div id="selectedSkins" class="selected-skins"></div>

    <div class="chance-row">
      <button
        class="chance active"
        data-chance="75"
        onclick="selectChance(75)"
      >
        75%
      </button>
      <button
        class="chance"
        data-chance="50"
        onclick="selectChance(50)"
      >
        50%
      </button>
      <button
        class="chance"
        data-chance="30"
        onclick="selectChance(30)"
      >
        30%
      </button>
    </div>

    <div class="strength">
      <div class="strength-title">
        <span>Сила улучшения</span>
        <span id="strengthText">20%</span>
      </div>

      <div class="strength-bar">
        <div id="strengthBar" class="strength-fill"></div>
      </div>
    </div>

    <button
      class="upgrade-button"
      onpointerdown="startStrength()"
      onpointerup="stopStrength()"
      onpointercancel="stopStrength()"
      onpointerleave="stopStrength()"
    >
      УДЕРЖИВАЙ ДЛЯ УЛУЧШЕНИЯ
    </button>

    <div class="upgrade-hint">
      Чем дольше держишь, тем выше сила улучшения.
    </div>
  </div>
</section>

<!-- PROFILE -->
<section id="profile" class="page hidden">
  <div class="title">Профиль</div>

  <div class="profile-card">
    <div class="profile-head">
      <div id="avatar" class="avatar">👤</div>

      <div>
        <div id="profileName" class="profile-name">
          Игрок
        </div>

        <div id="telegramId" class="profile-id">
          Telegram ID: не определён
        </div>
      </div>

      <div class="rank">
        <small>РАНГ</small>
        <b id="profileRank">Новичок</b>
      </div>
    </div>

    <div class="xp">
      <div class="xp-top">
        <span>Опыт</span>
        <span id="xpText">0 / 140 HP</span>
      </div>

      <div class="xp-bar">
        <div id="xpBar" class="xp-fill"></div>
      </div>
    </div>

    <div class="stats">
      <div class="stat">
        <b id="statOpen">0</b>
        <span>Кейсов</span>
      </div>

      <div class="stat">
        <b id="statUpgrade">0</b>
        <span>Улучшений</span>
      </div>

      <div class="stat">
        <b id="statFriends">0</b>
        <span>Друзей</span>
      </div>
    </div>

    <div class="title" style="margin-top:18px;font-size:16px">
      Таблица лидеров
    </div>

    <div id="leaderboard" class="leaderboard"></div>

    <button
      id="adminButton"
      class="admin-button hidden"
      onclick="openAdmin()"
    >
      ⚙️ Админ-панель
    </button>
  </div>

  <div class="daily">
    <div class="title">Ежедневная награда</div>

    <div id="dailyBox" class="days"></div>

    <button
      id="claimDailyButton"
      class="claim-daily"
      onclick="claimDaily()"
    >
      ЗАБРАТЬ ПОДАРОК
    </button>

    <div id="dailyStatus" class="daily-status"></div>
  </div>
</section>

<!-- EARN -->
<section id="earn" class="page hidden">
  <div class="title">Заработок</div>

  <div class="card earn-card">
    <div class="energy">
      <span>Энергия</span>
      <b><span id="energy">100</span> / 100 ⚡</b>
    </div>

    <div class="coin-zone">
      <div id="bigCoin" class="big-coin">
        🪙
      </div>
    </div>

    <div class="earn-note">
      Нажимай на монету и получай монеты.
      За каждое нажатие расходуется 1 энергия.
    </div>
  </div>

  <div class="card ref-card">
    <b>Приглашай друзей</b>

    <div
      id="refLink"
      class="ref-link"
    ></div>

    <button
      class="copy-ref"
      onclick="copyReferral()"
    >
      СКОПИРОВАТЬ ССЫЛКУ
    </button>
  </div>
</section>

</div>

<!-- BOTTOM NAV -->
<nav class="bottom">
  <button
    class="active"
    onclick="showPage('home',this)"
  >
    <span>🏠</span>
    Главная
  </button>

  <button
    onclick="showPage('inventory',this)"
  >
    <span>🎒</span>
    Инвентарь
  </button>

  <button
    onclick="showPage('upgrade',this)"
  >
    <span>⚡</span>
    Улучшить
  </button>

  <button
    onclick="showPage('earn',this)"
  >
    <span>🪙</span>
    Заработок
  </button>

  <button
    onclick="showPage('profile',this)"
  >
    <span>👤</span>
    Профиль
    <i id="dailyDot" class="dot"></i>
  </button>
</nav>

<!-- CONFIRM -->
<div id="confirmModal" class="confirm-modal">
  <div class="confirm-window">
    <h3 id="confirmTitle">Подтверждение</h3>

    <p id="confirmText"></p>

    <div class="confirm-actions">
      <button
        class="cancel"
        onclick="closeConfirm()"
      >
        Отмена
      </button>

      <button
        id="confirmYes"
        class="yes"
      >
        Продолжить
      </button>
    </div>
  </div>
</div>

<!-- WIN -->
<div id="winModal" class="win-modal">
  <div class="win-window">
    <div id="winIcon" class="win-icon">🎁</div>

    <div id="winName" class="win-name">
      Предмет
    </div>

    <div id="winRarity" class="win-rarity">
      Редкий
    </div>

    <div id="winValue" class="win-value">
      50 🪙
    </div>

    <div class="win-actions">
      <button
        class="sell-win"
        onclick="sellWin()"
      >
        Продать
      </button>

      <button
        class="take"
        onclick="takeWin()"
      >
        Забрать
      </button>
    </div>
  </div>
</div>

<!-- HOME FILTER -->
<div id="homeFilterModal" class="home-filter-modal">
  <div class="confirm-window">
    <h3>Фильтр</h3>

    <div class="topup-grid">
      <button
        class="topup-option"
        onclick="setHomeFilter('all')"
      >
        Всё
      </button>

      <button
        class="topup-option"
        onclick="setHomeFilter('cases')"
      >
        📦 Кейсы
      </button>

      <button
        class="topup-option"
        onclick="setHomeFilter('sets')"
      >
        🎁 Наборы
      </button>

      <button
        class="topup-close"
        onclick="closeHomeFilter()"
      >
        Закрыть
      </button>
    </div>
  </div>
</div>

<!-- TOPUP -->
<div id="topupModal" class="topup-modal">
  <div class="topup-window">
    <h3>Пополнение</h3>

    <div class="topup-grid">
      <button
        class="topup-option"
        onclick="visualTopup(90,15)"
      >
        ⭐ 15 Stars →
        <b>90 🪙</b>
      </button>

      <button
        class="topup-option"
        onclick="visualTopup(320,50)"
      >
        ⭐ 50 Stars →
        <b>320 🪙</b>
      </button>

      <button
        class="topup-option"
        onclick="visualTopup(720,100)"
      >
        ⭐ 100 Stars →
        <b>720 🪙</b>
      </button>
    </div>

    <button
      class="topup-close"
      onclick="closeTopup()"
    >
      Закрыть
    </button>
  </div>
</div>

<!-- ADMIN -->
<div id="adminModal" class="admin-modal">
  <div class="admin-window">
    <h3>⚙️ Админ-панель</h3>

    <input
      id="promoCode"
      class="admin-input"
      placeholder="Промокод"
    >

    <input
      id="promoReward"
      class="admin-input"
      type="number"
      placeholder="Награда"
    >

    <input
      id="promoLimit"
      class="admin-input"
      type="number"
      value="1"
      placeholder="Лимит"
    >

    <button
      class="admin-create"
      onclick="createPromo()"
    >
      Создать промокод
    </button>

    <div
      id="promoList"
      style="margin-top:12px"
    ></div>

    <button
      class="topup-close"
      onclick="closeAdmin()"
    >
      Закрыть
    </button>
  </div>
</div>

<div id="toast"></div>

<script src="https://telegram.org/js/telegram-web-app.js"></script>
<script>
/* =========================================================
   CONFIG
========================================================= */
const STORAGE_VERSION="v8";
const ADMIN_IDS=[
  "000000000"
];

/* =========================================================
   RARITIES
========================================================= */
const RARITIES=[
  {
    name:"Обычный",
    icon:"⚪",
    value:25,
    className:"common"
  },
  {
    name:"Редкий",
    icon:"🔵",
    value:40,
    className:"rare"
  },
  {
    name:"Сверхредкий",
    icon:"🔷",
    value:60,
    className:"superrare"
  },
  {
    name:"Эпический",
    icon:"🟣",
    value:85,
    className:"epic"
  },
  {
    name:"Мифический",
    icon:"🔴",
    value:100,
    className:"mythic"
  },
  {
    name:"Легендарный",
    icon:"🟡",
    value:125,
    className:"legendary"
  }
];

/* =========================================================
   RANKS
========================================================= */
const ranks=[
  {
    name:"Новичок",
    hp:0
  },
  {
    name:"Рядовой",
    hp:140
  },
  {
    name:"Сержант",
    hp:550
  },
  {
    name:"Лудаман младший",
    hp:1000
  },
  {
    name:"Лудаман",
    hp:1600
  },
  {
    name:"Лудаман Старший",
    hp:2200
  },
  {
    name:"Полковник Лудаман",
    hp:3000
  },
  {
    name:"Генерал",
    hp:4200
  },
  {
    name:"Профессионал",
    hp:5000
  },
  {
    name:"Легенда симулятора",
    hp:10000
  }
];

/* =========================================================
   CASE DATA
========================================================= */
const ITEMS=[
  {
    id:"frost",
    name:"Морозный ужас",
    icon:"❄️",
    price:40,
    type:"set",
    category:"set"
  },
  {
    id:"hell",
    name:"Адское пламя",
    icon:"🔥",
    price:50,
    type:"case",
    category:"weapon"
  },
  {
    id:"modern",
    name:"Эпоха современности",
    icon:"🤖",
    price:30,
    type:"set",
    category:"set"
  },
  {
    id:"weapon",
    name:"Оружейный ящик",
    icon:"🔫",
    price:35,
    type:"case",
    category:"weapon"
  },
  {
    id:"graffiti",
    name:"Граффити Rush",
    icon:"🎨",
    price:25,
    type:"case",
    category:"graffiti"
  },
  {
    id:"armor",
    name:"Броневой кейс",
    icon:"🛡️",
    price:45,
    type:"case",
    category:"armor"
  },
  {
    id:"soon",
    name:"Новый кейс",
    icon:"🔒",
    price:0,
    type:"case",
    category:"soon",
    soon:true
  }
];

/* =========================================================
   STATE
========================================================= */
const state={
  coins:250,
  hp:0,
  casesOpened:0,
  upgrades:0,
  friends:0,
  inventory:[],
  selectedItems:[],
  dailyClaimed:false,
  energy:100,
  lastEnergyDate:"",
  homeFilter:"all",
  caseCategory:"weapon"
};

/* =========================================================
   RUNTIME
========================================================= */
let selectedChance=75;
let strength=20;
let holding=false;
let strengthTimer=null;
let caseOpening=false;
let upgradeRunning=false;
let pendingConfirm=null;
let inventoryFilter="all";
let currentWinningItem=null;

/* =========================================================
   TELEGRAM
========================================================= */
function getTelegramUser(){
  return (
    window.Telegram?.WebApp
      ?.initDataUnsafe?.user
  ) || null;
}

function getTelegramId(){
  const user=
    getTelegramUser();

  return user?.id
    ? String(user.id)
    : "guest";
}

/* =========================================================
   STORAGE RESET
========================================================= */
function load(){
  const version=
    localStorage.getItem(
      "oxideDropsStorageVersion"
    );

  /*
    Новый version специально изменён.
    Поэтому старые данные этого сайта
    больше не используются.
  */

  if(version!==STORAGE_VERSION){
    localStorage.removeItem(
      "oxideDropsState"
    );

    localStorage.setItem(
      "oxideDropsStorageVersion",
      STORAGE_VERSION
    );

    return;
  }

  const saved=
    localStorage.getItem(
      "oxideDropsState"
    );

  if(!saved)
    return;

  try{
    const data=
      JSON.parse(saved);

    Object.assign(
      state,
      data
    );

    state.selectedItems=[];

    state.inventory=
      Array.isArray(state.inventory)
        ? state.inventory
        : [];

  }catch(e){
    console.log(e);
  }
}

function save(){
  localStorage.setItem(
    "oxideDropsState",
    JSON.stringify(state)
  );
}

/* =========================================================
   TOAST
========================================================= */
function toast(text){
  const el=
    document.getElementById("toast");

  el.textContent=text;

  el.classList.add("show");

  setTimeout(()=>{
    el.classList.remove("show");
  },2200);
}

/* =========================================================
   PAGE NAVIGATION
========================================================= */
function showPage(id,button){
  if(caseOpening || upgradeRunning)
    return;

  document
    .querySelectorAll(".page")
    .forEach(p=>{
      p.classList.add("hidden");
    });

  document
    .getElementById(id)
    .classList.remove("hidden");

  document
    .querySelectorAll(".bottom button")
    .forEach(b=>{
      b.classList.remove("active");
    });

  button.classList.add("active");

  if(id==="home")
    renderHomeItems();

  if(id==="inventory")
    renderInventory();

  if(id==="upgrade")
    renderSelectedSkins();

  if(id==="profile")
    renderProfile();

  if(id==="earn")
    renderEarn();
}

/* =========================================================
   RANK
========================================================= */
function getRank(){
  let rank=
    ranks[0];

  for(const r of ranks){
    if(state.hp>=r.hp)
      rank=r;
  }

  return rank;
}

/* =========================================================
   MAIN RENDER
========================================================= */
function render(){
  document
    .getElementById("coins")
    .textContent=
    state.coins.toLocaleString("ru-RU");

  renderHomeItems();
  renderInventory();
  renderProfile();
  renderDaily();
  updateDailyMarker();
  renderSelectedSkins();
  renderEarn();
  renderWinFeed();

  save();
}

/* =========================================================
   HOME
========================================================= */
function openHomeFilter(){
  document
    .getElementById("homeFilterModal")
    .classList.add("show");
}

function closeHomeFilter(){
  document
    .getElementById("homeFilterModal")
    .classList.remove("show");
}

function setHomeFilter(filter){
  state.homeFilter=filter;
  closeHomeFilter();
  renderHomeItems();
}

function renderHomeItems(){
  const container=
    document.getElementById("homeItems");

  const search=
    document
      .getElementById("homeSearch")
      ?.value
      .trim()
      .toLowerCase() || "";

  let list=
    ITEMS.filter(item=>{

      if(state.homeFilter==="cases" &&
         item.type!=="case")
        return false;

      if(state.homeFilter==="sets" &&
         item.type!=="set")
        return false;

      if(search &&
        !item.name
          .toLowerCase()
          .includes(search))
        return false;

      return true;
    });

  document
    .getElementById("homeFilterText")
    .textContent=
      state.homeFilter==="all"
        ? "Показываются: всё"
        : state.homeFilter==="cases"
        ? "Показываются: кейсы"
        : "Показываются: наборы";

  if(!list.length){
    container.innerHTML=`
      <div class="card"
        style="text-align:center">
        🔎 Ничего не найдено
      </div>
    `;
    return;
  }

  container.innerHTML=
    list.map(item=>`
      <div class="case">
        <div class="case-icon">
          ${item.icon}
        </div>

        <div class="case-info">
          <div class="case-name">
            ${item.name}
          </div>

          <div class="case-type">
            ${
              item.type==="set"
                ? "🎁 Набор"
                : item.soon
                ? "🔒 Скоро"
                : "📦 Кейc"
            }
          </div>

          <div class="case-price">
            ${
              item.soon
                ? "СКОРО"
                : `${item.price} 🪙`
            }
          </div>
        </div>

        <button
          class="open"
          ${item.soon ? "disabled" : ""}
          onclick="requestOpenCase('${item.id}')"
        >
          ${
            item.soon
              ? "Скоро"
              : "Открыть"
          }
        </button>
      </div>
    `).join("");
}

/* =========================================================
   CASE CONFIRM
========================================================= */
function requestOpenCase(id){
  const item=
    ITEMS.find(x=>x.id===id);

  if(!item || item.soon)
    return;

  if(caseOpening)
    return;

  if(state.coins<item.price){
    toast("Недостаточно монет");
    return;
  }

  openConfirm(
    "Открытие кейса",
    `Вы уверены, что хотите открыть «${item.name}» за ${item.price} 🪙?`,
    ()=>{
      closeConfirm();

      if(item.id==="weapon")
        openWeaponCase(item);
      else
        openCase(item);
    }
  );
}

/* =========================================================
   CONFIRM MODAL
========================================================= */
function openConfirm(title,text,yes){
  document
    .getElementById("confirmTitle")
    .textContent=title;

  document
    .getElementById("confirmText")
    .textContent=text;

  pendingConfirm=yes;

  document
    .getElementById("confirmYes")
    .onclick=()=>{
      if(pendingConfirm)
        pendingConfirm();
    };

  document
    .getElementById("confirmModal")
    .classList.add("show");
}

function closeConfirm(){
  pendingConfirm=null;

  document
    .getElementById("confirmModal")
    .classList.remove("show");
}

/* =========================================================
   RARITY RANDOM
========================================================= */
function getNormalRandomRarity(){
  const roll=
    Math.random()*100;

  if(roll<55)
    return RARITIES[0];

  if(roll<75)
    return RARITIES[1];

  if(roll<88)
    return RARITIES[2];

  if(roll<96)
    return RARITIES[3];

  if(roll<99)
    return RARITIES[4];

  return RARITIES[5];
}

/* =========================================================
   WEAPON RARITY
========================================================= */
const WEAPON_RARITIES=[
  {
    ...RARITIES[0],
    chance:52
  },
  {
    ...RARITIES[1],
    chance:28
  },
  {
    ...RARITIES[2],
    chance:12
  },
  {
    ...RARITIES[3],
    chance:5
  },
  {
    ...RARITIES[4],
    chance:2
  },
  {
    ...RARITIES[5],
    chance:1
  }
];

function getWeaponRarity(){
  const roll=
    Math.random()*100;

  let sum=0;

  for(const r of WEAPON_RARITIES){
    sum+=r.chance;

    if(roll<sum)
      return r;
  }

  return WEAPON_RARITIES[0];
}

/* =========================================================
   CASE OPEN
========================================================= */
function openCase(item){
  if(caseOpening)
    return;

  if(state.coins<item.price){
    toast("Недостаточно монет");
    return;
  }

  caseOpening=true;

  state.coins-=item.price;
  state.casesOpened++;

  render();

  const rarity=
    getNormalRandomRarity();

  const win={
    name:item.name,
    icon:item.icon,
    rarity:rarity.name,
    value:rarity.value,
    className:rarity.className
  };

  currentWinningItem=win;

  openWinModal(win);
}

function openWeaponCase(item){
  if(caseOpening)
    return;

  if(state.coins<item.price){
    toast("Недостаточно монет");
    return;
  }

  caseOpening=true;

  state.coins-=item.price;
  state.casesOpened++;

  render();

  const rarity=
    getWeaponRarity();

  const win={
    name:rarity.name,
    icon:rarity.icon,
    rarity:rarity.name,
    value:rarity.value,
    className:rarity.className
  };

  currentWinningItem=win;

  openWinModal(win);
}

/* =========================================================
   WIN MODAL
========================================================= */
function openWinModal(win){
  document
    .getElementById("winIcon")
    .textContent=win.icon;

  document
    .getElementById("winName")
    .textContent=win.name;

  document
    .getElementById("winRarity")
    .textContent=win.rarity;

  document
    .getElementById("winValue")
    .textContent=
    `${win.value} 🪙`;

  document
    .getElementById("winModal")
    .classList.add("show");
}

function closeWinModal(){
  document
    .getElementById("winModal")
    .classList.remove("show");

  caseOpening=false;
  currentWinningItem=null;
}

function takeWin(){
  if(!currentWinningItem)
    return;

  state.inventory.push({
    ...currentWinningItem,
    id:Date.now()+"_"+Math.random()
  });

  state.hp+=currentWinningItem.value;

  render();

  closeWinModal();

  toast(
    `Получено: ${currentWinningItem.name}`
  );
}

function sellWin(){
  if(!currentWinningItem)
    return;

  state.coins+=
    currentWinningItem.value;

  render();

  closeWinModal();

  toast(
    `Продано за ${currentWinningItem.value} 🪙`
  );
}

/* =========================================================
   INVENTORY
========================================================= */
function renderInventory(){
  const container=
    document.getElementById(
      "inventoryItems"
    );

  if(!container)
    return;

  let list=
    state.inventory.filter(item=>{

      if(inventoryFilter==="all")
        return true;

      if(inventoryFilter==="weapon")
        return item.category==="weapon";

      if(inventoryFilter==="set")
        return item.category==="set";

      return true;
    });

  if(!list.length){
    container.innerHTML=`
      <div class="card"
        style="text-align:center">
        Инвентарь пуст
      </div>
    `;
    return;
  }

  container.innerHTML=
    list.map(item=>`
      <div class="item">
        <div class="item-img">
          ${item.icon}
        </div>

        <div class="item-name">
          ${escapeHtml(item.name)}
        </div>

        <div class="item-price">
          ${Number(item.value||0)} 🪙
        </div>

        <button
          class="sell"
          onclick="sellItem('${item.id}')"
        >
          ПРОДАТЬ
        </button>
      </div>
    `).join("");
}

function setInventoryFilter(filter){
  inventoryFilter=filter;
  renderInventory();
}

function sellItem(id){
  const index=
    state.inventory.findIndex(
      x=>String(x.id)===String(id)
    );

  if(index<0)
    return;

  const item=
    state.inventory[index];

  state.coins+=
    Number(item.value||0);

  state.inventory.splice(
    index,
    1
  );

  state.selectedItems=
    state.selectedItems.filter(
      x=>String(x.id)!==String(id)
    );

  render();

  toast(
    `Продано за ${item.value} 🪙`
  );
}

function sellSelected(){
  if(!state.selectedItems.length){
    toast("Ничего не выбрано");
    return;
  }

  let total=0;

  state.selectedItems.forEach(item=>{
    total+=Number(item.value||0);

    const index=
      state.inventory.findIndex(
        x=>String(x.id)===String(item.id)
      );

    if(index>=0)
      state.inventory.splice(index,1);
  });

  state.coins+=total;
  state.selectedItems=[];

  render();

  toast(
    `Продано за ${total} 🪙`
  );
}

function selectInventoryItem(id){
  const item=
    state.inventory.find(
      x=>String(x.id)===String(id)
    );

  if(!item)
    return;

  if(
    state.selectedItems.some(
      x=>String(x.id)===String(id)
    )
  ){
    state.selectedItems=
      state.selectedItems.filter(
        x=>String(x.id)!==String(id)
      );
  }else{
    if(state.selectedItems.length>=3){
      toast("Можно выбрать максимум 3 предмета");
      return;
    }

    state.selectedItems.push(item);
  }

  renderSelectedSkins();
  renderInventory();
}

function renderSelectedSkins(){
  const box=
    document.getElementById(
      "selectedSkins"
    );

  if(!box)
    return;

  if(!state.selectedItems.length){
    box.innerHTML=`
      <div class="selected-empty">
        Выбери до 3 предметов
      </div>
    `;
    return;
  }

  box.innerHTML=
    state.selectedItems.map(item=>`
      <div class="selected-skin">
        <span>${item.icon}</span>
        <b>${escapeHtml(item.name)}</b>
        <small>${item.value} 🪙</small>
      </div>
    `).join("");
}

/* =========================================================
   UPGRADE
========================================================= */
function selectChance(chance){
  if(upgradeRunning)
    return;

  selectedChance=chance;

  document
    .querySelectorAll(".chance")
    .forEach(el=>{
      el.classList.toggle(
        "active",
        Number(el.dataset.chance)===chance
      );
    });

  document
    .getElementById("upgradeChanceText")
    .textContent=
    chance+"%";

  updateWheelVisual();
}

function updateWheelVisual(){
  const wheel=
    document.getElementById(
      "upgradeWheel"
    );

  if(!wheel)
    return;

  wheel.style.setProperty(
    "--chance",
    selectedChance+"%"
  );
}

function startStrength(){
  if(upgradeRunning)
    return;

  holding=true;
  strength=20;

  strengthTimer=setInterval(()=>{
    if(!holding)
      return;

    strength+=3;

    if(strength>=100)
      strength=20;

    const bar=
      document.getElementById(
        "strengthBar"
      );

    if(bar)
      bar.style.width=
        strength+"%";

    const text=
      document.getElementById(
        "strengthText"
      );

    if(text)
      text.textContent=
        strength+"%";

  },80);
}

function stopStrength(){
  if(!holding)
    return;

  holding=false;

  clearInterval(strengthTimer);

  performUpgrade();
}

function performUpgrade(){
  if(upgradeRunning)
    return;

  if(!state.selectedItems.length){
    toast("Выбери предметы для улучшения");
    return;
  }

  upgradeRunning=true;

  const total=
    state.selectedItems.reduce(
      (sum,x)=>sum+Number(x.value||0),
      0
    );

  const chanceRoll=
    Math.random()*100;

  const success=
    chanceRoll<selectedChance;

  const multiplier=
    success
      ? 1+(strength/100)*0.5
      : 0.5;

  const resultValue=
    Math.max(
      1,
      Math.round(total*multiplier)
    );

  setTimeout(()=>{
    if(success){
      state.coins+=resultValue;
      state.hp+=resultValue;
      state.upgrades++;

      toast(
        `🔥 Успех! +${resultValue} 🪙`
      );
    }else{
      toast(
        `💥 Неудача! Потеряно 50%`
      );
    }

    state.selectedItems=[];

    render();

    upgradeRunning=false;
  },1200);
}

/* =========================================================
   WIN FEED
========================================================= */
function renderWinFeed(){
  const el=
    document.getElementById(
      "winFeed"
    );

  if(!el)
    return;

  let feed=[];

  try{
    feed=
      JSON.parse(
        localStorage.getItem(
          "oxideWinFeed"
        ) || "[]"
      );
  }catch(e){}

  const demo=[
    {
      name:"Игрок",
      chance:75
    },
    {
      name:"rust_player",
      chance:30
    },
    {
      name:"OXIDE",
      chance:50
    },
    {
      name:"oxide",
      chance:33
    }
  ];

  const combined=
    [...feed,...demo];

  el.innerHTML=
    combined
      .map(x=>`
        <div class="win-pill">
          🔥 ${escapeHtml(x.name)}
          win ${x.chance}%
        </div>
      `)
      .join("");
}

function escapeHtml(text){
  return String(text)
    .replace(/&/g,"&amp;")
    .replace(/</g,"&lt;")
    .replace(/>/g,"&gt;")
    .replace(/"/g,"&quot;")
    .replace(/'/g,"&#039;");
}

/* =========================================================
   PROFILE
========================================================= */
function renderProfile(){
  const rank=
    getRank();

  const user=
    getTelegramUser();

  const avatar=
    document.getElementById(
      "avatar"
    );

  /*
    Аватар используется только здесь.
    В header его больше нет.
  */

  if(
    user?.photo_url
  ){
    avatar.innerHTML=`
      <img
        src="${user.photo_url}"
        alt="avatar"
      >
    `;
  }else{
    avatar.textContent="👤";
  }

  document
    .getElementById("profileName")
    .textContent=
    user?.first_name ||
    user?.username ||
    "Игрок";

  document
    .getElementById("telegramId")
    .textContent=
    `Telegram ID: ${user?.id || "не определён"}`;

  document
    .getElementById("profileRank")
    .textContent=
    rank.name;

  document
    .getElementById("statOpen")
    .textContent=
    state.casesOpened;

  document
    .getElementById("statUpgrade")
    .textContent=
    state.upgrades;

  document
    .getElementById("statFriends")
    .textContent=
    state.friends;

  renderLeaderboard();

  const adminButton=
    document.getElementById(
      "adminButton"
    );

  if(adminButton)
    adminButton.classList.toggle(
      "hidden",
      !isAdmin()
    );

  const nextIndex=
    ranks.indexOf(rank)+1;

  const next=
    ranks[nextIndex];

  if(next){
    document
      .getElementById("xpText")
      .textContent=
      `${state.hp} / ${next.hp} HP`;

    const previous=
      rank.hp;

    const percent=
      ((state.hp-previous)/
      (next.hp-previous))*100;

    document
      .getElementById("xpBar")
      .style.width=
      Math.max(
        0,
        Math.min(100,percent)
      )+"%";
  }else{
    document
      .getElementById("xpText")
      .textContent=
      `${state.hp} HP • МАКСИМАЛЬНЫЙ РАНГ`;

    /*
      После последнего ранга HP
      продолжает просто копиться.
    */

    document
      .getElementById("xpBar")
      .style.width="100%";
  }
}

/* =========================================================
   LEADERBOARD + ADMIN PROMOS
========================================================= */
function getLeaderboard(){
  let a=[];

  try{
    a=
      JSON.parse(
        localStorage.getItem(
          "oxideLeaderboard"
        )||"[]"
      );
  }catch(e){}

  const u=
    getTelegramUser();

  const me={
    id:String(u?.id||"local"),
    name:
      u?.username
        ? "@"+u.username
        : (u?.first_name||"Игрок"),
    hp:state.hp
  };

  const i=
    a.findIndex(
      x=>x.id===me.id
    );

  if(i>=0)
    a[i]=me;
  else
    a.push(me);

  a.sort(
    (x,y)=>y.hp-x.hp
  );

  a=a.slice(0,100);

  localStorage.setItem(
    "oxideLeaderboard",
    JSON.stringify(a)
  );

  return a;
}

function renderLeaderboard(){
  const el=
    document.getElementById(
      "leaderboard"
    );

  if(!el)
    return;

  const list=
    getLeaderboard();

  el.innerHTML=
    list.map((x,i)=>`
      <div
        style="
          display:flex;
          justify-content:space-between;
          align-items:center;
          padding:8px 4px;
          border-bottom:1px solid #202b38;
          font-size:12px
        "
      >
        <span>
          <b style="color:#ffd84d">
            #${i+1}
          </b>
          ${escapeHtml(x.name)}
        </span>

        <b>
          ${Number(x.hp||0).toLocaleString("ru-RU")} HP
        </b>
      </div>
    `).join("");
}

function isAdmin(){
  const id=
    getTelegramUser()?.id;

  return id &&
    ADMIN_IDS.includes(
      String(id)
    );
}

function getPromos(){
  try{
    return JSON.parse(
      localStorage.getItem(
        "oxidePromos"
      )||"[]"
    );
  }catch(e){
    return[];
  }
}

function savePromos(a){
  localStorage.setItem(
    "oxidePromos",
    JSON.stringify(a)
  );
}

function openAdmin(){
  if(!isAdmin()){
    toast("Нет доступа");
    return;
  }

  document
    .getElementById("adminModal")
    .classList.add("show");

  renderPromos();
}

function closeAdmin(){
  document
    .getElementById("adminModal")
    .classList.remove("show");
}

function createPromo(){
  if(!isAdmin())
    return;

  const code=
    document
      .getElementById("promoCode")
      .value
      .trim()
      .toUpperCase();

  const reward=
    Number(
      document
        .getElementById("promoReward")
        .value
    );

  const limit=
    Math.max(
      1,
      Number(
        document
          .getElementById("promoLimit")
          .value
      )||1
    );

  if(!code||!reward){
    toast("Заполни код и награду");
    return;
  }

  const a=
    getPromos();

  if(
    a.some(
      x=>x.code===code
    )
  ){
    toast(
      "Такой промокод уже есть"
    );
    return;
  }

  a.push({
    code,
    reward,
    limit,
    used:0,
    active:true
  });

  savePromos(a);

  document
    .getElementById("promoCode")
    .value="";

  document
    .getElementById("promoReward")
    .value="";

  renderPromos();

  toast(
    "Промокод создан"
  );
}

function renderPromos(){
  const el=
    document.getElementById(
      "promoList"
    );

  if(!el)
    return;

  const a=
    getPromos();

  el.innerHTML=
    a.length
      ? a.map((x,i)=>`
          <div class="admin-row">
            <span>
              <b>${escapeHtml(x.code)}</b>
              <br>
              ${x.reward} 🪙 • ${x.used}/${x.limit}
            </span>

            <button
              onclick="togglePromo(${i})"
            >
              ${x.active?"Выкл":"Вкл"}
            </button>

            <button
              onclick="deletePromo(${i})"
            >
              ✕
            </button>
          </div>
        `).join("")
      : `
        <div
          style="
            color:#687586;
            font-size:12px;
            padding:8px
          "
        >
          Промокодов пока нет
        </div>
      `;
}

function togglePromo(i){
  const a=
    getPromos();

  if(!a[i])
    return;

  a[i].active=
    !a[i].active;

  savePromos(a);

  renderPromos();
}

function deletePromo(i){
  const a=
    getPromos();

  a.splice(i,1);

  savePromos(a);

  renderPromos();
}

/* =========================================================
   DAILY
========================================================= */
const dailyRewards=[
  80,
  80,
  80,
  150,
  200,
  220,
  300
];

function renderDaily(){
  const box=
    document.getElementById(
      "dailyBox"
    );

  if(!box)
    return;

  box.innerHTML="";

  dailyRewards.forEach(
    (reward,index)=>{
      const div=
        document.createElement(
          "div"
        );

      div.className="day";

      if(state.dailyClaimed)
        div.classList.add(
          "claimed"
        );

      if(
        index===0 &&
        !state.dailyClaimed
      ){
        div.classList.add(
          "today"
        );
      }

      div.innerHTML=
        `Д${index+1}<b>${reward}</b>`;

      box.appendChild(div);
    }
  );

  const button=
    document.getElementById(
      "claimDailyButton"
    );

  const status=
    document.getElementById(
      "dailyStatus"
    );

  if(state.dailyClaimed){
    button.disabled=true;

    button.textContent=
      "ПОДАРОК ПОЛУЧЕН";

    status.textContent=
      "Сегодняшняя награда уже получена";
  }else{
    button.disabled=false;

    button.textContent=
      "ЗАБРАТЬ ПОДАРОК";

    status.textContent=
      "🎁 Тебе доступен подарок за вход";
  }
}

function updateDailyMarker(){
  const dot=
    document.getElementById(
      "dailyDot"
    );

  if(!dot)
    return;

  dot.style.display=
    state.dailyClaimed
      ? "none"
      : "block";
}

function claimDaily(){
  if(state.dailyClaimed){
    toast(
      "Подарок уже получен"
    );
    return;
  }

  const reward=
    dailyRewards[0];

  state.coins+=reward;

  state.dailyClaimed=true;

  render();

  toast(
    `🎁 Получено ${reward} 🪙`
  );
}

/* =========================================================
   EARN / ENERGY
========================================================= */
function todayKey(){
  const d=
    new Date();

  return [
    d.getFullYear(),
    d.getMonth()+1,
    d.getDate()
  ].join("-");
}

function loadEnergy(){
  const today=
    todayKey();

  if(
    state.lastEnergyDate!==today
  ){
    state.energy=100;

    state.lastEnergyDate=
      today;

    save();
  }
}

function renderEarn(){
  loadEnergy();

  const energy=
    document.getElementById(
      "energy"
    );

  if(energy)
    energy.textContent=
      state.energy;

  const link=
    document.getElementById(
      "refLink"
    );

  if(link){
    const id=
      getTelegramId();

    link.textContent=
      `https://t.me/OxideDropsBot?start=ref_${id}`;
  }
}

function earnCoin(event){
  if(state.energy<=0){
    toast(
      "⚡ Энергия закончилась"
    );
    return;
  }

  state.energy--;
  state.coins++;

  render();

  /*
    +1 появляется именно
    в месте нажатия.
  */

  const x=
    event.clientX;

  const y=
    event.clientY;

  const el=
    document.createElement(
      "div"
    );

  el.className=
    "float-coin";

  el.textContent="+1 🪙";

  el.style.left=
    x+"px";

  el.style.top=
    y+"px";

  document
    .body
    .appendChild(el);

  setTimeout(()=>{
    el.remove();
  },800);
}

function copyReferral(){
  const id=
    getTelegramId();

  const link=
    `https://t.me/OxideDropsBot?start=ref_${id}`;

  if(
    navigator.clipboard
  ){
    navigator.clipboard
      .writeText(link)
      .then(()=>{
        toast(
          "🔗 Реферальная ссылка скопирована"
        );
      });
  }else{
    toast(
      link
    );
  }
}

/* =========================================================
   TOPUP
========================================================= */
function openTopup(){
  document
    .getElementById("topupModal")
    .classList.add("show");
}

function closeTopup(){
  document
    .getElementById("topupModal")
    .classList.remove("show");
}

function visualTopup(
  coins,
  stars
){
  closeTopup();

  /*
    ВАЖНО:
    Деньги НЕ начисляются.
    Это пока только визуал.
  */

  toast(
    `${coins} 🪙 за ⭐ ${stars} — платежи пока отключены`
  );
}

/* =========================================================
   TELEGRAM INIT
========================================================= */
function initTelegram(){
  if(window.Telegram?.WebApp){
    Telegram.WebApp.ready();
    Telegram.WebApp.expand();
  }
}

/* =========================================================
   COIN BUTTON
========================================================= */
document
  .getElementById("bigCoin")
  .addEventListener(
    "pointerdown",
    earnCoin
  );

/* =========================================================
   INIT
========================================================= */
function init(){
  load();
  loadEnergy();
  initTelegram();
  updateWheelVisual();
  render();
  renderHomeItems();
  renderSelectedSkins();
  renderWinFeed();
}

init();
</script>
</body>
</html>
