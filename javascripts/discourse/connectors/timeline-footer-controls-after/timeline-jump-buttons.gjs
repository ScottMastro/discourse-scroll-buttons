import Component from "@glimmer/component";
import { inject as controller } from "@ember/controller";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import icon from "discourse/helpers/d-icon";

export default class TimelineJumpButtons extends Component {
  static shouldRender(args) {
    return settings.timeline_buttons_enabled;
  }

  @controller topic;

  @action
  jumpTop(event) {
    this.topic.send("jumpTop", event);
  }

  @action
  jumpDown(event) {
    this.topic.send("jumpEnd", event);
  }

  <template>
    <div id="timeline-buttons-desktop">
      <button
        type="button"
        class="btn btn-default jump-up-button no-text btn-icon"
        {{on "click" this.jumpTop}}
      >
        {{icon "arrow-up"}}
      </button>

      <button
        type="button"
        class="btn btn-default jump-down-button no-text btn-icon"
        {{on "click" this.jumpDown}}
      >
        {{icon "arrow-down"}}
      </button>
    </div>
  </template>
}
