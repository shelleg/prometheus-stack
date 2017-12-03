# Alert manager templates

* A Custom slack template:

```
{{ define "customAlertmanagerURL" }}http://{{ web.listen}}/#/alerts?receiver={{ .Receiver }}{{ end }}

{{ define "slack.custom.text" }}
{{ range .Alerts }}
{{ .Annotations.description }}
{{ end }}
{{ end }}

{{ define "slack.custom.titlelink" }}{{ template "customAlertmanagerURL" . }}{{ end }}

{{ define "slack.custom.title" }}
[{{ .Status | toUpper }}{{ if eq .Status "firing" }}:{{ .Alerts.Firing | len }}{{ end }}] Monitoring Event Notification
{{ end }}

{{ define "slack.custom.text_long" }}
{{ range .Alerts }}
*Alert:* {{ .Annotations.summary }} - `{{ .Labels.severity }}`
 *Description:* {{ .Annotations.description }}
 *Details:*
{{ range .Labels.SortedPairs }} • *{{ .Name }}:* `{{ .Value }}`
{{ end }}
{{ end }}
{{ end }}
```

The only tricky part here is getting the correct dns name in the `customAlertmanagerURL` varible.
