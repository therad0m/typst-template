#let list-of-tables() = {
  pagebreak()
  v(1.5cm)
  heading(level: 1, numbering: none)[Danh sách bảng]
  v(1.5cm)
  outline(
    target: figure.where(kind: table),
    title: none,
  )
}

#let list-of-figures() = {
  pagebreak()
  v(1.5cm)
  heading(level: 1, numbering: none)[Danh sách hình vẽ]
  v(1.5cm)
  outline(
    target: figure.where(kind: image),
    title: none,
  )
}

#let list-of-abbreviations(entries) = {
  pagebreak()
  v(1.5cm)
  heading(level: 1, numbering: none)[DANH MỤC CÁC CHỮ VIẾT TẮT]
  v(1.5cm)
  let rows = entries
    .pairs()
    .enumerate()
    .map(((index, pair)) => {
      let abbreviation = pair.at(0)
      let translations = pair.at(1)
      (
        str(index + 1),
        abbreviation,
        translations.at(0),
        translations.at(1),
      )
    })
    .flatten()

  table(
    columns: (auto, auto, 1fr, 1fr),
    align: (center, center, left, left),
    stroke: 0.5pt + gray,
    table.header(
      [STT],
      [Chữ viết tắt],
      [Tiếng Anh],
      [Tiếng Việt],
    ),
    ..rows,
  )
}
