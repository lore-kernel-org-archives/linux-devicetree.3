Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8C23535E
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151350; cv=none; b=KbsbNcIYs3SN73alZLU8fzEy5XyDtydp1yBE05ylHFUz7rYTWt4qMcVId4QG2T02qW1TiYQr3gL+ViJdgY2tHmupEe68TDluK4lDonRK0qNemsJ3jecd1VhVU3bHaql5B5RGXtFwlmFM4SsGHYT+QtQrKHE1dbX5pJD6JvCxioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151350; c=relaxed/simple;
	bh=r0MsJrdXT+XMsm+NFn4nwRplGNrJvyXWIVxDlQiHpXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kb3quOdEzLskU7GSRGwvSk6Iu47zpElUGXxjdaNw4rWzeF8qI9EPRCBqUHoMiwo81upgm6BOrwm0RBwGpiKenCuqGh3tBSmajreZXnlPlFfLGb4gjTHX3bbK3HMhSwjEmZthM3PODzNJAA3z3BvXmoIt/o1NR0tW4aMguw+JKs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Umma+8FX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Umma+8FX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410CA1F000E9;
	Sat,  4 Jul 2026 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783151337;
	bh=lvQ+W0D0bVolYcy14VMa78HZr+Y/H6iEiHSczYmunyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Umma+8FXN0SWIehkTSGTYeApy5NviiGXnHqUWQ1e8dgQvFbO+NL+XKP73Ea61PmTH
	 NQJHtsmHqAf9kn0VB57D00emDWQb5+LXeoaSJoq9L+W7xgrSM19Vs0LfUBL4/7u7yn
	 GzdPheW9/PE5VcbHBJzx/zihMUmOvK2WC7Dz6HAQws6U+2AjVKRnKZ9rFWsdEyMtPQ
	 lzlzjUx00kiMnDLo3/+XQCFCeXawPj1PTUJOuuzDBilEpEHS+kLsYv+RBeflswdF3F
	 C+UfERvn0uVMhj5m5ZpTmFvkB8uOY9eoweAHZSdZm1K2hEaPigwgds7ZsbrtqGcKRK
	 z6DK4zJFpHz6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: ti: cpcap-mapphone: use charger detection
 interrupt for CPCAP USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260704073843.1750458-5-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
 <20260704073843.1750458-5-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 07:48:56 +0000
Message-Id: <20260704074857.410CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Backward Compatibility Breakage in DT interrupt name change
- [High] Missing Cleanup / Error Handling causes permanent sysrq disablement
- [Medium] Data Race on `cpcap_enable_uart` module parameter leads to mixed=
 hardware state
--

commit 657e07c7931cc99eefeab1abc1d21d20f3271aa2
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for CPCAP USB=
 PHY

This commit updates the CPCAP USB PHY interrupt mapping in the device tree
to use the charger detection interrupt. It replaces the "se1" interrupt name
with "chrg_det", which matches driver and binding updates for DCP detection.

> diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arc=
h/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> index 73e27b95105e1..f3ec85d73a16f 100644
> --- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
[ ... ]
> @@ -106,11 +106,11 @@ cpcap_usb2_phy: phy {
>  			interrupts-extended =3D
>  				<&cpcap 15 0>, <&cpcap 14 0>, <&cpcap 28 0>,
>  				<&cpcap 19 0>, <&cpcap 18 0>, <&cpcap 17 0>,
> -				<&cpcap 16 0>, <&cpcap 49 0>, <&cpcap 48 0>;
> +				<&cpcap 13 0>, <&cpcap 49 0>, <&cpcap 48 0>;
>  			interrupt-names =3D
>  				"id_ground", "id_float", "se0conn",
>  				"vbusvld", "sessvld", "sessend",
> -				"se1", "dm", "dp";
> +				"chrg_det", "dm", "dp";

[Severity: High]
Does replacing the "se1" interrupt name outright instead of appending it
break backward compatibility?

If a new kernel boots with an older device tree (which provides "se1"
instead of "chrg_det"), probe aborts. The driver strictly requires all
interrupts to be present:

drivers/phy/motorola/phy-cpcap-usb.c:cpcap_phy_irqs:
	/* REG_INT1 */
	"se0conn", "vbusvld", "sessvld", "sessend", "chrg_det",

And in cpcap_usb_init_irq():
	irq =3D platform_get_irq_byname(pdev, name);
	if (irq < 0)
		return -ENODEV;

Probe is aborted if "chrg_det" is not found, without attempting to fall
back to "se1".

[Severity: High]
Can a transient error during PHY mode switching in the driver permanently
disable sysrq?

In drivers/phy/motorola/phy-cpcap-usb.c:cpcap_usb_set_idle_mode(), sysrq is
disabled at the start:

	sysrq =3D sysrq_mask();
	if (sysrq & 1)
		sysrq_toggle_support(sysrq & ~1);

	error =3D cpcap_usb_gpio_set_mode(ddata, CPCAP_UNKNOWN_DISABLED);
	if (error)
		goto out_err;

If hardware configuration fails, the function skips the restoration block:

	if (sysrq & 1)
		sysrq_toggle_support(sysrq);

	return 0;

out_err:
	dev_err(ddata->dev, "%s failed with %i\n", __func__, error);
	return error;

Does this silently strip the system of its diagnostic capabilities on a
single I2C/SPI bus error?

[Severity: Medium]
Could a concurrent modification to the cpcap_enable_uart module parameter
cause a mixed hardware state?

In drivers/phy/motorola/phy-cpcap-usb.c:cpcap_usb_set_idle_mode(), the glob=
al
cpcap_enable_uart is queried independently multiple times:

	if (cpcap_enable_uart && ddata->pins_uart) {
		error =3D pinctrl_select_state(ddata->pins,  ddata->pins_uart);
...
	if (cpcap_enable_uart)
		val |=3D (CPCAP_BIT_UARTMUX0 | CPCAP_BIT_EMUMODE0);
...
	if (!cpcap_enable_uart)
		val |=3D CPCAP_BIT_SUSPEND_SPI;

If modified during execution, could this read true during the pinctrl check
and false during the regmap bitmask construction, leaving the hardware in an
inconsistent configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704073843.1750=
458-1-ivo.g.dimitrov.75@gmail.com?part=3D4
