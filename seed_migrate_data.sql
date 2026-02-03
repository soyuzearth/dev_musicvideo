-- 1. Ensure author column exists (Safety check)
ALTER TABLE projects ADD COLUMN IF NOT EXISTS author TEXT;

-- 2. Update projects where title contains ' - ' (Standard Format)
-- Example: "유문주 작가님 - AI 동화책" -> Author: "유문주", Title: "AI 동화책"
UPDATE projects
SET 
  author = TRIM(REPLACE(split_part(title, ' - ', 1), '작가님', '')),
  title = TRIM(substring(title from position(' - ' in title) + 3))
WHERE 
  category_id = 2 
  AND title LIKE '% - %';

-- 3. Verify results (Select top 10)
SELECT id, author, title FROM projects WHERE category_id = 2 LIMIT 10;
