{{ define "members" }}
{{ range .Members }}{{ if not (hiddenMember .)}}| `{{ fieldName . -}}` {{ printf "%s" "| ***" -}}
{{ if linkForType .Type }}
{{- printf "%s" "[" -}}{{- typeDisplayName .Type }}]({{ linkForType .Type}}{{- printf "%s" ")" -}}
{{ else }}
{{- typeDisplayName .Type -}}
{{- end -}}
{{- printf "%s" "***" }} {{- printf "%s" "|" -}}
{{ if fieldEmbedded . }}(Members of `{{- fieldName . -}}` are embedded into this type.)
{{- end -}}
{{ if isOptionalMember .}}
{{- printf "%s" " ***(Optional)*** " -}}
{{- end -}}

{{- renderComments .CommentLines -}}
{{ if and (eq (.Type.Name.Name) "ObjectMeta") }}
{{- printf "%s" "Refer to the Kubernetes API documentation for the fields of the `metadata` field." -}}
{{- end -}} 
{{ printf "%s" "|" }}
{{ end -}}
{{ end }}

{{- end -}}