#let report-cover(
	course-name: "",
	course-id: "",
	title: "",
	instructor: "",
	group-name: "Nhóm ",
	members: (), // Nhận vào một mảng chứa các mảng con: (("Tên", "MSSV"), ...)
	date: "",
	logo: "../assets/LOGO_UIT.PNG" // Đã chỉnh lại theo đường dẫn thư mục assets của bạn
) = {
	block(width: 100%, height: 100%)[
	#set table(stroke: none)

	#set text(font: "New Computer Modern")
		
	// Khung viền ngoài
	#box(
		width: 100%,
		height: 100%, 
		inset: 3.5pt,
		stroke: 2.5pt + black,
		)[
		// Khung viền trong
			#box(
				width: 100%,
				height: 100%, 
				stroke: 1pt + black,
			)[
				#align(center)[
				#v(2cm)
				#set text(size:14pt)
				*TRƯỜNG ĐẠI HỌC CÔNG NGHỆ THÔNG TIN* 
				#v(0.25cm)
				*ĐẠI HỌC QUỐC GIA TP. HCM*
				#v(0.25cm)
				*KHOA KHOA HỌC MÁY TÍNH*
				#v(0.5cm)
				#line(length: 30%, stroke: 1.5pt)
				#v(0.25cm)
				
				#figure(
					image(logo, width: 20%), numbering: none,
				)

				#v(0.5cm)
				#set text(size:15pt)
				*BÁO CÁO ĐỒ ÁN MÔN HỌC\ #upper(course-name)*
				#line(length: 70%, stroke: 2pt)
				#v(0.5cm)
				
				#set text(size:16pt)
				*#upper(title)*
				#v(0.5cm)
				
				#set text(size:14pt)
				#line(length: 70%, stroke: 2pt)
				#v(0.25cm)
				
				*Lớp học phần*: #course-id
				#v(0.25cm)
				*GVHD:* #instructor
				#v(0.25cm)
				*#group-name:*
				#v(0.1cm)
				]

				// Bảng danh sách thành viên
				#block(inset: (left: 4cm))[
				#set table(
					columns: (0.5fr, 0.7fr),
					column-gutter: 1.5cm,
				)
				
				// Trải phẳng mảng 2 chiều thành 1 chiều để nạp vào table
				#table(
					..members.flatten()
				)
				]
				
				// Đẩy ngày tháng xuống sát đáy trang cho cân đối
				#align(center + bottom)[
					#pad(bottom: 1cm)[
						#date
					]
				]
			]
		]
	]
}