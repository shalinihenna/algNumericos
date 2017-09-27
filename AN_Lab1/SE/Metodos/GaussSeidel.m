function [X,paso]=GaussSeidel(A,b,x0,iter)
      X = [];  
      matriz = [];
      [cols filas]=size(A);
      if cols~=filas
         error('La matriz no es cuadrada');
      else
         if (cols~=size(x0))|(cols~=size(b))
            error('El sistema no es valido');
         else
            for k=1:cols
               for j=k+1:cols
                  if k~=j
                     D(j,k)=0;
                     D(k,j)=0;
                     L(j,k)=A(j,k);
                     L(k,j)=0;
                     R(k,j)=A(k,j);
                     R(j,k)=0;
                  end
               end
               D(k,k)=A(k,k);
               L(k,k)=0;
               R(k,k)=0;
            end
            fin=0;
            paso=1;
            x(1,:)=x0'
            while (fin==0)&&(paso<iter)
                X=[X; x(paso,:)];
               for componente=1:cols
                  vectant=0;
                  vectsig=0;
                  for k=1:componente-1
                     vectant=vectant+A(componente,k)*x(paso+1,k);
                  end
                  for k=componente+1:cols
                     vectsig=vectsig+A(componente,k)*x(paso,k);
                  end
                  x(paso+1,componente)=(b(componente)-vectant-vectsig)/A(componente,componente);
               end
               if x(paso,:)==x(paso+1,:)
                  fin=1;
               end
               paso=paso+1;
            end
            X=[X; x(paso,:)];
         end
      end
end

