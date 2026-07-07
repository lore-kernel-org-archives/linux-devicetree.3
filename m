Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743D73161A1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436049; cv=none; b=YSs2howvmU7EUjI2jrIfs5NV1ysKFcIgWj7LJ68HuGgSMUq9ZeQbmoHvze/fdq4KgK+WaVTT9Oy36Id3xtUpu0m5U0NBkDKTxCRSSNe97f5iWwHqf8W0mIYHeSUWbeUddWYtZpdtOa/+QuZz1B6Qe1lECFaJq5MUFvkELIWIFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436049; c=relaxed/simple;
	bh=oW4MCN7TAevvX4hbcenoSTFY1SNdC5W41WceBuagNfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W/g6BDiUhe1IQx6t5YH+yzvvunhfrXkY5gH2VFrqbnckj3O8RaOoHl09gO0a37F1AzJADZmtf2MT01R/hd8SkjvAwJTT+8KLHu8MbXD+uXQR/Z9tRitU+SGQNxQeTRxHDG3QaonCj3yXsV5mmJfSy1qF4g1BqI8+/pI3T0uAO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mK1fu8xF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mK1fu8xF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49B31F000E9;
	Tue,  7 Jul 2026 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783436048;
	bh=RN3pVbrpCLvPal2+muUAP1q+R+Btpffxq7rOANZd4Ok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mK1fu8xFat9IhJSX8zvE1NAB9GW6FPkKn18fT7LBy6zxyP7g7NWMVgkExhi4IBX8u
	 54s5VP55ATcsfFjTsb7xJKOwMD1LTNL/L8bXEv7vrmFc9h6uUHoIh26+2Tgmv9j9Df
	 pqD7F7Vteh8UTLw5jQYHHEgJ+YwGmY3jXJ7w/XI3SK76/+XnUGVy1DJ5GA28Z+kK80
	 ixgnywx9CUhEajh9mpjFG5BpPNDnoSEBGGU3p4UcoU0z87zMPZ7vUvcRhM1NoHlACm
	 OxAMX4N9SpxAZmKZxa4KoGKAHxpMyqFv5tWEMZBkrRuEczO6ATEFR40B3q7QOXCUMJ
	 aWHLUpyOLlJKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0
 device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260707143646.245177-9-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:54:07 +0000
Message-Id: <20260707145407.E49B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] module_platform_driver() is invoked twice in the same C file, which=
 will cause a build failure when compiled as a loadable module.

Pre-existing issues:
- [High] The fix for the VBUS regulator enable_count leak is incomplete and=
 leaves the count unbalanced if the driver explicitly calls regulator_enabl=
e() on a pre-enabled regulator.
--

--- Patch [8]: [PATCH v3 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0 de=
vice nodes ---
commit 5af51dcc7dc2267ce2a724cd23f6ac8e1361e710
Author: Biju Das <biju.das.jz@bp.renesas.com>

regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support

Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC.
Register a separate rzg3l-usb-vbus-regulator platform driver for it.

> diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/reg=
ulator/renesas-usb-vbus-regulator.c
> index 9ba791bd72eca..9028340008749 100644
> --- a/drivers/regulator/renesas-usb-vbus-regulator.c
> +++ b/drivers/regulator/renesas-usb-vbus-regulator.c

[ ... ]

> @@ -64,6 +108,15 @@ static struct platform_driver rzg2l_usb_vbus_regulato=
r_driver =3D {
>  };
>  module_platform_driver(rzg2l_usb_vbus_regulator_driver);
> =20
> +static struct platform_driver rzg3l_usb_vbus_regulator_driver =3D {
> +	.probe =3D rzg3l_usb_vbus_regulator_probe,
> +	.driver	=3D {
> +		.name =3D "rzg3l-usb-vbus-regulator",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_platform_driver(rzg3l_usb_vbus_regulator_driver);

[Severity: Low]
Will this cause a build failure when compiled as a loadable module?

The module_platform_driver() macro is invoked twice in the same C file, whi=
ch
will expand to redefine the init_module and cleanup_module alias functions.


commit 30054990ee806fb8d79768ae79587b9acfe0f6a6
Author: Biju Das <biju.das.jz@bp.renesas.com>

phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled=
 VBUS regulator

Fix the devm disable action registration to base it on actual enabled state=
 via
regulator_is_enabled(), regardless of whether the caller requested an expli=
cit
enable.

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index d06fb52ed5f1b..ef38c3b365d42 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c

[ ... ]

> @@ -905,15 +905,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_ex=
clusive_enable(struct rcar_ge
>  	if (IS_ERR(channel->vbus))
>  		return PTR_ERR(channel->vbus);
> =20
> -	if (!enable)
> -		return 0;
> +	if (enable) {
> +		ret =3D regulator_enable(channel->vbus);
> +		if (ret)
> +			return ret;
> +	}
> =20
> -	ret =3D regulator_enable(channel->vbus);
> -	if (ret)
> -		return ret;
> +	if (regulator_is_enabled(channel->vbus))
> +		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_a=
ction,
> +						channel->vbus);

[Severity: High]
This isn't a bug introduced by this patch, but does this leave the enable_c=
ount
unbalanced if the driver explicitly calls regulator_enable() on a pre-enabl=
ed
regulator?

If the enable parameter is true, regulator_enable() increments the count.
If the regulator was already enabled by hardware, registering a single devm
disable action here fails to account for the double-incremented enable_coun=
t.

This would trigger a WARN_ON during device removal, which could panic the
kernel if panic_on_warn is set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707143646.2451=
77-1-biju.das.jz@bp.renesas.com?part=3D8
