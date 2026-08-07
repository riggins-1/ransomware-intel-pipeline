SELECT
    domain,
    COUNT(*) AS attack_count
FROM
    `ransomware_intel.cleaned_attacks`
WHERE
    domain IS NOT NULL
    AND domain != ''
GROUP BY
    domain
ORDER BY
    attack_count DESC
LIMIT 100;
