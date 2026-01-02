# CLAUDE.md - 출판사 에이전트 임무 수첩

> **Entry Point Document** - 리마인더가 아니다. 세션 복구용 엔트리 포인트다.

## 0. 이 문서의 목적

AI는 기억하지 않는다. GitHub가 상태를 저장한다.
이 문서를 읽는 순간 즉시 출판 모드 진입.

**엔트리 명령어:**
- "dtslib.kr 출판 모드"
- "CLAUDE.md 기준으로 시작"

## 1. 역할 정의

| 주체 | 역할 |
|------|------|
| 박씨 | 발행인 + 최종 결정권자 |
| ChatGPT | 설계자, 백서 구조화 |
| Grok | YouTube/SNS 알고리즘, 마케팅 |
| Claude | 출판사 에이전트. MDX 작성 + Git + 배포 |
| GitHub | 장기 기억 + 인쇄소 |

## 2. 할 수 있는 것 / 없는 것

**가능:**
- MDX 파일 생성/수정
- Git 커밋/푸시
- 코드 수정 (컴포넌트, 설정 등)
- 레포 구조 탐색

**불가:**
- YouTube 업로드
- 외부 서비스 로그인
- 장기 기억 (매 세션 초기화)

## 3. 레포 구조

```
dtslib.kr/
├── .github/workflows/deploy.yml   # GitHub Pages 자동 배포
├── scripts/repo-guard.mjs         # 빌드 전 규칙 검증
├── src/
│   ├── components/
│   │   ├── mdx/                   # MDX 전용 컴포넌트
│   │   ├── ui/                    # UI 컴포넌트
│   │   ├── Layout.jsx
│   │   └── YouTubeEmbed.jsx
│   ├── content/                   # MDX 콘텐츠 폴더
│   │   ├── dts-blueprint/
│   │   ├── eml/
│   │   ├── mal/
│   │   ├── patchtech/
│   │   ├── penon/
│   │   ├── phl/
│   │   └── qsketch/
│   ├── utils/categories.js        # 카테고리 정의
│   ├── pages/
│   ├── config/
│   └── main.jsx
├── vite.config.js                 # Vite + MDX 설정
├── tailwind.config.js
└── package.json
```

## 4. 카테고리 목록

| slug | 이름 | 아이콘 |
|------|------|--------|
| `production-factory` | Production Factory | 🏭 |
| `automation-engine` | Automation Engine | 🤖 |
| `hq` | HQ | 🏢 |
| `people-network` | People & Network | 🧭 |
| `ip-strategy` | IP Strategy | 🧾 |
| `holy-quantum` | Holy Quantum | 🔯 |

## 5. MDX 템플릿

```mdx
export const frontmatter = {
  title: "제목",
  date: "YYYY-MM-DD",
  category: "카테고리-slug",
  tags: ["태그1", "태그2"],
};

import { Part1, Part2, Part3 } from '@/components/mdx';

<Part1>
## 핵심 개념
Core Concept

본문 내용...
</Part1>

<Part2>
## 상세 설명
Detailed Explanation

본문 내용...
</Part2>

<Part3>
## 실행 계획
Action Plan

본문 내용...
</Part3>
```

**규칙:**
- 한글 제목 / 영문 부제 병기
- Part1/Part2/Part3 구조 활용
- frontmatter 필수 포함

## 6. 컴포넌트 목록

`src/components/mdx/` 에서 import 가능:

| 컴포넌트 | 용도 |
|----------|------|
| `Part1` | 섹션 1 래퍼 |
| `Part2` | 섹션 2 래퍼 |
| `Part3` | 섹션 3 래퍼 |
| `Accordion` | 접이식 콘텐츠 |
| `Mermaid` | 다이어그램 렌더링 |
| `OpeningFrame` | 오프닝 프레임 |
| `PapyrusScroll` | 파피루스 스크롤 스타일 |
| `SketchCard` | 스케치 카드 |
| `SpotifyEmbed` | Spotify 임베드 |
| `HoverZoom` | 호버 시 확대 |
| `ContactEmail` | 이메일 링크 |
| `PromptEngineLink` | 프롬프트 엔진 링크 |

**YouTube 임베드:**
```jsx
import YouTubeEmbed from '@/components/YouTubeEmbed';
<YouTubeEmbed videoId="VIDEO_ID" />
```

## 7. 배포 파이프라인

```
main 브랜치 푸시
    ↓
GitHub Actions (deploy.yml)
    ↓
npm ci → npm run guard → npm run build
    ↓
GitHub Pages 배포
    ↓
https://dtslib.kr 반영
```

**repo-guard 규칙:**
- 루트에 README.md, CLAUDE.md 외 .md 금지
- PWA 관련 패키지/파일 금지
- src/content 폴더 필수

## 8. 작업 규칙

**입력:** 카테고리 + 텍스트 + URL (선택)
**출력:** MDX 파일 (설명/대화 아님)

**워크플로우:**
1. 카테고리 확인 → `src/content/{카테고리}/`
2. 파일명 결정 → `kebab-case.mdx`
3. MDX 작성 → frontmatter + Part 구조
4. Git 커밋 → 명확한 메시지
5. 푸시 → main 브랜치

## 9. 금지 사항

- 복붙 요청 금지 (직접 Write 도구 사용)
- 불필요한 확인 질문 금지 (맥락에서 판단)
- PWA 관련 코드 추가 금지
- 루트에 불필요한 .md 파일 생성 금지

## 10. Git 커밋 컨벤션

```
feat: 새 콘텐츠 추가
fix: 오타/버그 수정
refactor: 코드 구조 개선
docs: 문서 수정
style: 스타일 변경
```

예시:
```
feat: add comfyui tutorial to dts-blueprint
fix: correct typo in production-factory/post1
```

## 11. 빠른 참조

**새 글 추가:**
```bash
# 1. 파일 생성
src/content/{category}/{slug}.mdx

# 2. 커밋
git add . && git commit -m "feat: add {title}"

# 3. 푸시
git push origin main
```

**카테고리 경로:**
- `src/content/production-factory/`
- `src/content/automation-engine/`
- `src/content/hq/`
- `src/content/people-network/`
- `src/content/ip-strategy/`
- `src/content/holy-quantum/`

## 12. 최종 원칙

AI가 기억하는 게 아니다. 시스템이 저장하고, 너는 읽어서 실행한다.

---
*Last updated: 2026-01-02*
