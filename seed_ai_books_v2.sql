
-- SQL Script to insert 'AI 동화책' projects (v2)
-- Includes Thumbnail URLs and Public View Canva Links
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

  -- 2. Insert Projects 
  -- We use ON CONFLICT DO UPDATE behavior conceptually by checking for existence first.
  -- Since we want to UPDATE existing rows with the new thumbnail/link if they exist, we'll try an UPDATE first, then INSERT if not found.

  -- Helper logic: We will attempt an UPSERT-like approach using the resource_url (original or new) or purchase_url as a key.
  -- However, to keep it simple and safe for manual execution:
  -- We will check by 'purchase_url' (Kyobo link) which is unique per book. 
  -- If found, we UPDATE the thumbnail_url and resource_url.
  -- If not found, we INSERT.

  -- 2 김보라
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218331929') THEN
    UPDATE projects 
    SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000934357.jpg',
        resource_url = 'https://www.canva.com/design/DAGzETPEis8/ynEnDlTktHaIL9_7zJV2oQ/view?utm_content=DAGzETPEis8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
    WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218331929';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '김보라 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 김보라', 'canva', 
            'https://www.canva.com/design/DAGzETPEis8/ynEnDlTktHaIL9_7zJV2oQ/view?utm_content=DAGzETPEis8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218331929', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000934357.jpg', 
            now());
  END IF;

  -- 3 남지혜
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608423') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938195.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEcG4Z9k/A52XIHxNzssdifBhwLKo0A/view?utm_content=DAGzEcG4Z9k&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608423';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '남지혜 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 남지혜', 'canva', 
            'https://www.canva.com/design/DAGzEcG4Z9k/A52XIHxNzssdifBhwLKo0A/view?utm_content=DAGzEcG4Z9k&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218608423', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938195.jpg', 
            now());
  END IF;

  -- 4 도희정
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608419') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939277.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEZNFIBQ/1dt1qZy55NixspiRqdquXQ/view?utm_content=DAGzEZNFIBQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608419';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '도희정 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 도희정', 'canva', 
            'https://www.canva.com/design/DAGzEZNFIBQ/1dt1qZy55NixspiRqdquXQ/view?utm_content=DAGzEZNFIBQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218608419', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939277.jpg',
            now());
  END IF;

  -- 5 민수정
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608450') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938584.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEct11xw/p-NB9gBoDjMNopjVnz-kqw/view?utm_content=DAGzEct11xw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608450';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '민수정 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 민수정', 'canva', 
            'https://www.canva.com/design/DAGzEct11xw/p-NB9gBoDjMNopjVnz-kqw/view?utm_content=DAGzEct11xw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218608450', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938584.jpg',
            now());
  END IF;

  -- 6 방정은
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218626316') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939192.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEca43d0/p_sYiOEsuk018ZbsQ3_weg/view?utm_content=DAGzEca43d0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218626316';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '방정은 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 방정은', 'canva', 
            'https://www.canva.com/design/DAGzEca43d0/p_sYiOEsuk018ZbsQ3_weg/view?utm_content=DAGzEca43d0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218626316', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939192.jpg',
            now());
  END IF;

  -- 7 소민정
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218694094') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000942635.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEakvjiM/DoDa7V7SI2nrADTyOKneig/view?utm_content=DAGzEakvjiM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218694094';
  ELSE
    -- Re-check title uniqueness for 소민정 just in case
    IF NOT EXISTS (SELECT 1 FROM projects WHERE title LIKE '%소민정%') THEN
        INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
        VALUES (v_category_id, '소민정 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 소민정', 'canva', 
                'https://www.canva.com/design/DAGzEakvjiM/DoDa7V7SI2nrADTyOKneig/view?utm_content=DAGzEakvjiM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
                'https://product.kyobobook.co.kr/detail/S000218694094', 
                'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000942635.jpg',
                now());
    END IF;
  END IF;

  -- 9 유문주
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608429') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939253.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEceTjKA/s_5Y3EeaJcYJmIEBBpOZ8A/view?utm_content=DAGzEceTjKA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608429';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '유문주 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 유문주', 'canva', 
            'https://www.canva.com/design/DAGzEceTjKA/s_5Y3EeaJcYJmIEBBpOZ8A/view?utm_content=DAGzEceTjKA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218608429', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939253.jpg',
            now());
  END IF;

  -- 10 윤다혜
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608424') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938409.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEYrHWMM/tXM1sr6UKDiv7wgZ50nwHA/view?utm_content=DAGzEYrHWMM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218608424';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '윤다혜 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 윤다혜', 'canva', 
            'https://www.canva.com/design/DAGzEYrHWMM/tXM1sr6UKDiv7wgZ50nwHA/view?utm_content=DAGzEYrHWMM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218608424', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938409.jpg',
            now());
  END IF;

  -- 11 이준민
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218602871') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000940051.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEcYzyvg/0ps9ozQWb60UUkiazv3d8Q/view?utm_content=DAGzEcYzyvg&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218602871';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '이준민 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 이준민', 'canva', 
            'https://www.canva.com/design/DAGzEcYzyvg/0ps9ozQWb60UUkiazv3d8Q/view?utm_content=DAGzEcYzyvg&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218602871', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000940051.jpg',
            now());
  END IF;

  -- 13 정경하
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218367892') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000935347.jpg',
         resource_url = 'https://www.canva.com/design/DAGzER44pEU/z8x33jUpyBk29vq4O5_m_g/view?utm_content=DAGzER44pEU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218367892';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '정경하 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 정경하', 'canva', 
            'https://www.canva.com/design/DAGzER44pEU/z8x33jUpyBk29vq4O5_m_g/view?utm_content=DAGzER44pEU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218367892', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000935347.jpg',
            now());
  END IF;

  -- 14 최보선
  IF EXISTS (SELECT 1 FROM projects WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218602854') THEN
     UPDATE projects 
     SET thumbnail_url = 'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000940068.jpg',
         resource_url = 'https://www.canva.com/design/DAGzEc0K5yo/qzzTwCGnJfk9mdt35YX52g/view?utm_content=DAGzEc0K5yo&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'
     WHERE purchase_url = 'https://product.kyobobook.co.kr/detail/S000218602854';
  ELSE
    INSERT INTO projects (category_id, title, description, resource_type, resource_url, purchase_url, thumbnail_url, created_at)
    VALUES (v_category_id, '최보선 작가님 - AI 동화책', '2025 수지도서관 AI 동화작가 되기 3기 작품입니다.' || chr(10) || chr(10) || '작가: 최보선', 'canva', 
            'https://www.canva.com/design/DAGzEc0K5yo/qzzTwCGnJfk9mdt35YX52g/view?utm_content=DAGzEc0K5yo&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 
            'https://product.kyobobook.co.kr/detail/S000218602854', 
            'https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000940068.jpg',
            now());
  END IF;

END $$;
