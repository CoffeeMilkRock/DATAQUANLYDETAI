use master
GO

IF DB_ID('QLGVDT') IS NOT NULL 
	--ALTER DATABASE QLGVDT SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE QLGVDT
GO
CREATE DATABASE QLGVDT
GO
USE QLGVDT
GO
CREATE TABLE GIAOVIEN(
	MAGV NCHAR(10),
	HOTEN NCHAR(30),
	LUONG FLOAT,
	PHAI NCHAR(4),
	NGAYSINH DATE,
	DIACHI NCHAR(50),
	GVQLCM NCHAR(10),
	MABM NCHAR(10)

	CONSTRAINT PK_GIAOVIEN
	PRIMARY KEY (MAGV)
)

CREATE TABLE GV_DT(
	MAGV NCHAR(10),
	DIENTHOAI NCHAR(12)

	CONSTRAINT PK_GV_DT
	PRIMARY KEY (MAGV,DIENTHOAI)

)

CREATE TABLE BOMON(
	MABM NCHAR(10),
	TENBM NCHAR(30),
	PHONG NCHAR(5),
	DIENTHOAI NCHAR(12),
	TRUONGBM NCHAR(10),
	MAKHOA NCHAR(10),
	NGAYNHANCHUC DATE

	CONSTRAINT PK_BOMON
	PRIMARY KEY (MABM)

)

CREATE TABLE KHOA(
	MAKHOA NCHAR(10),
	TENKHOA NCHAR(30),
	NAMTL NCHAR(4),
	PHONG NCHAR(5),
	DIENTHOAI NCHAR(12),
	TRUONGKHOA NCHAR(10),
	NGAYNHANCHUC DATE

	CONSTRAINT PK_KHOA
	PRIMARY KEY (MAKHOA)
)

CREATE TABLE DETAI(
	MADT NCHAR(10),
	TENDT NCHAR(60),
	CAPQL NCHAR(30),
	KINHPHI FLOAT,
	NGAYBD DATE,
	NGAYKT DATE,
	MACD NCHAR(10),
	GVCNDT NCHAR(10)

	CONSTRAINT PK_DETAI
	PRIMARY KEY (MADT)
)

CREATE TABLE CHUDE(
	MACD NCHAR(10),
	TENCD NCHAR(30)

	CONSTRAINT PK_CHUDE
	PRIMARY KEY (MACD)

)

CREATE TABLE CONGVIEC(
	MADT NCHAR(10),
	STT INT,
	TENCV NCHAR(30),
	NGAYBD DATE,
	NGAYKT DATE

	CONSTRAINT PK_CONGVIEC 
	PRIMARY KEY (MADT,STT)

)

CREATE TABLE THAMGIADT(
	MAGV NCHAR(10),
	MADT NCHAR(10),
	STT INT,
	PHUCAP FLOAT,
	KETQUA NCHAR(5)

	CONSTRAINT PK_THAMGIADT
	PRIMARY KEY (MADT,MAGV,STT)
)

CREATE TABLE NGUOI_THAN(
	MAGV NCHAR(10),
	TEN NCHAR(30),
	NGAYSINH DATE,
	PHAI NCHAR(5),
	MOIQUANHE NCHAR(20)

	CONSTRAINT PK_NGUOI_THAN
	PRIMARY KEY (MAGV,TEN)
)

ALTER TABLE GIAOVIEN 
ADD  
	CONSTRAINT FK_GIAOVIEN_GIAOVIEN
	FOREIGN KEY (GVQLCM)
	REFERENCES GIAOVIEN (MAGV)
ALTER TABLE GIAOVIEN 
ADD  
	CONSTRAINT FK_GIAOVIEN_BOMON
	FOREIGN KEY (MABM)
	REFERENCES BOMON (MABM)

ALTER TABLE GV_DT
ADD  
	CONSTRAINT FK_GVDT_GIAOVIEN
	FOREIGN KEY (MAGV)
	REFERENCES GIAOVIEN (MAGV)


ALTER TABLE BOMON
ADD  
	CONSTRAINT FK_BOMON_GIAOVIEN
	FOREIGN KEY (TRUONGBM)
	REFERENCES GIAOVIEN (MAGV)

ALTER TABLE BOMON
ADD  
	CONSTRAINT FK_BOMON_KHOA
	FOREIGN KEY (MAKHOA)
	REFERENCES KHOA (MAKHOA)

ALTER TABLE KHOA
ADD  
	CONSTRAINT FK_KHOA_GIAOVIEN
	FOREIGN KEY (TRUONGKHOA)
	REFERENCES GIAOVIEN (MAGV)


ALTER TABLE DETAI
ADD  
	CONSTRAINT FK_DETAI_GIAOVIEN
	FOREIGN KEY (GVCNDT)
	REFERENCES GIAOVIEN (MAGV)

ALTER TABLE DETAI
ADD  
	CONSTRAINT FK_DETAI_CHUDE
	FOREIGN KEY (MACD)
	REFERENCES CHUDE (MACD)

	
ALTER TABLE THAMGIADT
ADD  
	CONSTRAINT FK_THAMGIADT_CONGVIEC
	FOREIGN KEY (MADT,STT)
	REFERENCES CONGVIEC,
	
	CONSTRAINT FK_THAMGIADT_GIAOVIEN
	FOREIGN KEY (MAGV)
	REFERENCES GIAOVIEN

ALTER TABLE CONGVIEC
ADD  
	CONSTRAINT FK_CONGVIEC_DETAI
	FOREIGN KEY (MADT)
	REFERENCES DETAI (MADT)


ALTER TABLE NGUOI_THAN
ADD  
	CONSTRAINT FK_NGUOITHAN_GIAOVIEN
	FOREIGN KEY (MAGV)
	REFERENCES GIAOVIEN (MAGV)

INSERT GIAOVIEN
VALUES
	('001',N'Nguyễn Hoài An', 2000, 'Nam', '02/15/1973', N'25/3 Lạc Long Quân, Q.10, TP.HCM', NULL, NULL),
	('002',N'Trần Trà Hương', 2500, N'Nữ', '06/20/1960', N'125 Trần Hưng Đạo, Q.1, TP.HCM', NULL, NULL),
	('003',N'Nguyễn Ngọc Ánh', 2200, N'Nữ', '05/11/1975', N'12/21 Võ Văn Ngân Thủ Đức, TP.HCM', '002', NULL),
	('004',N'Trương Nam Sơn', 2300, 'Nam', '06/20/1959', N'215 Lý Thường Kiệt, TP Biên Hòa', NULL, NULL),
	('005',N'Lý Hoàng Hà', 2500, 'Nam', '10/23/1954', N'Nguyễn Xí, Q.Bình Thạnh, TP.HCM', NULL, NULL),
	('006',N'Trần Bạch Tuyết', 1500, N'Nữ', '05/20/1980', N'127 Hùng Vương, TP Mỹ Tho', '004', NULL),
	('007',N'Nguyễn An Trung', 2100, 'Nam', '06/05/1976', N'234 3/2, TP Biên Hòa', NULL, NULL),
	('008',N'Trần Trung Hiếu', 1800, 'Nam', '08/06/1977', N'23/11 Lý Thường Kiệt, TP Mỹ Tho', '007', NULL),
	('009',N'Trần Hoàng Nam', 2000, 'Nam', '11/22/1975', N'234 Trần Não, An Phú,TP HCM', '001', NULL),
	('010',N'Phạm Nam Thanh', 1500, 'Nam', '12/12/1980', N'221 Hùng Vương, Q.5, TP HCM', '007', NULL)
INSERT GV_DT
VALUES
	('001', '0838912112'),
	('001', '0903123123'),
	('002', '0913454545'),
	('003', '0838121212'),
	('003', '0903656565'),
	('003', '0937125125'),
	('006', '0937888888'),
	('008', '0653717171'),
	('008', '0913232323')

INSERT KHOA
VALUES
	('CNTT', N'Công nghệ thông tin', 1995, 'B11', '0838123456', '002', '02/20/2005'),
	('HH', N'Hóa Học', 1980, 'B41', '0838456456', '007', '10/15/2001'),
	('SH', N'Sinh học', 1980, 'B31', '0838454545', '004', '10/11/2000'),
	('VL', N'Vật lý', 1976, 'B21', '0838223223', '005', '09/18/2003')

INSERT BOMON
VALUES
	('CNTT', N'Công nghệ tri thức', 'B15', '0838126126', NULL, 'CNTT', NULL),
	('HHC', N'Hóa hữu cơ', 'B44', '838222222', NULL, 'HH', NULL),
	('HL', N'Hóa lý', 'B42', '0838878787', NULL, 'HH', NULL),
	('HPT', N'Hóa phân tích', 'B43', '0838777777', '007', 'HH', '10/15/2007'),
	('HTTT', N'Hệ thống thông tin', 'B13', '0838125125', '002', 'CNTT', '09/20/2004'),
	('MMT', N'Mạng máy tính', 'B16', '0838676767', '001', 'CNTT', '05/15/2005'),
	('SH', N'Sinh hóa', 'B33', '0838898989', NULL, 'SH', NULL),
	(N'VLĐT', N'Vật lý điện tử', 'B23', '0838234234', NULL, 'VL', NULL),
	(N'VLƯD', N'Vật lý ứng dụng', 'B24', '0838454545', '005', 'VL', '02/18/2006'),
	('VS', N'Vi sinh', 'B32', '0838909090', '004', 'SH', '01/01/2007')

INSERT INTO NGUOI_THAN (MAGV,TEN,NGAYSINH,PHAI,MOIQUANHE) 
VALUES 
	('001', N'Hùng', '01/14/1990', 'Nam', 'Con trai'),
	('001', N'Thủy', '12/08/1994', N'Nữ', N'Con gái'),
	('003', N'Hà', '09/03/1998', N'Nữ', N'Con gái'),
	('003', 'Thu', '09/03/1998', N'Nữ', N'Con gái'),
	('007', 'Mai', '03/26/1998', N'Nữ', N'Con gái'),
	('007', 'Vy', '02/14/1998', N'Nữ', N'Con gái'),
	('008', 'Nam', '05/06/1998', 'Nam', 'Con trai'),
	('009', 'An', '08/19/1996', 'Nam', 'Con trai'),
	('010', N'Nguyệt', '01/14/2006', N'Nữ', N'Con gái')

INSERT CHUDE
VALUES
	(N'NCPT', N'Nghiên cứu phát triển'),
	(N'QLGD', N'Quản lý giáo dục'),
	(N'UDCN', N'Ứng dụng công nghệ')

INSERT DETAI
VALUES
	('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20, '10/20/2007', '10/20/2008', 'QLGD', '002'),
	('002', N'HTTT quản lý giáo vụ cho mọt Khoa', N'Trường', 20, '10/12/2000', '10/12/2001', 'QLGD', '002'),
	('003', N'Nghiên cứu chế tạo sợi Nanô Platin', N'ĐHQG', 300, '5/15/2008', '5/15/2010', 'NCPT', '005'),
	('004', N'Tạo vật liệu sinh học bằng màng ối người', N'Nhà nước', 100, '01/01/2007', '12/31/2019', 'NCPT', '004'),
	('005', N'Ứng dung hóa học xanh', N'Trường', 200, '10/10/2003', '10/10/2004', 'UDCN', '007'),
	('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000, '10/20/2006', '10/20/2009', 'NCPT', '004'),
	('007', N'HTTT quản lý thư viện ở các trường ĐH', N'Trường', 20, '05/10/2009', '05/10/2010', 'QLGD', '001')

INSERT CONGVIEC
VALUES
	('001', 1, N'Khởi tạo và Lập kế hoạch', '10/20/2007', '12/20/2008'),
	('001', 2, N'Xác định yêu cầu', '12/21/2008', '03/21/2008'),
	('001', 3, N'Phân tích hệ thống', '03/22/2008', '05/22/2008'),
	('001', 4, N'Thiét kế hệ thống', '05/23/2008', '06/23/2008'),
	('001', 5, N'Cài đặt thử nghiệm', '06/24/2008', '06/24/2008'),
	('002', 1, N'Khởi tạo và Lập kế hoạch', '05/10/2009', '07/10/2009'),
	('002', 2, N'Xác định yêu cầu', '07/11/2009', '10/11/2009'),
	('002', 3, N'Phân tích hệ thống', '10/12/2009', '12/20/2009'),
	('002', 4, N'Thiét kế hệ thống', '12/21/2009', '03/22/2010'),
	('002', 5, N'Cài đặt thử nghiệm', '03/23/2010', '05/10/2010'),
	('006', 1, N'Lấy mẫu', '10/20/2006', '02/20/2007'),
	('006', 2, N'Nuôi cấy', '02/21/2007', '08/21/2008')

INSERT THAMGIADT
VALUES
	('001', '002', 1, 0, NULL),
	('001', '002', 2, 2, NULL),
	('002', '001', 4, 2, N'Đạt'),
	('003', '001', 1, 1, N'Đạt'),
	('003', '001', 2, 0, N'Đạt'),
	('003', '001', 4, 1, N'Đạt'),
	('003', '002', 2, 0, NULL),
	('004', '006', 1, 0, N'Đạt'),
	('004', '006', 2, 1, N'Đạt'),
	('006', '006', 2, 1.5, N'Đạt'),
	('009', '002', 3, 0.5, NULL),
	('009', '002', 4, 1.5, NULL)


UPDATE GIAOVIEN
SET MABM = CASE
WHEN MAGV = '001' OR MAGV = '009' THEN 'MMT'
WHEN MAGV = '002' OR MAGV = '003' THEN 'HTTT'
WHEN MAGV = '004' OR MAGV = '006' THEN 'VS'
WHEN MAGV = '005' THEN N'VLĐT'
WHEN MAGV = '007' OR MAGV = '008' OR MAGV = '010' THEN 'HPT'
END

--Q1. Cho biết họ tên và mức lương của các giáo viên nữ.
SELECT GV.HOTEN, GV.LUONG
FROM GIAOVIEN GV 
WHERE GV.PHAI = N'Nữ'
--Q2. Cho biết họ tên của các giáo viên và lương của họ sau khi tăng 10%.
SELECT GV.HOTEN, GV.LUONG*1.1 AS 'Lương đã tăng'
FROM GIAOVIEN GV 
--Q3. Cho biết mã của các giáo viên có họ tên bắt đầu là “Nguyễn” và lương trên $2000 hoặc, giáo viên là trưởng bộ môn nhận chức sau năm 1995.
SELECT GV.MAGV
FROM GIAOVIEN GV 
WHERE GV.LUONG > 2000 AND GV.HOTEN LIKE N'Nguyễn%'
UNION
SELECT GV.MAGV
FROM GIAOVIEN GV 
	JOIN BOMON BM 
	ON GV.MAGV = BM.TRUONGBM
WHERE YEAR(BM.NGAYNHANCHUC) > 1995 
--Q4. Cho biết tên những giáo viên khoa Công nghệ thông tin.
SELECT GV.HOTEN
FROM GIAOVIEN GV 
	JOIN BOMON BM 
	ON GV.MABM = BM.MABM
	JOIN KHOA K 
	ON BM.MAKHOA = K.MAKHOA
WHERE K.TENKHOA = N'Công Nghệ Thông Tin';
--Q5. Cho biết thông tin của bộ môn cùng thông tin giảng viên làm trưởng bộ môn đó.
SELECT *
FROM BOMON BM
	LEFT JOIN GIAOVIEN GV
	ON BM.TRUONGBM = GV.MAGV
--Q6. Với mỗi giáo viên, hãy cho biết thông tin của bộ môn mà họ đang làm việc.
SELECT GV.HOTEN,BM.*
FROM GIAOVIEN GV
	LEFT JOIN BOMON BM 
	ON GV.MABM = BM.MABM

--Q7. Cho biết tên đề tài và giáo viên chủ nhiệm đề tài.
SELECT DT.TENDT,GV.HOTEN
FROM DETAI DT
	JOIN GIAOVIEN GV
	ON DT.GVCNDT = GV.MAGV
--Q8. Với mỗi khoa cho biết thông tin trưởng khoa.
SELECT K.MAKHOA, GV.*
FROM KHOA K
	LEFT JOIN GIAOVIEN GV
	ON K.TRUONGKHOA = GV.MAGV
--Q9. Cho biết các giáo viên của bộ môn “Vi sinh” có tham gia đề tài 006.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
	JOIN BOMON BM
	ON GV.MABM = BM.MABM
	JOIN THAMGIADT TGDT
	ON TGDT.MAGV = GV.MAGV
WHERE GV.MABM = N'VS' AND TGDT.MADT = '006'
--Q10. Với những đề tài thuộc cấp quản lý “Thành phố”, cho biết mã đề tài, đề tài thuộc về chủ đề nào, họ tên
--người chủ nghiệm đề tài cùng với ngày sinh và địa chỉ của người ấy.

SELECT DISTINCT DT.MADT, DT.MACD, GV.HOTEN,GV.NGAYSINH,GV.DIACHI
FROM DETAI DT
	LEFT JOIN GIAOVIEN GV
	ON DT.GVCNDT = GV.MAGV
WHERE DT.CAPQL = N'ĐHQG'
--Q11. Tìm họ tên của từng giáo viên và người phụ trách chuyên môn trực tiếp của giáo viên đó.
SELECT GV.HOTEN, PT.HOTEN AS 'Người phụ trách'
FROM GIAOVIEN GV
	LEFT JOIN GIAOVIEN PT
	ON  GV.GVQLCM = PT.MAGV
ORDER BY GV.MAGV
--Q12. Tìm họ tên của những giáo viên được “Nguyễn An Trung” phụ trách trực tiếp.
SELECT GV.HOTEN
FROM GIAOVIEN GV
	JOIN GIAOVIEN PT
	ON  GV.GVQLCM = PT.MAGV AND PT.HOTEN =N'Nguyễn An Trung'
ORDER BY GV.MAGV

--Q13. Cho biết tên giáo viên là trưởng bộ môn Hệ thống thông tin.
SELECT GV.HOTEN
FROM GIAOVIEN GV
	JOIN BOMON BM 
	ON  GV.MAGV = BM.TRUONGBM AND BM.TENBM = N'Hệ thống thông tin'
ORDER BY GV.MAGV

--Q14. Cho biết tên người chủ nhiệm đề tài của những đề tài thuộc chủ đề Quản lý giáo dục.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
	JOIN DETAI DT 
	ON  GV.MAGV = DT.GVCNDT 
	JOIN CHUDE CD
	ON CD.MACD = DT.MACD AND CD.TENCD = N'Quản lý giáo dục'
--Q15. Cho biết tên các công việc của đề tài HTTT quản lý các trường ĐH có thời gian bắt đầu trong tháng
--3/2008.
SELECT DISTINCT CV.TENCV
FROM CONGVIEC CV
	JOIN DETAI DT 
	ON  DT.MADT = CV.MADT AND DT.TENDT =N'HTTT quản lý các trường ĐH' AND (YEAR(CV.NGAYBD) = '2008' AND MONTH(CV.NGAYBD) = '03')
--Q16. Cho biết tên giáo viên và tên người quản lý chuyên môn của giáo viên đó.
SELECT GV.HOTEN, PT.HOTEN AS 'Quản lý chuyên môn'
FROM GIAOVIEN GV
	LEFT JOIN GIAOVIEN PT
	ON  GV.GVQLCM = PT.MAGV
ORDER BY GV.MAGV
--Q17. Cho các công việc bắt đầu trong khoảng từ 01/01/2007 đến 01/08/2007.
SELECT CV.TENCV
FROM CONGVIEC CV
WHERE  CV.NGAYBD <= '20070801' AND CV.NGAYBD >= '20070101'
--Q18. Cho biết họ tên các giáo viên cùng bộ môn với giáo viên “Trần Trà Hương”.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
JOIN BOMON BM
ON GV.MABM = BM.MABM
AND  GV.HOTEN != N'Trần Trà Hương'
AND NOT EXISTS (SELECT BM1.MABM
                FROM BOMON BM1
					JOIN GIAOVIEN GV1
					ON BM1.MABM = GV1.MABM
						AND   GV1.HOTEN = N'Trần Trà Hương'
                EXCEPT (
                    SELECT BM2.MABM
                    FROM BOMON BM2
                    WHERE BM.MABM = BM2.MABM))
--Q19. Tìm những giáo viên vừa là trưởng bộ môn vừa chủ nhiệm đề tài.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
	JOIN BOMON BM
	ON BM.TRUONGBM = GV.MAGV
	JOIN DETAI DT
	ON DT.GVCNDT = GV.MAGV
--Q20. Cho biết tên những giáo viên vừa là trưởng khoa và vừa là trưởng bộ môn.
SELECT GV.HOTEN 
FROM GIAOVIEN GV
	JOIN KHOA K
	ON K.TRUONGKHOA = GV.MAGV
	JOIN BOMON BM
	ON BM.MABM = GV.MABM
--Q21. Cho biết tên những trưởng bộ môn mà vừa chủ nhiệm đề tài
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
	JOIN BOMON BM
	ON BM.TRUONGBM = GV.MAGV
	JOIN DETAI DT
	ON DT.GVCNDT = GV.MAGV
--Q22. Cho biết mã số các trưởng khoa có chủ nhiệm đề tài.
SELECT DISTINCT GV.MAGV
FROM GIAOVIEN GV
	JOIN KHOA K
	ON K.TRUONGKHOA = GV.MAGV
	JOIN DETAI DT
	ON DT.GVCNDT = GV.MAGV
--Q23. Cho biết mã số các giáo viên thuộc bộ môn HTTT hoặc có tham gia đề tài mã 001.
SELECT DISTINCT GV.MAGV
FROM GIAOVIEN GV
	JOIN BOMON BM
	ON BM.MABM = GV.MABM
	JOIN THAMGIADT TGDT
	ON TGDT.MAGV = GV.MAGV
WHERE GV.MABM = N'HTTT' OR TGDT.MADT = N'001'
--Q24. Cho biết giáo viên làm việc cùng bộ môn với giáo viên 002.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
	JOIN BOMON BM
	ON BM.MABM = GV.MABM
		AND GV.MAGV != N'002'
		AND NOT EXISTS (SELECT BM1.MABM
						FROM BOMON BM1
							JOIN GIAOVIEN GV1
							ON BM1.MABM = GV1.MABM
								AND GV1.MAGV = N'001'
						EXCEPT(SELECT BM2.MABM
								FROM BOMON BM2
								WHERE BM2.MABM = BM.MABM
								)
						)
--Q25. Tìm những giáo viên là trưởng bộ môn.
SELECT GV.HOTEN
FROM GIAOVIEN GV
	JOIN BOMON BM
	ON BM.TRUONGBM = GV.MAGV
--Q26. Cho biết họ tên và mức lương của các giáo viên.
SELECT GV.HOTEN, GV.LUONG
FROM GIAOVIEN GV 
