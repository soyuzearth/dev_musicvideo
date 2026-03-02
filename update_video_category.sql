-- SQL Script to update video category and project list
-- Run this in the Supabase SQL Editor

DO $$
DECLARE
  v_cat_id bigint;
BEGIN
  -- 1. Find the old category '초등 AI 뮤직비디오' and rename it to 'AI 영상 제작'
  -- If it already has the new name, find it by that.
  SELECT id INTO v_cat_id FROM categories WHERE name = '초등 AI 뮤직비디오' LIMIT 1;
  
  IF v_cat_id IS NOT NULL THEN
    UPDATE categories SET name = 'AI 영상 제작' WHERE id = v_cat_id;
    RAISE NOTICE 'Renamed category from "초등 AI 뮤직비디오" to "AI 영상 제작" (ID: %)', v_cat_id;
  ELSE
    SELECT id INTO v_cat_id FROM categories WHERE name = 'AI 영상 제작' LIMIT 1;
    IF v_cat_id IS NULL THEN
      -- Create it if it doesn't exist at all (fallback)
      INSERT INTO categories (name) VALUES ('AI 영상 제작') RETURNING id INTO v_cat_id;
      RAISE NOTICE 'Created new category "AI 영상 제작" (ID: %)', v_cat_id;
    END IF;
  END IF;

  -- 2. Clear out existing projects in this category to implement the 3-theme structure
  DELETE FROM projects WHERE category_id = v_cat_id;

  -- 3. Theme 1: AI 숏폼 영상 제작, 김햄찌 따라하기 (5 videos)
  INSERT INTO projects (category_id, title, description, resource_type, resource_url, created_at) VALUES
  (v_cat_id, '삐약이의 첫 회식', 'AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', '6a2IcaS-a_4', now() - interval '5 seconds'),
  (v_cat_id, '매수 타이밍 놓친 펭모씨의 좌절', 'AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'lOJIfGYLep8', now() - interval '4 seconds'),
  (v_cat_id, '직장인의 하루', 'AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'a--zKGq14mU', now() - interval '3 seconds'),
  (v_cat_id, '홍이글의 골프 어택', 'AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'j-aiGKQzwcM', now() - interval '2 seconds'),
  (v_cat_id, '토깽이 츄의 쇼핑 대참사', 'AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'cvBjU9MBv84', now() - interval '1 second');

  -- 4. Theme 2: AI 뮤직비디오 (3 videos)
  INSERT INTO projects (category_id, title, description, resource_type, resource_url, created_at) VALUES
  (v_cat_id, '꿈꾸는 우주 비행사 (AI Generated)', 'AI 뮤직비디오 제작 프로젝트', 'youtube', 'dQw4w9WgXcQ', now() + interval '1 second'),
  (v_cat_id, '미래 도시의 하루', 'AI 뮤직비디오 제작 프로젝트', 'youtube', 'LXb3EKWsInQ', now() + interval '2 seconds'),
  (v_cat_id, '로봇 친구와 함께', 'AI 뮤직비디오 제작 프로젝트', 'youtube', 'ysz5S6P_z-E', now() + interval '3 seconds');

  -- Note: Theme 3 '초등 북트레일러 제작' is mentioned as a future/planned topic.

END $$;
