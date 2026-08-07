SELECT
    domain,
    COUNT(*) AS attack_count
FROM
    `ransomware_intel.attacks`
WHERE
    domain IS NOT NULL
GROUP BY
    domain
ORDER BY
    attack_count DESC
LIMIT 100;
