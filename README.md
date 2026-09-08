# tbaouit

Template Typst cho báo cáo học thuật của UIT - VNUHCM.

## Trạng thái hiện tại

Package hiện cung cấp:

- Theme `academic`, `compact` và `presentation` qua `make-theme`.
- Template báo cáo `report`.
- Trang bìa báo cáo `report-cover`.
- Hình và bảng có số riêng theo chương: `report-image` và `report-table`.
- Danh sách bảng, danh sách hình vẽ và danh mục chữ viết tắt.
- Hỗ trợ bibliography bằng hàm có sẵn của Typst.



## Cấu trúc hiện tại

```
tbaouit/
├── typst.toml
├── lib.typ
├── main.typ
├── ref.bib
├── core/
│   └── theme.typ
├── pages/
│   ├── cover.typ
│   └── frontmatter.typ
├── templates/
│   ├── report.typ
│   └── notes.typ
└── assets/
    ├── LOGO_UIT.PNG
    └── LOGO_UIT_FADED.PNG
```

`lib.typ` là entrypoint công khai của package. Các hàm nên được import từ package thay vì import trực tiếp từ file nội bộ.

## Cài đặt và sử dụng

Trong file Typst của báo cáo:

```typst
#import "@local/tbaouit:0.1.0": (
  report,
  report-cover,
  report-image,
  report-table,
  list-of-tables,
  list-of-figures,
  list-of-abbreviations,
)

#show: report.with(theme: "academic")
```

### Trang bìa



### Mục lục và frontmatter


Các danh sách bảng và hình vẽ tự tạo trang mới. Tiêu đề của chúng được đưa vào outline nhưng không đánh số. Danh mục chữ viết tắt là một trang riêng, không đưa vào outline.

### Hình và bảng

Dùng wrapper tương ứng để số hình và số bảng độc lập, đồng thời đánh số theo chương:

```typst
#report-image(
  image("assets/LOGO_UIT.PNG", width: 25%),
  caption: [Logo UIT],
)

#report-table(
  table(
    columns: 2,
    [Tên], [Giá trị],
    [A], [1],
  ),
  caption: [Bảng dữ liệu],
)
```

Ví dụ, trong chương 1, hình sẽ có số `1.1`, `1.2`, còn bảng có bộ đếm riêng `1.1`, `1.2`. Sang chương 2, cả hai bộ đếm bắt đầu lại từ `2.1`.

### Tài liệu tham khảo

```typst
#bibliography(
  "ref.bib",
  title: "Tài liệu tham khảo",
  style: "ieee",
  full: true,
)
```

`full: true` hiển thị toàn bộ mục trong file `.bib`, kể cả các mục chưa được trích dẫn. Nếu chỉ muốn hiển thị các tài liệu đã trích dẫn, bỏ tham số này.

Citation trong nội dung dùng key của file BibTeX, ví dụ:

```typst
Theo nghiên cứu về attention @vaswani2017attention.
```

## Theme

```typst
#show: report.with(theme: "academic")
```

Các preset hiện có là `academic`, `compact` và `presentation`. Có thể truyền `accent` cho `report` để ghi đè màu nhấn.

## Biên dịch

Có thể biên dịch bằng:

- Typst CLI.
- Extension Tinymist trong VS Code.
- Typst web app.

Ví dụ với Typst CLI:

```text
typst compile main.typ
```

## Giấy phép

MIT
