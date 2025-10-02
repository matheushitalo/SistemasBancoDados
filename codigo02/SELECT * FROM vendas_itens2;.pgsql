SELECT * FROM vendas_itens2;

SELECT
ROUND (MIN(total_vendas)::numeric, 3) AS menor_total_vendas,
ROUND (MAX(total_vendas)::numeric, 3) AS maior_total_vendas,
ROUND (AVG(total_vendas)::numeric, 3) AS media_total_vendas
FROM (
    SELECT 
        venda_id, 
        ROUND (SUM (quantidade * valor_unitario)::numeric, 2) AS total_vendas, data_venda
    FROM vendas_itens2
    GROUP BY venda_id, data_venda
    ORDER BY venda_id ASC
) AS vendas_totais;


-- VENDA MENOR 
SELECT 
    venda_id, total_vendas
FROM (
    SELECT 
        venda_id, 
        ROUND (SUM (quantidade * valor_unitario)::numeric, 2) AS total_vendas
    FROM vendas_itens2
    GROUP BY venda_id
) AS vendas_totais
WHERE total_vendas =(
    SELECT 
        MIN(total_vendas) 
    FROM (
        SELECT 
            venda_id, 
            SUM (quantidade * valor_unitario) AS total_vendas
        FROM
        vendas_itens2
        GROUP BY venda_id
    ) AS menor_venda
);

-- VENDA MENOR (otimizado)
SELECT 
    venda_id, 
    ROUND(SUM(quantidade * valor_unitario)::numeric, 2) AS total_vendas
FROM vendas_itens2
GROUP BY venda_id
ORDER BY total_vendas ASC
LIMIT 1;
