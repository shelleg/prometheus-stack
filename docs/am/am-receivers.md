# Alertmanager multipule receivers

A common use case would be when you want to test how your templating is going ... and you have both and e-mail and a slack channel ...

```yaml
receivers:
- name: 'slack_n_mail'
  slack_configs:
    - send_resolved: true
      api_url: 'https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXX'
      title: "{{ template \"slack.custom.title\" . }}"
      text: "{{ template \"slack.custom.text_long\" . }}"
      color: "{{  if eq .Status \"firing\" }}danger{{ else }}good{{ end }}"
      title_link: "{{  template \"slack.custom.titlelink\" }}"
  email_configs:
  - to: teamA@shelleg.io
    smarthost: 'mailhog:1025'
```

* This basically a setup where the `slack` channel key will lead to you slack account and the `channel` associated with it.
* The slack receiver in this case utilizes the [slack templates ...](am-template.md)
