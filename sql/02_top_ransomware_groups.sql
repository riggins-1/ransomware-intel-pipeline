SELECT
    claim_gang AS ransomware_group,
    COUNT(*) AS total_attacks
FROM
    `ransomware_intel.cleaned_attacks`
WHERE
    claim_gang IS NOT NULL
GROUP BY
    ransomware_group
ORDER BY
    total_attacks DESC;
