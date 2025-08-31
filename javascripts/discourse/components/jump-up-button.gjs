import Component from "@glimmer/component";
import { action } from "@ember/object";
import { inject as service } from "@ember/service";
import { hbs } from "ember-cli-htmlbars";

export default class JumpUpButton extends Component {
  @service topic;

  @action
  jumpTop() {
    this.topic?.jumpToIndex(0);
  }

  static template = hbs`
    <button
      type="button"
      class="btn btn-default discourse-jump-up-button no-text btn-icon"
      {{on "click" this.jumpTop}}
    >
      {{d-icon "arrow-up"}}
    </button>
  `;
}
