SELECT
    DATE_TRUNC(date, MONTH) AS attack_month,
    COUNT(*) AS total_attacks
FROM
    `ransomware_intel.attacks`
WHERE
    date IS NOT NULL
GROUP BY
    attack_month
ORDER BY
    attack_month;
