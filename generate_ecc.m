% 定义一个16进制数
a = uint8(0x37);  % 十六进制数AB转换为uint8类型
b = uint8(0xf0);
c = uint8(0x01);
%reverse
a_f= bitget(a,1:8);
b_f= bitget(b,1:8);
c_f= bitget(c,1:8);
%combine
d = [a_f,b_f,c_f];

P5_i=[d(11),d(12),d(13),d(14),d(15),d(16),d(17),d(18),d(19),d(20),d(22),d(23),d(24)];
P4_i=[d(5),d(6),d(7),d(8),d(9),d(10),d(17),d(18),d(19),d(20),d(21),d(23),d(24)];
P3_i=[d(2),d(3),d(4),d(8),d(9),d(10),d(14),d(15),d(16),d(20),d(21),d(22),d(24)];
P2_i=[d(1),d(3),d(4),d(6),d(10),d(12),d(13),d(16),d(19),d(21),d(22),d(23)];
P1_i=[d(1),d(2),d(4),d(5),d(7),d(9),d(11),d(13),d(15),d(18),d(21),d(22),d(23),d(24)];
P0_i=[d(1),d(2),d(3),d(5),d(6),d(8),d(11),d(12),d(14),d(17),d(21),d(22),d(23),d(24)];

P7 = 0;
P6 = 0;
P5 = P5_i(1);
P4 = P4_i(1);
P3 = P3_i(1);
P2 = P2_i(1);
P1 = P1_i(1);
P0 = P0_i(1);
  
% 遍历数组中的其余元素，并逐一进行异或运算  
for i = 2:length(P5_i)  
    P5 = xor(P5, P5_i(i));  
end 

for i = 2:length(P4_i)  
    P4 = xor(P4, P4_i(i));  
end 

for i = 2:length(P3_i)  
    P3 = xor(P3, P3_i(i));  
end 

for i = 2:length(P2_i)  
    P2 = xor(P2, P2_i(i));  
end 

for i = 2:length(P1_i)  
    P1 = xor(P1, P1_i(i));  
end 

for i = 2:length(P0_i)  
    P0 = xor(P0, P0_i(i));  
end 
ECC = [P0,P1,P2,P3,P4,P5,P6,P7];

% 初始化一个变量来存储最终的字节  
ECC_byte = uint8(0);  
  
% 遍历每个位，并将其添加到字节中  
for i = 1:8  
    % 将当前位左移到正确的位置，并与现有字节进行或操作  
     bit_to_add = bitsll(ECC(9-i),(8 - i)); 
      
    % 使用位或操作将当前位添加到ECC_byte中  
    ECC_byte = bitor(ECC_byte,bit_to_add);
end 
% 输出处理后的16进制数和获取的位
fprintf('ECC的16进制数: %X\n', ECC_byte);