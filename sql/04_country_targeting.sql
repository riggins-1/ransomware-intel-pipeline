SELECT
    country,
    COUNT(*) AS total_attacks
FROM
    `ransomware_intel.attacks`
WHERE
    country IS NOT NULL
GROUP BY
    country
ORDER BY
    total_attacks DESC;
