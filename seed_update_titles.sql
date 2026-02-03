-- Update script for Book Titles
-- Please fill in the correct title inside ( ) excluding 'POD' or '[POD]'

-- 2. 김보라 (S000218331929)
UPDATE projects SET title = '잃어버린 색깔을 찾아서' WHERE purchase_url LIKE '%S000218331929%';

-- 3. 남지혜 (S000218608423)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218608423%';

-- 4. 도희정 (S000218608419)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218608419%';

-- 5. 민수정 (S000218608450)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218608450%';

-- 6. 방정은 (S000218626316)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218626316%';

-- 7. 소민정 (S000218694094)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218694094%';

-- 9. 유문주 (S000218608429)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218608429%';

-- 10. 윤다혜 (S000218608424)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218608424%';

-- 11. 이준민 (S000218602871)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218602871%';

-- 13. 정경하 (S000218367892)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218367892%';

-- 14. 최보선 (S000218602854)
UPDATE projects SET title = 'FILL_TITLE_HERE' WHERE purchase_url LIKE '%S000218602854%';

-- Verify
SELECT author, title FROM projects WHERE category_id = 2;
