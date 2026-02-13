# Walkthrough - Adding Senior AI Class Canva Links

I have successfully prepared the data and updated the frontend to display the new '시니어 AI 수업' projects.

## Changes Made

### 1. Database Preparation
I have created three SQL scripts to populate the '시니어 AI 수업' category with a total of 16 student projects from the Padlet.

#### [NEW] [seed_senior_ai_canva.sql](file:///d:/00_dev/00_dev_musicvideo/seed_senior_ai_canva.sql)
- Projects 1-8 (강명신 ~ 이길자)

#### [NEW] [seed_senior_ai_canva_v2.sql](file:///d:/00_dev/00_dev_musicvideo/seed_senior_ai_canva_v2.sql)
- Projects 9-15 (이명옥 ~ 최은화)

#### [NEW] Supabase Storage 버킷 생성 및 이미지 업로드
- **버킷**: `project-thumbnails` (Public 활설화)
- **폴더**: `senior-ai`
- **파일명**: `작가명.png` (예: `강명신.png`)

### [DELETE] 패들릿 자동 수집 스크립트 (제거)
- 패들릿의 보안 정책 및 구조 변경으로 인해 더 이상 사용하지 않음.

### [MODIFY] 데이터베이스 업데이트 방식
- 업로드된 Supabase Storage 주소를 기반으로 최종 SQL 업데이트 예정.

### 2. Frontend Refactoring
To ensure the new category matches the portrait aspect ratio of 'AI 동화책', I updated the following components:

#### [MODIFY] [PortfolioGrid.jsx](file:///d:/00_dev/00_dev_musicvideo/src/components/PortfolioGrid.jsx)
- Modified the category lookup to pass the `categoryName` prop to each `ProjectCard`.

#### [MODIFY] [ProjectCard.jsx](file:///d:/00_dev/00_dev_musicvideo/src/components/ProjectCard.jsx)
- Updated the aspect ratio logic to use `isBookCategory`, which checks if the category name is 'AI 동화책' or '시니어 AI 수업'.
- This ensures that both categories use the portrait `aspect-[3/4]` layout, while others continue to use `aspect-video`.

## Verification Results

### Manual Verification Required
> [!IMPORTANT]
> Please run the following SQL scripts in your Supabase SQL Editor in order:
> 1. [seed_senior_ai_canva.sql](file:///d:/00_dev/00_dev_musicvideo/seed_senior_ai_canva.sql) (Initial 1-8)
> 2. [seed_senior_ai_canva_v2.sql](file:///d:/00_dev/00_dev_musicvideo/seed_senior_ai_canva_v2.sql) (Projects 9-15)
> 3. [seed_senior_ai_canva_v3.sql](file:///d:/00_dev/00_dev_musicvideo/seed_senior_ai_canva_v3.sql) (Project 16)
> 4. [update_senior_ai_thumbnails.sql](file:///d:/00_dev/00_dev_musicvideo/update_senior_ai_thumbnails.sql)
### Manual Thumbnail Integration (Final)
Due to issues with automated scraping, a manual approach was used:
1.  **Manual Screenshots:** The user captured 16 book covers in 3:4 aspect ratio.
2.  **Supabase Storage:** Images were uploaded to `ebooks/` bucket with numbered filenames (`1.png` to `16.png`) corresponding to the author order.
3.  **Database Update:** [update_senior_ai_thumbnails_storage.sql](file:///d:/00_dev/00_dev_musicvideo/update_senior_ai_thumbnails_storage.sql) was created to point all projects to these permanent storage URLs.

| Author | Filename |
| :--- | :--- |
| 강명신 | 1.png |
| 김경희 | 2.png |
| ... | ... |
| 최정순 | 16.png |

### Results
- Fixed aspect ratio (3:4) for all book projects.
- Removed black bars and unwanted logos.
- Permanent URLs that are faster and more reliable than scraping.
- **Title Cleanup**: Removed '시니어 AI 수업 -' prefix and fixed specific titles for authors (안정선, 이금숙).
- **GitHub & Vercel**: All changes pushed to GitHub and deployed to the production site.

### Final Cleanup (Optional)
[cleanup_senior_ai_titles.sql](file:///d:/00_dev/00_dev_musicvideo/cleanup_senior_ai_titles.sql) was created to clean up the display titles and fix mistakes.ds correctly.
