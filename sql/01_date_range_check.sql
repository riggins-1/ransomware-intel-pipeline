SELECT MIN(date) AS earliest_attack, MAX(date) AS latest_attack, COUNT(*) AS total_attacks
FROM `ransomware_intel.attacks`;
