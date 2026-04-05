export default function handler(req, res) {
    // 設定 CORS 標頭 (允許跨域請求)
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET');

    // 這是模擬從資料庫撈出來的商品資料
    const mockProducts = [
        {
            id: 1,
            category: "PUBG",
            name: "無後座力輔助腳本 V2.0 (Vercel Node.js 版)",
            price: "1500.00",
            cost: "500.00",
            stock: 99,
            status: "active",
            helper_status: "normal",
            description: "恭喜！你成功串接了 Vercel 的 Serverless API！這是一筆測試資料。"
        }
    ];

    // 回傳 JSON 格式的 HTTP 200 成功回應
    res.status(200).json(mockProducts);
}