{{ define "type" }}

## {{ .Name.Name -}}
{{ if eq .Kind "Alias" }}(`{{.Underlying}}` alias){{ end -}}
{{ with (typeReferences .) }}
Appears on: {{- $prev := "" }}
{{- range . -}}
{{- if $prev -}}, {{ end -}}
{{ $prev = . }}
{{- printf "%s" "[" -}}{{ typeDisplayName . }}{{- printf "%s" "]" -}}({{ linkForType . }})
{{- end -}}
{{ end }}

{{ if .Members }}| Field | Type | Description |
| ------ | ----- | ----------- |{{ if isExportedType . }}
| `apiVersion` | string | `{{apiGroup .}}` |
|    `kind` | string | `{{.Name.Name}}` |{{ end }}{{- template "members" . }}

{{ end }}{{ end }}