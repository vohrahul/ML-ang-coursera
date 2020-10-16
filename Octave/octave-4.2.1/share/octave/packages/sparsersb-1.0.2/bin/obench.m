# 
#  Copyright (C) 2011-2015   Michele Martone   <michelemartone _AT_ users.sourceforge.net>
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, see <http://www.gnu.org/licenses/>.
# 
1; # This is a script
# once complete, this program will benchmark our matrix implementation against octave's
cmt="#";
#for n_=1:6*0+1
for n_=1:6
for ro=0:1
	n=n_*1000;
	m=k=n;
	# making vectors
	b=linspace(1,1,n)';
	ox=linspace(1,1,n)';
	bx=linspace(1,1,n)';
	# making matrices
	r=(rand(n)>.6);
	om=sparse(r);
	nz=nnz(om);
	M=10^6;
	if ro==1 
		printf("%s%s\n",cmt,"reordering with colamd");
		pct=-time; 
		p=colamd(om);
		pct+=time;
		pat=-time; 
		om=om(:,p);
		pat+=time;
		# TODO: use an array to select/specify the different reordering algorithms
		printf("%g\t%g\t(%s)\n",(nz/M)/pct,(nz/M)/pat,"mflops for pct/pat");
	else
		printf("%s%s\n",cmt,"no reordering");
	end
	#bm=sparsevbr(om);
	bm=sparsersb(sparse(om));
	#bm=sparsersb3(sparse(om));
	# stats
	flops=2*nz;
	## spmv
	ot=-time; ox=om*b; ot+=time;
	#
	bt=-time; bx=bm*b; bt+=time;
	t=ot; p=["octave-",version]; mflops=(flops/M)/t;
	printf("%s\t%d\t%d\t%d\t%g\t%s\n","*",m,k,nz,mflops, p);
	t=bt; p=["RSB"]; mflops=(flops/M)/t;
	printf("%s\t%d\t%d\t%d\t%g\t%s\n","*",m,k,nz,mflops, p);

	## spmvt
	ot=-time; ox=om.'*b; ot+=time;
	#
	bt=-time; bx=bm.'*b; bt+=time;
	t=ot; p=["octave-",version]; mflops=(flops/M)/t;
	printf("%s\t%d\t%d\t%d\t%g\t%s\n","*",m,k,nz,mflops, p);
	t=bt; p=["RSB"]; mflops=(flops/M)/t;
	printf("%s\t%d\t%d\t%d\t%g\t%s\n","*",m,k,nz,mflops, p);

	## spgemm
	ot=-time; ox=om*om; ot+=time;
	#
	bt=-time; bx=bm*bm; bt+=time;
	t=ot; p=["octave-",version]; mflops=n*(flops/M)/t;
	printf("%s\t%d\t%d\t%d\t%g\t%s\n","OCT_SPGEMM",m,k,nz,mflops, p);
	t=bt; p=["RSB"]; mflops=n*(flops/M)/t;
	printf("%s\t%d\t%d\t%d\t%g\t%s\n","RSB_SPGEMM",m,k,nz,mflops, p);
endfor
endfor
