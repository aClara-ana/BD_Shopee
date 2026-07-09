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
