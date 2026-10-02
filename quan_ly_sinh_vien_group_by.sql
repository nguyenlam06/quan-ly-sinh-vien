USE QuanLySinhVien;

-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
SELECT * 
FROM Subject 
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

-- 2. Hiển thị các thông tin môn học có điểm thi lớn nhất
SELECT Sub.*, M.Mark
FROM Subject Sub
JOIN Mark M ON Sub.SubId = M.SubId
WHERE M.Mark = (SELECT MAX(Mark) FROM Mark);

-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.*, AVG(M.Mark) AS 'Diem trung binh'
FROM Student S
LEFT JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId
ORDER BY AVG(M.Mark) DESC;