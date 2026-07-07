Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4236F8F9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436398; cv=none; b=glrHWrRmECaBgYdq4SDBQJ0XaZwOrxv6DjQyoHMKLB/g5/UAUmIirY6PWbKpxpJja5u3BF2HIr5EBubXlSSXqLxtK7dv/c5+9gSv45ihsTiR6YcgSG+XWJwZlNUbzGcvy0RxtBMuo5MCtcNur432+E+DSP5uAtcX+8OX1qfyUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436398; c=relaxed/simple;
	bh=TIfztXWYnIrZkb/ZScCNE2Hs1kmtYF/KQc3gysNoyxA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HzlTSkLKKZDllXdSrbcZAoBR+UGaT1WvMrBcKTWXuj+vLmr/CvhQjFR1BbuOsNANn9do0Jn0yaqJJKfMV2TrDKJ2c6l4vrZglk2IoEqN7z98YOrIlDF3XVLgtUwqV+k5d+Y170+rKH2LV14BdrxldAoyLDWumegPCazm8CCw5u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWp0Pt+R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWp0Pt+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61911F00A3A;
	Tue,  7 Jul 2026 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783436397;
	bh=ZpVMRbhWgK11tYpFNVsqMqdwQ5a2afpA+BiSYkYD6Rg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eWp0Pt+Ra+MuJYbxsokw7geQ4zj1yaG0uXJt/ziU82EdkQbJ6hLRPejDPXU3dMOm9
	 i16sE6tfFN7kvcUHQk+Tdb/nLtRwbsKpNV+j1bhGDpEmf276Z2bQDMpezNMnE4StiY
	 RKf2cyQVVyPJvaN+oE23tJJFkVqU18wXabPQl3artr9jwTb8MTe3ghjPT3tGDgI8F4
	 20h7CIh30eJPeJ6axLTqfuDia6DhExDZLgI1d/Rwv6IYQXbWWWC67iJj4kkoD0QhgE
	 RXDOvpEn5QU1HpTpvdpluNE1vm0+k0MS80AKhGTCkco9jGIF0o0tMl8pfPeVoemIT9
	 NMe4uVl/yYOgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add
 USB2.0 support
Reply-To: sashiko-reviews@lists.linux.dev
To: Biju <biju.das.au@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707143646.245177-10-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-10-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:59:56 +0000
Message-Id: <20260707145956.C61911F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Using `module_platform_driver()` twice in the same C file causes a =
build failure due to the redefinition of `init_module` and `cleanup_module`.
--

--- Patch [9]: [PATCH v3 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add =
USB2.0 support ---
commit 5af51dcc7dc2267ce2a724cd23f6ac8e1361e710
Author: Biju Das <biju.das.jz@bp.renesas.com>

regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support

This commit adds dual USB VBUS regulator support for the RZ/G3L SoC. It
introduces an array of regulator descriptors and a dedicated probe
function to register both regulators. A new platform driver is also added
to handle this dual regulator configuration.

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
Will this regression cause a build failure when the driver is compiled as a
module?

Using module_platform_driver() twice in the same C file expands into
module_init() and module_exit() twice.

This creates conflicting global aliases for init_module and cleanup_module,
causing the compiler to flag a redefinition error.

Could these drivers be registered with a custom module_init() function
that registers both, or perhaps combined into a single driver using match d=
ata?

> +
>  MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
>  MODULE_DESCRIPTION("Renesas RZ/G2L USB Vbus Regulator Driver");
>  MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707143646.2451=
77-1-biju.das.jz@bp.renesas.com?part=3D9
