import Component from "@glimmer/component";
import { inject as controller } from "@ember/controller";
import { action } from "@ember/object";
import { on } from "@ember/modifier";
import icon from "discourse/helpers/d-icon";

export default class JumpUpButton extends Component {
  @controller topic;

  @action
  jumpTop(event) {
    this.topic.send("jumpTop", event);
  }

  static shouldRender(args) {
    return settings.timeline_buttons_enabled;
  }

  <template>
      <button
        type="button"
        class="btn btn-default discourse-jump-up-button no-text btn-icon"
        {{on "click" this.jumpTop}}
      >
        {{icon "arrow-up"}}
      </button>
  </template>
}
