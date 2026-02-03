
-- SQL Script to insert 'AI 동화책' projects
-- Run this in the Supabase SQL Editor

DO $$
DECLARE
  v_category_id bigint;
BEGIN
  -- 1. Get or Create Category 'AI 동화책'
  SELECT id INTO v_category_id FROM categories WHERE name = 'AI 동화책' LIMIT 1;
  
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name) VALUES ('AI 동화책') RETURNING id INTO v_category_id;
    RAISE NOTICE 'Created new category ''AI 동화책'' with ID %', v_category_id;
  ELSE
    RAISE NOTICE 'Found existing category ''AI 동화책'' with ID %', v_category_id;
  END IF;

  -- 2. Insert Projects (checking for duplicates via resource_url or title)
  
  -- 2 김보라
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzETPEis8/ynEnDlTktHaIL9_7zJV2oQ/edit?utm_content=DAGzETPEis8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '김보라 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 김보라', 'canva', 'https://www.canva.com/design/DAGzETPEis8/ynEnDlTktHaIL9_7zJV2oQ/edit?utm_content=DAGzETPEis8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218331929', now());
  END IF;

  -- 3 남지혜
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEcG4Z9k/A52XIHxNzssdifBhwLKo0A/edit?utm_content=DAGzEcG4Z9k&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '남지혜 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 남지혜', 'canva', 'https://www.canva.com/design/DAGzEcG4Z9k/A52XIHxNzssdifBhwLKo0A/edit?utm_content=DAGzEcG4Z9k&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218608423', now());
  END IF;

  -- 4 도희정
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEZNFIBQ/1dt1qZy55NixspiRqdquXQ/edit?utm_content=DAGzEZNFIBQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '도희정 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 도희정', 'canva', 'https://www.canva.com/design/DAGzEZNFIBQ/1dt1qZy55NixspiRqdquXQ/edit?utm_content=DAGzEZNFIBQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218608419', now());
  END IF;

  -- 5 민수정
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEct11xw/p-NB9gBoDjMNopjVnz-kqw/edit?utm_content=DAGzEct11xw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '민수정 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 민수정', 'canva', 'https://www.canva.com/design/DAGzEct11xw/p-NB9gBoDjMNopjVnz-kqw/edit?utm_content=DAGzEct11xw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218608450', now());
  END IF;

  -- 6 방정은
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEca43d0/p_sYiOEsuk018ZbsQ3_weg/edit?utm_content=DAGzEca43d0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '방정은 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 방정은', 'canva', 'https://www.canva.com/design/DAGzEca43d0/p_sYiOEsuk018ZbsQ3_weg/edit?utm_content=DAGzEca43d0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218626316', now());
  END IF;

  -- 7 소민정 (Checking for duplicates strictly as requested + general check)
  -- The user asked to avoid duplicates for this one specifically, but good practice for all.
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEakvjiM/DoDa7V7SI2nrADTyOKneig/edit?utm_content=DAGzEakvjiM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton' OR title LIKE '%소민정%') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '소민정 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 소민정', 'canva', 'https://www.canva.com/design/DAGzEakvjiM/DoDa7V7SI2nrADTyOKneig/edit?utm_content=DAGzEakvjiM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218694094', now());
  END IF;

  -- 9 유문주
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEceTjKA/s_5Y3EeaJcYJmIEBBpOZ8A/edit?utm_content=DAGzEceTjKA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '유문주 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 유문주', 'canva', 'https://www.canva.com/design/DAGzEceTjKA/s_5Y3EeaJcYJmIEBBpOZ8A/edit?utm_content=DAGzEceTjKA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218608429', now());
  END IF;

  -- 10 윤다혜
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEYrHWMM/tXM1sr6UKDiv7wgZ50nwHA/edit?utm_content=DAGzEYrHWMM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '윤다혜 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 윤다혜', 'canva', 'https://www.canva.com/design/DAGzEYrHWMM/tXM1sr6UKDiv7wgZ50nwHA/edit?utm_content=DAGzEYrHWMM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218608424', now());
  END IF;

  -- 11 이준민
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEcYzyvg/0ps9ozQWb60UUkiazv3d8Q/edit?utm_content=DAGzEcYzyvg&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '이준민 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 이준민', 'canva', 'https://www.canva.com/design/DAGzEcYzyvg/0ps9ozQWb60UUkiazv3d8Q/edit?utm_content=DAGzEcYzyvg&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218602871', now());
  END IF;

  -- 13 정경하
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzER44pEU/z8x33jUpyBk29vq4O5_m_g/edit?utm_content=DAGzER44pEU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '정경하 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 정경하', 'canva', 'https://www.canva.com/design/DAGzER44pEU/z8x33jUpyBk29vq4O5_m_g/edit?utm_content=DAGzER44pEU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218367892', now());
  END IF;

  -- 14 최보선
  IF NOT EXISTS (SELECT 1 FROM projects WHERE resource_url = 'https://www.canva.com/design/DAGzEc0K5yo/qzzTwCGnJfk9mdt35YX52g/edit?utm_content=DAGzEc0K5yo&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton') THEN
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, created_at)
    VALUES (v_category_id, '최보선 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 최보선', 'canva', 'https://www.canva.com/design/DAGzEc0K5yo/qzzTwCGnJfk9mdt35YX52g/edit?utm_content=DAGzEc0K5yo&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 'https://product.kyobobook.co.kr/detail/S000218602854', now());
  END IF;

END $$;
