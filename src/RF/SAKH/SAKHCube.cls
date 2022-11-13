/// 
Class RF.SAKH.SAKHCube Extends %DeepSee.CubeDefinition [ DependsOn = RF.SAKH.Region, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="SAKHCube" displayName="Карта Сахалинской области" disabled="false" abstract="false" sourceClass="RF.SAKH.Region" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false">
  <dimension name="Name" disabled="false" hasAll="false" allCaption="All Name" allDisplayName="Name" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Name" disabled="false" sourceProperty="%ID" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="Population" disabled="false" sourceProperty="Population" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="Name" disabled="false" sourceProperty="Name" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
</cube>
}

Parameter DOMAIN;

}

