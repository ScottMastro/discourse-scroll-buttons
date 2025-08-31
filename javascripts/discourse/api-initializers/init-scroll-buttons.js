import { apiInitializer } from "discourse/lib/api";
import { h } from "virtual-dom";
import { iconNode } from "discourse-common/lib/icon-library";

export default apiInitializer("0.11.1", (api) => {
  const topicController = api.container.lookup("controller:topic");
  
  function createFakeEvent() {
    return {
      defaultPrevented: false,
      shiftKey: false,
      metaKey: false,
      ctrlKey: false,
      button: 0,
      currentTarget: {
        target: "_self"
      },
      preventDefault() {
        // no-op
      }
    };
  }


  if (settings.jump_button_enabled) {
    api.registerTopicFooterButton({
      id: "discourse-jump-button",
      icon: "arrow-up",
      priority: 0,
      translatedLabel() {
        return settings.jump_button_label;
      },
      translatedTitle() {
        return settings.jump_button_title;
      },
      action() {
        topicController?.send("jumpTop", createFakeEvent());
      },
      classNames: ["discourse-jump-button"],
    });
  }
});
