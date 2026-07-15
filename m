Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A13AE183
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142898; cv=none; b=JAl41Nked7lEaHNQ3SjUf94CPRGjOjw3iEZF+g9cKeXTPLpGP+bEkRRmI9U//CcLnXK8si6VPOkmM0gPLjNiOOvEqwAZUEIR9n6lNP4DyBVe9s6mTdh37POhATaqUO8L0JwaWH5a8ZEDHRYViIQ6B9TKdktan3gDcNdsGoSVtB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142898; c=relaxed/simple;
	bh=laJCjMxVZ1mFt2XxuKKkmQyp2LbrleFETiSvryhev58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cAib1SVYT/voeM4UlIDe6m2Q0VqCypQ5r39yk7KIhZynRevIRVyKzIi2QLfrn/jCdcMaZfLLYFbxEWtWwdyoF1EsSjfdUSVGhOVSQZwfhfcRhXLuM7xG6Gn4Ka+8Q61mmKSs/hqm4Fh1CPUAubjDl8oiyKKUJ0MC8EZpLclt4a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQbZpVGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQbZpVGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437E11F00A3A;
	Wed, 15 Jul 2026 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142889;
	bh=QaPvJvsUGfaYOnyKvojyIFNtpOj23a4t4/Ky9KmWBbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQbZpVGFZCA5viPknyLXtBRQdB6/PhAC1hsdaD+m4jf74vrvtIpcQZl5Cp31rGH2Q
	 NieTGaLas+UREXQTkii6ZcmG4k8OibaeVH4HARPyuwtoque/R39J9PidaB0fo+Gvz7
	 1oy/jUiy3KpaIhFV0qHM0x9By3dQpbsgIInwiY02g0VmXCi6cW96jBZfU4QNaoG5TC
	 oIWnG2Wd/pueZAScIDfGtaZgvcyNRQ1Lx3UIM9E984E6nOxvTeBhjN37dfdd8Oln2V
	 VlGPl49I9Rs5DlLFhMDDGrmhJ6Zky7nlW+MZErkArZpEzJllCbx6/8UbmvO4L3ztc1
	 KyqmhhZQv8CMg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy:
 add rockchip,sgmii-mac-sel property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260714191341.690906-3-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-3-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:14:48 +0000
Message-Id: <20260715191449.437E11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Logical contradiction between the property's documented default =
value and the commit message's explicit configuration requirement.
- [Low] The `rockchip,sgmii-mac-sel` property is defined globally and not c=
onditionally constrained to the RK3568 SoC.
--

--- Patch [2]: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy=
: add rockchip,sgmii-mac-sel property ---
commit 0d950b4055dd144fecf5059f16535f2c8d94b5d3
Author: Coia Prant <coiaprant@gmail.com>

dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel prop=
erty

This commit adds the "rockchip,sgmii-mac-sel" property to the Rockchip
Naneng combphy device tree binding. It allows selecting between GMAC0
and GMAC1 for the SGMII interface on the RK3568 SoC.

> This is necessary for boards such as the Ariaboard Photonicat, where
> the SGMII interface is connected to GMAC0 and needs to be explicitly
> configured.

[Severity: Medium]
Is it actually necessary to explicitly configure the property to 0 for
GMAC0?=20

The schema defines the default as 0, which implies that omitting the proper=
ty
would naturally default the hardware to GMAC0. If explicit configuration is
required, does this mean the hardware or bootloader leaves the register at =
1,
making the `default: 0` documented in the schema incorrect?

> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 379b08bd9e97a..6173192e31ab2 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
[ ... ]
> @@ -80,6 +80,13 @@ properties:
>      description:
>        Some additional pipe settings are accessed through GRF regs.
> =20
> +  rockchip,sgmii-mac-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

[Severity: Low]
Should this property be conditionally restricted to the RK3568 compatible
string?=20

Because it is defined in the top-level properties block, it will pass
validation for all other hardware variants (like RK3528 or RK3588) that do
not actually support SGMII. Could an `if-then` block in the `allOf` section
be used to set this property to false for compatibles other than
`rockchip,rk3568-naneng-combphy`?

> +    default: 0
> +    description:
> +      Select gmac0 or gmac1 to be used as SGMII controller.
> +
>    "#phy-cells":
>      const: 1
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714191341.6909=
06-1-coiaprant@gmail.com?part=3D2
