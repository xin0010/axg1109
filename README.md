<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AXG 輔助商城</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;700;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --brand-primary: #a78bfa; /* violet-400 */
            --brand-secondary: #8b5cf6; /* violet-500 */
        }

        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #121212; /* Darker black */
            color: #d1d5db; /* gray-300 */
            -webkit-user-select: none;
            user-select: none;
        }

        .page {
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        main#main-content.is-transitioning {
            opacity: 0;
            transition: opacity 0.2s ease-in-out;
        }

        .neon-button {
            box-shadow: 0 0 8px var(--brand-secondary), 0 0 20px var(--brand-secondary) inset;
            transition: all 0.3s ease;
        }
        .neon-button:hover:not(:disabled) {
            box-shadow: 0 0 15px var(--brand-secondary), 0 0 40px var(--brand-secondary) inset, 0 0 10px var(--brand-secondary);
        }
        
        .tab-button.active {
            border-bottom: 2px solid var(--brand-primary);
            color: var(--brand-primary);
            background-color: rgba(167, 139, 250, 0.1);
        }

        #toast-notification {
            transition: transform 0.5s ease-in-out, opacity 0.5s ease-in-out;
        }

        .faq-question.open .faq-arrow {
            transform: rotate(180deg);
        }
        .faq-answer {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-in-out;
        }
        .faq-answer.open {
            max-height: 200px; 
        }
    </style>
</head>
<body class="bg-[#121212]">

    <!-- Announcement Modal -->
    <div id="announcement-modal" class="hidden fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
        <div class="bg-gray-800 border border-gray-700 rounded-lg shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col">
            <div class="flex justify-between items-center p-4 border-b border-gray-700">
                <h2 class="text-lg font-semibold text-white">⭐ 所有輔助｜商品頁 - 彈跳訊息/公告 ⭐</h2>
                <button id="close-modal-btn" class="text-gray-400 hover:text-white text-2xl transition-colors">&times;</button>
            </div>
            <div class="p-6 overflow-y-auto">
                <p class="mb-4 text-gray-300">歡迎來到AXG輔助商城！我們致力於提供最穩定、最安全的遊戲輔助，讓您輕鬆享受遊戲樂趣。以下是我們目前提供的遊戲輔助及其相關資訊：</p>
<ul class="space-y-3 list-inside text-sm">
    <li><span class="mr-2">🦆</span>鳴潮2.6｜AXG內部版最安全｜AXG一般版跟BS不建議大號使用</li>
    <li><span class="mr-2">⭐</span>星鐵3.5｜國際服安全｜陸服自身檢測機制嚴格，可能會封號</li>
    <li><span class="mr-2">🌐</span>絕區零2.2｜國際服安全｜陸服自體偵測嚴格機制，可能會封號</li>
    <li><span class="mr-2">ⓛ️</span>原神6.0｜全服拉閘｜要開請用小號｜注入就可能封號</li>
    <li><span class="mr-2">🛡️</span>英雄聯盟｜超級推薦ES｜近期拉閘，等待修復｜自帶過VAN152機器碼</li>
    <li><span class="mr-2">📩</span>購買私訊：
        <a href="https://www.instagram.com/axg_store" target="_blank" rel="noopener noreferrer" class="ml-2 text-violet-400 hover:underline">IG: @axg_store</a>
    </li>
</ul>
                <p class="mt-4 text-gray-300">請注意，使用遊戲輔助可能會違反遊戲的服務條款，並導致帳號被封禁。我們建議您在使用輔助前，先了解相關風險並謹慎操作。如有任何問題，歡迎隨時聯繫我們的客服團隊，我們將竭誠為您服務！祝您遊戲愉快！</p>
            </div>
        </div>
    </div>

    <!-- Header -->
     <header class="bg-gray-900/80 backdrop-blur-sm text-white sticky top-0 z-30 border-b border-gray-800">
        <div class="container mx-auto px-4 lg:px-6 py-4 flex justify-between items-center">
            <a href="index.html" class="flex items-center space-x-3">
                <img src="https://img.freepik.com/free-vector/cute-shiba-inu-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-4990.jpg?w=240" alt="AXG Logo" class="h-12 w-12 rounded-full object-cover">
                <span class="text-xl font-bold">AXG輔助商城</span>
            </a>

            <nav class="hidden md:flex items-center space-x-6">
                <a href="index.html" class="hover:text-violet-400 transition-colors">首頁</a>
                <a href="store.html" class="text-violet-400 font-semibold">輔助商城</a>
                <a href="#" class="hover:text-violet-400 transition-colors nav-link" data-page="faq">常見問題</a>
                <a href="#" class="hover:text-violet-400 transition-colors nav-link" data-page="contact">聯絡我們</a>
            </nav>

            <div class="flex items-center space-x-4">
                 <div class="relative hidden md:block">
                    <input id="search-input" type="text" placeholder="尋找遊戲..." class="w-40 bg-gray-800 border border-gray-700 rounded-full py-2 pl-4 pr-10 text-white placeholder-gray-400 focus:outline-none focus:w-60 focus:ring-2 focus:ring-violet-500 transition-all">
                    <button id="search-button" class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-white"><i class="fas fa-search"></i></button>
                </div>
                <div id="main-auth-buttons" class="flex items-center space-x-2">
                    <button id="login-button" class="bg-violet-500 hover:bg-violet-600 text-white px-4 py-2 rounded-full transition-colors neon-button">登入</button>
                    <button id="register-button" class="bg-gray-800 border border-violet-500 text-violet-400 px-4 py-2 rounded-full hover:bg-violet-500 hover:text-white transition-colors">註冊</button>
                </div>
                 <button class="bg-violet-500 hover:bg-violet-600 text-white p-3 rounded-full transition-colors flex items-center nav-link" data-page="cart">
                    <i class="fas fa-shopping-cart"></i>
                    <span id="cart-total-display-badge" class="ml-2 text-sm bg-violet-700 rounded-full h-5 w-5 flex items-center justify-center">0</span>
                </button>
                <button class="md:hidden text-gray-300 hover:text-white transition-colors text-2xl" id="mobile-menu-button" aria-label="開啟選單"><i class="fas fa-bars"></i></button>
            </div>
        </div>
        
        <div class="hidden md:hidden bg-gray-900/90" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1">
                 <a href="index.html" class="block px-3 py-2 rounded-md text-base font-medium text-white hover:bg-gray-700">首頁</a>
                 <a href="store.html" class="block px-3 py-2 rounded-md text-base font-medium text-white bg-gray-700">輔助商城</a>
                 <a href="#" class="block px-3 py-2 rounded-md text-base font-medium text-white hover:bg-gray-700 nav-link" data-page="faq">常見問題</a>
                 <a href="#" class="block px-3 py-2 rounded-md text-base font-medium text-white hover:bg-gray-700 nav-link" data-page="contact">聯絡我們</a>
                 <div class="relative mt-4 px-3">
                    <input id="mobile-search-input" type="text" placeholder="尋找遊戲..." class="w-full bg-gray-800 border border-gray-700 rounded-full py-2 pl-4 pr-10 text-white placeholder-gray-400">
                    <button id="mobile-search-button" class="absolute right-6 top-1/2 -translate-y-1/2 text-gray-400"><i class="fas fa-search"></i></button>
                </div>
            </div>
        </div>
    </header>

    <main id="main-content" class="transition-opacity duration-200">

        <!-- Page: Product Listing (PLP) -->
        <div id="page-plp" class="page">
            <div class="container mx-auto px-4 lg:px-6 py-12">
                <h1 class="text-4xl font-bold text-white mb-8">所有遊戲</h1>
                <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4 md:gap-6" id="plp-grid">
                    <!-- Product cards will be inserted by JS -->
                </div>
            </div>
        </div>

        <!-- Page: Product Detail (PDP) -->
        <div id="page-pdp" class="page hidden">
            <!-- PDP content will be generated by JS -->
        </div>

        <!-- Page: Download -->
        <div id="page-download" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-12">
                <h1 class="text-4xl font-bold text-white mb-8">輔助下載</h1>
                <div class="bg-gray-800/50 p-8 rounded-lg text-gray-300">
                    <p>此處將會提供遊戲輔助程式的下載連結。請先購買並登入會員以查看相關內容。</p>
                </div>
            </div>
        </div>

        <!-- Page: FAQ -->
        <div id="page-faq" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-12">
                <h1 class="text-4xl font-bold text-white mb-8">常見問題</h1>
                 <div class="space-y-4 max-w-3xl mx-auto" id="faq-container">
                    <!-- FAQ items will be inserted by JS -->
                </div>
            </div>
        </div>
        
        <!-- Page: Contact -->
        <div id="page-contact" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-12">
                <h1 class="text-4xl font-bold text-white mb-8 text-center">聯絡我們</h1>
                <div class="bg-gray-800/50 p-8 rounded-lg text-gray-300 max-w-lg mx-auto text-center">
                    <p>若您有任何問題，歡迎透過以下方式與我們聯繫：</p>
                    <p class="mt-4 font-semibold text-white text-lg">yang20080221@gmail.com</p>
                </div>
            </div>
        </div>

        <!-- Page: Search Results -->
        <div id="page-search-results" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-12">
                <h1 id="search-results-title" class="text-4xl font-bold text-white mb-8"></h1>
                <div id="search-results-grid" class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4 md:gap-6">
                    <!-- Search results will be inserted by JS -->
                </div>
            </div>
        </div>

        <!-- Page: Cart -->
        <div id="page-cart" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-12">
                <h1 class="text-4xl font-bold text-white mb-8">您的購物車</h1>
                <div id="cart-content">
                    <!-- Cart content will be rendered by JS -->
                </div>
            </div>
        </div>

        <!-- Page: Login -->
        <div id="page-login" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-20">
                <div class="max-w-md mx-auto bg-gray-800/50 p-8 rounded-lg border border-gray-700">
                    <h1 class="text-3xl font-bold text-white text-center mb-6">會員登入</h1>
                    <form id="login-form">
                        <div class="mb-4">
                            <label for="login-email" class="block text-gray-400 mb-2">電子郵件</label>
                            <input type="email" id="login-email" required class="w-full bg-gray-700 border border-gray-600 rounded-lg py-3 px-4 text-white focus:outline-none focus:ring-2 focus:ring-violet-500">
                        </div>
                        <div class="mb-6">
                            <label for="login-password" class="block text-gray-400 mb-2">密碼</label>
                            <input type="password" id="login-password" required class="w-full bg-gray-700 border border-gray-600 rounded-lg py-3 px-4 text-white focus:outline-none focus:ring-2 focus:ring-violet-500">
                        </div>
                        <button type="submit" class="w-full neon-button bg-violet-500/20 border border-violet-500 text-white font-bold py-3 rounded-lg text-lg">登入</button>
                        <p id="login-error" class="text-red-500 text-center mt-4 h-5"></p>
                    </form>
                    <p class="text-center mt-6 text-gray-400">還沒有帳號？ <a href="#" class="text-violet-400 hover:underline nav-link" data-page="register">立即註冊</a></p>
                </div>
            </div>
        </div>

        <!-- Page: Register -->
        <div id="page-register" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-20">
                <div class="max-w-md mx-auto bg-gray-800/50 p-8 rounded-lg border border-gray-700">
                    <h1 class="text-3xl font-bold text-white text-center mb-6">建立新帳號</h1>
                    <form id="register-form">
                        <div class="mb-4">
                            <label for="register-username" class="block text-gray-400 mb-2">使用者名稱</label>
                            <input type="text" id="register-username" required class="w-full bg-gray-700 border border-gray-600 rounded-lg py-3 px-4 text-white focus:outline-none focus:ring-2 focus:ring-violet-500">
                        </div>
                        <div class="mb-4">
                            <label for="register-email" class="block text-gray-400 mb-2">電子郵件</label>
                            <input type="email" id="register-email" required class="w-full bg-gray-700 border border-gray-600 rounded-lg py-3 px-4 text-white focus:outline-none focus:ring-2 focus:ring-violet-500">
                        </div>
                        <div class="mb-6">
                            <label for="register-password" class="block text-gray-400 mb-2">密碼</label>
                            <input type="password" id="register-password" required class="w-full bg-gray-700 border border-gray-600 rounded-lg py-3 px-4 text-white focus:outline-none focus:ring-2 focus:ring-violet-500">
                        </div>
                        <button type="submit" class="w-full neon-button bg-violet-500/20 border border-violet-500 text-white font-bold py-3 rounded-lg text-lg">註冊</button>
                        <p id="register-error" class="text-red-500 text-center mt-4 h-5"></p>
                    </form>
                    <p class="text-center mt-6 text-gray-400">已經有帳號了？ <a href="#" class="text-violet-400 hover:underline nav-link" data-page="login">前往登入</a></p>
                </div>
            </div>
        </div>
        
        <!-- Page: Member -->
        <div id="page-member" class="page hidden">
            <div class="container mx-auto px-4 lg:px-6 py-12">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                    <div class="md:col-span-1">
                        <div class="bg-gray-800/50 p-6 rounded-lg border border-gray-700">
                            <div class="text-center mb-6">
                                <i class="fas fa-user-circle text-6xl text-violet-400"></i>
                                <h2 id="member-name" class="text-2xl font-bold text-white mt-4"></h2>
                                <p id="member-email" class="text-gray-400"></p>
                            </div>
                            <ul class="flex border-b border-gray-700 mb-4">
                                <li class="flex-1"><button data-tab="history" class="tab-button w-full text-center p-4 font-semibold transition-colors active">購買紀錄</button></li>
                                <li class="flex-1"><button data-tab="settings" class="tab-button w-full text-center p-4 font-semibold transition-colors">帳號設定</button></li>
                            </ul>
                             <p class="text-xs text-gray-500 mt-4 text-center">加入時間: <span id="member-joined"></span></p>
                        </div>
                    </div>
                    <div class="md:col-span-3">
                        <div id="tab-panel-history" class="tab-panel bg-gray-800/50 p-8 rounded-lg border border-gray-700">
                            <!-- Purchase history rendered by JS -->
                        </div>
                        <div id="tab-panel-settings" class="tab-panel hidden bg-gray-800/50 p-8 rounded-lg border border-gray-700">
                             <h2 class="text-2xl font-bold text-white mb-6">帳號設定</h2>
                             <p class="text-gray-400">此功能尚未開放。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>
    
    <!-- Footer -->
    <footer class="bg-gray-900 text-gray-400">
        <div class="container mx-auto px-4 lg:px-6 py-12">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div class="md:col-span-1">
                     <a href="index.html" class="flex items-center space-x-3 mb-4">
                        <img src="https://img.freepik.com/free-vector/cute-shiba-inu-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-4990.jpg?w=240" alt="AXG Logo" class="h-10 w-10 rounded-full object-cover">
                        <span class="text-lg font-bold text-white">AXG輔助商城</span>
                    </a>
                    <p class="text-sm">提供最穩定、最安全的遊戲輔助，讓您輕鬆享受遊戲樂趣。</p>
                    <div class="flex space-x-4 mt-4 text-xl">
                         <a href="#" class="hover:text-violet-400"><i class="fab fa-line"></i></a>
                         <a href="#" class="hover:text-violet-400"><i class="fab fa-discord"></i></a>
                    </div>
                </div>
                <div>
                    <h4 class="font-bold text-white mb-4">產品</h4>
                    <ul class="space-y-2 text-sm">
                        <li><a href="store.html" class="hover:text-white">所有遊戲</a></li>
                        <li><a href="store.html?search=APEX" class="hover:text-white">APEX 英雄</a></li>
                        <li><a href="store.html?search=LOL" class="hover:text-white">英雄聯盟</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="font-bold text-white mb-4">支援</h4>
                    <ul class="space-y-2 text-sm">
                        <li><a href="#" class="nav-link" data-page="faq">常見問題</a></li>
                        <li><a href="#" class="nav-link" data-page="contact">聯絡我們</a></li>
                        <li><a href="#" class="nav-link" data-page="download">下載中心</a></li>
                    </ul>
                </div>
                 <div>
                    <h4 class="font-bold text-white mb-4">關於</h4>
                    <ul class="space-y-2 text-sm">
                        <li><a href="#" class="nav-link" data-page="aboutUs">關於我們</a></li>
                        <li><a href="#" class="nav-link" data-page="termsOfService">服務條款</a></li>
                        <li><a href="#" class="nav-link" data-page="privacyPolicy">隱私權政策</a></li>
                    </ul>
                </div>
            </div>
            <div class="text-center text-xs mt-12 border-t border-gray-800 pt-6">
                <p>&copy; 2025 AXG輔助商城. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Toast Notification -->
    <div id="toast-notification" class="fixed bottom-5 right-5 bg-violet-500 text-white py-3 px-6 rounded-lg shadow-lg transform translate-y-20 opacity-0"></div>

    <script>
    document.addEventListener('DOMContentLoaded', () => {

        // --- 原始碼防護 ---
        document.addEventListener('contextmenu', event => event.preventDefault());
        document.addEventListener('keydown', event => {
            if (event.keyCode === 123 || (event.ctrlKey && event.shiftKey && event.keyCode === 73) || (event.ctrlKey && event.keyCode === 85) || (event.ctrlKey && event.keyCode === 83)) {
                event.preventDefault();
            }
        });

        // --- 模擬資料 ---
        const AppData = {
            products: {
                'g01': {
                    id: 'g01', name: '傳說對決',
                    image: 'https://play-lh.googleusercontent.com/9HgbyVHLtzWzYX1cL9yjxXgkTtBpcaWsztJgdVU0QHnoNLxEwHIYnMlWdjLdN2y6oD8',
                    banner: 'https://play-lh.googleusercontent.com/9HgbyVHLtzWzYX1cL9yjxXgkTtBpcaWsztJgdVU0QHnoNLxEwHIYnMlWdjLdN2y6oD8',
                    description: '《Garena 傳說對決》是一款多人線上戰鬥競技場（MOBA）手機遊戲。我們的輔助程式提供地圖透視、技能預判等功能，助您輕鬆上分。',
                    packages: [ { duration: '天卡', price: 150 }, { duration: '周卡', price: 750 }, { duration: '月卡', price: 2500 }, { duration: '季卡', price: 6800 } ],
                    requirements: { os: 'Windows 10/11', processor: 'Intel Core i5', memory: '8 GB RAM', graphics: 'NVIDIA GTX 1050' }
                },
                'g02': {
                    id: 'g02', name: '原神',
                    image: 'https://images5.alphacoders.com/112/thumb-1920-1127881.jpg',
                    banner: 'https://images5.alphacoders.com/112/thumb-1920-1127881.jpg',
                    description: '《原神》是由米哈遊開發的一款動作角色扮演遊戲。輔助提供無限體力、秒殺怪物、自動採集等功能，讓您的冒險旅程暢行無阻。',
                    packages: [ { duration: '天卡', price: 150 }, { duration: '周卡', price: 750 }, { duration: '月卡', price: 2500 }, { duration: '季卡', price: 6800 } ],
                    requirements: { os: 'Windows 10/11', processor: 'Intel Core i7', memory: '16 GB RAM', graphics: 'NVIDIA RTX 2060' }
                },
                'g03': {
                    id: 'g03', name: '絕地求生 M',
                    image: 'https://play-lh.googleusercontent.com/J63785Y2YUoZirCgiCR9lt5ZkqnMt9rDTptm4S9TDpCDMYr5JXebfI__3UwreatUm5U',
                    banner: 'https://play-lh.googleusercontent.com/J63785Y2YUoZirCgiCR9lt5ZkqnMt9rDTptm4S9TDpCDMYr5JXebfI__3UwreatUm5U',
                    description: '《PUBG MOBILE：絕地求生M》是一款戰術競技型射擊類沙盒遊戲。體驗頂級的自動瞄準、透視、無後座力，輕鬆主宰戰場，把把吃雞。',
                    packages: [ { duration: '天卡', price: 200 }, { duration: '周卡', price: 1000 }, { duration: '月卡', price: 3000 }, { duration: '季卡', price: 8000 } ],
                    requirements: { os: 'Windows 10/11', processor: 'Intel Core i5', memory: '8 GB RAM', graphics: 'NVIDIA GTX 1060' }
                },
                'g04': { 
                    id: 'g04', name: '英雄聯盟', 
                    image: 'https://images4.alphacoders.com/115/1159995.jpg',
                    banner: 'https://images4.alphacoders.com/115/1159995.jpg',
                    description: '《英雄聯盟》是一款快節奏、競技性的線上多人戰術競技遊戲。我們的輔助提供自動走位、技能預判與即時冷卻計時，讓您在召喚峽谷中無往不利。',
                    packages: [ { duration: '天卡', price: 180 }, { duration: '周卡', price: 900 }, { duration: '月卡', price: 2800 }, { duration: '季卡', price: 7500 } ],
                    requirements: { os: 'Windows 10/11', processor: 'Intel Core i3', memory: '4 GB RAM', graphics: 'NVIDIA GTX 960' }
                },
                'g05': { 
                    id: 'g05', name: '決勝時刻 M', 
                    image: 'https://p2.bahamut.com.tw/B/2KU/23/a85d8753481c01ae298a552a5916een5.JPG',
                    banner: 'https://p2.bahamut.com.tw/B/2KU/23/a85d8753481c01ae298a552a5916een5.JPG',
                    description: '《決勝時刻 Mobile - Garena》是一款經典第一人稱射擊遊戲。我們的輔助程式讓您擁有透視、自瞄等絕對優勢，在槍林彈雨中脫穎而出。',
                    packages: [ { duration: '天卡', price: 160 }, { duration: '周卡', price: 800 }, { duration: '月卡', price: 2600 }, { duration: '季卡', price: 7000 } ],
                    requirements: { os: 'Windows 10/11', processor: 'Intel Core i5', memory: '8 GB RAM', graphics: 'NVIDIA GTX 1050 Ti' }
                },
                'g06': { 
                    id: 'g06', name: 'Free Fire', 
                    image: 'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/a0/cb/44/a0cb447b-2dfb-69c7-5059-c4216307956c/196835967394.jpg/1200x1200bf-60.jpg',
                    banner: 'https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/a0/cb/44/a0cb447b-2dfb-69c7-5059-c4216307956c/196835967394.jpg/1200x1200bf-60.jpg',
                    description: '《Garena Free Fire - 我要活下去》是一款大逃殺孤島生存射擊遊戲。使用我們的輔助，鎖定爆頭、快速移動，成為最後的生存者。',
                    packages: [ { duration: '天卡', price: 120 }, { duration: '周卡', price: 600 }, { duration: '月卡', price: 2000 }, { duration: '季卡', price: 5500 } ],
                    requirements: { os: 'Windows 7/8/10', processor: 'Intel Core i3', memory: '4 GB RAM', graphics: 'Intel HD Graphics 4000' }
                },
                'g07': { 
                    id: 'g07', name: 'ROBLOX', 
                    image: 'https://play-lh.googleusercontent.com/WNWZaxi9RdJKe2GQM3vqXIAkk69mnIl4Cc8EyZcir2SKlVOxeUv9tZGfNTmNaLC717Ht',
                    banner: 'https://play-lh.googleusercontent.com/WNWZaxi9RdJKe2GQM3vqXIAkk69mnIl4Cc8EyZcir2SKlVOxeUv9tZGfNTmNaLC717Ht',
                    description: '《ROBLOX》是一個終極的虛擬宇宙，可讓您創作、分享體驗，並成為您能想像到的一切。我們的輔助工具讓您在各種遊戲模式中擁有無限可能性。',
                    packages: [ { duration: '天卡', price: 100 }, { duration: '周卡', price: 500 }, { duration: '月卡', price: 1800 }, { duration: '季卡', price: 5000 } ],
                    requirements: { os: 'Windows 7/8/10', processor: '1.6 GHz Processor', memory: '1 GB RAM', graphics: 'DirectX 9 compatible' }
                },
                'g08': { 
                    id: 'g08', name: 'APEX 英雄', 
                    image: 'https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2019/02/Apex-Legends-2.png',
                    banner: 'https://static1.dualshockersimages.com/wordpress/wp-content/uploads/2019/02/Apex-Legends-2.png',
                    description: '《Apex 英雄》是一款免費的英雄射擊遊戲，傳奇角色們將在邊境的遠處為光榮、名聲與財富而戰。我們的輔助提供精準的彈道預測與敵人位置顯示。',
                    packages: [ { duration: '天卡', price: 200 }, { duration: '周卡', price: 1000 }, { duration: '月卡', price: 3000 }, { duration: '季卡', price: 8000 } ],
                    requirements: { os: 'Windows 10', processor: 'Intel Core i5-3570K', memory: '8 GB RAM', graphics: 'NVIDIA GeForce GTX 970' }
                },
                 'g09': { 
                    id: 'g09', name: '柏德之門 3', 
                    image: 'https://gamemad.com/upload/images/2021/04/03/606846456709f.jpg',
                    banner: 'https://gamemad.com/upload/images/2021/04/03/606846456709f.jpg',
                    description: '《柏德之門 3》是一款角色扮演遊戲，故事背景設定在龍與地下城的世界。我們的輔助工具提供屬性修改、無限金錢等功能，讓您打造最強隊伍。',
                    packages: [ { duration: '天卡', price: 250 }, { duration: '周卡', price: 1200 }, { duration: '月卡', price: 3500 }, { duration: '永久', price: 9000 } ],
                    requirements: { os: 'Windows 10', processor: 'Intel i5-4690', memory: '8 GB RAM', graphics: 'Nvidia GTX 970' }
                },
                 'g10': { 
                    id: 'g10', name: '艾爾登法環', 
                    image: 'https://tse4.mm.bing.net/th/id/OIP.3zcnVaqoG81EHw3Q0BuizQHaEK?r=0&cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3',
                    banner: 'https://tse4.mm.bing.net/th/id/OIP.3zcnVaqoG81EHw3Q0BuizQHaEK?r=0&cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3',
                    description: '《艾爾登法環》是一款以正宗黑暗奇幻世界為舞台的動作RPG遊戲。體驗我們的一擊必殺、無限盧恩與無敵模式，輕鬆挑戰交界地的所有強敵。',
                    packages: [ { duration: '天卡', price: 220 }, { duration: '周卡', price: 1100 }, { duration: '月卡', price: 3200 }, { duration: '永久', price: 8500 } ],
                    requirements: { os: 'Windows 10', processor: 'INTEL CORE I5-8400', memory: '12 GB RAM', graphics: 'NVIDIA GEFORCE GTX 1060 3 GB' }
                },
                'g11': { 
                    id: 'g11', name: '電馭叛客 2077', 
                    image: 'https://th.bing.com/th/id/OIP.24u_T3I2o4InpIY-B_e24QHaEK?w=263&h=180&c=7&r=0&o=7&dpr=2.3&pid=1.7&rm=3'
                    banner: 'https://th.bing.com/th/id/OIP.24u_T3I2o4InpIY-B_e24QHaEK?w=263&h=180&c=7&r=0&o=7&dpr=2.3&pid=1.7&rm=3',
                    description: '《電馭叛客 2077》是一款開放世界動作冒險角色扮演遊戲，故事發生在渴望權力、魅惑與身體改造的巨型都市「夜城」。使用輔助獲得無限金錢、技能點，成為夜城傳奇。',
                    packages: [ { duration: '天卡', price: 200 }, { duration: '周卡', price: 1000 }, { duration: '月卡', price: 3000 }, { duration: '永久', price: 8000 } ],
                    requirements: { os: 'Windows 10', processor: 'Intel Core i7-6700', memory: '12 GB RAM', graphics: 'NVIDIA GTX 1060 6GB' }
                },
                'g12': { 
                    id: 'g12', name: '星空', 
                    image: 'https://images.unsplash.com/photo-1655003504389-7742634d547f?q=80&w=400&auto=format&fit=crop',
                    banner: 'https://images.unsplash.com/photo-1655003504389-7742634d547f?q=80&w=1920&auto=format&fit=crop',
                    description: '《星空》是 Bethesda Game Studios 睽違 25 年所打造的第一個全新宇宙。這款次世代角色扮演遊戲將背景設定在浩瀚的銀河系。我們的輔助讓您擁有無限資源與技能，自由探索宇宙。',
                    packages: [ { duration: '天卡', price: 250 }, { duration: '周卡', price: 1200 }, { duration: '月卡', price: 3500 }, { duration: '永久', price: 9000 } ],
                    requirements: { os: 'Windows 10/11', processor: 'AMD Ryzen 5 2600X', memory: '16 GB RAM', graphics: 'AMD Radeon RX 5700' }
                },
            },
            faq: [
                { q: '購買後如何取得商品？', a: '付款成功後，卡號將會自動發送到您的會員中心，您也可以在購買紀錄中查詢。' },
                { q: '輔助程式是否會被偵測？', a: '我們的團隊採用頂級加密技術，大幅降低被偵測的風險。但任何輔助程式皆有風險，建議您謹慎使用。' },
                { q: '我可以在多台電腦上使用嗎？', a: '大部分的輔助程式都綁定單一電腦，若需更換電腦請聯繫客服處理。' },
                { q: '是否支援 Mac 或遊戲主機？', a: '目前我們的輔助程式主要支援 Windows 作業系統，暫不支援 Mac 或其他遊戲主機平台。' }
            ]
        };

        // --- DOM 元素快取 ---
        const DOM = {
            mainContent: document.getElementById('main-content'),
            authContainer: document.getElementById('main-auth-buttons'),
            pages: {
                plp: document.getElementById('page-plp'),
                pdp: document.getElementById('page-pdp'),
                login: document.getElementById('page-login'),
                register: document.getElementById('page-register'),
                member: document.getElementById('page-member'),
                searchResults: document.getElementById('page-search-results'),
                cart: document.getElementById('page-cart'),
                download: document.getElementById('page-download'),
                faq: document.getElementById('page-faq'),
                contact: document.getElementById('page-contact'),
            },
            searchInput: document.getElementById('search-input'),
            searchButton: document.getElementById('search-button'),
            mobileSearchInput: document.getElementById('mobile-search-input'),
            mobileSearchButton: document.getElementById('mobile-search-button'),
            mobileMenuButton: document.getElementById('mobile-menu-button'),
            mobileMenu: document.getElementById('mobile-menu'),
            cartBadge: document.getElementById('cart-total-display-badge'),
            toast: document.getElementById('toast-notification'),
            announcementModal: document.getElementById('announcement-modal'),
            closeModalBtn: document.getElementById('close-modal-btn'),
        };
        
        // --- 應用程式狀態管理 ---
        const state = { 
            currentPage: 'plp', 
            currentProduct: null,
            pdpSelection: null,
            currentUser: null,
            cart: [],
        };
        
        // --- 本地儲存 (LocalStorage) 幫手 ---
        const Storage = {
            getUsers: () => JSON.parse(localStorage.getItem('axg_users')) || {},
            saveUsers: (users) => localStorage.setItem('axg_users', JSON.stringify(users)),
            getLoggedInUser: () => localStorage.getItem('axg_loggedInUser'),
            setLoggedInUser: (email) => localStorage.setItem('axg_loggedInUser', email),
            removeLoggedInUser: () => localStorage.removeItem('axg_loggedInUser'),
            getCart: () => JSON.parse(localStorage.getItem('axg_cart')) || [],
            saveCart: (cart) => localStorage.setItem('axg_cart', JSON.stringify(cart)),
        };

        // --- 渲染函式 ---
        const Render = {
            gameCard(product) {
                const card = document.createElement('a');
                card.href = "#";
                card.className = "group text-center nav-link";
                card.dataset.page = 'pdp';
                card.dataset.productId = product.id;
                card.innerHTML = `
                    <div class="relative aspect-square bg-gray-800 rounded-lg overflow-hidden mb-3 transform group-hover:-translate-y-1 transition-transform border-2 border-transparent group-hover:border-violet-500">
                        <img data-src="${product.image}" alt="${product.name}" class="lazy w-full h-full object-cover">
                    </div>
                    <h3 class="font-semibold text-gray-300 group-hover:text-white transition-colors">${product.name}</h3>
                `;
                return card;
            },
            plp(products) {
                const grid = document.getElementById('plp-grid');
                if (!grid) return;
                grid.innerHTML = '';
                products.forEach(product => grid.appendChild(this.gameCard(product)));
            },
            pdp() {
                state.pdpSelection = null;
                const product = state.currentProduct;
                if (!product) {
                    DOM.pages.pdp.innerHTML = `<div class="container mx-auto py-12 text-center"><p>找不到遊戲資料。</p></div>`;
                    return;
                };
                
                const { banner, name, description, packages, requirements } = product;
                const bannerUrl = banner || 'https://images.unsplash.com/photo-1511882150382-421059c8143f?q=80&w=1920&auto=format&fit=crop';
                const descText = description || '暫無遊戲介紹。';
                const pkgs = packages || [{ duration: '暫無方案', price: 'N/A' }];

                let requirementsHTML = '';
                if (requirements) {
                    requirementsHTML = `
                        <div class="mt-8 pt-6 border-t border-gray-700">
                             <h3 class="text-xl font-bold text-white mb-4">系統需求</h3>
                             <div class="grid grid-cols-2 gap-4 text-sm">
                                 <div><strong class="text-gray-400">作業系統:</strong> ${requirements.os}</div>
                                 <div><strong class="text-gray-400">處理器:</strong> ${requirements.processor}</div>
                                 <div><strong class="text-gray-400">記憶體:</strong> ${requirements.memory}</div>
                                 <div><strong class="text-gray-400">顯示卡:</strong> ${requirements.graphics}</div>
                             </div>
                         </div>`;
                }

                DOM.pages.pdp.innerHTML = `
                    <div class="relative w-full h-[40vh] md:h-[60vh] bg-cover bg-center" style="background-image: url('${bannerUrl}')">
                        <div class="absolute inset-0 bg-gradient-to-t from-[#121212] via-[#121212]/80 to-transparent"></div>
                    </div>
                    <div class="container mx-auto px-4 lg:px-6 -mt-20 md:-mt-32 relative z-10 pb-16">
                        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                            <div class="lg:col-span-1">
                                <img src="${product.image}" alt="${product.name}" class="w-full rounded-lg shadow-2xl border-4 border-gray-700">
                            </div>
                            <div class="lg:col-span-2 bg-gray-800/50 p-8 rounded-lg border border-gray-700">
                                <h1 class="text-4xl md:text-5xl font-black text-white mb-2">${name}</h1>
                                <p class="text-gray-400 mb-6">${descText}</p>
                                <div id="pdp-packages" class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
                                    ${pkgs.map(pkg => `
                                        <button class="package-button border-2 border-gray-700 rounded-lg p-4 text-center hover:border-violet-500 transition-colors" data-duration="${pkg.duration}" data-price="${pkg.price}">
                                            <span class="block font-bold text-white">${pkg.duration}</span>
                                            <span class="block text-violet-400">NT$ ${pkg.price}</span>
                                        </button>
                                    `).join('')}
                                </div>
                                 <button id="add-to-cart-btn" class="w-full md:w-1/3 neon-button bg-violet-500/20 border border-violet-500 text-white font-bold py-4 rounded-lg text-xl" disabled>
                                    請先選擇方案
                                 </button>
                                 ${requirementsHTML}
                            </div>
                        </div>
                    </div>
                `;
            },
            authUI() {
                if (!DOM.authContainer) return;
                if (state.currentUser) {
                    DOM.authContainer.innerHTML = `<a href="#" class="bg-gray-700/50 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded-lg transition-colors nav-link" data-page="member">會員中心</a> <a href="#" id="logout-button" class="py-2 px-2 text-gray-400 hover:text-white">登出</a>`;
                } else {
                    DOM.authContainer.innerHTML = `<a href="#" class="bg-violet-500 hover:bg-violet-600 text-white font-bold py-2 px-4 rounded-lg transition-colors nav-link" data-page="login">登入 / 註冊</a>`;
                }
            },
            searchResults(results, query) {
                const titleEl = document.getElementById('search-results-title');
                const gridEl = document.getElementById('search-results-grid');
                if (!titleEl || !gridEl) return;
                
                titleEl.textContent = `搜尋 "${query}" 的結果`;
                gridEl.innerHTML = '';
                
                if (results.length > 0) {
                    results.forEach(product => gridEl.appendChild(this.gameCard(product)));
                } else {
                    gridEl.innerHTML = `<p class="col-span-full text-center">找不到符合條件的遊戲。</p>`;
                }
            },
            cartBadge() {
                if(DOM.cartBadge) {
                    DOM.cartBadge.textContent = state.cart.length;
                }
            },
            cartPage() {
                const cartContent = document.getElementById('cart-content');
                if (!cartContent) return;
                this.cartBadge();
                if (state.cart.length === 0) {
                    cartContent.innerHTML = `
                        <div class="text-center py-20 text-gray-400">
                            <i class="fas fa-shopping-cart text-5xl mb-4"></i>
                            <h2 class="text-2xl font-bold text-white mb-2">您的購物車是空的</h2>
                            <p class="mb-6">快去尋找您喜愛的遊戲輔助吧！</p>
                            <a href="#" class="neon-button bg-violet-500/20 border border-violet-500 text-white font-bold py-3 px-8 rounded-lg text-lg nav-link" data-page="plp">
                                繼續購物
                            </a>
                        </div>`;
                    return;
                }
                const total = state.cart.reduce((sum, item) => sum + item.price, 0);
                cartContent.innerHTML = `
                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                        <div class="lg:col-span-2 bg-gray-800/50 p-6 rounded-lg border border-gray-700 space-y-4">
                            ${state.cart.map(item => `
                            <div class="flex items-center justify-between p-4 bg-gray-800 rounded-md">
                                <div class="flex items-center min-w-0">
                                    <img src="${item.image}" alt="${item.name}" class="w-16 h-16 object-cover rounded-md mr-4 flex-shrink-0">
                                    <div class="min-w-0">
                                        <h3 class="font-bold text-white truncate">${item.name}</h3>
                                        <p class="text-gray-400">${item.duration}</p>
                                    </div>
                                </div>
                                <div class="text-right flex-shrink-0 ml-4">
                                    <p class="font-semibold text-white">NT$ ${item.price}</p>
                                    <button class="text-red-500 hover:text-red-400 text-sm remove-from-cart-btn" data-cart-item-id="${item.cartItemId}">移除</button>
                                </div>
                            </div>`).join('')}
                        </div>
                        <div class="bg-gray-800/50 p-6 rounded-lg border border-gray-700 self-start">
                            <h2 class="text-2xl font-bold text-white mb-4">訂單摘要</h2>
                            <div class="flex justify-between mb-2"><span>小計</span><span>NT$ ${total}</span></div>
                            <div class="border-t border-gray-600 my-4"></div>
                            <div class="flex justify-between font-bold text-white text-xl mb-6"><span>總計</span><span>NT$ ${total}</span></div>
                            <button id="checkout-btn" class="w-full block text-center neon-button bg-violet-500/20 border border-violet-500 text-white font-bold py-3 rounded-lg text-lg">前往結帳</button>
                        </div>
                    </div>`;
            },
            purchaseHistory() {
                const container = document.getElementById('tab-panel-history');
                if (!container) return;
                const history = state.currentUser?.history || [];
                if (history.length === 0) {
                     container.innerHTML = `<h2 class="text-2xl font-bold text-white mb-6">您的購買紀錄</h2><div class="text-center py-12 text-gray-400"><i class="fas fa-receipt text-4xl mb-4"></i><p>這裡目前沒有任何紀錄。</p></div>`;
                    return;
                }
                container.innerHTML = `
                    <h2 class="text-2xl font-bold text-white mb-6">您的購買紀錄</h2>
                    <div class="overflow-x-auto">
                        <table class="w-full text-left">
                            <thead><tr class="border-b border-gray-600"><th class="p-4">訂單編號</th><th class="p-4">日期</th><th class="p-4">項目</th><th class="p-4 text-right">金額</th></tr></thead>
                            <tbody>
                                ${history.map(item => `
                                <tr class="border-b border-gray-700">
                                    <td class="p-4">AXG-${item.date.split('T')[0].replace(/-/g, '')}-${item.id.toString().slice(-4)}</td>
                                    <td class="p-4">${item.date.split('T')[0]}</td>
                                    <td class="p-4">${item.name} - ${item.duration}</td>
                                    <td class="p-4 text-right">NT$ ${item.price}</td>
                                </tr>`).join('')}
                            </tbody>
                        </table>
                    </div>`;
            },
            faq() {
                const container = document.getElementById('faq-container');
                if (!container) return;
                container.innerHTML = AppData.faq.map(item => `
                    <div class="bg-gray-800/50 rounded-lg border border-gray-700">
                        <button class="faq-question w-full flex justify-between items-center text-left p-5">
                            <span class="font-semibold text-white">${item.q}</span>
                            <i class="fas fa-chevron-down faq-arrow text-gray-400 transition-transform"></i>
                        </button>
                        <div class="faq-answer">
                            <p class="text-gray-400 px-5 pb-5">${item.a}</p>
                        </div>
                    </div>
                `).join('');
            },
        };

        // --- 核心應用程式邏輯 ---
        const App = {
            init() {
                state.cart = Storage.getCart();
                Auth.init();
                this.initModal();
                this.initNavigation();
                this.initAuthForms();
                this.initSearch();
                this.initTabsAndInteractions();
                this.initCart();
                this.initLazyLoading();
                this.initFaqAccordion();
                Render.cartBadge();
                this.handleUrlParams();
            },
            handleUrlParams() {
                const params = new URLSearchParams(window.location.search);
                const productId = params.get('product');
                const searchQuery = params.get('search');

                if (productId) {
                    this.showPage('pdp', productId);
                } else if (searchQuery) {
                    const results = Object.values(AppData.products).filter(p => p.name.toLowerCase().includes(searchQuery.toLowerCase()));
                    this.showPage('search-results');
                    setTimeout(() => Render.searchResults(results, searchQuery), 10);
                } else {
                    this.showPage('plp');
                }
            },
            initModal() {
                const modal = DOM.announcementModal;
                if (!modal) return;
                const closeModal = () => modal.classList.add('hidden');
                if (!sessionStorage.getItem('axg_modal_shown')) {
                    modal.classList.remove('hidden');
                    sessionStorage.setItem('axg_modal_shown', 'true');
                }
                DOM.closeModalBtn.addEventListener('click', closeModal);
                modal.addEventListener('click', (e) => { if (e.target === modal) closeModal(); });
            },
            showPage(pageId, productId = null) {
                DOM.mainContent.classList.add('is-transitioning');
                setTimeout(() => {
                    state.currentPage = pageId;
                    Object.values(DOM.pages).forEach(p => p && p.classList.add('hidden'));
                    
                    if (pageId === 'pdp' && productId) {
                        state.currentProduct = AppData.products[productId];
                        Render.pdp();
                    } else if (pageId === 'plp') {
                        Render.plp(Object.values(AppData.products));
                    } else if (pageId === 'member' || (pageId === 'login' && state.currentUser)) {
                        if (!state.currentUser) { this.showPage('login'); return; }
                        const user = state.currentUser;
                        document.getElementById('member-name').textContent = user.username;
                        document.getElementById('member-email').textContent = user.email;
                        document.getElementById('member-joined').textContent = new Date(user.joined).toLocaleDateString();
                        Render.purchaseHistory();
                    } else if (pageId === 'cart') {
                        Render.cartPage();
                    } else if (pageId === 'faq') {
                        Render.faq();
                    }
                    
                    const targetPage = DOM.pages[pageId];
                    if(targetPage) targetPage.classList.remove('hidden');
                    window.scrollTo(0, 0);
                    this.initLazyLoading();
                    DOM.mainContent.classList.remove('is-transitioning');
                }, 200);
            },
            initNavigation() {
                document.body.addEventListener('click', e => {
                    const navLink = e.target.closest('.nav-link');
                    if (navLink && navLink.dataset.page) {
                        e.preventDefault();
                        const page = navLink.dataset.page;
                        const productId = navLink.dataset.productId;
                        if (DOM.mobileMenu.classList.contains('block')) {
                           DOM.mobileMenu.classList.remove('block');
                           DOM.mobileMenu.classList.add('hidden');
                        }
                        this.showPage(page, productId);
                    }
                    if (e.target.closest('#logout-button')) { e.preventDefault(); Auth.logout(); }
                });
                if (DOM.mobileMenuButton) {
                    DOM.mobileMenuButton.addEventListener('click', () => {
                        const isHidden = DOM.mobileMenu.classList.contains('hidden');
                        DOM.mobileMenu.classList.toggle('hidden', !isHidden);
                        DOM.mobileMenu.classList.toggle('block', isHidden);
                    });
                }
            },
            initAuthForms() {
                const loginForm = document.getElementById('login-form'), registerForm = document.getElementById('register-form');
                if (loginForm) loginForm.addEventListener('submit', (e) => {
                    e.preventDefault();
                    if (!Auth.login(document.getElementById('login-email').value, document.getElementById('login-password').value)) {
                        document.getElementById('login-error').textContent = '電子郵件或密碼錯誤。';
                    } else {
                        document.getElementById('login-error').textContent = '';
                    }
                });
                if (registerForm) registerForm.addEventListener('submit', (e) => {
                    e.preventDefault();
                    const result = Auth.register(document.getElementById('register-username').value, document.getElementById('register-email').value, document.getElementById('register-password').value);
                    if (result.success) { this.showToast(result.message); this.showPage('login'); } 
                    else { document.getElementById('register-error').textContent = result.message; }
                });
            },
            initSearch() {
                const performSearch = (query) => {
                    if (!query) return;
                    window.location.href = `store.html?search=${encodeURIComponent(query)}`;
                };
                if (DOM.searchButton) DOM.searchButton.addEventListener('click', () => performSearch(DOM.searchInput.value.trim()));
                if (DOM.searchInput) DOM.searchInput.addEventListener('keypress', e => { if (e.key === 'Enter') performSearch(DOM.searchInput.value.trim()); });
                if (DOM.mobileSearchButton) DOM.mobileSearchButton.addEventListener('click', () => performSearch(DOM.mobileSearchInput.value.trim()));
                if (DOM.mobileSearchInput) DOM.mobileSearchInput.addEventListener('keypress', e => { if (e.key === 'Enter') performSearch(DOM.mobileSearchInput.value.trim()); });
            },
            initTabsAndInteractions() {
                document.body.addEventListener('click', e => {
                    const tabButton = e.target.closest('.tab-button');
                    if(tabButton) {
                        const tabName = tabButton.dataset.tab;
                        const container = tabButton.closest('.md\\:col-span-1');
                        container.querySelectorAll('.tab-button').forEach(btn => btn.classList.remove('active'));
                        tabButton.classList.add('active');
                        container.nextElementSibling.querySelectorAll('.tab-panel').forEach(panel => panel.classList.add('hidden'));
                        document.getElementById(`tab-panel-${tabName}`).classList.remove('hidden');
                    }
                    const packageButton = e.target.closest('.package-button');
                    if(packageButton) {
                        state.pdpSelection = { duration: packageButton.dataset.duration, price: parseInt(packageButton.dataset.price, 10) };
                        packageButton.closest('#pdp-packages').querySelectorAll('.package-button').forEach(btn => btn.classList.remove('bg-violet-500/20', 'border-violet-400'));
                        packageButton.classList.add('bg-violet-500/20', 'border-violet-400');
                        const addToCartBtn = document.getElementById('add-to-cart-btn');
                        if (addToCartBtn) { addToCartBtn.disabled = false; addToCartBtn.textContent = '加入購物車'; }
                    }
                });
            },
             initFaqAccordion() {
                document.body.addEventListener('click', (e) => {
                    const question = e.target.closest('.faq-question');
                    if (question) {
                        const answer = question.nextElementSibling;
                        const wasOpen = question.classList.contains('open');
                        
                        document.querySelectorAll('.faq-question').forEach(q => q.classList.remove('open'));
                        document.querySelectorAll('.faq-answer').forEach(a => a.classList.remove('open'));

                        if(!wasOpen){
                           question.classList.add('open');
                           answer.classList.add('open');
                        }
                    }
                });
            },
            initCart() {
                document.body.addEventListener('click', e => {
                    if (e.target.closest('#add-to-cart-btn')) {
                        if (!state.pdpSelection) { this.showToast('請先選擇一個方案', true); return; }
                        const cartItem = { cartItemId: Date.now(), productId: state.currentProduct.id, name: state.currentProduct.name, image: state.currentProduct.image, ...state.pdpSelection };
                        state.cart.push(cartItem);
                        Storage.saveCart(state.cart);
                        Render.cartBadge();
                        this.showToast(`${state.currentProduct.name} - ${state.pdpSelection.duration} 已加入購物車`);
                    }
                    const removeFromCartBtn = e.target.closest('.remove-from-cart-btn');
                    if (removeFromCartBtn) {
                        state.cart = state.cart.filter(item => item.cartItemId !== parseInt(removeFromCartBtn.dataset.cartItemId, 10));
                        Storage.saveCart(state.cart);
                        Render.cartPage();
                        Render.cartBadge();
                        this.showToast('商品已從購物車移除');
                    }
                    if (e.target.closest('#checkout-btn')) {
                        if (state.cart.length === 0) { this.showToast('您的購物車是空的', true); return; }
                        if (!state.currentUser) { this.showToast('請先登入會員再進行結帳', true); this.showPage('login'); return; }
                        const users = Storage.getUsers();
                        const currentUserData = users[state.currentUser.email];
                        if (currentUserData) {
                            if (!currentUserData.history) currentUserData.history = [];
                            state.cart.forEach(item => currentUserData.history.push({ id: item.cartItemId, date: new Date().toISOString(), name: item.name, duration: item.duration, price: item.price }));
                            state.currentUser.history = currentUserData.history;
                            Storage.saveUsers(users);
                        }
                        state.cart = [];
                        Storage.saveCart(state.cart);
                        Render.cartBadge();
                        this.showToast('結帳成功！感謝您的購買');
                        this.showPage('member');
                    }
                });
            },
            initLazyLoading() {
                const lazyImages = document.querySelectorAll('img.lazy');
                const observer = new IntersectionObserver((entries, obs) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const img = entry.target;
                            img.src = img.dataset.src;
                            img.classList.remove('lazy');
                            obs.unobserve(img);
                        }
                    });
                }, { rootMargin: "0px 0px 200px 0px" });
                lazyImages.forEach(img => observer.observe(img));
            },
            showToast(message, isError = false) {
                const toast = DOM.toast;
                if (!toast) return;
                toast.textContent = message;
                toast.className = `fixed bottom-5 right-5 text-white py-3 px-6 rounded-lg shadow-lg transform translate-y-20 opacity-0 ${isError ? 'bg-red-500' : 'bg-violet-500'}`;
                setTimeout(() => { toast.style.transform = 'translateY(0)'; toast.style.opacity = '1'; }, 10);
                setTimeout(() => { toast.style.transform = 'translateY(5rem)'; toast.style.opacity = '0'; }, 3000);
            }
        };

        const Auth = {
            init() {
                const loggedInEmail = Storage.getLoggedInUser();
                if (loggedInEmail) {
                    const users = Storage.getUsers();
                    if (users[loggedInEmail]) state.currentUser = users[loggedInEmail];
                    else this.logout();
                }
                Render.authUI();
            },
            login(email, password) {
                const users = Storage.getUsers();
                if (users[email] && users[email].password === password) {
                    state.currentUser = users[email];
                    Storage.setLoggedInUser(email);
                    Render.authUI();
                    App.showPage('member');
                    return true;
                }
                return false;
            },
            logout() {
                state.currentUser = null;
                Storage.removeLoggedInUser();
                Render.authUI();
                App.showPage('plp');
                App.showToast('您已成功登出');
            },
            register(username, email, password) {
                const users = Storage.getUsers();
                if (users[email]) return { success: false, message: '此電子郵件已被註冊。' };
                users[email] = { email, username, password, joined: new Date().toISOString(), history: [] };
                Storage.saveUsers(users);
                return { success: true, message: '註冊成功！請重新登入。' };
            }
        };

        App.init();

    });
    </script>
</body>
</html>

