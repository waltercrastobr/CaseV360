SELECT 
	p.usuario_atribuido_id,
	p.nota_fiscal_id,
    p.processo_id,
    p.tipo_processo,
    p.divergencia_id,
    nf.produto AS "produto/servico",
    nf.valor AS valor,
    d.nome_divergencia,
    d.tipo_divergencia,
    p.data_criacao,
    p.data_finalizacao,
    EXTRACT(EPOCH FROM (p.data_finalizacao - p.data_criacao)) / 86400 AS tempo_processamento,
    CASE 
        WHEN EXTRACT(EPOCH FROM (p.data_finalizacao - p.data_criacao)) / 86400 > 2 THEN 'Sim'
        ELSE 'Não'
    END AS processamento_atrasado
FROM 
    schema_v360.processo p
LEFT JOIN 
    schema_v360.divergencia d ON p.divergencia_id = d.divergencia_id
JOIN 
    schema_v360.nota_fiscal nf ON p.nota_fiscal_id = nf.nota_fiscal_id
WHERE 
    p.data_finalizacao IS NOT NULL
ORDER BY 
    p.processo_id;

