-- SQL Script to update thumbnails for '시니어 AI 수업' projects
-- Run this in the Supabase SQL Editor

DO $$
DECLARE
  v_category_id bigint;
BEGIN
  -- 1. Get Category ID
  SELECT id INTO v_category_id FROM categories WHERE name = '시니어 AI 수업' LIMIT 1;

  IF v_category_id IS NULL THEN
    RAISE EXCEPTION 'Category ''시니어 AI 수업'' not found. Please run the seeding scripts first.';
  END IF;

  -- 2. Update Thumbnails (Replacing w_56 with w_480 for better quality)
  
  -- 강명신
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2Fc87961d9c8d02f90ff29a553f12c37d588283797%2Fbhwebsnap-30309c22bb22454d443ff848ae1f625b47e7040e-h-c4bef737efdbe6bb51081b5889852b2d.png'
  WHERE category_id = v_category_id AND author = '강명신';

  -- 김경희
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2Fd5cd557d105ce3ff26ca16eb351a5facd76fe26b%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '김경희';

  -- 김연순
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F8a414a7895f58ea3732b287bab56cedc9020e0a9%2Fbhwebsnap-6555344b43ffc39ccd5d08fad6bf9e11b784f369-h-5260e4a4aa17b81d7048661692cb927c.png'
  WHERE category_id = v_category_id AND author = '김연순';

  -- 김영란
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F00b9d454de8612fd51b92d307f9e557bd8322582%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '김영란';

  -- 박경임
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F4ddec675dcb76e9a06fb46dc1134d77ee9c07f5d%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '박경임';

  -- 안정선
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F8286454f69975812ef6e223e2f8f25fc9f0ad7f2%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '안정선';

  -- 이금숙
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F9cc8271c329a3d74c25592a9507f7f9c10e805c6%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '이금숙';

  -- 이길자
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F35ae76074ff7c10eca42dbf9c0347ed1c2db6a1f%2Fbhwebsnap-aa8c546521c85a9b7a9690d993d36e7abbb17d8f-h-632a39ca7983e4e16721bb58357ae9a0.png'
  WHERE category_id = v_category_id AND author = '이길자';

  -- 이명옥
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F25f58178afafb25cff7a2bf78af41d2b400837cd%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '이명옥';

  -- 전성인
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F749e918e95ff59ec7a59da81b0a52f8bf1570d76%2Fbhwebsnap-0d17607cf6a9df2a9823822d3d8a36e22c0be2c9-h-352ff2745217756a117ad76c0a3b0a95.png'
  WHERE category_id = v_category_id AND author = '전성인';

  -- 정광득
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F09895b750346bc8a5f313db675664a90a97de526%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '정광득';

  -- 정덕자
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F74ad02646a78f967320f32a6bde014a76b46a222%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '정덕자';

  -- 조혜란
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F8a7e374c4ea97be85904749363bc8405649c4a62%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '조혜란';

  -- 최송록
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2Ffa873b4f2aabc90ee0f770caf4b399e84f9ddd49%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '최송록';

  -- 최은화
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2Fe63c05b0c4c2702c1c691f501fd28d08934aa7a5%2F6092a1b89c9ab7954edba34ae64118c4-h-d6e9b56bd490c980c11d8b7248c07fd4.jpg'
  WHERE category_id = v_category_id AND author = '최은화';

  -- 최정순
  UPDATE projects SET thumbnail_url = 'https://v1.padlet.pics/1/image.webp?t=ar_1.414285714%2Cc_lfill%2Cdpr_2%2Cg_auto%2Cw_480&url=https%3A%2F%2Fpadlet-artifacts.storage.googleapis.com%2F88f0f6b36750ccf712df06de089f904c0549e180%2Fbhwebsnap-23d9ccfa511ee49057744977651d73773bfdef6f-h-90cbc15504ac108a7915c7e74be2a3c4.png'
  WHERE category_id = v_category_id AND author = '최정순';

END $$;
