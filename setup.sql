-- 在 Supabase SQL Editor 中执行这段 SQL

CREATE TABLE IF NOT EXISTS notes (
  id    TEXT PRIMARY KEY DEFAULT 'default',
  cipher TEXT NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 允许匿名读写（个人工具够用，生产环境建议加认证）
ALTER TABLE notes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_anon_all" ON notes
  FOR ALL
  USING (true)
  WITH CHECK (true);
