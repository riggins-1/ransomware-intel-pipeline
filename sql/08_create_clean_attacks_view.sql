CREATE OR REPLACE VIEW
`ransomware_intel.cleaned_attacks` AS

SELECT
    *,
    CASE
        WHEN claim_gang IS NULL THEN 'Unknown'
        WHEN LOWER(claim_gang) = 'false' THEN 'Unknown'
        ELSE claim_gang
    END AS ransomware_group

FROM
    `ransomware_intel.attacks`;
