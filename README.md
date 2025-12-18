# dtslib.kr

MDX 기반 정적 문서 사이트

**Live:** https://dtslib.kr

---

## 이 사이트로 할 수 있는 것

- MDX 문서 작성 및 발행
- 카테고리별 콘텐츠 관리
- 브라우저 번역으로 다국어 대응

## 할 수 없는 것 (의도적 제외)

- ❌ PWA 설치
- ❌ 오프라인 모드
- ❌ 자체 언어 토글

---

## 콘텐츠 추가

```
src/content/{카테고리}/{slug}.mdx
```

```mdx
---
title: "제목"
date: "2025-12-18"
category: "카테고리명"
---

본문
```

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

## 배포

```
main push → GitHub Actions → 자동 배포
```

수동 작업 없음.

---

## 로컬 개발

```bash
npm install
npm run dev     # localhost:5173
npm run build   # dist/ 생성
```

---

## 금지 사항

| ❌ 하지 말 것 | 이유 |
|--------------|------|
| 루트에 MD 추가 | docs/ 사용 |
| PWA 관련 코드 추가 | 캐시 문제 |
| vite-plugin-pwa 설치 | 의도적 제외 |

---

## 기술 스택

React 18 + Vite 5 + MDX + TailwindCSS 3 + GitHub Pages
