-- PostgreSQL 資料庫初始化腳本 (HACK小舖)
-- 說明：請在 Railway 的 PostgreSQL 模組 -> "Data" 面板中貼上並執行此腳本。

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'customer' CHECK (role IN ('admin', 'customer')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    cost DECIMAL(10, 2) NOT NULL DEFAULT 0,
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive')),
    helper_status VARCHAR(20) DEFAULT 'normal',
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id VARCHAR(36) PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE RESTRICT,
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    status VARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'paid', 'completed', 'cancelled')),
    virtual_account VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id VARCHAR(36) NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0)
);

CREATE TABLE product_keys (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    key_code VARCHAR(255) NOT NULL,
    is_used BOOLEAN DEFAULT false,
    order_id VARCHAR(36) REFERENCES orders(id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (product_id, key_code)
);

CREATE TABLE settings (
    id SERIAL PRIMARY KEY,
    setting_key VARCHAR(50) UNIQUE,
    setting_value TEXT
);

CREATE TABLE email_codes (
    email VARCHAR(255) PRIMARY KEY,
    code VARCHAR(10),
    expires_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE chat_messages (
    id SERIAL PRIMARY KEY,
    session_id VARCHAR(100) NOT NULL,
    user_email VARCHAR(255),
    sender VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 寫入預設 Admin 帳號 (密碼為 admin987987 的 bcrypt hash)
INSERT INTO users (email, password_hash, role) 
VALUES ('admin01@gmail.com', '$2b$10$OebsH9kIfD4/9u3.RInr/.7QdKxH7j6u.bZ9mP3H3b7v.G5Q5oPue', 'admin')
ON CONFLICT (email) DO NOTHING;

-- 寫入預設公告
INSERT INTO settings (setting_key, setting_value) 
VALUES ('announcement', '歡迎來到 HACK小舖！系統目前正常運作中。') 
ON CONFLICT (setting_key) DO NOTHING;