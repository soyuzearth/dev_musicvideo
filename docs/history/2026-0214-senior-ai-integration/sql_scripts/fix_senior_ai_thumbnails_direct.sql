-- SQL Script to fix thumbnails using direct Canva-to-Padlet Proxy mapping
-- This ensures each author gets the correct 3:4 portrait thumbnail from their Canva design.
-- Run this in the Supabase SQL Editor.

DO $$
DECLARE
  v_category_id bigint;
  v_proxy_base text := 'https://v1.padlet.pics/1/image.webp?t=ar_0.75%2Cc_fill%2Cw_640&url=';
BEGIN
  -- 1. Get Category ID
  SELECT id INTO v_category_id FROM categories WHERE name = '시니어 AI 수업' LIMIT 1;
  
  IF v_category_id IS NULL THEN
    RAISE EXCEPTION 'Category "시니어 AI 수업" not found.';
  END IF;

  -- 2. Update Thumbnail URLs for all 16 authors
  
  -- 1. 강명신
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAGygZMDC_o%2FHzd5Upkt3xOngGA9SfwW4w%2Fview'
  WHERE category_id = v_category_id AND author = '강명신';

  -- 2. 김경희
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAGygat-5AM%2F-Uddxp9aWRw-zgRkHClcJw%2Fview'
  WHERE category_id = v_category_id AND author = '김경희';

  -- 3. 김연순
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG08CUj2gQ%2F5GqPfAYz2iaqVr-zYZ6bqQ%2Fview'
  WHERE category_id = v_category_id AND author = '김연순';

  -- 4. 김영란
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAGzJsZ0_KY%2FXlOZBir56N0gWdfXv1OR5Q%2Fview'
  WHERE category_id = v_category_id AND author = '김영란';

  -- 5. 박경임
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG08E0748M%2FZlVoVmp9pkCCgVdh_o1NPw%2Fview'
  WHERE category_id = v_category_id AND author = '박경임';

  -- 6. 안정선
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG1jfDRt9I%2FueDvZu3oTEgebOg-jl9IYA%2Fview'
  WHERE category_id = v_category_id AND author = '안정선';

  -- 7. 이금숙
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG08Xr-dyQ%2F-2XFeQj9bFAE7B4jn_9S6Q%2Fview'
  WHERE category_id = v_category_id AND author = '이금숙';

  -- 8. 이길자
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_QPkAWc%2Fuf9-cu5D8XHBwh0FycEmyg%2Fview'
  WHERE category_id = v_category_id AND author = '이길자';

  -- 9. 이명옥
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_dBR1ek%2FlDt7S8bgXVY83Eg3IXLWgg%2Fview'
  WHERE category_id = v_category_id AND author = '이명옥';

  -- 10. 전성인
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_ddSBbY%2FpN8Zoo7ChzQ7dnU3ajOoIA%2Fview'
  WHERE category_id = v_category_id AND author = '전성인';

  -- 11. 정광득
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_Zcurb4%2FjdPBmVm3tiiBnZdO93XMvQ%2Fview'
  WHERE category_id = v_category_id AND author = '정광득';

  -- 12. 정덕자
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_fHWw_w%2FkdNKgw4PjJIOsDJ_FnoANw%2Fview'
  WHERE category_id = v_category_id AND author = '정덕자';

  -- 13. 조혜란
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_omCWH8%2FsE8ZoOSrgYDNHO4NgqqNoA%2Fview'
  WHERE category_id = v_category_id AND author = '조혜란';

  -- 14. 최송록
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_nVHCbE%2F62CSYoY-pZXxKx_nBiBWPw%2Fview'
  WHERE category_id = v_category_id AND author = '최송록';

  -- 15. 최은화
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAGzNL6Yu9U%2FhsNTgFvuY4Q1Cvdr1ctJbw%2Fview'
  WHERE category_id = v_category_id AND author = '최은화';

  -- 16. 최정순
  UPDATE projects SET thumbnail_url = v_proxy_base || 'https%3A%2F%2Fwww.canva.com%2Fdesign%2FDAG0_lXCqIU%2FmiorCpt9-VHpjw_8AhGU1A%2Fview'
  WHERE category_id = v_category_id AND author = '최정순';

  RAISE NOTICE 'Successfully updated 16 thumbnail URLs for 시니어 AI 수업.';

END $$;
