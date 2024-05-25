use udb_1;

SELECT 
    a.AppID AS ID,
    a.Length,
    a.Comments,
    a.Type AS TypeID,
    t.Label AS `Type`,
    a.LabelID AS LabelID,
    l.Label AS Status,
    a.PkgID AS PackageID,
    p.Name AS Package,
    p.CategoryID AS PackageCategoryID,
    pc.Title AS PackageCategory
FROM
    appointments a
        LEFT JOIN
    AppointmentLabels l ON a.LabelID = l.LabelID
        LEFT JOIN
    Packages p ON a.PkgID = p.ID
        LEFT JOIN
    AppointmentTypes t ON a.Type = t.TypeID
        LEFT JOIN
    PackageCategories pc ON p.CategoryID = pc.CategoryID
WHERE
    a.Deleted = 0 AND a.Type != 0
ORDER BY a.Created ASC
LIMIT 999999;
