# dtslib.kr — START HERE

## 이 레포는 뭐냐
- MDX 문서 생산용 (앱 아님)
- PWA 설치 프롬프트 없음 (standalone 금지)
- 브라우저 UI(주소창) 유지
- 브라우저 번역 사용

**Live:** https://dtslib.kr

---

## 오늘 할 일 (3줄)

1. `src/content/{category}/{slug}.mdx` 추가
2. `git push origin main`
3. 배포 확인

---

## 금지 (자동 차단됨)

| ❌ 금지 | 이유 |
|--------|------|
| 루트에 .md 추가 | README.md만 허용 |
| vite-plugin-pwa 설치 | 캐시 문제 |
| workbox 설치 | PWA 금지 |
| manifest `display: standalone` | 앱처럼 설치됨 |
| service worker 코드 | PWA 금지 |

> `npm run build` 시 `repo-guard.mjs`가 자동 검사 → 위반 시 빌드 실패

### 예외 (2025-12-30 추록)

| ✅ 허용 | 조건 |
|--------|------|
| manifest.json | `display: "browser"` 필수 |

> 브라우저 바로가기 추가 시 아이콘 표시용. 주소창 유지됨, PWA 설치 프롬프트 안 뜸.

---

## 카테고리

| 폴더 | 용도 |
|------|------|
| dts-blueprint | 설계 문서 |
| qsketch | 빠른 스케치 |
| penon | Penon |
| mal | Mal |
| patchtech | 기술 패치 |
| eml | EML |
| phl | PHL |

---

## MDX 템플릿

```mdx
---
title: "제목"
date: "2025-12-18"
category: "카테고리명"
---

본문
```

---

## 로컬 개발

```bash
npm install
npm run dev     # localhost:5173
npm run build   # guard + vite build
```

---

## 기술 스택

React 18 + Vite 5 + MDX + TailwindCSS 3 + GitHub Pages
