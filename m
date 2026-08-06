Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E83FA5E7
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055492; cv=none; b=qLo+2oODa6SfLFGI4idHCSC2STESqdqFF0hAiwOJD5SF3CMrU8kmShlItB3Sakm+hbeNa9IlFKMBgkt372q4wmSxlXgFgWH+SwNnGlBHUaljfWRzN4Q6XpUIGpmWhHxu6US/U3M1kZSoumO/K4bEipeCaFQb4DxKspXa3UQcKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055492; c=relaxed/simple;
	bh=HGGDmrU3t+wP0eHY8wQGAcHaj154tprHwvvRUuEqJ2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZgE3U3aqVc+rkSNAy+mihnTFMnich68WUvtgR+4TGn1b6Bv2oPNBOSKU3W2pWPLswahNGs417duJnoNjgBz9OJruxjGHd+3puo/d5WgsnXbTz0zrklKQb+bs4D10RSYJeTlQWrthekyokvtJPgisHMjswxglkZgylrJhqIdm4h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwJ4A4jt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwJ4A4jt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC191F000E9;
	Thu,  6 Aug 2026 22:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055477;
	bh=3ho3HNLffm4kVMuvGlWQUwNslXMN/LjdqItQC0LtdSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IwJ4A4jt8pyHurIzyU6+rRBfibrCt1IzE9A4IsgknG5d2lRQFcdQPoyu4JWFksqlB
	 GSvTqbS/ADbNiI+DwVqaX3PCYstQswQ5+GJ5Nk2wwfHGrfNI7gMeq7HRWz0Xd0UdMB
	 by3fwavS3Mz7VsIUJJu/z/JlFvCSv/zGGpzdwjbGYLLOjV7keKKhwJ3xYlJ6cAmZYH
	 MESkdh0vC+VcwMEG5IX+KGJ4Ba64WqCdpV8o8gvKcdWcUX8h1U/BzZOAXD2sCxJmma
	 sfJGuspAzNT6+n/zzQCqtyagTZqXu1HN0Qmzn3/XJGf7VIYkq7kYdNXgVFQo56XeTJ
	 DHNkcww+jz9VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 06/37] dt-bindings: pinctrl: airoha: en7581: allow
 configuration of pcie_reset pins as gpio or pwm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-7-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-7-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:31:16 +0000
Message-Id: <20260806223117.3EC191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `gpio-ranges` example specifies an incorrect linear pin mappin=
g due to a physical hardware gap, and the schema's `maxItems: 1` constraint=
 prevents specifying the correct discontinuous mapping.
- [High] The dt-bindings introduce group names and functions for the EN7581=
 SoC that conflict with the corresponding pinctrl driver's definitions, cre=
ating an API contract violation.
--

--- Patch [6]: [PATCH v11 06/37] dt-bindings: pinctrl: airoha: en7581: allo=
w configuration of pcie_reset pins as gpio or pwm ---
commit e5dd844dc6505525d8f5010d6aec0311493b74f7
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

dt-bindings: pinctrl: airoha: en7581: allow configuration of pcie_reset pin=
s as gpio or pwm

This commit updates the en7581 pinctrl binding to allow configuring the
pcie_reset pins as gpio or pwm. It introduces new pin groups and functions,
and updates the device tree example to include a gpio-ranges property.

> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.=
yaml
> index 0c5a7eb6d563e..0cf1826c691fc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml

[ ... ]

> @@ -187,6 +187,14 @@ patternProperties:
>                properties:
>                  groups:
>                    enum: [pnand]
> +          - if:
> +              properties:
> +                function:
> +                  const: gpio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gpio47, gpio48, gpio49]
[Severity: High]
Will this configuration cause a runtime failure during device probe?

The pinctrl driver for EN7581 (drivers/pinctrl/airoha/pinctrl-airoha.c)
does not appear to register a "gpio" function, nor does it define the
"gpio47", "gpio48", or "gpio49" groups (which are defined for the AN7583
variant).=20

If a device tree uses this documented API, will the pinctrl core
fail to find the requested function or groups?

[ ... ]

> @@ -347,6 +356,8 @@ examples:
>        interrupt-controller;
>        #interrupt-cells =3D <2>;
> =20
> +      gpio-ranges =3D <&pinctrl 0 13 50>;
> +
[Severity: High]
Does this linear mapping misalign the pins due to a physical hardware gap?

The block "0 13 50" maps GPIO 47 to physical pin 60, but pin 60 does not
exist on the EN7581 SoC (pcie_reset0 is at pin 61). This forces GPIO 48 to
manipulate pcie_reset0 instead of pcie_reset1, leaving pcie_reset2
inaccessible.

Additionally, because the schema limits gpio-ranges to a single tuple
(maxItems: 1 defined earlier in the schema), developers cannot specify the
two tuples required to skip the pin 60 gap without violating the schema.=20

Should the schema be updated to allow a discontinuous mapping and provide
an example that correctly maps the pins?

>        pcie1-rst-pins {
>          conf {
>            pins =3D "pcie_reset1";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D6
