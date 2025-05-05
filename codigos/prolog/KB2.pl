% ---------------------------
% Hechos (Facts)
% ---------------------------

woman(mia). 
woman(jody). 
woman(yolanda). 

loves(vincent, mia). 
loves(marsellus, mia). 
loves(pumpkin, honey_bunny). 
loves(honey_bunny, pumpkin).

% ---------------------------
% Reglas (Rules)
% ---------------------------
% X está celoso de Y si tanto X como Y aman a la misma persona Z
jealous(X, Y) :- loves(X, Z), loves(Y, Z).

