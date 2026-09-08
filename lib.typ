// =============================================================
//  lib.typ — Mặt tiền công khai của package uit-doc
//  Mọi import từ bên ngoài đều đi qua file này.
// =============================================================

// -------------------------------------------------------------
// CORE
// -------------------------------------------------------------

// Theme system — preset, token, make-theme()
#import "core/theme.typ": make-theme

// Hàm thuần — tính toán, định dạng, xử lý dữ liệu
// (chưa viết — sẽ thêm khi có core/utils.typ)
// #import "core/utils.typ": gpa, grade-label, total-credits,
//   pass-rate, fmt, pct, vn-date, pipe, compose, group-by,
//   deep-merge, safe-int, safe-float

// Nhãn song ngữ
// (chưa viết — sẽ thêm khi có core/i18n.typ)
// #import "core/i18n.typ": label, set-lang

// -------------------------------------------------------------
// COMPONENTS
// -------------------------------------------------------------

// Hộp ghi chú
// #import "components/callouts.typ": callout, note, tip,
//   warning, info, example-box, quote-block

// Hệ thống định lý
// #import "components/theorem.typ": make-env, theorem, lemma,
//   corollary, definition, example, remark, proposition,
//   proof, reset-envs

// Bảng
// #import "components/tables.typ": auto-table, confusion-matrix,
//   comparison-table

// Biểu đồ đơn giản
// #import "components/charts.typ": bar-chart, progress-bar,
//   sparkline

// Nhãn và badge
// #import "components/badges.typ": badge, status-badge, tag-list

// Card
// #import "components/cards.typ": student-card, project-card,
//   info-grid

// Timeline
// #import "components/timeline.typ": timeline, gantt-simple

// Code
// #import "components/code.typ": code-with-output, pseudocode

// Bài tập
// #import "components/exercises.typ": make-exercise-system,
//   quiz-question

// -------------------------------------------------------------
// pages — khối trang
// -------------------------------------------------------------

// Bìa
#import "pages/cover.typ": report-cover, //slide-cover

// Phần mở đầu
#import "pages/frontmatter.typ": list-of-tables, list-of-figures, list-of-abbreviations

// Mục lục
// #import "blocks/outlines.typ": toc, list-of-figures,
//   list-of-tables, list-of-algorithms

// Header / Footer
// #import "blocks/headers.typ": academic-header, minimal-header,
//   slide-header

// Phần kết
// #import "blocks/backmatter.typ": bibliography-page,
//   appendix-start, glossary, signature-block

// -------------------------------------------------------------
// TEMPLATES
// -------------------------------------------------------------

// Báo cáo đồ án / tiểu luận
#import "templates/report.typ": report, report-image, report-table

// Ghi chú học tập
// #import "templates/notes.typ": notes

// Slide thuyết trình
// #import "templates/slides.typ": slides
