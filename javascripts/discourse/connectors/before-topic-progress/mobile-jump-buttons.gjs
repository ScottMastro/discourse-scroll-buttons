import Component from "@glimmer/component";
import { inject as controller } from "@ember/controller";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import icon from "discourse/helpers/d-icon";

export default class MobileJumpButtons extends Component {
  static shouldRender(args) {
    return settings.mobile_buttons_enabled;
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
    <div id="mobile-jump-buttons">
      <button
        type="button"
        class="btn btn-default popup-menu-button no-text btn-icon mobile-jump-up-button"
        {{on "click" this.jumpTop}}
      >
        {{icon "arrow-up"}}
      </button>

      <button
        type="button"
        class="btn btn-default popup-menu-button no-text btn-icon mobile-jump-down-button"
        {{on "click" this.jumpDown}}
      >
        {{icon "arrow-down"}}
      </button>
    </div>
  </template>
}
