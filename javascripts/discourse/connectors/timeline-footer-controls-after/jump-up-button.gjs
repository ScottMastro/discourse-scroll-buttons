import Component from "@glimmer/component";
import { inject as controller } from "@ember/controller";
import { action } from "@ember/object";
import { on } from "@ember/modifier";
import icon from "discourse/helpers/d-icon";
import themeSetting from "discourse/helpers/theme-setting";

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
    {{#if (theme-setting "timeline_buttons_enabled")}}
      <button
        type="button"
        class="btn btn-default discourse-jump-up-button no-text btn-icon"
        {{on "click" this.jumpTop}}
      >
        {{icon "arrow-up"}}
      </button>
    {{/if}}
  </template>
}
