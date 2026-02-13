-- SQL Script to insert '시니어 AI 수업' projects (Canva Links) - Part 2 (9-15)
-- Run this in the Supabase SQL Editor

DO $$
DECLARE
  v_category_id bigint;
BEGIN
  -- 1. Get or Create Category '시니어 AI 수업'
  SELECT id INTO v_category_id FROM categories WHERE name = '시니어 AI 수업' LIMIT 1;
  
  IF v_category_id IS NULL THEN
    INSERT INTO categories (name) VALUES ('시니어 AI 수업') RETURNING id INTO v_category_id;
    RAISE NOTICE 'Created new category ''시니어 AI 수업'' with ID %', v_category_id;
  ELSE
    RAISE NOTICE 'Found existing category ''시니어 AI 수업'' with ID %', v_category_id;
  END IF;

  -- 2. Insert Projects (Canva Links)
  
  -- 이명옥 (9)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 루루와 동물들의 꿈의 집', '이명옥', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_dBR1ek/lDt7S8bgXVY83Eg3IXLWgg/view', 
          now());

  -- 전성인 (10)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 시아는 반짝반짝 나비', '전성인', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_ddSBbY/pN8Zoo7ChzQ7dnU3ajOoIA/view', 
          now());

  -- 정광득 (11)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 별씨앗을 심는 아이들', '정광득', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_Zcurb4/jdPBmVm3tiiBnZdO93XMvQ/view', 
          now());

  -- 정덕자 (12)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 용감한 흰동가리의 모험과 사랑', '정덕자', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_fHWw_w/kdNKgw4PjJIOsDJ_FnoANw/view', 
          now());

  -- 조혜란 (13)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 엉뚱천재 똥글이', '조혜란', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_omCWH8/sE8ZoOSrgYDNHO4NgqqNoA/view', 
          now());

  -- 최송록 (14)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 오리 삼형제와 거북이', '최송록', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_nVHCbE/62CSYoY-pZXxKx_nBiBWPw/view', 
          now());

  -- 최은화 (15)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 수호의 타임머신', '최은화', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAGzNL6Yu9U/hsNTgFvuY4Q1Cvdr1ctJbw/view', 
          now());

END $$;
