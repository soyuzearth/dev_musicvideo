# Add Senior AI Class Canva links from Padlet

This plan outlines the steps to add student work (Canva public links) from the Senior AI Class Padlet to the website.

## User Review Required

> [!IMPORTANT]
> I was unable to access the Padlet link (https://padlet.com/cdljintest2/ai-bit-ly-2025aibook-ww3x5nyoc41gxesg) due to technical limitations with my browser tool. 
> **Please provide a list of student names and their corresponding Canva public view links.**

## Proposed Changes

### Database Updates

I will generate a SQL script to be run in the Supabase SQL Editor.

#### [NEW] `seed_senior_ai_canva.sql` (Conceptual)

The script will:
1.  **Ensure Category Exists**: Check for the '시니어 AI 수업' category and create it if missing.
2.  **Insert Projects**: Add each student's work as a project in the `projects` table.
    - `category_id`: ID of '시니어 AI 수업'.
    - `title`: "[Student Name] 작가님 - 시니어 AI 수업" (following existing patterns).
    - `resource_type`: 'canva'.
    - `resource_url`: The Canva public view link.
    - `description`: A brief description (e.g., "2025 시니어 AI 수업 결과물입니다.").

### Frontend Checks

Based on `ProjectDetail.jsx`, the frontend already handles `resource_type: 'canva'` by embedding it in an iframe. No code changes are expected in the frontend.

## Thumbnail Strategy (NEW)

Since Canva public preview links are dynamic, automated scraping is restricted. I propose two methods to get the cover images:

### [MODIFY] [fix_senior_ai_thumbnails_direct.sql](file:///d:/00_dev/00_dev_musicvideo/fix_senior_ai_thumbnails_direct.sql)
A new, foolproof SQL script that maps each author's Canva link directly to Padlet's image proxy. This ensures:
- **100% Accuracy**: No mismatch between authors and book covers.
- **Portait Aspect Ratio**: Forced `ar_0.75` (3:4) with `c_fill` to eliminate black bars.
- **High Reliability**: Bypasses dynamic DOM scraping entirely.

## Verification Plan

### Automated Tests
- The user will run the SQL script in Supabase and verify the frontend display.
- Check `ProjectCard.jsx` to ensure `bg-gray-50` is visible during image loading.

## Proposed Changes (Updated)

### 1. Database Updates
### 3. Thumbnail Quality & Formatting (NEW)
Address issues with black bars and missing cover images:
- **Black Bars Fix**: Change Padlet URL parameter from `ar_1.414285714` (A4 landscape) to `ar_0.75` (3:4 portrait) to match our frontend container.
- **Canva Logo Fix**: Propose a "Force Refresh" for specific links or use direct Canva thumbnail endpoints where possible.
- **Frontend Fallback**: Update `ProjectCard.jsx` to handle cases where a thumbnail might contain black bars or fail to load.
### Final Method: Manual Screenshot & Supabase Storage (Foolproof)
Since Padlet's security and dynamic structure prevent reliable automation, we will use the most professional and permanent method: **Self-hosting the thumbnails.**

#### 1. Supabase Storage 준비
- Supabase 대시보드에서 **Storage** 메뉴로 들어갑니다.
- **[New Bucket]** 버튼을 눌러 `project-thumbnails`라는 이름의 버킷을 생성합니다.
- 버킷 설정에서 **Public**을 활성화해 주세요 (로그인 없이도 이미지가 보여야 합니다).

#### 2. 이미지 캡처 및 업로드
- **Capture**: 각 캔바 링크를 열어 책 표지를 **3:4 비율(세로형)**로 캡처합니다.
- **Naming**: 파일 이름을 작가님 성함으로 저장해 주세요. (예: `강명신.png`, `김경희.jpg` 등)
- **Upload**: 생성한 버킷 안에 `senior-ai` 폴더를 만들고 16장의 사진을 모두 올립니다.

#### 3. 데이터베이스 업데이트 (제가 수행)
- 업로드가 완료되면 저에게 말씀해 주세요. 
- 제가 모든 이미지를 한 번에 사이트와 연결하는 최종 SQL을 생성해 드리겠습니다.

**이 방법의 장점:**
- **Permanent**: 외부 사이트(패들릿) 정책 변경에 영향을 받지 않습니다.
- **High Quality**: 가장 선명한 상태의 표지를 직접 선택할 수 있습니다.
- **Zero Configuration**: 브라우저 콘솔 코드를 실행할 필요가 없습니다.

### [MODIFY] [ProjectCard.jsx](file:///d:/00_dev/00_dev_musicvideo/src/components/ProjectCard.jsx)
Modify the aspect ratio logic to allow book-style thumbnails to display their natural proportions:
-   **Remove Fixed Ratio**: Replace `aspect-[3/4]` with a flexible approach for 'AI 동화책' and '시니어 AI 수업'.
-   **Image Scaling**: Ensure images fill the width while maintaining their natural height (`h-auto`).

## Verification Plan

### Manual Verification
1.  Navigate to the '시니어 AI 수업' category.
2.  Verify that book covers are displayed in their actual captured proportions (no cropping at top/bottom).
3.  Ensure the "Video" categories still maintain their `aspect-video` (16:9) ratio.
4.  Confirm that the hover overlay still correctly covers the entire image area.
