select 
id_usuario,
COUNT(*) AS quantidade 
from pedido
where metodo_pagamento = 'PIX' and status_pedido = 'CANCELADO' and extract (month from data_pedido) = 06
group by id_usuario;
