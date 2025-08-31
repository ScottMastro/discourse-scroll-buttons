import Component from "@glimmer/component";
import { withPluginApi } from "discourse/lib/plugin-api";



function addUpArrow(api) {
  api.renderBeforeWrapperOutlet(
    "timeline-footer-controls-after",
    class extends Component {
      static shouldRender(args) {
        return true;
      }

      <template>
        <button
        type="button"
        class="btn btn-default discourse-jump-up-button no-text btn-icon"
        {{on "click" console.log("Jump Up Button Clicked")}}
        >
        {{d-icon "arrow-up"}}
        </button>
      </template>
    }
  );
}

export default {
  name: "add-jump-buttons",
  initialize() {
    withPluginApi((api) => {
      // ... other customizations
      addUpArrow(api);
    });
  }
};
