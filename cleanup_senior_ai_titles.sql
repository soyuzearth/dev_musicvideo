-- SQL Script to remove '시니어 AI 수업 - ' prefix from project titles
-- Run this in the Supabase SQL Editor.

DO $$
DECLARE
  v_category_id bigint;
BEGIN
  -- 1. Get Category ID
  SELECT id INTO v_category_id FROM categories WHERE name = '시니어 AI 수업' LIMIT 1;
  
  IF v_category_id IS NULL THEN
    RAISE EXCEPTION 'Category "시니어 AI 수업" not found.';
  END IF;

  -- 2. Update titles by removing the prefix
  UPDATE projects 
  SET title = REPLACE(title, '시니어 AI 수업 - ', '')
  WHERE category_id = v_category_id 
  AND title LIKE '시니어 AI 수업 - %';

  -- 3. Fix specific incorrect titles
  UPDATE projects SET title = '서호와 숲 속의 말' WHERE category_id = v_category_id AND author = '이금숙';
  UPDATE projects SET title = '포포의 비밀 가방' WHERE category_id = v_category_id AND author = '안정선';

  RAISE NOTICE 'Successfully cleaned up titles and fixed specific author titles.';

END $$;
