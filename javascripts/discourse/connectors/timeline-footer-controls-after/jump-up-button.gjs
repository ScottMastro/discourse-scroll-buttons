import Component from "@glimmer/component";
import { service } from "@ember/service";
import { action } from "@ember/object";

export default class JumpUpButton extends Component {
  @service topic;

  jumpTop() {
    this.topic?.jumpToIndex(0);
  }

  <template>
    <button
      type="button"
      class="btn btn-default discourse-jump-up-button no-text btn-icon"
      {{on "click" this.jumpTop}}
    >
      {{d-icon "arrow-up"}}
    </button>
  </template>
}
