import Component from "@glimmer/component";
import { service } from "@ember/service";
import { action } from "@ember/object";
import { on } from "@ember/modifier";
import icon from "discourse/helpers/d-icon";
import { getOwner } from "@ember/application";

export default class JumpUpButton extends Component {
  get topicController() {
    return getOwner(this).lookup("controller:topic");
  }

  jumpTop() {
    const tc = this.topicController();
    console.log("Jump Up Button Clicked", tc);

    tc?.jumpToIndex(0);
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
