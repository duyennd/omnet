# omnet

+lab3a
Hãy dùng NED để tạo ra một mạng có các nút có tạo hình thành tên không dấu của các bạn. 
a) Hiển thị được network đó trên màn hình đồ họa NED của Omnet++. 
b) Sửa mã nguồn sao cho mỗi gói tin (message) sẽ đi qua tất cả các hop (nút) và in ra giá trị hop count khi gói tin đến được nút cuối cùng. 
Chú ý rằng người lập trình cố gắng chọn nút nguồn và nút đích sao cho nó đi qua lần lượt từng chữ cái của tên các bạn. (Chấp nhận cho việc một nút được đi lại hai lần)

+Wsn:
Wireless Sensor Networks: 
Tạo ra 100 nút sensor trong không gian có kích thước 8*8, các nút mạng nằm ngẫu nhiên và trong mỗi nút ta tính toán được có khoảng cách giữa nó với một nút bất kỳ. 
Chú ý rằng chúng ta chuẩn hóa giá trị khoảng cách đó.
Tức là nếu D là giá trị cực đại trong số khoảng cách giữa hai nút bất kỳ thì ta tính lại giá trị khoảng cách giữa các nút đó bằng cách chia cho D. 
Nói cách khác khoảng cách giữa hai nút bất kỳ luôn <= 1.

Viết mã nguồn tìm đường đi cho gói tin, một khi gói tin đến được một nút thì nó sẽ được gửi đến nút gần nhất (mà chưa đi qua) với nút hiện tại.  

+ Lab06: mã nguồn C++ cho giả lập truyền tin trong mạng Fat-tree

+ RenderFatTree : chứa mã nguồn C++ sinh tự động ra file .ned
Viết file NED nhận tham số truyền vào qua omnetpp.ini là biến k (số cổng của một switch). Sau khi người dùng nhập biến k thì nhấn Omnet++ để build ra project.
Yêu cầu file NED phải cấu hình được các kết nối của các switch và host theo đúng hình trạng của fat Tree.
