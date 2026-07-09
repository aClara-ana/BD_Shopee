SELECT 
    v.nome_loja AS "Loja",
    prod.eh_indicado AS "Selo Indicado",
    prod.nome AS "Produto",
    vp.nome_variacao AS "Variação",
    ip.preco_original_historico AS "Preço Antigo (Riscado)",
    ip.preco_unitario AS "Preço Pago",
    ip.quantidade AS "Qtd",
    ped.valor_total AS "Total Pago"
FROM pedido ped
JOIN item_pedido ip ON ped.id_pedido = ip.id_pedido
JOIN produto prod ON ip.id_produto = prod.id_produto
JOIN vendedor v ON prod.id_vendedor = v.id_vendedor
LEFT JOIN variacao_produto vp ON ip.id_variacao = vp.id_variacao
WHERE ped.status_pedido = 'ENTREGUE'; --filtra apenas os finalizados 


SELECT 
    v.nome_loja AS "Nome da Loja",
    COUNT(ip.id_item_pedido) AS "Total de Itens Vendidos",
    SUM(ip.subtotal) AS "Faturamento Bruto (R$)"
FROM vendedor v
JOIN item_pedido ip ON v.id_vendedor = ip.id_vendedor
JOIN pedido ped ON ip.id_pedido = ped.id_pedido
WHERE ped.status_pagamento = 'APROVADO'
GROUP BY v.nome_loja
ORDER BY "Faturamento Bruto (R$)" DESC;
