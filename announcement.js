export default function handler(req, res) {
    // 設定 CORS 標頭
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET');

    // 回傳系統跑馬燈公告
    res.status(200).json({ 
        text: "SYSTEM_BROADCAST: 歡迎來到 Vercel 雲端節點！現代化 Serverless 架構部署成功。" 
    });
}