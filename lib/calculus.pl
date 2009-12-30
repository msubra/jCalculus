/****************** Differential Calculus ***************/

d( X, X, 1 ):- !.                  /* d(X) w.r.t. X is 1      */

d( C, X, 0 ):- atomic(C).          /* If C is a constant then */
                                   /* d(C)/dX is 0            */

d( U+V, X, R ):-                 /* d(U+V)/dX = A+B where   */
   d( U, X, A ),                   /* A = d(U)/dX and         */
   d( V, X, B ),
   R = A + B.

d( U-V, X, R ):-
   d( U, X, A ),
   d( V, X, B ),
   R = A - B.

d( C*U, X, R ):-
   atomic(C),
   C \= X,
   d( U, X, A ),
   R = C * A,
   !.

d( U*V, X, U*B+V*A ):-           /* d(U*V)/dX = B*U+A*V where */
   d( U, X, A ),                 /* A = d(U)/dX and           */
   d( V, X, B ).                 /* B = d(V)/dX               */

d( U/V, X, (A*V-B*U)/(V^2) ):- /* d(U/V)/dX = (A*V-B*U)/(V*V) */
   d( U, X, A),                /* where A = d(U)/dX and       */
   d( V, X, B).                /*       B = d(V)/dX           */

d( U^C, X, R ):-       /* d(U^C)/dX = C*A*U^(C-1)   */
   atomic(C),                    /* where C is a number or    */
   C\=X,
   d( U, X, A ),
   R = C * A * U ^ ( C - 1 ).


d( sin(W), X, Z*cos(W) ):-       /* d(sin(W))/dX = Z*cos(W)   */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( exp(W), X, Z*exp(W) ):-       /* d(exp(W))/dX = Z*exp(W)   */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( log(W), X, Z/W ):-            /* d(log(W))/dX = Z/W        */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( cos(W), X, -(Z*sin(W)) ):-    /* d(cos(W))/dX = Z*sin(W)   */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( tan(W), X, (Z*sec(W)^2) ):-    /* d(tan(W))/dX = Z*sec(W)^2   */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( cot(W), X, -(Z*cosec(W)^2) ):-    /* d(cot(W))/dX = -Z*cosec(W)^2   */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( sec(W), X, (Z*sec(W)*tan(W)) ):-    /* d(sec(W))/dX = sec(W)*tan(W)  */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( cosec(W), X, -(Z*cosec(W)*cot(W)) ):-    /* d(cosec(W))/dX = -cosec(W)*cot(W)  */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( arcsin(W), X, Z/sqrt(1-W^2) ):-    /* d(arcsin(W))/dX = Z/sqrt(1-W^2) */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( arccos(W), X, -(Z/sqrt(1-W^2)) ):-    /* d(arccos(W))/dX = -(Z/sqrt(1-W^2) )*/
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( arctan(W), X, Z/(1+W^2) ):-    /* d(arctan(W))/dX = Z/(1+W^2) */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( arccot(W), X, -(Z/(1+W^2)) ):-    /* d(arccot(W))/dX = -(Z/(1+W^2)) */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( arcsec(W), X, (Z/(W*sqrt(W^2-1))) ):-    /* d(arcsec(W))/dX = (Z/(W*sqrt(W^2-1))) */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

d( arccosec(W), X, -(Z/(W*sqrt(W^2-1))) ):-    /* d(arccosec(W))/dX = -(Z/(W*sqrt(W^2-1))) */
   d( W, X, Z).                  /* where Z = d(W)/dX         */

   /****************** End Differential Calculus ***************/

   /****************** Integral Calculus ***************/
int( 0 , X , 0).

int( C , X , C * X ):-
	atomic(C),
	C \= X,  !.

int( X , X , 0.5 * X^2 ):- !.

int( 1 / X , X , ln(X) ):- !.

int( C * X , X , C * R):-
	atomic(C),
	int(X , X , R).

int( X * C , X , R):-
	atomic(C),
	int(C * X , X , R).

int( U + V , X , A + B ):-
	int( U , X , A ),
	int( V , X , B ).

int( U - V , X , A - B):-
	int( U , X , A ),
	int( V , X , B ).

int( U * V , X , U * R):-
	atomic(U),
	U \= X,
	int(V , X , R).

int( A^X , X , A^X / ln(A) ):-
	atomic(A),
	A \= X,
	!.

int( X^N , X , W1 * (X ^ W ) ):-
	numeric(N),
	W is N + 1,
	W1 is 1 / W,
	!.

int( X^N , X , (1 / (N + 1) ) * X ^ (N + 1) ):-
	atomic(N),
	!.

int( Z / X , X , Z * ln(X) ):-
	atomic(Z),
	Z \= X, !.

int( ( (A*X+B)^(-1) ) * X , X , inf ).

int( ( (A*X+B)^N ) * X , X , R):-
	A1 = ( A*X + B) ^ ( N + 1),
	A2 = ( A * ( N + 1 ) ),
	R = A1 / A2.

int( sin(A*X+B) , X , -(1/A) * cos(A*X+B) ):- !.

int( cos(A*X+B) , X , (1/A) * sin(A*X+B) ):- !.

% integration of functions
int( sin(X) , X , -cos(X) ):- !.

int( cos(X) , X , sin(X) ):- !.

int( tan(X) , X , ln(cos(X)) ):- !.

int( sec(X) , X , ln( sec(X) + tan(X) ) ):- !.

int( cosec(X) , X , ln( cosec(X) - cot(X) ) ):-	!.

int( cot(X) , X , ln(sin(X)) ):- !.

int( exp(X) , X , exp(X) ):- !.

int( sec(X)^2 , X , tan(X) ):- !.

int( cosec(X)^2 , X , -cot(X) ):- !.

int( sec(X) * tan(X) , X , sec(X) ):- !.

int( cosec(X) * cot(X) , X , -cosec(X) ):- !.

int( 1/(A*X+B) , X , (1/A) * ln(A*X+B) ):- !.

int( exp(A*X+B) , X , (1/A) * exp(A*X+B) ):- !.

int( 1/sqrt(1-X^2) , X , arcsin(X) ):- !.

int( 1/sqrt(1+X^2) , X , arctan(X) ):- !.

int( 1/(X*sqrt(X^2-1)) , X , arcsec(X) ):- !.

int( 1/(X^2-A^2) , X , (1/2*A) * ln( (X-A) / (X+A) ) ):- !.

int( 1/(A^2-X^2) , X , (1/2*A) * ln( (A+X) / (A-X) ) ):- !.

int( 1/(X^2+A^2) , X , (1/A)* arctan(X/A) ):- !.

int( 1/sqrt(X^2-A^2) , X , ln( X+sqrt(X^2-A^2) ) ):- !.

int( 1/sqrt(A^2-X^2) , X , arcsin(X/A) ):- !.

int( 1/sqrt(A^2+X^2) , X , ln(X+sqrt(X^2+A^2)) ):- !.

% integration of functions
% using substitutions

int( sin(X)*cos(X), X , (1/2)*R):-
	int(sin(2*X),X,R).

%if all fails

int(W,X,W).
   /****************** End Integral Calculus ***************/
numeric(A) :- integer(A).
numeric(A) :- float(A).
numeric(e).
numeric(pi).