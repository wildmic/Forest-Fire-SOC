function [Forest_grid,noter]=changer(Forest_grid,m1,m2,m3,m4,minimum,N2,noter)
% This function replaces all the neighbours of a cell with the minimum
% index among these cells.
%Care has been taken that the cells which are on fire or without trees are
%not indexed through the converter function.
% Index=Forest_grid(v1(1),v1(2));
if m1<Inf && m1>minimum
    [Forest_grid]=enforcer(Forest_grid,minimum,m1,N2);
%     mistake(noter)=m1;
    noter=noter+1;
end
if m2<Inf && m2>minimum && m2~=m1
    [Forest_grid]=enforcer(Forest_grid,minimum,m2,N2);
%     mistake(noter)=m2;
    noter=noter+1;
end
if m3<Inf && m3>minimum && m3~=m1 && m3~=m2
    [Forest_grid]=enforcer(Forest_grid,minimum,m3,N2);
%     mistake(noter)=m3;
    noter=noter+1;
end
if m4<Inf && m4>minimum && (m4~=m1 && m4~=m2 && m4~=m3)
    [Forest_grid]=enforcer(Forest_grid,minimum,m4,N2);
%     mistake(noter)=m4;
    noter=noter+1;
end    
end