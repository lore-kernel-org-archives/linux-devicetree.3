Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609134949ED
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332917; cv=none; b=u69c67ddmduA+rGDjTnRfkvVdaBXzpsH2VhDnwV8Ixgj4uCElx3iL1QnQPzysKyvEHvNdxAY5yUFYv8GSDuBsRCnk4CwwmSOYeBHPHuE5nI6Zl49UsGnISv/808dijXgokYVV30RUgcknzhuXoPsLH94n6C9wSL92g75bju3pjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332917; c=relaxed/simple;
	bh=f0/jKXJfpQCfQcGnTnrKUCwwHGGwX6zxfVwd2fTlTfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bU2ll4iPxVlOEhsyDcgvBOzoqQl6olPADeFta8jWr4gaJPaFQfSFOKaqoYBYCY1HY/Q8Nh6T8AoRLsxnOvXS/8asG3cluKeVjMhGUm7J8Lkbc/KRD/UOXRn9SPgNccRaDHq0KCeHk/S2LwRu2JuIDcSaCOY2LTs3hv6sVoVOr+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCqh7JcB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCqh7JcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A921F000E9;
	Wed, 29 Jul 2026 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785332913;
	bh=JqEQuJ/ZelP+Jj+D7IuHq5D9Wa4u3v1Tn4sRfOnQB6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PCqh7JcB7NMHUldeMp5L38DnuHlvL0fi615OCn6iBtmvXsMavTure7TQrW/TCviac
	 3COYKxiS/a6iwccoNFSicAMexznAA4H8XpAZFOVOAXLEe0DXbG51NrS8yeLUB98dYB
	 LljH/owo2nJqFgwPnHBHkCut5kCVel/Ft3oFQvt3WwIxkduq3GqY2x2fQfnaGHPYh5
	 GjVU9cBUTRbGtVyVrzbGzB40EkXftgr8bVcbnqMrlMXN0dfzLC7LbnO3WfrBFr96jG
	 HHjxVcrLgi7JtZNFgaj70dmGGSgbV8Iw445E6GRFeQZuYrDDkOZhkmZHQDEk/lMwiB
	 8pFZRAr9S0ziw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:48:32 +0000
Message-Id: <20260729134833.45A921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing pinctrl driver match support for 'rockchip,rv1106-pinctrl'
- [High] Silent truncation and unreachable dead code in rockchip_get_drive_=
perpin()
- [Medium] Unused 'rockchip,grf' property in 'gpio-bank' child nodes
--

--- Patch [3]: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 co=
mpatible ---
commit f508d7fe3fdaea1487deaf572cd3b667691010ce
Author: Simon Glass <sjg@chromium.org>

dt-bindings: pinctrl: rockchip: Add RV1106 compatible

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 9b3cbeb54fed4..81747bb530569 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -51,6 +51,7 @@ properties:
>        - rockchip,rk3576-pinctrl
>        - rockchip,rk3588-pinctrl
>        - rockchip,rv1103b-pinctrl
> +      - rockchip,rv1106-pinctrl

[Severity: High]
Does this compatible string need to be added to the driver match table as w=
ell?

The schema strictly enforces 'rockchip,rv1106-pinctrl' without an allowable
fallback compatible, but it appears to be missing from the driver:

drivers/pinctrl/pinctrl-rockchip.c:rockchip_pinctrl_dt_match[] {
	static const struct of_device_id rockchip_pinctrl_dt_match[] =3D {
		{ .compatible =3D "rockchip,px30-pinctrl",
    ...
}

Will the pinctrl driver silently fail to probe for any device tree using th=
is
new compatible string?

[Severity: Medium]
Will this new hardware function correctly without parsing the rockchip,grf
property in gpio-bank child nodes?

The property appears to be correctly documented for gpio-bank subnodes:

Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml {
    ...
      rockchip,grf:
        $ref: /schemas/types.yaml#/definitions/phandle
    ...
}

But looking at the driver, it only parses rockchip,grf from the parent
pinctrl node and seems to ignore the subnodes entirely:

drivers/pinctrl/pinctrl-rockchip.c:rockchip_pinctrl_probe() {
    ...
	node =3D of_parse_phandle(np, "rockchip,grf", 0);
    ...
}

Could this cause the hardware feature for per-bank IOC control to be
non-functional?

[Severity: High]
Can the RV1103B override logic lead to silent truncation and unreachable co=
de?

Looking at rockchip_get_drive_perpin(), an override forces
DRV_TYPE_IO_LEVEL_2_BIT:

drivers/pinctrl/pinctrl-rockchip.c:rockchip_get_drive_perpin() {
    ...
	if (ctrl->type =3D=3D RV1103B && pin_num >=3D 12)
		drv_type =3D DRV_TYPE_IO_LEVEL_2_BIT;
    ...
}

This hits the 2-bit case block, which introduces an early return and perfor=
ms a
2-bit truncation for Banks 0 and 1:

drivers/pinctrl/pinctrl-rockchip.c:rockchip_get_drive_perpin() {
    ...
	case DRV_TYPE_IO_LEVEL_2_BIT:
		ret =3D regmap_read(regmap, reg, &data);
		if (ret)
			return ret;
		data >>=3D bit;

		return data & 0x3;
    ...
}

Because of this early return, does the fallback logic for RV1103B at the
bottom of the function become structurally dead?

drivers/pinctrl/pinctrl-rockchip.c:rockchip_get_drive_perpin() {
    ...
	if (ctrl->type =3D=3D RV1103B && bank->bank_num =3D=3D 2 && pin_num >=3D 1=
2) {
		data =3D data >> 10;
		return data & 0x3;
	}
    ...
}

Since the override lacks a bank number check, won't 8-bit drive strength pi=
ns
on Banks 0 and 1 with pin_num >=3D 12 now incorrectly hit the new 2-bit case
block and be silently bitwise-truncated to a 2-bit value?

>        - rockchip,rv1108-pinctrl
>        - rockchip,rv1126-pinctrl

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729132736.3807=
082-1-sjg@chromium.org?part=3D3
