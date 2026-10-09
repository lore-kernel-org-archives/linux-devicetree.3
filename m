Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9342D592D
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582765; cv=none; b=QRQDiPQGHNo4W7Fbkez1Zw8+JdbrzmjZZQFyFlqlasheL8HfPB7mwiDZewvaWtYBLu/RwRfy1NQRjiuPNDaQcjSt39Z6oialssIHeZ1ni8q7dg0hKwTaQHfSvPX+M7HNeNy/ZbsFUV466yVFZCJeTB84u/3F94J8SKJRTAXRw+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582765; c=relaxed/simple;
	bh=32Ov3gzbJTmldi9SSZz5cTh4jnWeVDs+WKpDDmYX79Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CNXyeAKNxgRI8r2pIjmLizDhqPbe4LIqdgnsokvDoMcgtJ4yxtE3lOVOEnNC3FeUQItjnV0CApE191iV1vTGAi8RGrp50VqcOFlhDIWueK5UtSEXRBrqhnx9ewhZNCG2isFUqdsyiBxzFTeGRmZIbOPHKFvZv+efUTTqcwcXcSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1hc1hJ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1hc1hJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8212C1F000FF;
	Fri,  9 Oct 2026 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582764;
	bh=zXIyGn9ki7zUhhL6EfuRff/jI+Qi/I9WkE8uiCRycj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X1hc1hJ3Ch3ZTfMbd1q6LebM9R2eKTtrSpDRDWDw2yyiAEU6FfV+TkDT5XHU4YP6k
	 +XXiCcGbOs6qfSMUaJl+SToxOlW5rEc7Iu4pFUy95JupHu3K5ItXQwBi2SNUbejrnE
	 cimcksT9eSJv/B/xznkKi6ICEBA8hE2Xwel6iVqUgwwQFPoNx+lQSCzxNuDbQSwnGA
	 j0VmfS2R2TO38LxE3fZqwtWvDmhMarzvi8fxz70jv9tMgzd3ZptyzcttMwCsZgKxoS
	 ipm2c6ZRWUsBN6wMnFxB0LRPS0kGPBXKAwWkSD2ARXrHvoE8jo1sn1RPjoH79WNUBP
	 UUY6FXTX8UGhA==
Message-ID: <sashiko-outbox-166096@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: add hi3798cv200
 regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Yang" <mmyangfl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009214404.722628-2-mmyangfl@gmail.com>
References: <20261009214404.722628-1-mmyangfl@gmail.com>
 <20261009214404.722628-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 21:52:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt-bindings: regulator: missing hardware calibration properties ca=
uses overvoltage
- [Medium] dt-bindings: compatible restricts to single SoC despite supporti=
ng multiple variants
--

commit e41927e1676c51346b08990a591c57b883a2a88d
Author: David Yang <mmyangfl@gmail.com>

regulator: dt-bindings: add hi3798cv200 regulator

The PMOC block of the HiSilicon STB SoCs (Hi3798cv200/mv100/mv200)
drives an external converter with a PWM signal. Add dt-binding doc.

> diff --git a/Documentation/devicetree/bindings/regulator/hisilicon,hi3798=
cv200-regulator.yaml b/Documentation/devicetree/bindings/regulator/hisilico=
n,hi3798cv200-regulator.yaml
> new file mode 100644
> index 0000000000000..812d94aca1f59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-r=
egulator.yaml

[ ... ]

> +description: |
> +  HiSilicon STB SoCs (Hi3798cv200/mv100/mv200) provide PWM outputs in th=
e PMOC
> +  block which drive an external converter.
> +
> +  The voltage range depends on the board design: reference designs speci=
fy
> +  0.65 V to 1.15 V for the Hi3798cv200, and 0.7 V to 1.25 V for the Hi37=
98mv200;
> +  a customized board has to figure out its own. The regulator itself has=
 no
> +  other source of calibration.
> +
> +properties:
> +  compatible:
> +    const: hisilicon,hi3798cv200-regulator

[Severity: Medium]
Will this strict constraint reject device trees for the other supported SoC=
s?

The description explicitly mentions support for multiple HiSilicon STB SoCs
(Hi3798cv200/mv100/mv200) which have different voltage reference designs.
However, restricting the compatible property to a single exact value
(hisilicon,hi3798cv200-regulator) rejects device trees that use SoC-specific
compatible strings (e.g., hisilicon,hi3798mv200-regulator) or fallback list=
s.

This prevents the proper representation of the other supported hardware var=
iants
without failing schema validation (dt_binding_check).

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulator-min-microvolt
> +  - regulator-max-microvolt
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +unevaluatedProperties: false

[Severity: High]
Does the lack of hardware calibration properties here cause overvoltage
in the driver?

By not including properties to describe the physical hardware bounds (e.g.,
duty-cycle mappings or pwm-regulator integration), strict validation preven=
ts
defining these board-specific calibration values in the device tree.

As a result, the follow-up commit "regulator: histb: add voltage regulator
driver" relies on the standard OS policy constraints (regulator-min-microvo=
lt
and regulator-max-microvolt) as physical 100% and 0% duty cycle calibration
boundaries:

drivers/regulator/histb-regulator.c:histb_regulator_probe() {
    ...
	priv->min_uV =3D init_data->constraints.min_uV;
	priv->max_uV =3D init_data->constraints.max_uV;
    ...
}

If a device tree author specifies a tighter policy constraint to protect
hardware (e.g., a maximum of 1.0V when the physical maximum is 1.15V),
a legitimate request for 1.0V outputs a 0% duty cycle:

drivers/regulator/histb-regulator.c:histb_regulator_set_voltage() {
    ...
	if (min_uV >=3D priv->max_uV)
		duty =3D 0;
    ...
}

This configures the hardware to physically deliver the unconstrained maximum
of 1.15V, completely bypassing the intended safety bounds and potentially
damaging connected components.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009214404.7226=
28-1-mmyangfl@gmail.com?part=3D1
