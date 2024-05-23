%% ԭ����
% function [imre] = IIWT( aa,bb,cc,dd,dim )
% % ��S�����任3���ع�ͼ�����ݣ��������imMatΪԭʼ�Ҷ�ͼ�����ݷ��󣬷ֽ�Ҷ�ͼ
% % S�任�������ֽ�ʽ Dj-1, k = Sj, 2k +1 - Sj, 2k��Sj-1, k = 	Sj, 2k + [Dj-1, k / 2] 
% % �ع�ʽ Sj, 2k = Sj-1, k - [Dj-1, k / 2] Sj, 2k +1 = Dj-1, k + Sj, 2k
% % ���� SΪ��Ӧͼ������
% % dim = 256;
% % map = gray(256);
% % subplot(4, 4, 1); image(imde);colormap(map); title('ԭ ͼ ��'); axis square; axis off;
% % ��ÿһ�к��н�����е�����S�ع��任
% imde=[aa,bb;cc,dd];
% [imrer, imrec] = recompose(imde,dim);
% % imrer
% % imrec
% imre = imrec;
% % imgray = mat2gray(imrer); % תΪ�ҶȾ���
% % imwrite(imgray, 'iimgray3r.bmp'); % ����3���б任��ĻҶ�ͼ
% % imshow(imgray); % ��ʾ3�����ع���ĻҶ�ͼ
% % subplot(4, 4, 12); image(imrer);colormap(map); title('3�����ع�'); axis square; axis off;
% 
% % imgray = mat2gray(imrec);
% % imwrite(imgray, 'iimgray3c.bmp');
% % imshow(imgray); % ��ʾ3�����ع���ĻҶ�ͼ
% % subplot(4, 4, 16); image(imrec);colormap(map); title('3�����ع�'); axis square; axis off;
% 
% %-----------------------------�ӳ���recompose---------------------------------
% function [imrer, imrec] = recompose( imde, dim )
% % ��ÿһ�к��н������һ��S�ع��任, dim�Ǿ���ά��
% imrer = imde;
% imrec = imde;
% for i = 1:dim  % ��ÿһ�н�S�ع��任
%     for j = 1:2:dim  
%         imrer(j, i) = imde((j+1)/2, i) - floor(imde(dim/2+(j+1)/2, i)/2);
%         imrer(j+1, i) = imde(dim/2+(j+1)/2, i) + imrer(j, i);
%     end
% end
% for i = 1:dim % ��ÿһ�н���S�ع��任
%     for j = 1:2:dim
%         imrec(i, j) = imrer( i, (j+1)/2 ) - floor( imrer(i, dim/2+(j+1)/2)/2 ); 
%         imrec(i, j+1) = imrer( i, dim/2+(j+1)/2 ) + imrec(i, j);
%     end
% end
%--------------------------------------------------------------------------
%% �µ�
function [imre] = IIWT( aa,bb,cc,dd)
% ��S�����任3���ع�ͼ�����ݣ��������imMatΪԭʼ�Ҷ�ͼ�����ݷ��󣬷ֽ�Ҷ�ͼ
% S�任�������ֽ�ʽ Dj-1, k = Sj, 2k +1 - Sj, 2k��Sj-1, k =  Sj, 2k + [Dj-1, k / 2] 
% �ع�ʽ Sj, 2k = Sj-1, k - [Dj-1, k / 2] Sj, 2k +1 = Dj-1, k + Sj, 2k
% ���� SΪ��Ӧͼ������
% dim = 256;
% map = gray(256);
% subplot(4, 4, 1); image(imde);colormap(map); title('ԭ ͼ ��'); axis square; axis off;
% ��ÿһ�к��н�����е�����S�ع��任
[dim,~]=size(aa);
dim=dim*2;
imde=[aa,bb;cc,dd];
[imrer, imrec] = recompose(imde,dim);
% imrer
% imrec
imre = imrec;
% imgray = mat2gray(imrer); % תΪ�ҶȾ���
% imwrite(imgray, 'iimgray3r.bmp'); % ����3���б任��ĻҶ�ͼ
% imshow(imgray); % ��ʾ3�����ع���ĻҶ�ͼ
% subplot(4, 4, 12); image(imrer);colormap(map); title('3�����ع�'); axis square; axis off;

% imgray = mat2gray(imrec);
% imwrite(imgray, 'iimgray3c.bmp');
% imshow(imgray); % ��ʾ3�����ع���ĻҶ�ͼ
% subplot(4, 4, 16); image(imrec);colormap(map); title('3�����ع�'); axis square; axis off;

%-----------------------------�ӳ���recompose---------------------------------
function [imrer, imrec] = recompose( imde, dim )
% ��ÿһ�к��н������һ��S�ع��任, dim�Ǿ���ά��
imrer = imde;
imrec = imde;
for i = 1:dim  % ��ÿһ�н�S�ع��任
    for j = 1:2:dim  
        imrer(j, i) = imde((j+1)/2, i) - floor(imde(dim/2+(j+1)/2, i)/2);
        imrer(j+1, i) = imde(dim/2+(j+1)/2, i) + imrer(j, i);
    end
end
for i = 1:dim % ��ÿһ�н���S�ع��任
    for j = 1:2:dim
        imrec(i, j) = imrer( i, (j+1)/2 ) - floor( imrer(i, dim/2+(j+1)/2)/2 ); 
        imrec(i, j+1) = imrer( i, dim/2+(j+1)/2 ) + imrec(i, j);
    end
end
%--------------------------------------------------------------------------