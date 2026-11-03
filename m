Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714936;
	b=HcrcoSiuA3AK9TGDvOQvppL17+v9F3at0qOpEK1AnxeO4MB5jgJQSq2NKEeAJ8FLSSaT
	 z18a2z1GZJSE9QArGyUEoEzKdIdzTgCN2OYH6+kXy2SGS548gCQxWkOAfvsp/6hbh4A8d
	 myKeYaZtRDdULyOIdD3FXo4LRgHDfkd4oL8ngZpPktvJ2I9NTlWiWwOVa5vFEAc+eCHB8
	 Osmf1+CbQ2rh1cUy8AjC7OaEdBqw0UxpOZqyiIH6u7pIzAZaCVFf8t3VPYN7RuFMwY/H0
	 oFnCxxtwhTNumMcDgAE44CnaV7DA6n8hNt8/oZn9JFheWHI+uYUYatVfNRRS6QDsfwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714936;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qfFlfuobUs0Isvbz0jTDZgklsqPPgH6u+YoCPP35c3k=;
	b=YzWsDslJHSiFdZy4MA6MTyXmByY5gNGpvVAy0jhL7ZDLKwlWtwgw/WyNt/S34ePCnwZg
	 pV3AGtjGPm/W3i+it14VJirwQgWfFj9U9TNdO0viHa1X10bOcpiqpWyh74Yurn96dXTBX
	 BYqGI7SqHGFUPSc3qUjn1QtFHIF9leLsGzzeqPS6yhasreycLKYsw19ALbipd4h2Og1ru
	 slljl9PI3arMt4NiXDIWwj0QfXaKvA6Vzg3EnJNdTAzKssmuvK9qJ2lImXnbcakXX6hD2
	 yqbvavA6IGBQ2afAdVR9M9UCH/VyGPTB2ubNiQOXJYZQNNRcKTXsldhNBxPv1hvTYbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzzhOnFa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C63606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzzhOnFa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3671F000C1;
	Tue,  3 Nov 2026 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714935;
	bh=qfFlfuobUs0Isvbz0jTDZgklsqPPgH6u+YoCPP35c3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZzzhOnFaOW5CNcG9aOHukgtaQH4/a05alzMolwfFmwJqqnf4PrdyUujQLRRbBjiS4
	 Flqn6JCKvNY81/JSme2GVwq5fyX9ri83duGbuEiAbwdp490Mlx52oceu1VIi6tzsff
	 fZv0jKlYPEHyo8cgK3JxHWRhttkgq87csMWaGcxQQA55Kq907ueRSJGN0r6WRgbMB1
	 sM3hVNjvXr+KyJsG5g35QCAQ1coMtDW4oA+xOc2LQdv3TErSx6+PTgEIBR/d3yBLgU
	 iOWO4CJlig3YFUE6Iq2hMGqqRuOx2jzAQd+k94wQjuzcs1ct6Ic0+BFHGGP34Yi9Sl
	 G3welGYe67THA==
Message-ID: <sashiko-outbox-195423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-quarkpi-ca2-v13-2-ad8c30cdb67e@163.com>
References: <20261103-quarkpi-ca2-v13-0-ad8c30cdb67e@163.com>
 <20261103-quarkpi-ca2-v13-2-ad8c30cdb67e@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:08:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: rockchip: non-power-of-two ramoops sizes in quarkpi-ca2
- [Low] arm64: dts: rockchip: unreferenced combophy regulators and unused i=
nclude
- [Low] arm64: dts: rockchip: duplicate headphone DAPM routes in QuarkPi-CA2
--

commit b00e8823ca510ece58a0c11ef8ab0946698d2e72
Author: Bob Hui <bg9oxa@163.com>

arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

This commit adds the device tree for the ALIENTEK QuarkPi-CA2, an RK3588S
based card computer, describing its regulators, storage, display, audio,
USB, PCIe, and expansion interfaces.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..df9887d5dc925
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> @@ -0,0 +1,1211 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/pinctrl/rockchip.h>

[ ... ]

> +	analog_sound: analog-sound {
> +		compatible =3D "simple-audio-card";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&hp_det>;
> +		simple-audio-card,name =3D "QuarkPi-CA2 ES8388";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&sound_cpu>;
> +		simple-audio-card,frame-master =3D <&sound_cpu>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,aux-devs =3D <&hp_amp>;
> +		simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +		simple-audio-card,pin-switches =3D "Headphones", "Headset Mic";
> +		simple-audio-card,widgets =3D
> +			"Headphone", "Headphones",
> +			"Microphone", "Headset Mic";
> +		simple-audio-card,routing =3D
> +			"Headphones", "LOUT1",
> +			"Headphones", "ROUT1",
> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",
> +			"Headphone Power INL", "LOUT1",
> +			"Headphone Power INR", "ROUT1",
> +			"LINPUT1", "Headset Mic",
> +			"RINPUT1", "Headset Mic";

[Severity: Low]
As reported by Sashiko on v12 [1], in analog_sound, when
simple_util_parse_routing() parses simple-audio-card,routing, it registers
both direct routes from LOUT1 and ROUT1 to Headphones and amplified routes
through the hp_amp simple-audio-amplifier (LOUT1/ROUT1 -> Headphone Power
INL/INR -> Headphone Power OUTL/OUTR -> Headphones).

Since the headphone outputs are routed through hp_amp, should the direct
"Headphones", "LOUT1" and "Headphones", "ROUT1" entries be dropped so the
DAPM graph does not contain duplicate parallel paths in
dapm_is_connected_ep()?

[ ... ]

> +	combophy_avdd0v85: regulator-combophy-avdd0v85 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "combophy_avdd0v85";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <850000>;
> +		regulator-max-microvolt =3D <850000>;
> +		vin-supply =3D <&vdd_0v85_s0>;
> +	};
> +
> +	combophy_avdd1v8: regulator-combophy-avdd1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "combophy_avdd1v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		vin-supply =3D <&avcc_1v8_s0>;
> +	};

[Severity: Low]
Are combophy_avdd0v85 and combophy_avdd1v8 needed here? Neither regulator is
referenced by any consumer in rk3588s-quarkpi-ca2.dts or rk3588s.dtsi, and
both are always-on fixed regulators without GPIO control that simply mirror
their parent supplies (&vdd_0v85_s0 and &avcc_1v8_s0).

Also, the <dt-bindings/media/video-interfaces.h> include at the top of
rk3588s-quarkpi-ca2.dts appears to be unused. Could these unreferenced
regulator nodes and the unused header include be removed?

[ ... ]

> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		ramoops: ramoops@118000 {
> +			compatible =3D "ramoops";
> +			reg =3D <0 0x118000 0 0xd8000>;
> +			console-size =3D <0x80000>;
> +			ftrace-size =3D <0x00000>;
> +			pmsg-size =3D <0x30000>;
> +			record-size =3D <0x14000>;
> +		};
> +	};

[Severity: High]
Can these non-power-of-two pmsg-size (0x30000) and record-size (0x14000)
values in ramoops@118000 cause misconfigured zone sizes and alignment faults
at boot when CONFIG_PSTORE_RAM is enabled?

In fs/pstore/ram.c, ramoops_probe() rounds non-power-of-two zone sizes down
to powers of two:

    if (pdata->record_size && !is_power_of_2(pdata->record_size))
        pdata->record_size =3D rounddown_pow_of_two(pdata->record_size);
    ...
    if (pdata->pmsg_size && !is_power_of_2(pdata->pmsg_size))
        pdata->pmsg_size =3D rounddown_pow_of_two(pdata->pmsg_size);

This reduces pmsg_size from 0x30000 to 0x20000 and record_size from 0x14000
to 0x10000, leaving dump_mem_sz =3D 0xd8000 - 0x80000 - 0x20000 =3D 0x38000.

When ramoops_probe() -> ramoops_init_przs() initializes the dump zones, it
computes:

    *cnt =3D mem_sz / record_size; /* 0x38000 / 0x10000 =3D 3 */
    zone_sz =3D mem_sz / *cnt;
    zone_sz =3D ALIGN_DOWN(zone_sz, 2); /* 0x12aaa */

Advancing paddr by 0x12aaa places subsequent persistent_ram_buffer headers =
at
2-byte-aligned physical addresses (0x12aaaa, 0x14fffe, and 0x1cfffe, with t=
he
latter two straddling 4K page boundaries). When persistent_ram_new() ->
persistent_ram_post_init() -> buffer_size() calls atomic_read() on the start
and size fields of struct persistent_ram_buffer, arm64 kernels built with
CONFIG_LTO emit load-acquire instructions (ldar/ldapr) that require 4-byte
alignment and fault on 2-byte-aligned addresses.

Should console-size, pmsg-size, and record-size be power-of-two values that
divide the ramoops reg size into power-of-two zones?

[1] https://lore.kernel.org/r/20261102-quarkpi-ca2-v12-2-d749d9bb2bf9@163.c=
om

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-quarkpi-ca=
2-v13-0-ad8c30cdb67e@163.com?part=3D2
