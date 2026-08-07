SELECT
    country,
    COUNT(*) AS total_attacks
FROM
    `ransomware_intel.cleaned_attacks`
WHERE
    country IS NOT NULL
GROUP BY
    country
ORDER BY
    total_attacks DESC;
