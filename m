Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24002437130
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634637; cv=none; b=rSmXTjRm+DpcgNMtgHAHJg589e4VomKRp9Yl+ZMaktyONIPW/1wD9EJhCdAl22cOFrouJe+GsXl6DZdqfbFGl+nXmcKpkkiIGqBnDoZcTw55YvSG9Ck+YpYQ6oXBeEoSdv+qy/0XxfyjBiWHIEo+EzlIDS9nM28u1tLJfeeS3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634637; c=relaxed/simple;
	bh=Gi67RHtSFidYHgQEMhXHryb6rZaktOxae5usPppBvOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tUPj7gsIVFbAGtaywKB4FU+LMSdyk9vvPJVAd9TfUwkZWNX3bAHP5veZrmkVcNmByqhUDaG35r63XDBGDvhGPUMnoEPQc1nwt3UFxYqrYt3q9Pyy9nfWIjoM7h0Wa95iAXNQDZq10Uh51Mrbnpm1gsieR+sa3+NdsZC6HozLxvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYa8yE6M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYa8yE6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA6F1F00899;
	Thu, 17 Sep 2026 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789634611;
	bh=vAB+yhr8pkqYa6sTFV1ksyJeSf/VB1oYVxs6XgjqQks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYa8yE6Mbz+mi8dLjkoHBC/wxzbO6ObZWpzhVNmtsdhwpFcPijfD2X64Ox/rHnCUP
	 TaPsJ+zAC2UY3MUzsteMc541Eh8vhSHiacqi80noFGjxzeS5CnKkL4gdFKaoyY6tpd
	 4BlShdimS+M22f0TQsqlIjg62NT5+b5dXtpoB8QoPa8r/ULRr48cQie0An6RBtWG7U
	 DRKmpYZJodFZGAuCn2mTmf13G1457WD3qL4lfET2k59HROyV1Wjl8CtrIAwIoyU5Ht
	 4TUMmUsQAgByq/r/5AqxofWdCq5IdvlquQ5a9U1hSXYDyuOlKYehPhP8nJw2i6Mlnz
	 PQFwM0FTHf/gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm: dts: sunplus: add Tibbo LTPP3G2 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917082632.626614-4-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
 <20260917082632.626614-4-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:43:30 +0000
Message-Id: <20260917084331.6BA6F1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] i2c: open-drain bus stuck LOW due to hardware output inversion
- [Medium] pinctrl: requested RTS output inversion is silently ignored for =
PMUX pins
- [Low] dts: hardcoded OS-specific root partition in bootargs
- [Low] dts: non-generic device tree node names for I2C and LEDs
- [Low] dts: unused pinctrl definition for UART3 (dead code)
- [Low] dt-bindings: missing compatible string documentation for tibbo,ltpp=
3g2
--

commit 10e32790a2e05cfde60226acde658b3dc19b67ab
Author: Andrew Gaylard <ag@ffroot.co.za>
Subject: arm: dts: sunplus: add Tibbo LTPP3G2 board

This adds a device tree for the Tibbo LTPP3G2 board based on the Sunplus
SP7021 SoC. The hardware description includes eMMC, SPI, bit-banged I2C
EEPROM, PWM, a watchdog, RTC, and two GPIO LEDs.

> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts b/arch/=
arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> new file mode 100644
> index 0000000000000..f91b0de79c3d0
> --- /dev/null
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for Tibbo LTPP board G2
> + *
> + * Copyright (C) 2021 Sunplus Technology Co.
> + */
> +
> +/dts-v1/;
> +
> +#include "sunplus-sp7021-achip.dtsi"
> +
> +/ {
> +	compatible =3D "tibbo,ltpp3g2", "sunplus,sp7021";

[Severity: Low]
Is the tibbo,ltpp3g2 compatible string documented in the YAML bindings?
Running dtbs_check will likely fail since this board string does not
appear to be documented.

[ ... ]

> +	chosen {
> +		bootargs =3D "console=3DttySUP0,115200 earlycon root=3D/dev/mmcblk0p8 =
rootwait";

[Severity: Low]
Does hardcoding root=3D/dev/mmcblk0p8 tie the device tree to a highly speci=
fic
OS partitioning scheme? Booting a standard kernel image that expects the ro=
ot
filesystem on a different partition will fail to mount root without overrid=
ing
bootargs. Could this be removed to better separate the hardware description
from software configuration?

[ ... ]

> +	i2c_tps: i2c-tps { /* eeprom */

[Severity: Low]
Does the i2c-tps node name violate standard Devicetree naming schemas?
Node names should typically be generic, such as i2c.

[ ... ]

> +&leds {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&gpio_leds_pins>;
> +	pinctrl-1 =3D <&leds_s0_slp>;
> +	system-led {

[Severity: Low]
Should this node use a generic name like led-0 to comply with standard
validation schemas?

[ ... ]

> +&uart3 {
> +	status =3D "disabled";
> +};

[Severity: Low]
Should uart3 claim the pins_uart3 pinctrl configuration here, similar to
uart1, uart2, and uart4? If a user enables uart3 via an overlay, the
hardware pins will remain unconfigured.

[ ... ]

> +	pins_i2ctps: pinmux_i2ctps-pins {
> +		sunplus,pins =3D <
> +			SPPCTL_IOPAD(1, SPPCTL_PCTL_G_GPIO, 0,
> +				     SPPCTL_PCTL_L_OUT | SPPCTL_PCTL_L_ONV | SPPCTL_PCTL_L_ODR)
> +			SPPCTL_IOPAD(2, SPPCTL_PCTL_G_GPIO, 0,
> +				     SPPCTL_PCTL_L_OUT | SPPCTL_PCTL_L_ONV | SPPCTL_PCTL_L_ODR)
> +		>;
> +	};

[Severity: High]
Will applying SPPCTL_PCTL_L_ONV to these pins break open-drain signaling
and persistently hold the bus LOW?

When the i2c-gpio driver requests the bus to float HIGH by writing 1, the
SPPCTL_PCTL_L_ONV configuration bit hardware-inverts this 1 into a 0,
pulling the open-drain line strongly LOW.

Should SPPCTL_PCTL_L_OU1 be used instead of combining SPPCTL_PCTL_L_OUT
with SPPCTL_PCTL_L_ONV to set an initial HIGH output without breaking logic?

[ ... ]

> +	/* AP6256 Bluetooth */
> +	pins_btuart: pinmux_btuart-pins {
> +		sunplus,pins =3D <
> +			SPPCTL_IOPAD(40, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RX, 0)
> +			SPPCTL_IOPAD(41, SPPCTL_PCTL_G_PMUX, MUXF_UA4_TX, 0)
> +			SPPCTL_IOPAD(56, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RTS, SPPCTL_PCTL_L_ONV)

[Severity: Medium]
Is the SPPCTL_PCTL_L_ONV inversion request actually taking effect for this
PMUX pin?

Looking at the SP7021 pinctrl driver in sppctl_dt_node_to_map(), it generat=
es
a PIN_MAP_TYPE_MUX_GROUP for SPPCTL_PCTL_G_PMUX pin types and explicitly
discards configuration bits.

As a result, the requested inversion will be silently ignored, potentially
causing UART flow control failure if the AP6256 module actually requires an
inverted signal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917082632.6266=
14-1-ag@ffroot.co.za?part=3D3
