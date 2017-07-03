/// 
Class RF.KHAB.BI.KHABCube Extends %DeepSee.CubeDefinition [ DependsOn = RF.KHAB.Region, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="KHABCube" displayName="KHABCube" disabled="false" abstract="false" sourceClass="RF.KHAB.Region" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false">
  <dimension name="Region" disabled="false" hasAll="false" allCaption="All Key" allDisplayName="Key" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Region" disabled="false" sourceProperty="Key" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
        <property name="Name" disabled="false" sourceProperty="Name" hidden="false" isName="true" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
        <property name="Population" disabled="false" sourceProperty="Population" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
</cube>
}

Parameter DOMAIN;

}

