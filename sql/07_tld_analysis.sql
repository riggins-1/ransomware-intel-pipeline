SELECT
    REGEXP_EXTRACT(domain, r'\.([a-zA-Z]{2,})$') AS tld,
    COUNT(*) AS attacks
FROM
    `ransomware_intel.attacks`
WHERE
    domain IS NOT NULL
GROUP BY
    tld
ORDER BY
    attacks DESC;
