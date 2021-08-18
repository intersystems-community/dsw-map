Class UA21.BI.UA21Cube Extends %DeepSee.CubeDefinition [ DependsOn = UA21.District, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="UA21Cube" displayName="UA21Cube" disabled="false" abstract="false" sourceClass="UA21.District" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="region" disabled="false" hasAll="false" allCaption="All region" allDisplayName="region" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="region" disabled="false" sourceProperty="region.name" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
        <property name="guid" disabled="false" sourceProperty="region.guid" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
      <level name="district" disabled="false" sourceProperty="name" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
        <property name="guid" disabled="false" sourceProperty="guid" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <measure name="population" disabled="false" sourceProperty="population" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
</cube>
}

Parameter DOMAIN;

}