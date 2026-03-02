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

  -- 3. Theme 1: ✅ AI 숏폼 영상 제작, 김햄찌 따라하기 (5 videos)
  INSERT INTO projects (category_id, title, description, resource_type, resource_url, created_at) VALUES
  (v_cat_id, '삐약이의 첫 회식', '✅ AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', '6a2IcaS-a_4', now() - interval '8 seconds'),
  (v_cat_id, '매수 타이밍 놓친 펭모씨의 좌절', '✅ AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'lOJIfGYLep8', now() - interval '7 seconds'),
  (v_cat_id, '직장인의 하루', '✅ AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'a--zKGq14mU', now() - interval '6 seconds'),
  (v_cat_id, '홍이글의 골프 어택', '✅ AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'j-aiGKQzwcM', now() - interval '5 seconds'),
  (v_cat_id, '토깽이 츄의 쇼핑 대참사', '✅ AI 숏폼 영상 제작, 김햄찌 따라하기', 'youtube', 'cvBjU9MBv84', now() - interval '4 seconds');

  -- 4. Theme 2: ✅ 초등 AI 뮤직비디오 (6 videos)
  INSERT INTO projects (category_id, title, description, resource_type, resource_url, created_at) VALUES
  (v_cat_id, '초등 AI 뮤직비디오 프로젝트 01', '✅ 초등 AI 뮤직비디오', 'youtube', 'w7DYBR60rJQ', now() - interval '6 seconds'),
  (v_cat_id, '초등 AI 뮤직비디오 프로젝트 02', '✅ 초등 AI 뮤직비디오', 'youtube', 'oCV0jb6Doiw', now() - interval '5 seconds'),
  (v_cat_id, '초등 AI 뮤직비디오 프로젝트 03', '✅ 초등 AI 뮤직비디오', 'youtube', 'ygyAOjJjcxw', now() - interval '4 seconds'),
  (v_cat_id, '초등 AI 뮤직비디오 프로젝트 04', '✅ 초등 AI 뮤직비디오', 'youtube', '0tkeY5Puh48', now() - interval '3 seconds'),
  (v_cat_id, '초등 AI 뮤직비디오 프로젝트 05', '✅ 초등 AI 뮤직비디오', 'youtube', '9kQ7WlCnasA', now() - interval '2 seconds'),
  (v_cat_id, '초등 AI 뮤직비디오 프로젝트 06', '✅ 초등 AI 뮤직비디오', 'youtube', 'JZYbBjx5Bz4', now() - interval '1 second');

  -- Note: Theme 3 '초등 북트레일러 제작' is mentioned as a future/planned topic.

END $$;
