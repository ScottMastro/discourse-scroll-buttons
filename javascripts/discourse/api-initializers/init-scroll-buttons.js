import { apiInitializer } from "discourse/lib/api";
import { h } from "virtual-dom";
import { iconNode } from "discourse-common/lib/icon-library";
import { getOwner } from "discourse-common/lib/get-owner";

export default apiInitializer("0.11.1", (api) => {
  const topicController = getOwner(this)?.lookup("controller:topic");

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

  if (settings.timeline_buttons_enabled) {
    api.createWidget("jump-up-button", {
      tagName: "widget-button.btn.btn-default.discourse-jump-up-button.no-text.btn-icon",
      html() {
        return h("span", [iconNode("arrow-up")]);
      },
      click(event) {
        topicController?.send("jumpTop", event);
      }
    });

    api.createWidget("jump-down-button", {
      tagName: "widget-button.btn.btn-default.discourse-jump-down-button.no-text.btn-icon",
      html() {
        return h("span", [iconNode("arrow-down")]);
      },
      click(event) {
        topicController?.send("jumpEnd", event);
      }
    });
  }

  if (settings.mobile_buttons_enabled) {
    api.createWidget("mobile-jump-up-button", {
      tagName: "widget-button.btn.btn-default.popup-menu-button.no-text.btn-icon.discourse-mobile-jump-up-button",
      html() {
        return h("span", [iconNode("arrow-up")]);
      },
      click(event) {
        topicController?.send("jumpTop", event);
      }
    });

    api.createWidget("mobile-jump-down-button", {
      tagName: "widget-button.btn.btn-default.popup-menu-button.no-text.btn-icon.discourse-mobile-jump-down-button",
      html() {
        return h("span", [iconNode("arrow-down")]);
      },
      click(event) {
        topicController?.send("jumpEnd", event);
      }
    });
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
