# Material Display – PSP421

SAP FIORI RAP transactional app to display Material master data sourced from the `MARA` table via the standard cloud-released CDS view `I_Material`.

---

## ABAP Object Overview

| Object | Type | Name | Purpose |
|--------|------|------|---------|
| Package | DEVC | `ZPSP421_MATERIAL` | Container for all objects |
| Projection View | DDLS | `ZC_Material_PSP421` | Consumption view on `I_Material` |
| Metadata Extension | DDLX | `ZC_Material_PSP421` | UI annotations (List Report + Object Page) |
| Service Definition | SRVD | `ZUI_Material_PSP421_O4` | Exposes projection view as OData service |
| Service Binding | SRVB | `ZUI_Material_PSP421_O4` | OData V4 UI binding |

### Standard base view used
`I_Material` — SAP cloud-released interface view (VDM type BASIC, `@ObjectModel.usageType.serviceQuality: #A`) that reads from `MARA`.

---

## ABAPGit Import into S/4 Public Cloud (Eclipse)

### Prerequisites
- Eclipse with ADT (ABAP Development Tools) installed
- ABAPGit plugin installed in Eclipse  
  _(Help → Install New Software → `https://eclipse.abapgit.org/updatesite/`)_
- GitHub Personal Access Token (PAT) with `repo` scope

### Steps

1. **Open ABAPGit in Eclipse**  
   Go to _Window → Show View → Other → ABAPGit Repositories_

2. **Clone this repository**  
   - Click the **+** (New Repository) button  
   - Enter URL: `https://github.com/psp421/productdisplay`  
   - Enter your GitHub PAT when prompted  
   - Set **Starting Folder** to `/abap/src/`  
   - Set **Package** to `ZPSP421_MATERIAL` (create it if it does not exist)

3. **Create the package in the system first** (if not present)  
   - In ADT, right-click a parent package → New → ABAP Package  
   - Name: `ZPSP421_MATERIAL`, Description: `Material Display - PSP421`  
   - Assign to a transport request (for on-prem) or leave as local (cloud trial)

4. **Pull objects**  
   - In the ABAPGit view, right-click the repo → **Pull**  
   - Confirm the transport request assignment  
   - All objects will be created: CDS views, metadata extension, service definition, and service binding

5. **Activate objects** (in ADT)  
   - Select all objects in package `ZPSP421_MATERIAL`  
   - Press `F8` or right-click → **Activate**

6. **Publish the Service Binding**  
   - Open `ZUI_MATERIAL_PSP421_O4` service binding  
   - Click **Publish** to make the OData V4 endpoint active  
   - Copy the Service URL for Fiori Launchpad / test in browser

7. **Preview in Fiori Elements**  
   - In ADT, open the service binding → click **Preview** next to the `Material` entity set

---

## App Layout

| Fiori Element | Detail |
|---------------|--------|
| Floor plan | List Report + Object Page |
| Protocol | OData V4 |
| Entity Set | `Material` |
| Selection fields | Material, Description, Material Type, Material Group |
| List columns | Material · Description · Material Type · Material Group · Base Unit · Created On |
| Object Page | General Data facet + Weight & Volume field group |

---

## File Structure

```
.abapgit.xml              ← ABAPGit project descriptor
abap/
└── src/
    ├── zpsp421_material.devc.xml          ← Package definition
    ├── zc_material_psp421.ddls.asddls     ← Projection CDS view
    ├── zc_material_psp421.ddlx.asddlx    ← UI metadata extension
    ├── zui_material_psp421_o4.srvd.srvd   ← Service definition
    └── zui_material_psp421_o4.srvb.srvb   ← Service binding (OData V4 UI)
```
