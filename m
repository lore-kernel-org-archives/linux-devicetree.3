Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9FA399892
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759668; cv=none; b=AKgLeubSw2k/AQBYLQB2aI5g4D3aRvKBwwdAmeRnBDlk8jG5NfSSE13FcgD+xWSbrvwAbz++6SxAlRUzulEomlnBqPrcQASYAsU26pC82n7dIp+kny2wIA9cqoo+TDAPtCTpQwmeeuEOuNjaOFamnftJTt3snqkqtzSqWhWNlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759668; c=relaxed/simple;
	bh=bXgQdB/QGZVlSDlQcRIJTHYYFPX2PoWDb+DSXgpMdtQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kHrmPry2ULsvJ8mvds0bIjnZWfRFsR80pV7DYMAF4EolN0ZC53m7Dd0v5EcuoZT6rCqc6V5KbW4m+hHzH1uzm93nMl3Hk3oaRqHRrfcCF43ojqTBOfKzOpscTwiLwmNc1YWR25rgGenJoTXttrmkSlgJpRc4Cu046mjNE0UR6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwBCmo8a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwBCmo8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C52BC2BCB3;
	Thu, 14 May 2026 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759668;
	bh=bXgQdB/QGZVlSDlQcRIJTHYYFPX2PoWDb+DSXgpMdtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MwBCmo8aiTJEmllOqLp44EJV4IZVtePoAZfcN1h2kRewnzlSHA7BRQ/+Sb6Qenram
	 m8oZ7gjYiWMHA5JAuKXnWZROx3QN6xy6fyzcUhbEQaHRd+KYN3y48QWkKfK0AXkTSf
	 zcJEVOfsZeWIbR5EkmSKUWV7YTPfBPIthiSkeb7aMw7tb4eHe7Kt75SE094sfiGaIy
	 bEES22oEKHR5SM/zi7/dQ84eOdV+IXBP6PrpVjqnWAIHd3etECbdBPh/+1wW4IPrYB
	 AjxpeDv1j+kph4hobkQH06OpyM8+6+SI+TxqFV2AZpWL2GSet18MwW0rhfnwTLvjZr
	 wS/YZwAiV2+fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260513233447.2713737-3-jm@ti.com>
References: <20260513233447.2713737-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:54:26 +0000
Message-Id: <20260514115427.5C52BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `microchip,spi-present-mask` property is specified as an 8-bit=
 value, which will cause the mcp23s18 driver probe to fail.
- [High] Missing `bootph-all` property on `&wkup_i2c0` and its PMIC child n=
ode `tps65214`.
- [Low] Unnecessary inclusion of DT binding header files.
--

commit 14331975158856c05618604ffa3aca84008b3237
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: Add k3-am62l3-beaglebadge

This commit adds the device tree for the BeagleBoard.org BeagleBadge,
a compact single board computer based on the TI AM62L3 SoC. It provides
initial support including GPIOs, LEDs, regulators, and other peripherals.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm6=
4/boot/dts/ti/k3-am62l3-beaglebadge.dts
> new file mode 100644
> index 0000000000000..b7541e162a90d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> @@ -0,0 +1,700 @@
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
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/thermal/thermal.h>

Are these last two includes necessary?

It doesn't look like there are any DP83867 Ethernet PHY nodes in this device
tree to use the networking macros.

Also, the thermal zone trip point uses a raw string literal for the type
rather than the standard macros defined in thermal.h.

[ ... ]

> +&wkup_i2c0 {
> +	clock-frequency =3D <400000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&wkup_i2c0_pins_default>;
> +	status =3D "okay";
> +
> +	tps65214: pmic@30 {
> +		compatible =3D "ti,tps65214";

Will U-Boot SPL drop the I2C bus and PMIC from its device tree, failing to
configure essential SoC voltages like VDD_CORE, VDD_1V8, and VDD_LPDDR4?

While the associated pinmux group wkup_i2c0_pins_default correctly specifies
bootph-all, both the wkup_i2c0 controller node and the PMIC child node do n=
ot.

Could this prevent the board from booting?

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

Will the mcp23s18 driver probe fail here because of the 8-bit mask value?

The driver in drivers/pinctrl/pinctrl-mcp23s08_spi.c attempts to read this
using device_property_read_u32(), which expects a property of at least 4 by=
tes.

Reading a 1-byte property will cause the underlying
of_property_read_variable_u32_array() to return -EOVERFLOW, which could
completely disable the GPIO expander and its dependent peripherals.

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513233447.2713=
737-1-jm@ti.com?part=3D2
