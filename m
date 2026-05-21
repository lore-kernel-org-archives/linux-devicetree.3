Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8E367283
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 16:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379670; cv=none; b=IaIDsccA4w0hy7o4clwKhVoGGQ55N4gSyqhVZ/ia8TfAetXlhjFj1/LITwp/HIdcQl8sUT04WNJDY3dqg8URc3OQ1dFr10ulrV19/cOidxh6O8fYJmD+ptPqDXl18wHz1UVuvQBlXJ3XZ+A1JfVcGDl7+7m/JTaKeU5OaE9wmz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379670; c=relaxed/simple;
	bh=i5AcCrCNsclF/I/Vs+d8ILuWO7HCNkOLoFCgNnyW/Z0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OgYpq/TJrchA39G1RWhMR6acp1A0+izTGlTI9lSlly3WUq0WVDX2R92Tu7O9fN6XpG9iiTjwRbv7f4ft1XmqSEz7qclrJYTH2XhmUEvLWUuCPYMppy9sbTzipS9GYQH32cRD9ruzl/UrnkTrOhqyvf87RQoxV7qf2wPre4D39oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bwy14QR+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bwy14QR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94941F000E9;
	Thu, 21 May 2026 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779379669;
	bh=I+nicCEQH3k3MCPNUqu1ZkC6LyIIUQd/vdyf1KEbB9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bwy14QR+HBrwzWiZyRPWcIUDOker2meAQZtkItE82jpETzWspZ5PI1v5U8yT0eLAa
	 ncqdX2/a+5GYAj8INOpQQt2KnATH7O8dqEc/drctcq1DGpRdcZG9wyYOE16xMNH/5D
	 rhIpZcSii5kfrJBeR5pGiG/4SqToYF7lAO+E2KCw8vmhk4KxpYioVoMp3jSIxLOmvS
	 hGzw+ReWAOnWyusfxoe2kMZ4TIww6infIVM3iLikbwcKbEpznD9iy9ca2GwXeSOnX/
	 G/TcSYCGiURr52E/Ww9Wpv8nRzEWBPZ1FVUCe3DuvoRA3C5KJYjl95Z4DQjlmconIC
	 iOjvA8CKvnt8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: display: Add Synaptics R63455 panel
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 16:07:48 +0000
Message-Id: <20260521160748.C94941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] Invalid inline mapping for `$ref` under `ports` property.
- [Low] The `reg` property is used in the device tree example but omitted f=
rom the schema definitions.
- [Low] Missing closing brace for the panel device node in the DTS example.
- [Low] The `reset-gpios` property's `maxItems: 2` constraint conflicts wit=
h the strictly enforced `maxItems: 1` inherited from `panel-common.yaml`.
--

commit 5bb531a3ba9addcc1e532a73333c359429ef1ea6
Author: Jun Nie <jun.nie@linaro.org>
Subject: dt-bindings: display: Add Synaptics R63455 panel support

Add support for the dual-panel system found in the virtual reality device.
This system consists of two physical 2160x2160 panels, each connected via
a MIPI DSI interface.

> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r6=
3455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r6345=
5.yaml
> new file mode 100644
> index 0000000000000..a94b355ed9557
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.ya=
ml
[ ... ]
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - sharp,ls026b3sa06
> +        - boe,vs026c4m-n52-6000
> +      - const: synaptics,r63455
> +
> +  reset-gpios:
> +    maxItems: 2

[Severity: Low]
Will this conflict with panel-common.yaml? Since panel-common.yaml is
included via allOf, and it restricts reset-gpios to maxItems: 1, a device
tree providing two GPIOs will fail validation against the inherited schema.
The local relaxation to maxItems: 2 cannot override the stricter requirement
from panel-common.yaml.

> +    description: 2 reset pins for 2 physical panels
[ ... ]
> +  vdda-supply:
> +    description: core 1.8V supply for panels
> +
> +  ports: $ref: /schemas/graph.yaml#/properties/ports

[Severity: Low]
Does this syntax cause a YAML parser error? In YAML, a colon followed by a
space indicates a mapping value, and a plain scalar cannot contain an
unquoted colon-space sequence. Should the $ref be placed on a new line with
proper indentation?

> +
> +required:
> +  - compatible
[ ... ]
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    &mdss_dsi0 {
> +        vdda-supply =3D <&vreg_l3i_1p2>;
> +        status =3D "okay";
> +
> +        qcom,dual-dsi-mode;
> +        qcom,master-dsi;
> +
> +        panel: panel@0 {
> +            compatible =3D "sharp,ls026b3sa06", "synaptics,r63455";
> +            reg =3D <0>;

[Severity: Low]
Should the reg property be explicitly defined in the local schema
properties block? It is used here in the example but omitted from the
schema definitions. Since additionalProperties is false, dt_binding_check
will fail with an undocumented property error.

> +
> +            reset-gpios =3D <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
[ ... ]
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                port@0 {
> +                    reg =3D <0>;
> +                    panel0_in: endpoint {
> +                        remote-endpoint =3D <&mdss_dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +                    panel1_in: endpoint {
> +                        remote-endpoint =3D <&mdss_dsi1_out>;
> +                    };
> +                };
> +            };
> +    };

[Severity: Low]
Is there a missing closing brace for the panel node here? The brace
indented at 12 spaces closes the ports subnode, and the next brace indented
at 4 spaces closes the root mdss_dsi0 node. The lack of an 8-space indented
closing brace for the panel node will cause a syntax error from the Device
Tree Compiler.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-sm8650-7-1=
-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org?part=3D4
