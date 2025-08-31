import Component from "@glimmer/component";
import { inject as controller } from "@ember/controller";
import { action } from "@ember/object";
import { on } from "@ember/modifier";
import icon from "discourse/helpers/d-icon";

export default class TimelineJumpButtons extends Component {
  @controller topic;

  @action
  jumpTop(event) {
    this.topic.send("jumpTop", event);
  }
  @action
  jumpDown(event) {
    this.topic.send("jumpEnd", event);
  }

  static shouldRender(args) {
    return settings.timeline_buttons_enabled;
  }

  <template>
      <div class="timeline-buttons-desktop">
        <button
          type="button"
          class="btn btn-default discourse-jump-up-button no-text btn-icon"
          {{on "click" this.jumpTop}}
        >
          {{icon "arrow-up"}}
        </button>

        <button
          type="button"
          class="btn btn-default discourse-jump-down-button no-text btn-icon"
          {{on "click" this.jumpDown}}
        >
          {{icon "arrow-down"}}
        </button>
      </div>
  </template>
}
