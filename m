Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C327453
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779841697; cv=none; b=ESIJb5tqqoqFXoKKKG8CuJ8ULfOJx+k4ikpK4Ijg7Z5mVHpnR8f3iYcHip9BVyn7rvnaDtxRrbPz4cyq8iaq8e4x0uAr+X3MO8/k9SsLObNmwOWxd6MskClFy34d1D3QbEs2WCRW1mSJcTkS0xJZXdBABYNPDQPlIsg+fscnJyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779841697; c=relaxed/simple;
	bh=4/wnOvkkJuxWgdaIhUbO6CctBAacNt1hTSmGTeeVyyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lB4+38W0Hl/y9MBFhaNbWL5aCXWGCO4wGyCe6hN5GaYl6HH2PFUAjczFtw1j3n7ZcVUUdyBEyrrmhg1tjsGA+XHuykB6987xHWNnVcGDevOf272NMVU3yDExLEx9VDwPhV//nTZgNPyioxTrrtg3RoM+1a/JmGKd+A/rXi5Nli8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A394+aB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A394+aB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF5D1F000E9;
	Wed, 27 May 2026 00:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779841695;
	bh=CRvrqXBDFgZVzFjxH4ncA1cR0owH8ul4av1ZqaCxV9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A394+aB0z7s4GK4AS+FSe9DfGYy2nGxIwRGsTjR06tmlOCJa0ZozYTb/cr2NqqDc+
	 YIb79xc209pn0vdoTyqTKZvRjweZnU8SNEd7YONO6q8IU/piZqpzdBJ7xn1klYbFGt
	 HGQ79LmN9hGi7l6HsLJzCFZXn/bPnTzX6sEWz8fPKiosByRCQllmOmaHjGSIx18N39
	 P0bkWH9rQpk03X2O7P9MoOul699fWCnGdVgWC+0bwDXQrYAYbCfLC5Md7EHATPYc2M
	 Sd9ubRs9nUYNXa16pDwYr9GgmdZyzr0XNnrTrPUosfHprmaeqQt49R/6J0vK9QN3ph
	 g+/C6dXj0cByg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526235417.1326187-3-jm@ti.com>
References: <20260526235417.1326187-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 00:28:14 +0000
Message-Id: <20260527002815.4BF5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The property `microchip,spi-present-mask` is incorrectly defined a=
s an 8-bit integer, which will cause a probe failure.
- [Medium] Missing `serial0` alias and namespace collision with `gpio2`.
- [Low] Alphabetical sorting violation in the TI device tree Makefile.
--

commit ac1670e1647cc8bb2691b4ba5ca55b12fd24da41
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: Add k3-am62l3-beaglebadge

This commit adds the device tree for the BeagleBoard.org BeagleBadge,
which is based on the AM62L3 SoC. It includes configurations for GPIO keys,
LEDs, PWM beepers, regulators, PMIC, and several I2C and SPI peripherals.

> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index 5269c9619b65c..4e377ca011cd8 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) +=3D k3-am62d2-evm.dtb
> =20
>  # Boards with AM62Lx SoCs
>  dtb-$(CONFIG_ARCH_K3) +=3D k3-am62l3-evm.dtb
> +dtb-$(CONFIG_ARCH_K3) +=3D k3-am62l3-beaglebadge.dtb

[Severity: Low]
This isn't a bug, but should this be sorted alphabetically? The other entri=
es
in this Makefile usually follow alphabetical order, so k3-am62l3-beaglebadg=
e.dtb
would normally be placed before k3-am62l3-evm.dtb.

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm6=
4/boot/dts/ti/k3-am62l3-beaglebadge.dts
> new file mode 100644
> index 0000000000000..8e816d21a586f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> @@ -0,0 +1,658 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * https://www.beagleboard.org/boards/beaglebadge
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.co=
m/
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "k3-am62l3.dtsi"
> +#include "k3-pinctrl.h"
> +
> +/ {
> +	compatible =3D "beagle,am62l3-beaglebadge", "ti,am62l3";
> +	model =3D "BeagleBoard.org BeagleBadge";
> +
> +	chosen {
> +		stdout-path =3D &uart0;
> +	};
> +
> +	aliases {
> +		gpio0 =3D &gpio0;
> +		gpio2 =3D &wkup_gpio0;

[Severity: Medium]
Will aliasing wkup_gpio0 to gpio2 cause an enumeration collision?=20

The base k3-am62l-main.dtsi already defines a physical gpio2 controller, so
using ID 2 for wkup_gpio0 might conflict if the real gpio2 is ever enabled.

Also, since stdout-path uses uart0 and serial3 is aliased below, should the=
re
be a serial0 alias for uart0 to ensure predictable /dev/ttyS* numbering?

> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c2 =3D &i2c2;
> +		i2c4 =3D &wkup_i2c0;
> +		mmc1 =3D &sdhci1;
> +		serial3 =3D &uart1;
> +	};

[ ... ]

> +&spi1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi1_pins_default>;
> +	status =3D "okay";
> +
> +	mcp23s18: gpio@0 {
> +		compatible =3D "microchip,mcp23s18";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <10000000>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		reset-gpios =3D <&gpio0 25 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&mcp23s18_reset_pins_default>;
> +		microchip,spi-present-mask =3D /bits/ 8 <0x01>;

[Severity: High]
Can this cause a probe failure?

The mcp23s08 pinctrl driver reads the microchip,spi-present-mask property
using device_property_read_u32().

By defining the property as an 8-bit integer, the property length in the
device tree is 1 byte instead of the 4 bytes required by
device_property_read_u32().

This could lead to of_property_read_variable_u32_array() returning
-EOVERFLOW, which would cause the mcp23s18 driver probe to fail and leave
the 7-segment displays non-functional.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526235417.1326=
187-1-jm@ti.com?part=3D2
