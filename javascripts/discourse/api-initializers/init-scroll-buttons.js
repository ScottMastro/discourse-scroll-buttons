import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("0.11.1", (api) => {
  const topicController = api.container.lookup("controller:topic");

  if (settings.footer_button_enabled) {
    api.registerTopicFooterButton({
      id: "footer-jump-button",
      icon: "arrow-up",
      priority: 0,
      translatedLabel() {
        return settings.footer_button_label;
      },
      translatedTitle() {
        return settings.footer_button_title;
      },
      action() {
        topicController?.send("jumpTop", { preventDefault() {} });
      },
      classNames: ["footer-jump-button"],
    });
  }
});
