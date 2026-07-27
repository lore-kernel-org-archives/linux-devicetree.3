Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F803DDAE4
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140323; cv=none; b=bNBLsxhOE+th84GZ9Zi8qdYsmbr8RoJWg40nZmSgXbxB4yPEUsiD0FFZa02dxzf2/FAIvRLemuOFYfGmlJIifvaKZnxJ4MMkAwMJwP8JCr8i7QDz7jsB/2TNpthNNwCY/XApsdfO303EUizrGeswzo9y6to/g2Y9ACMtMn91v8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140323; c=relaxed/simple;
	bh=2hO7dBXaBfkMXYO8aWqhMOkaeMqdmzdKQfS0+dHB7cI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UoxXcMqcw7kKynfyzTGt1blXbbD7fRaSsaA6vt8y428q0gEnj260kRw8UwYuIiF84QTMfrMDqDFZlIzNXNGWFwyze3nsZ+o4LbuvcbOFYQvLpyuF6gL8hL9ZyteMbvkfAhTYHoZZhXXQreIfBg9ciG5bpbRGiNa7v3rGts/dayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAkvpn9b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAkvpn9b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCD41F000E9;
	Mon, 27 Jul 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785140322;
	bh=bkQSbPt9312gHYWmyJ0zT1xXoYlTCdz+ud8gm9c7+Bo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eAkvpn9b//b5a3btL3F3JxaIUW81GT0p1R6TfT7x8iiDWdPJz7th7FnCMyyZfyp4s
	 7YdyH482hyeSaPC3LUBN4JHF8FJf3OZUUO+ObuNKG1NTIn8XN8Y4ygsC7VYPw4Ik15
	 sKhvptoisEeUtBSWLwNEk3Mdeb+zcZWXlCs+y7U5CJu1iZN2oFD5EnRHWYpvEKUJHi
	 H1NtrgPVq7vSrSPG/5gNdokD6ZBb4CiKraO49n1Pcr1BBVDy4AZqZ6S17fKJyY/VeO
	 2UhU6UZ4WZQeoKhitwLRa+8arj55vFWREAexdjcHXCrmwljaX6IBGSw3b8vAych9dZ
	 ynkBKJuTheZvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Nie" <jun.nie@linaro.org>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:18:41 +0000
Message-Id: <20260727081841.EDCD41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Missing #address-cells, #size-cells, and reg in the example's paren=
t DSI node
- [Low] Missing schema reference for the ports node
- [Low] The 'reg' property is not marked as required
--

--- Patch [5]: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 pa=
nel support ---
commit 55e4e84f35f079171a4dea5e2741a34a7fac11e9
Author: Jun Nie <jun.nie@linaro.org>

dt-bindings: display: Add Synaptics R63455 panel support
   =20
Add support for the dual-panel system found in the virtual reality device.
This system consists of two physical 2160x2160 panels, each connected via
a MIPI DSI interface. The backlight is managed through DSI link.

> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r6=
3455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r6345=
5.yaml
> new file mode 100644
> index 0000000000000..c3bc8df981df7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.ya=
ml

[ ... ]

> +  vdda-supply:
> +    description: core 1.8V supply for panels
> +
> +  ports:

[Severity: Low]
Should this ports node include a $ref to /schemas/graph.yaml#/properties/po=
rts?
Without it, standard Open Firmware (OF) graph structural checks might be
bypassed, allowing invalid port configurations to silently pass schema
validation.

> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DSI input port for primary DSI link
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DSI input port for secondary DSI link
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reset-gpios

[Severity: Low]
Does 'reg' need to be added to this required list? Since MIPI DSI panels
must specify a virtual channel using the reg property, omitting it here mig=
ht
allow incomplete device trees to pass validation.

> +  - left-pos-supply
> +  - left-neg-supply
> +  - right-pos-supply
> +  - right-neg-supply
> +  - left-backlight-supply
> +  - right-backlight-supply
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi@ae94000 {

[Severity: Low]
Will this trigger a DTC warning during dt_binding_check? The parent node has
a unit address (dsi@ae94000) but lacks a reg property, and it also lacks
#address-cells and #size-cells which are needed since the child node
panel@0 has a reg property.

> +        vdda-supply =3D <&vreg_l3i_1p2>;
> +        status =3D "okay";
> +
> +        qcom,dual-dsi-mode;
> +        qcom,master-dsi;
> +
> +        panel: panel@0 {
> +            compatible =3D "sharp,ls026b3sa06", "synaptics,r63455";
> +            reg =3D <0>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-sm8650-7-1=
-bonded-dsi-v5-0-c042266b9eeb@linaro.org?part=3D5
