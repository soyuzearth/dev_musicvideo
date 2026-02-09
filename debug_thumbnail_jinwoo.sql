-- 1. [진단] 데이터가 올바르게 들어있는지 확인 (Supabase SQL Editor에서 실행 후 결과 확인)
SELECT id, title, author, thumbnail_url, resource_type 
FROM projects 
WHERE title LIKE '%용감한 진우%' OR author = '김미진';

-- 2. [수정] 더 유연한 조건으로 썸네일 다시 업데이트
UPDATE projects 
SET thumbnail_url = 'https://udlyikebeopjnewoydbg.supabase.co/storage/v1/object/public/ebooks/Thumbnail_BraveJinwoo.png'
WHERE title LIKE '%용감한 진우%' AND author LIKE '%김미진%';

-- 3. [확인] 업데이트 후 결과 다시 확인
SELECT title, thumbnail_url FROM projects WHERE title LIKE '%용감한 진우%';
