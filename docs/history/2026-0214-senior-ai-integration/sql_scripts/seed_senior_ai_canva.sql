-- SQL Script to insert '시니어 AI 수업' projects (Canva Links)
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
  
  -- 강명신
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 밥 장난감 나라', '강명신', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAGygZMDC_o/Hzd5Upkt3xOngGA9SfwW4w/view', 
          now());

  -- 김경희
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 토끼와 달빛 씨앗', '김경희', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAGygat-5AM/-Uddxp9aWRw-zgRkHClcJw/view', 
          now());

  -- 김연순
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 꼬마 토토와 마법 자동차 나라', '김연순', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG08CUj2gQ/5GqPfAYz2iaqVr-zYZ6bqQ/view', 
          now());

  -- 김영란
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 세한도의 사랑', '김영란', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAGzJsZ0_KY/XlOZBir56N0gWdfXv1OR5Q/view', 
          now());

  -- 박경임
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 루나와 토토의 꿈속 모험', '박경임', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG08E0748M/ZlVoVmp9pkCCgVdh_o1NPw/view', 
          now());

  -- 안정선
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 동화책', '안정선', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG1jfDRt9I/ueDvZu3oTEgebOg-jl9IYA/view', 
          now());

  -- 이금숙
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 하트숲의 비밀', '이금숙', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG08Xr-dyQ/-2XFeQj9bFAE7B4jn_9S6Q/view', 
          now());

  -- 이길자
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 할머니와 손자의 세계 여행', '이길자', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_QPkAWc/uf9-cu5D8XHBwh0FycEmyg/view', 
          now());

END $$;
