import { type BooleanLike, classes } from 'common/react';
import { useState } from 'react';
import { resolveAsset } from 'tgui/assets';
import { useBackend } from 'tgui/backend';
import {
  Button,
  Icon,
  Image,
  Input,
  NoticeBox,
  Section,
  Stack,
} from 'tgui/components';
import { Window } from 'tgui/layouts';

type Data = {
  selected: string;
  object: Object[];
  target: Target;
  scanning: BooleanLike;
};

type Object = {
  dev: string;
  name: string;
  ref: string;
};

type Target = {
  userot: BooleanLike;
  arrowstyle: string;
  rot: number;
  pointer: string;
  color: string;
  locy: number;
  locx: number;
};

export const Radar = (props) => {
  return (
    <Window width={965} height={600} theme="ntos">
      <Window.Content scrollable>
        <RadarContent />
      </Window.Content>
    </Window>
  );
};

export const RadarContent = (props) => {
  return (
    <Stack fill>
      <Stack.Item position="relative" width={35}>
        <ObjectDisplay />
      </Stack.Item>
      <Stack.Item
        style={{
          backgroundImage:
            'url("' + resolveAsset('ntosradarbackground.png') + '")',
          backgroundPosition: 'center',
          backgroundRepeat: 'no-repeat',
          top: '20px',
        }}
        position="relative"
        m={1.5}
        width={45}
        height={45}
      >
        <TargetDisplay />
      </Stack.Item>
    </Stack>
  );
};

/** Returns object information */
const ObjectDisplay = (props) => {
  const { act, data } = useBackend<Data>();
  const { object = [], scanning, selected } = data;

  const [filter, setFilter] = useState('');

  return (
    <Section
      buttons={
        <Input
          placeholder="Search..."
          onInput={(_, val) => setFilter(val.toLowerCase())}
        />
      }
    >
      <Button
        icon="redo-alt"
        color="blue"
        disabled={scanning}
        onClick={() => act('scan')}
      >
        {scanning ? 'Scanning...' : 'Scan'}
      </Button>
      {!object.length && !scanning && <div>No trackable signals found</div>}
      {!scanning &&
        object
          .filter(
            (val) =>
              filter.length <= 0 || val.name.toLowerCase().includes(filter),
          )
          .map((object) => (
            <div
              key={object.dev}
              title={object.name}
              className={classes([
                'Button',
                'Button--fluid',
                'Button--color--transparent',
                'Button--ellipsis',
                object.ref === selected && 'Button--selected',
              ])}
              onClick={() => {
                act('selecttarget', {
                  ref: object.ref,
                });
              }}
            >
              {object.name}
            </div>
          ))}
    </Section>
  );
};

/** Returns target information */
const TargetDisplay = (props) => {
  const { data } = useBackend<Data>();
  const { selected, target } = data;

  if (!selected || !target) {
    return null;
  }
  if (!Object.keys(target).length && !!selected) {
    return (
      <NoticeBox
        position="absolute"
        top={20.6}
        left={1.35}
        width={42}
        fontSize="30px"
        textAlign="center"
      >
        Signal Lost
      </NoticeBox>
    );
  }
  return target.userot ? (
    <Image
      src={resolveAsset(target.arrowstyle)}
      position="absolute"
      top="20px"
      left="243px"
      style={{
        transform: `rotate(${target.rot}deg)`,
      }}
    />
  ) : (
    <Icon
      name={target.pointer}
      position="absolute"
      size={2}
      color={target.color}
      top={target.locy * 10 + 19 + 'px'}
      left={(target.locx - 1) * 10 + 16 + 'px'}
    />
  );
};
