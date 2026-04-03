-- 강의 영상 게시판
CREATE TABLE IF NOT EXISTS course_videos (
    id BIGSERIAL PRIMARY KEY,
    course_id BIGINT NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    author_user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    body TEXT,                                  -- 영상 상세 설명
    video_url TEXT NOT NULL,                   -- S3 영상 스트리밍 경로
    view_count INTEGER DEFAULT 0,              -- 조회수
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 영상 댓글 (영상 게시판이 삭제되면 해당 댓글들도 자동으로 삭제됨)
CREATE TABLE IF NOT EXISTS video_comments (
    id BIGSERIAL PRIMARY KEY,
    video_id BIGINT NOT NULL REFERENCES course_videos(id) ON DELETE CASCADE,
    author_user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    body TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 강의 자료 게시판
CREATE TABLE IF NOT EXISTS course_materials (
    id BIGSERIAL PRIMARY KEY,
    course_id BIGINT NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    author_user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    body TEXT,                                  -- 자료 상세 설명
    file_url TEXT NOT NULL,                    -- S3 파일 다운로드 경로
    view_count INTEGER DEFAULT 0,              -- 조회수
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 강의 자료 댓글 (강의 자료가 삭제되면 해당 댓글들도 자동으로 삭제됨)
CREATE TABLE IF NOT EXISTS material_comments (
    id BIGSERIAL PRIMARY KEY,
    material_id BIGINT NOT NULL REFERENCES course_materials(id) ON DELETE CASCADE,
    author_user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    body TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);x`
