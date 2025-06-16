import { iconNode } from "discourse-common/lib/icon-library";

export default {
  name: "scroll-buttons",

  initialize(api) {
    const container = api.container;
    const topicController = container.lookup("controller:topic");

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
        preventDefault: () => {}
      };
    }

    if (api.getCurrentThemeSetting("timeline_buttons_enabled")) {
      api.createWidget("jump-up-button", {
        tagName: "button.btn.btn-default.discourse-jump-up-button.no-text.btn-icon",
        html() {
          return ["span", iconNode("arrow-up")];
        },
        click() {
          topicController.send("jumpTop");
        },
      });

      api.createWidget("jump-down-button", {
        tagName: "button.btn.btn-default.discourse-jump-down-button.no-text.btn-icon",
        html() {
          return ["span", iconNode("arrow-down")];
        },
        click() {
          topicController.send("jumpEnd");
        },
      });
    }

    if (api.getCurrentThemeSetting("mobile_buttons_enabled")) {
      api.createWidget("mobile-jump-up-button", {
        tagName: "button.btn.btn-default.popup-menu-button.no-text.btn-icon.discourse-mobile-jump-up-button",
        html() {
          return ["span", iconNode("arrow-up")];
        },
        click() {
          topicController.send("jumpTop");
        },
      });

      api.createWidget("mobile-jump-down-button", {
        tagName: "button.btn.btn-default.popup-menu-button.no-text.btn-icon.discourse-mobile-jump-down-button",
        html() {
          return ["span", iconNode("arrow-down")];
        },
        click() {
          topicController.send("jumpEnd");
        },
      });
    }

    if (api.getCurrentThemeSetting("jump_button_enabled")) {
      api.registerTopicFooterButton({
        id: "discourse-jump-button",
        icon: "arrow-up",
        priority: 0,
        translatedLabel() {
          return api.getCurrentThemeSetting("jump_button_label");
        },
        translatedTitle() {
          return api.getCurrentThemeSetting("jump_button_title");
        },
        action() {
          topicController.send("jumpTop", createFakeEvent());
        },
        classNames: ["discourse-jump-button"],
      });
    }
  }
};
