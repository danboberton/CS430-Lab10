SELECT lib.name, COUNT(*)
FROM Library as lib, Located as loc
WHERE lib.name = loc.location
GROUP BY lib.name;