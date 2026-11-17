SHOP PHẠM NHẬT — BẢN KIỂM TRA NHANH

Giữ các chức năng: đăng ký/đăng nhập, giỏ hàng, đơn hàng/chat, 7 cấp VIP,
quản trị, nạp QR, nạp thẻ cào và mức phí theo nhà mạng.
Đã bỏ chức năng khôi phục mật khẩu theo yêu cầu.

Cấu hình frontend đã gắn Supabase Project URL và publishable key.
Không có localStorage trong bản HTML.

MIGRATION BỔ SUNG
supabase/migrations/0002_user_carts.sql tạo bảng giỏ hàng và RLS để mỗi khách
chỉ đọc/ghi giỏ hàng của chính mình. Đây là migration bổ sung, không DROP bảng
hoặc dữ liệu hiện tại. Chưa được chạy trên project Supabase.

KIỂM TRA
- JavaScript inline đã qua `node --check`.
- Chưa thể kiểm thử đăng nhập/thanh toán/duyệt đơn thật vì chưa có quyền truy cập
  database Supabase và GitHub/Vercel của project trong phiên này.
- Không dùng bản này để nhận thanh toán thật trước khi kiểm tra RPC và RLS.

ĐƯA LÊN VERCEL ĐỂ XEM GIAO DIỆN
Giải nén ZIP, đưa thư mục này vào repo GitHub đang liên kết Vercel (thay index.html
và thêm thư mục supabase), sau đó Vercel tự deploy. Framework: Other; Build command
để trống; Output directory: `.`.
