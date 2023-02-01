function [] = Distance(x,y)

if  x > 0
    fprintf('Go %f miles east and ', x*100);
elseif x < 0
    fprintf('Go %f miles west and ', abs(x)*100);
end    

if  y > 0
    fprintf('%f miles north\n', y*100);
elseif y < 0
    fprintf('%f miles south\n', abs(y)*100);
end    
