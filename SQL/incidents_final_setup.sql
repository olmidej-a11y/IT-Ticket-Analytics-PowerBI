-- ======================================================
-- Author: Olumide Johnson
-- Purpose: Clean and prepare IT incident tickets dataset
-- for analysis and Power BI dashboard
-- ======================================================

-- Create a cleaned dataset from imported CSV
-- - Trim text fields
-- - Convert boolean text to numeric (0/1)
-- - Standardize dates to YYYY-MM-DD HH:MM
CREATE TABLE incidents_final AS
SELECT
    number,
    TRIM(incident_state) AS incident_state,
    CASE
        WHEN LOWER(TRIM(active)) = 'true' THEN 1
        WHEN LOWER(TRIM(active)) = 'false' THEN 0
        ELSE NULL
    END AS active,
    reassignment_count,
    reopen_count,
    sys_mod_count,
    CASE
        WHEN LOWER(TRIM(made_sla)) = 'true' THEN 1
        WHEN LOWER(TRIM(made_sla)) = 'false' THEN 0
        ELSE NULL
    END AS made_sla,
    caller_id,
    opened_by,
	
    -- Standardize dates
	
    STRFTIME('%Y-%m-%d %H:%M', 
        SUBSTR(opened_at,7,4) || '-' || SUBSTR(opened_at,4,2) || '-' || SUBSTR(opened_at,1,2) || ' ' || SUBSTR(opened_at,12,5)
    ) AS opened_at,
    sys_created_by,
    sys_created_at,
    sys_updated_by,
    sys_updated_at,
    contact_type,
    location,
    category,
    subcategory,
    u_symptom,
    cmdb_ci,
    impact,
    urgency,
    priority,
    assignment_group,
    assigned_to,
    knowledge,
    u_priority_confirmation,
    notify,
    problem_id,
    rfc,
    vendor,
    caused_by,
    closed_code,
    resolved_by,
    STRFTIME('%Y-%m-%d %H:%M', 
        SUBSTR(resolved_at,7,4) || '-' || SUBSTR(resolved_at,4,2) || '-' || SUBSTR(resolved_at,1,2) || ' ' || SUBSTR(resolved_at,12,5)
    ) AS resolved_at,
    STRFTIME('%Y-%m-%d %H:%M', 
        SUBSTR(closed_at,7,4) || '-' || SUBSTR(closed_at,4,2) || '-' || SUBSTR(closed_at,1,2) || ' ' || SUBSTR(closed_at,12,5)
    ) AS closed_at
FROM incident_event_log;

-- ======================================================
-- Replace missing or placeholder values
-- Convert '?' or NULL text values to 'Unknown'
-- ======================================================

UPDATE incidents_final
SET 
    number                  = COALESCE(NULLIF(TRIM(number), '?'), 'Unknown'),
    incident_state          = COALESCE(NULLIF(TRIM(incident_state), '?'), 'Unknown'),
    caller_id               = COALESCE(NULLIF(TRIM(caller_id), '?'), 'Unknown'),
    opened_by               = COALESCE(NULLIF(TRIM(opened_by), '?'), 'Unknown'),
    sys_created_by          = COALESCE(NULLIF(TRIM(sys_created_by), '?'), 'Unknown'),
    sys_updated_by          = COALESCE(NULLIF(TRIM(sys_updated_by), '?'), 'Unknown'),
    contact_type            = COALESCE(NULLIF(TRIM(contact_type), '?'), 'Unknown'),
    location                = COALESCE(NULLIF(TRIM(location), '?'), 'Unknown'),
    category                = COALESCE(NULLIF(TRIM(category), '?'), 'Unknown'),
    subcategory             = COALESCE(NULLIF(TRIM(subcategory), '?'), 'Unknown'),
    u_symptom               = COALESCE(NULLIF(TRIM(u_symptom), '?'), 'Unknown'),
    cmdb_ci                 = COALESCE(NULLIF(TRIM(cmdb_ci), '?'), 'Unknown'),
    impact                  = COALESCE(NULLIF(TRIM(impact), '?'), 'Unknown'),
    urgency                 = COALESCE(NULLIF(TRIM(urgency), '?'), 'Unknown'),
    priority                = COALESCE(NULLIF(TRIM(priority), '?'), 'Unknown'),
    assignment_group        = COALESCE(NULLIF(TRIM(assignment_group), '?'), 'Unknown'),
    assigned_to             = COALESCE(NULLIF(TRIM(assigned_to), '?'), 'Unknown'),
    knowledge               = COALESCE(NULLIF(TRIM(knowledge), '?'), 'Unknown'),
    u_priority_confirmation = COALESCE(NULLIF(TRIM(u_priority_confirmation), '?'), 'Unknown'),
    notify                  = COALESCE(NULLIF(TRIM(notify), '?'), 'Unknown'),
    problem_id              = COALESCE(NULLIF(TRIM(problem_id), '?'), 'Unknown'),
    rfc                     = COALESCE(NULLIF(TRIM(rfc), '?'), 'Unknown'),
    vendor                  = COALESCE(NULLIF(TRIM(vendor), '?'), 'Unknown'),
    caused_by               = COALESCE(NULLIF(TRIM(caused_by), '?'), 'Unknown'),
    closed_code             = COALESCE(NULLIF(TRIM(closed_code), '?'), 'Unknown'),
    resolved_by             = COALESCE(NULLIF(TRIM(resolved_by), '?'), 'Unknown');
	
	
	UPDATE incidents_final
SET
    knowledge = CASE
        WHEN LOWER(TRIM(knowledge)) = 'true' THEN 1
        WHEN LOWER(TRIM(knowledge)) = 'false' THEN 0
        ELSE NULL
    END,
    u_priority_confirmation = CASE
        WHEN LOWER(TRIM(u_priority_confirmation)) = 'true' THEN 1
        WHEN LOWER(TRIM(u_priority_confirmation)) = 'false' THEN 0
        ELSE NULL
    END;


-- ======================================================
-- Verification queries to Check for unknowns in key fields
-- ======================================================

SELECT 
    SUM(CASE WHEN category = 'Unknown' THEN 1 ELSE 0 END) AS UnknownCategoryCount,
    SUM(CASE WHEN subcategory = 'Unknown' THEN 1 ELSE 0 END) AS UnknownSubcategoryCount,
    SUM(CASE WHEN caller_id = 'Unknown' THEN 1 ELSE 0 END) AS UnknownCallerCount
FROM incidents_final;

SELECT active, COUNT(*) AS Count FROM incidents_final GROUP BY active;
SELECT made_sla, COUNT(*) AS Count FROM incidents_final GROUP BY made_sla;

-- ======================================================================================================
-- incidents_final is now fully clean, standardized and ready for Power BI dashboard or further analysis
-- =======================================================================================================
