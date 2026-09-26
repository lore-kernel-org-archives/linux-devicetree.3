Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934B37E5D4
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459966; cv=none; b=uNygMmhhv+7+CCgCZQ2upraBmGM+xx6BiwkSx/ViMFItiPx14+l7/0qBBCTpHxYNtCrhp4uoRR/UH7dgxTO2ED69otBr7WzmepLQdquYq9CkRuORzIrBowtpIiY6caq6JotUqjYXYCNgCjw5t/3w4vPFm88IKWXvMIu+rOoQTs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459966; c=relaxed/simple;
	bh=nODoQ1Xf1UO2oHVUbAxWodf/pX5xZ/9nwwd5NSDkfF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D+vUsJV36pyOGYWlAACWjOh+WqUEdxB8MaDaWIZnKSjT9btWzA+xzJspTM7xo2cVeo45ExDekJd8flPG0+VOY3teAcDG0PFYA6kWzmR0+sjDrP9LMDOeOaeMLXSAnbuE7k21ILVGd9bSQPoUNuAYVJe+k3PSKJF9la61+uZ6nCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSTsn0py; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSTsn0py"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDDC1F000FF;
	Sat, 26 Sep 2026 21:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790459965;
	bh=3X/OBd8pRCzWVURCiuy0ygWdkYLrYQ181fuzTz8Gir4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DSTsn0py+0aH2IAIlArb8EDvL8tSJBA3latWCBGXkma1oZtWwLLTZZkkC5H8zVVMI
	 B2+EHcuzEYluWL58pR7N1mIicWQZlgqiHxgZ1I0vqBs4TsVCVzzCPaQoIExKFykQEZ
	 9ej3h97zJV+klY2TPGeGTP3uNtFZQf3qquSV+Sd0AHiqxs1saL89UJ+E2IbYmzlTpA
	 CTCBGJjmQpHrfwNc4fNaYNicJMk5LsMTA98Fg84frJ17ip/1aDdjecoHTD4CVJr63B
	 5RnXaS0n45L1KoNjV7GEQcLEOg0gI4DdzxYo72cG2ioKT9oCQjS0vaM4+wbx72CJDC
	 CXBJwlyLTNigw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Convert hisilicon,hns-mdio
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925215911.2950356-1-robh@kernel.org>
References: <20260925215911.2950356-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 21:59:24 +0000
Message-Id: <20260926215924.EEDDC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dt-bindings: net: hisilicon,hns-mdio documents incorrect subctrl-v=
base register offsets
- [Medium] dt-bindings: net: hisilicon,hns-mdio restricts compatible proper=
ty breaking backwards compatibility
- [Medium] dt-bindings: net: hisilicon,hns-mdio omits functionally required=
 property subctrl-vbase
--

commit a57c7bf53ebe7bce1c71d128ab3f7430b9797694
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: net: Convert hisilicon,hns-mdio to DT schema

This commit converts the hisilicon,hns-mdio binding to DT schema format.
It also adds the subctrl-vbase property which is currently in use.

> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hns-mdio.yam=
l b/Documentation/devicetree/bindings/net/hisilicon,hns-mdio.yaml
> new file mode 100644
> index 0000000000000..b8350794650d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hns-mdio.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - hisilicon,hns-mdio
> +      - hisilicon,mdio

[Severity: Medium]
Does this new enum restriction unintentionally break backwards compatibilit=
y?

The original txt binding documented a fallback array format that is now
rejected by this schema. As shown in the deleted txt example, arrays like:

compatible =3D "hisilicon,hns-mdio", "hisilicon,mdio";

were previously valid. Existing device trees using that format will now fail
local dtbs validation.

[ ... ]

> +  subctrl-vbase:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: syscon phandle
> +          - description: MDIO clock enable register offset
> +          - description: MDIO reset request register offset
> +          - description: MDIO reset done register offset
> +          - description: MDIO reset deassert register offset

[Severity: High]
Are these register descriptions for subctrl-vbase accurate?

The driver implementation maps the third argument to clock status and the
fourth argument to reset status, computing the reset deassert offset
internally by adding 4 to the second argument.

Documenting the third argument as reset done and the fourth argument as res=
et
deassert could lead hardware engineers to provide incorrect offsets. Follow=
ing
this documentation causes the driver to poll incorrect syscon registers
during reset, leading to timeouts and functional failures during probe.

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'

[Severity: Medium]
Should subctrl-vbase be included in this list of required properties?

The driver unconditionally checks for subctrl-vbase during probe on DT
systems and fails with -ENODEV if it is missing. Device trees authored
without this property will pass dt-schema validation, but the hardware will
fail to initialize at runtime.

[ ... ]

> +examples:
> +  - |
> +    bus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        mdio@803c0000 {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            compatible =3D "hisilicon,hns-mdio";
> +            reg =3D <0x0 0x803c0000 0x0 0x10000>;
> +
> +            ethernet-phy@0 {
> +                reg =3D <0>;
> +            };
> +        };
> +    };

[Severity: Medium]
Since subctrl-vbase appears to be functionally required for initialization,
should it be included in this example? Adding it here would ensure the
example still passes validation if the property is correctly marked as
required.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925215911.2950=
356-1-robh@kernel.org?part=3D1
