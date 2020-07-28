# Arma 3 mission make pbo

Binarize mission SQM, and pack as pbo using armake2

## Inputs

### `mission`

**Required** Path to the mission directory to pack, relative to repository root.
It must contains an unbinarized mission.sqm file.

### `briefingName`

**Optional** If not empty, the action will set the mission briefing name to this value before packing.
Double quotes will be discarded.

## Outputs

*There is no output*

## Example

```yml
uses: actions/mission-make-pbo
with:
  mission: CONT_Orion.Malden
  briefingName: [GSRI] Orion-${{ env.GITHUB_RUN_NUMBER }}
```