-- SQL Script to update thumbnails using local Supabase Storage URLs
-- This assumes images are uploaded to: project-thumbnails/senior-ai/작가명.png (or .jpg)
-- Run this in the Supabase SQL Editor.

DO $$
DECLARE
  v_category_id bigint;
  -- .env에서 확인된 Supabase URL을 기반으로 한 스토리지 공용 주소
  -- 사용자가 제공한 실제 주소: https://udlyikebeopjnewoydbg.supabase.co/storage/v1/object/public/ebooks/1.png
  v_storage_base text := 'https://udlyikebeopjnewoydbg.supabase.co/storage/v1/object/public/ebooks/';
BEGIN
  -- 1. Get Category ID
  SELECT id INTO v_category_id FROM categories WHERE name = '시니어 AI 수업' LIMIT 1;
  
  IF v_category_id IS NULL THEN
    RAISE EXCEPTION 'Category "시니어 AI 수업" not found.';
  END IF;

  -- 2. Update Thumbnail URLs for all 16 authors
  -- 작가 이름 앞의 숫자(1..16)로 파일명이 설정된 것으로 업데이트합니다.
  
  UPDATE projects SET thumbnail_url = v_storage_base || '1.png' WHERE category_id = v_category_id AND author = '강명신';
  UPDATE projects SET thumbnail_url = v_storage_base || '2.png' WHERE category_id = v_category_id AND author = '김경희';
  UPDATE projects SET thumbnail_url = v_storage_base || '3.png' WHERE category_id = v_category_id AND author = '김연순';
  UPDATE projects SET thumbnail_url = v_storage_base || '4.png' WHERE category_id = v_category_id AND author = '김영란';
  UPDATE projects SET thumbnail_url = v_storage_base || '5.png' WHERE category_id = v_category_id AND author = '박경임';
  UPDATE projects SET thumbnail_url = v_storage_base || '6.png' WHERE category_id = v_category_id AND author = '안정선';
  UPDATE projects SET thumbnail_url = v_storage_base || '7.png' WHERE category_id = v_category_id AND author = '이금숙';
  UPDATE projects SET thumbnail_url = v_storage_base || '8.png' WHERE category_id = v_category_id AND author = '이길자';
  UPDATE projects SET thumbnail_url = v_storage_base || '9.png' WHERE category_id = v_category_id AND author = '이명옥';
  UPDATE projects SET thumbnail_url = v_storage_base || '10.png' WHERE category_id = v_category_id AND author = '전성인';
  UPDATE projects SET thumbnail_url = v_storage_base || '11.png' WHERE category_id = v_category_id AND author = '정광득';
  UPDATE projects SET thumbnail_url = v_storage_base || '12.png' WHERE category_id = v_category_id AND author = '정덕자';
  UPDATE projects SET thumbnail_url = v_storage_base || '13.png' WHERE category_id = v_category_id AND author = '조혜란';
  UPDATE projects SET thumbnail_url = v_storage_base || '14.png' WHERE category_id = v_category_id AND author = '최송록';
  UPDATE projects SET thumbnail_url = v_storage_base || '15.png' WHERE category_id = v_category_id AND author = '최은화';
  UPDATE projects SET thumbnail_url = v_storage_base || '16.png' WHERE category_id = v_category_id AND author = '최정순';

  RAISE NOTICE 'Successfully updated 16 thumbnail URLs to Supabase Storage paths.';

END $$;
