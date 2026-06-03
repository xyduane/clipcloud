# ClipCloud

加密剪贴板 — 内容在浏览器端加密后存储到 Supabase，服务端只保存密文。

## 部署到 GitHub Pages

### 1. 创建 Supabase 项目

1. 打开 [supabase.com](https://supabase.com)，新建项目
2. 进入 SQL Editor，执行 `setup.sql`

### 2. 配置 GitHub Secrets

在 GitHub 仓库 → Settings → Secrets and variables → Actions 中添加：

| Secret 名 | 值 |
|---|---|
| `SUPABASE_URL` | `https://你的项目ID.supabase.co` |
| `SUPABASE_KEY` | Supabase 项目 Settings → API → anon public key |

### 3. 开启 GitHub Pages

仓库 → Settings → Pages → Source 选择 **GitHub Actions**

### 4. 推送代码

```bash
cd clipcloud
git init && git add . && git commit -m "init"
git remote add origin https://github.com/你的用户名/clipcloud.git
git push -u origin main
```

推送后 Actions 自动构建部署，`__SUPABASE_URL__` 和 `__SUPABASE_KEY__` 会被替换为 Secrets 中的值。

## 本地开发

```bash
cp .env.example .env
# 编辑 .env 填入真实值
./build.sh
# 打开 dist/index.html
```

不配置 Supabase 也能直接打开 `index.html`，会自动降级为 localStorage 模式。

## 使用

- 打开页面直接编辑
- **保存**（Ctrl+S）加密上传
- 🔒 **锁定** 清除本地密码
- 其他设备打开同一链接 → 输入密码解锁
