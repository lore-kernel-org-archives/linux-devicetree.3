Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593428;
	b=GpIJernQtxCFJkEl/zBv85/z3VNJfDx/pKPEpIOOQg7n427JBJqDJoJUmtRxeDYs57Nj
	 lHppAwtJUE/ikVXnKWDDlea3L2pgzyjHPHFsIxr+XlQnuUpt6ic+oL9rykQRf85BNaltC
	 D1llwpfdHYJZrnmcnrYqkfwkm6Lf8ZexYom3xAIF4/beH3O7+i9DymzIjBJ0mbqRzNeLg
	 WbLg0+ABY1we9J30QU+N7i8deGq0VQ3QIanZT3fJVioeuPdbD7SYHH2p38cFMKg1WwY/b
	 hL2cIoYViQDA1ooSm5Isr2UpDA4wUIRMnkoj+uzrefvEh+E8GrmQp81+z0zg6ZjmaBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9ywfmRyOrMDZJEO0waa6Qwbf1ZDyisykmcC8A9v2Ln0=;
	b=m1cDqPcbMffmzCFc5T3PEHAWGcKILpCRnylGk92GeM6imjZOrt1DjQpaBjyESnxghPvQ
	 2KaSjHXVpv81TjutUmpxO1S7OMSwqNWWADAq9kaQtbB9Z/Iico/27zajZY+AHu0m8SDWx
	 tCwfBeoJFHGLVNwBBVMkEx14APHCRniVizMQSWK/vlGxVAiflmGQy3gZMB8cU4UoE3Fzb
	 H7bI+Zz+YV91xKl9rJ0W80QetylgtB214suyjKAzwYwsASHesTxMwfST3XLKCp++RwB+i
	 uakYaiqYfnSMBRt8WmICNcc9iOlT2KfJ/I4Wj37uuXRs8M5mukoSvYA8LBop4fiQHfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hR9mNRH1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55430606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hR9mNRH1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE861F000C1;
	Wed, 21 Oct 2026 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593428;
	bh=9ywfmRyOrMDZJEO0waa6Qwbf1ZDyisykmcC8A9v2Ln0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hR9mNRH1Rb6xSOjiHZz+4mrN3aEXxhV62qALiIFMcINm0TMvrD4PARYFvs1r+/UFQ
	 cK3BrnQ+rqUAMmsGHXBdQweYDEorGdZJqeaE4fO2Yaaas0N7sgjL+iaSecB+NuSI0m
	 Oe5p1Oa4LLB/ESF0KjA2oPDtdtKlqX53L1sa/TQoUYGKIV+OU7c6bPPx2DhYak6yTq
	 ayjzrK7d2Jg42BkcisXR2fo5Wc8boziYz9UYhhn6ciDszcv6OZcspSnJoW6m1pcEiS
	 iqgC/Wg7fzqOHp8Gl6S/dJ5iJD5+SvySEX40iSgybxcw3N+lWwpd6kQxMsXU94kieQ
	 6GawC57t8IuRg==
Message-ID: <sashiko-outbox-180386@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: shikra-iqs-evk: Add Waveshare
 8-inch DSI panel overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: vishnu.saini@oss.qualcomm.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021-shikra_display_overlays-v1-7-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-7-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:37:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: missing panel_vcc regulator on wsgpio 8 in Waves=
hare overlay
--

commit 8859b55c691118c8af80fdf98b5e594862815afd
Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch DSI panel overlay

This commit adds a devicetree overlay for the Waveshare 8-inch DSI panel on
the Shikra IQS EVK carrier board, configuring the jadard,jd9365da-h3 panel,
the waveshare,dsi-touch-gpio expander, and the goodix,gt9271 touchscreen
while disabling the default hdmi output.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.=
dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
> new file mode 100644
> index 0000000000000..d0aa115681ffd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	model =3D "Qualcomm Technologies, Inc. Shikra IQS EVK Waveshare 8inch D=
SI Panel";
> +
> +	panel_avdd: regulator-panel-avdd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "panel-avdd";
> +		gpios =3D <&wsgpio 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	panel_iovcc: regulator-panel-iovcc {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "panel-iovcc";
> +		gpios =3D <&wsgpio 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&hdmi_bridge {
> +	status =3D "disabled";
> +};
> +
> +&hdmi_connector {
> +	status =3D "disabled";
> +};
> +
> +&i2c4 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	wsgpio: gpio@45 {
> +		compatible =3D "waveshare,dsi-touch-gpio";
> +		reg =3D <0x45>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	touchscreen@5d {
> +		compatible =3D "goodix,gt9271";
> +		reg =3D <0x5d>;
> +		reset-gpios =3D <&wsgpio 9 GPIO_ACTIVE_HIGH>;
> +	};
> +};

[Severity: High]
Does this leave the Waveshare vcc rail unpowered?

In drivers/gpio/gpio-waveshare-dsi.c, the expander maps offset 8 to the vcc
rail and offset 9 to touchscreen reset:

enum {
	GPIO_AVDD =3D 0,
	GPIO_PANEL_RESET =3D 1,
	GPIO_BL_ENABLE =3D 2,
	GPIO_IOVCC =3D 4,
	GPIO_VCC =3D 8,
	GPIO_TS_RESET =3D 9,
};

During waveshare_gpio_probe()->waveshare_gpio_set(), state->poweron_state
starts at 0 and asserting offset 9 writes the upper byte of
state->poweron_state to the touch register:

	last_val =3D state->poweron_state;
	if (value)
		last_val |=3D BIT(offset);
	else
		last_val &=3D ~BIT(offset);

	state->poweron_state =3D last_val;

	err =3D regmap_write(state->regmap, REG_TP, last_val >> 8);
	if (!err)
		err =3D regmap_write(state->regmap, REG_LCD, last_val & 0xff);

Because the overlay only defines panel_avdd (offset 0) and panel_iovcc
(offset 4) under &{/} and does not configure a regulator for wsgpio
offset 8, bit 0 of the touch register is driven low on every
waveshare_gpio_set() call and never enabled before goodix_ts_probe()
accesses touchscreen@5d.

Should &{/} also define a panel_vcc regulator for wsgpio offset 8 (as in
Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml, or
wired to touchscreen@5d) so the vcc rail is enabled?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-shikra_dis=
play_overlays-v1-0-adaea735999f@oss.qualcomm.com?part=3D7
