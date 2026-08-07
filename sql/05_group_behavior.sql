SELECT
    claim_gang AS ransomware_group,
    country,
    COUNT(*) AS attacks
FROM
    `ransomware_intel.cleaned_attacks`
WHERE
    claim_gang IS NOT NULL
    AND country IS NOT NULL
GROUP BY
    ransomware_group,
    country
ORDER BY
    attacks DESC;
