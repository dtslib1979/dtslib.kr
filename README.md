# dtslib.kr

React + Vite + MDX + TailwindCSS 기반 PWA 사이트

**Live:** [dtslib.kr](https://dtslib.kr)

## 기술 스택

- React 18 + Vite 5
- React Router 6
- MDX (remark-gfm, rehype-slug)
- TailwindCSS 3
- VitePWA (Workbox)
- GitHub Actions → GitHub Pages

## 디렉토리 구조

```
├── .github/workflows/deploy.yml   # CI/CD
├── public/
│   ├── CNAME                      # 커스텀 도메인
│   ├── dtslib.kr-logo.png         # PWA 아이콘
│   └── manifest.webmanifest
├── src/
│   ├── components/                # Layout, UI, MDX 컴포넌트
│   ├── content/                   # MDX 콘텐츠
│   ├── pages/                     # 라우트 페이지
│   ├── utils/                     # 유틸리티
│   └── App.jsx                    # 라우터
├── docs/                          # 프로젝트 문서
└── vite.config.js
```

## 명령어

```bash
npm install     # 의존성 설치
npm run dev     # 개발 서버 (localhost:5173)
npm run build   # 프로덕션 빌드
npm run preview # 빌드 미리보기
```

## 배포

main 브랜치 push → GitHub Actions 자동 배포

## 라이선스

MIT
