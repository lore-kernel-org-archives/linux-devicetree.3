Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255497;
	b=E1OmtoZW8/XD+REDRlmPu5ekPRjT18QHZugRqvkgN7gxQ3vZKnG8HYfm+kPWSVjcKwu+
	 IyPZ+hmCHknRYMj2E8LYz4sUkvxyNczS8gLeYdAhag+bU/OlChFVa7HcmG0UJ7+7uKdZe
	 dYV+yTjXtqCzjFZHMX2cU3iWQfBhdepR+8p1QTeviRUnUV5U0SP2OMih3sdQE3l7NivGZ
	 X01O1hbLZ2Ct1ravDngywZvJVPAyXSTfXKbBY0jS+b0OOohLJInU1+GT9++TYhdGohowQ
	 ysYVut+hJWbaGwwBnxuaI1OTrZscCi4aj+8/SN0l39W6bQRdErUylHCgGDcblZWVFpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255497;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GXwPbXbh+Z+F5oVduadipq3ln8+a5XhFIMq1bORoax4=;
	b=JmHVs0gc/vOazj7Vp8d6jeL7fyW7+QbWClGpGxRydbhw6Q03CozJn6nBlIV/XzfzU370
	 P84urFOBrWdLREQTTH+DBG5GBccSPU2MJTN2g3wnM2usfM1QH2Qho4Y/vAK+mhhlXhJql
	 W8xoN0a7CzyB8fPpmbl69p3PrKVVQTdX7GChCl4p5kEGMPkLsR/sQ+P+PUWQurwjcY6qd
	 khkYGySR2v6ppUKsPDzizFLEG2BvZ1lyIk+jN9bVtnYlQc3Uve4dgwB6mYl3sNVsxXE87
	 SzcLpX0yBIt7ry70I4GeL0h9UBqteXhjcOzR8J/w1R34bKbgSQ2fgvfvmKo90cNYiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X1ZTL/OR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0818C606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1ZTL/OR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412461F0089F;
	Mon,  9 Nov 2026 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255496;
	bh=GXwPbXbh+Z+F5oVduadipq3ln8+a5XhFIMq1bORoax4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X1ZTL/ORXbC55TrDhUTzdLVFl9ie1IN8ZBcNavkkJ32tpHSloh442nLztZvdJpYx9
	 r2yXk3KZvy+/JTNeEOZ2R2sc9Bbo3/mDTc9NwiL2qnMfnrF/D2Xx2q9mGmGNiXbzZR
	 kqtOlOICPTA6LGf4aI41lpGjezssgMItGZnOby9vFF06lzuVA6jEVROUqOvdf2UuLA
	 uA1IjwgUi2a2Eu+67tYPFRKhi9g41xSoXZKMuhv1Ju7GCu3yYMHkUnREJCCV5GDZ5L
	 oeJZSXLoH0sf1ZcVSdAjoIxlxtG9DfiXL4jRl7sgZ+JjmWiqOrzisJWQz2XHtRzKIb
	 YwL0ZcdfMyCCw==
Message-ID: <sashiko-outbox-205565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: exynos: Add initial support for Samsung
 Galaxy Tab A 10.1 (2019, 4G)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-gta3xllte-support-v1-2-dc0c4bfa8b44@mentallysanemainliners.org>
References: <20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org>
 <20261109-gta3xllte-support-v1-2-dc0c4bfa8b44@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:18:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: exynos: chassis-type set to handset instead of
  tablet on gta3xllte
- [Low] arm64: dts: exynos: unused irq.h include and DTS coding style
  ordering
--

commit f760d421e0674fc017d8f648d9b5b6eeebf73f43
Author: Umer Uddin <umer.uddin@mentallysanemainliners.org>

arm64: exynos: Add initial support for Samsung Galaxy Tab A 10.1 (2019, 4G)

This commit adds initial device tree support for the LTE variant of the
Exynos7885-based Samsung Galaxy Tab A 10.1 (2019) tablet.

> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/a=
rm64/boot/dts/exynos/exynos7885-gta3xllte.dts
> new file mode 100644
> index 0000000000000..0e4e6c0b20e15
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Galaxy Tab A 10.1 (2019, 4G) (gta3xllte/SM-T515) device tree =
source
> + *
> + * Copyright (c) 2026, Umer Uddin <umer.uddin@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos7885.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model =3D "Samsung Galaxy Tab A 10.1 (2019, 4G)";
> +	compatible =3D "samsung,gta3xllte", "samsung,exynos7885";
> +	chassis-type =3D "handset";

[Severity: Low]
Should chassis-type be "tablet" instead of "handset"?  The kernel exposes
this property at /sys/firmware/devicetree/base/chassis-type, so "handset"
causes userspace services such as systemd-hostnamed to misidentify this
tablet as a phone.

> +
> +	aliases {
> +		mmc0 =3D &mmc_0;
> +		serial0 =3D &serial_0;
> +		serial1 =3D &serial_1;
> +		serial2 =3D &serial_2;
> +	};
> +
> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@ec000000 {
> +			compatible =3D "simple-framebuffer";
> +			reg =3D <0 0xec000000 0x01400000>;
> +			width =3D <1200>;
> +			height =3D <1920>;
> +			stride =3D <(1200 * 4)>;
> +			format =3D "a8r8g8b8";
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		cont_splash_mem: framebuffer@ec000000 {
> +			reg =3D <0 0xec000000 0x01400000>;
> +			no-map;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x80000000 0x3dd00000>,
> +		      <0x0 0xc0000000 0x40000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&key_volup &key_voldown &key_power>;
> +
> +		volup-key {
> +			label =3D "Volume Up";
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			gpios =3D <&gpa1 5 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		voldown-key {
> +			label =3D "Volume Down";
> +			linux,code =3D <KEY_VOLUMEDOWN>;
> +			gpios =3D <&gpa1 6 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power-key {
> +			label =3D "Power";
> +			linux,code =3D <KEY_POWER>;
> +			gpios =3D <&gpa1 7 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +};
> +
> +&mmc_0 {
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	cap-mmc-highspeed;
> +	non-removable;
> +	mmc-hs400-enhanced-strobe;
> +	card-detect-delay =3D <200>;
> +	clock-frequency =3D <800000000>;
> +	bus-width =3D <8>;
> +	samsung,dw-mshc-ciu-div =3D <3>;
> +	samsung,dw-mshc-sdr-timing =3D <0 4>;
> +	samsung,dw-mshc-ddr-timing =3D <2 4>;
> +	samsung,dw-mshc-hs400-timing =3D <0 2>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&sd0_clk_fast_slew_rate_3x &sd0_cmd &sd0_rdqs
> +		     &sd0_bus1 &sd0_bus4 &sd0_bus8>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
This isn't a bug, but a few places here deviate from the DTS coding style:

dt-bindings/interrupt-controller/irq.h is included at the top of the file
but never used.

Under the root node, gpio-keys is placed after reserved-memory and
memory@80000000 instead of in alphabetical order, and its child nodes
(volup-key, voldown-key, power-key) are not ordered alphabetically either.

In chosen and reserved-memory, ranges is placed after #address-cells and
#size-cells rather than before standard properties.

In &mmc_0, the standard pinctrl-0 and pinctrl-names properties are placed
after the vendor-specific samsung,dw-mshc-* properties, and pinctrl-names
is placed before pinctrl-0 in both gpio-keys and &mmc_0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-gta3xllte-=
support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org?part=3D2
