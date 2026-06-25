Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444CA14F70
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782356217; cv=none; b=vAr85wRMrXKNCD+sHnjO5l367XOZO67ailjF0EwKx11ee5jbxMiKpDxAvTEH8Nybh82ROfAkHwftY0kUQBry3qKEPg4AM/YpTSAyvp6tVo+zggbcmXxVto82FQRwkCAKsOaC3QmGpJtc2Wff46I192JxPeumt8yqdnF0oHrZFwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782356217; c=relaxed/simple;
	bh=i6d1+4/OmPrv4r4wXlQsK8ELIrlGKZ76WuYeAcJPtJ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pdroU4TOuQ3+KgPoQjd5Ilqfy+LEKaJKG2NvWlEVmUW17HtC3Zj+thm6z5G3e5DrN7/vEaaX9ntGkXMwRcM3dApM1yQ65x2cpCsXcAD4WJULZIRxV4VpFXMD9meBBlyk1Mrb0tgPvAGif4QpKbmnknejO1UcqcLZCbNps+Z7b+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuChnWOW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuChnWOW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0211F000E9;
	Thu, 25 Jun 2026 02:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782356215;
	bh=qlqA9kPYgXWfUACPUut1tV7rNdv4oaSCMTbf73mg6U8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MuChnWOWcnj8/w874/Sts9ItQg2YsIrrRpNlhvxT+pNlmrzGO70JVU7MNqjOQKMez
	 ws+KXeNNp0tMwAvOxE7UASW5N8Gkisxybqftvourkwo60Obc9fnZ42yNgSucJHlK9x
	 rea++WqOqCl0vyvt0xIZalQ+2D/HVkDKHA47Hm41BjMkZDQy0lJnVQnsIiHz5Bd+JQ
	 aHHSd+dzvczRu0UC01cOrwjjUNHXwQVfgK1ts0ZZCnomDf6yimYntT0xTw9cBOnzcO
	 8Y2f4RphM2A4kjdqobtB4+gjV0MV+1RJyx6kMLpsPnWadWn/imAn4+zyEP4dlGjTw/
	 o2x1mcUKnvsDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260625023958.569299-4-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 02:56:55 +0000
Message-Id: <20260625025655.8B0211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The PHY driver fails to probe unconditionally because the new devi=
ce tree node lacks required properties.
- [High] The PHY driver does not support multi-PHY indexing, causing the se=
cond USB port to remain uninitialized.
- [Low] The `sys` node lacks a `ranges` property, breaking standard device =
tree address translation for its children.
--

commit 9dc588096b739f5b70f171c1eb14764b230dfb57
Author: Joey Lu <a0987203069@gmail.com>

arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node

This commit adds device tree nodes for the MA35D1 USB subsystem, including
the simple-mfd sys node, the usb-phy child node, and the DWC2, EHCI0/1,=20
and OHCI0/1 controllers. It also enables them and sets up pinctrl in the=20
board files.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dt=
s/nuvoton/ma35d1.dtsi
> index e51b98f5bdce4..a6a354f283117 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -83,9 +83,18 @@ soc {
>  		ranges;
> =20
>  		sys: system-management@40460000 {
> -			compatible =3D "nuvoton,ma35d1-reset", "syscon";
> +			compatible =3D "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
>  			reg =3D <0x0 0x40460000 0x0 0x200>;
>  			#reset-cells =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

[Severity: Low]
Since this sys node is acting as a bus for usb_phy and now defines=20
#address-cells and #size-cells, does it also need a "ranges;" property?

Standard device tree specification requires a ranges property in the
parent to map the child's address space. Omitting it here breaks standard
device tree address translation and can trigger dtbs_check warnings.

> +
> +			usb_phy: usb-phy@60 {
> +				compatible =3D "nuvoton,ma35d1-usb2-phy";
> +				reg =3D <0x60 0x14>;
> +				#phy-cells =3D <1>;
> +				status =3D "disabled";
> +			};

[Severity: High]
Will this PHY node fail to probe since it lacks the "nuvoton,sys" and
"clocks" properties?

Looking at ma35_usb_phy_probe() in drivers/phy/nuvoton/phy-ma35d1-usb2.c,
it unconditionally requests both of these:

    p_phy->sysreg =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
                                                    "nuvoton,sys");
    if (IS_ERR(p_phy->sysreg))
        return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->sysreg),
                             "Failed to get SYS registers\n");

Because they are omitted from this node, won't the lookup return -ENODEV
and cause all dependent USB controllers (DWC2, EHCI0/1, OHCI0/1) to defer=20
indefinitely?

>  		};
> =20
>  		clk: clock-controller@40460200 {

[ ... ]

> +		ehci1: usb@401c0000 {
> +			compatible =3D "generic-ehci";
> +			reg =3D <0x0 0x401c0000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk HUSBH1_GATE>;
> +			phys =3D <&usb_phy 1>;

[Severity: High]
Does the current driver actually support indexing the PHY like this?

The device tree maps controllers to <&usb_phy 0> and <&usb_phy 1>, but=20
looking at ma35_usb_phy_probe(), the driver registers with a simple xlate
that ignores the index:

    provider =3D devm_of_phy_provider_register(&pdev->dev,
                                             of_phy_simple_xlate);

Since of_phy_simple_xlate returns the first PHY object for all requests,=20
and the power routines like ma35_usb_phy_power_on() are hardcoded to only=20
manipulate PHY0 bits:

    regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7,
                       (PHY0POR | PHY0SUSPEND));

Will the hardware for PHY1 (the dedicated host port) remain completely=20
unpowered and fail to initialize when ehci1 and ohci1 attempt to use it?

> +			phy-names =3D "usb";
> +			companion =3D <&ohci1>;
> +			status =3D "disabled";
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625023958.5692=
99-1-a0987203069@gmail.com?part=3D3
