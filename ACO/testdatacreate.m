dat = ['A' 'B' 'AC' 'BC' 'CD' 'ABC' 'ABD'; 45 55 78 99 12 3 55]';
subdat = zeros(length(dat),2);

unique(dat(:,1));

for i=1:numel(unique(dat(:,1)))
    for j=1:length(dat)
        if(dat(j,1)==i)
            subdat(j,:)=max(dat(dat(:,1)==i,:));
        end
    end
end

subdat = unique(subdat, 'rows');

D = zeros(length(subdat) + 2,length(subdat) + 2);

for i = 1:(length(subdat))
    for j= i+1:length(subdat)+1
        D(i,j)=subdat(j-1,2);
        D(j,i)=D(i,j);
    end
end

D(2:length(subdat)+1,length(subdat)+2) = 1;
