-- SQL Script to insert '시니어 AI 수업' projects (Canva Links) - Part 3 (16)
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

  -- 2. Insert Project (Canva Links)
  
  -- 최정순 (16)
  INSERT INTO projects (category_id, title, author, description, resource_type, resource_url, created_at)
  VALUES (v_category_id, '시니어 AI 수업 - 개미와 베짱이', '최정순', '2025 강남시니어플라자 AI 동화작가 되기 수업 작품입니다.', 'canva', 
          'https://www.canva.com/design/DAG0_lXCqIU/miorCpt9-VHpjw_8AhGU1A/view', 
          now());

END $$;
