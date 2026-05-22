Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA403D4127
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779467765; cv=none; b=cRtBE4SBow6NiuzhY26tqBG/2rN2FcUXdbTO/NpSv7AcMA55/pV8eqDXo6fyc01C3teRm8Xoc7cjpHrhI4CdxN4/EdA7Sj5dBznaZYTpYh95lWxXqzg+6I+qJ1Gx+NS/XU/L5+LbJPOoKSLlBL9659v/CR5lEA9x7Eqxreby+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779467765; c=relaxed/simple;
	bh=6gpqC196UKin8ItJOqth7Wj856VtQiibPrHDj0txmuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iSfN+HHNdJFkPnHOOHm6E2t5d4ZGqy5VF9uXL/XUqUjfeLsxn0C5Hee4SmLien7KJDjBVWPbghqjmBo130F7PbN2EaP8+fzjIKuhppg0VJoE0dDOFg2D4Q0+D/rW9oC6aeQ7V3BcYpUlJwdfqXY+ycbEawP1eTsWg2XO/v/FziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6FFu4gx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6FFu4gx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EC01F000E9;
	Fri, 22 May 2026 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779467764;
	bh=NIRTOYFRGYWuwrJ4Cucdq+js5Ekoq4Ne9Z4VpfIdPu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E6FFu4gxoOzU39MwP7hkgk7Eej7O9nwpPvXfx+RbjsfNUj4CHy/xDuprTnMbRtC2X
	 sH6K+QwQTwJhfVcFfxw1HHKL6M8hIaIauRxS/isVHyAZcV4rKwBg0ld/Zpp9LqAqLD
	 pkAfjw1ZaH4SgYSzp1jIDwB/w8TGfzL1ilSPcMWcadq4woY/TwG1Y7mqM6DX8wG2Nr
	 wJ7rzzbGo+k5HC9LEAsVQSOn0+yoAS3gnvB6UMGNAydIzSw8+5KbVUaWipM5euqyjm
	 fn18gNE4iUS2F1HlSlANnn1N60flFEu2tqD4yrO6huOVOW8OHQvY/pKSbu8lfbfR/9
	 1ST1P41eilLxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/11] arm64: dts: ti: k3-am62-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522161105.277519-18-ivitro@gmail.com>
References: <20260522161105.277519-18-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 16:36:03 +0000
Message-Id: <20260522163603.E4EC01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect interrupt trigger edge configured for the active-low t=
ouch controller interrupt.
--

commit fab3f681a92c02497462fd11a6e8c83f2e40950e
Author: Vitor Soares <vitor.soares@toradex.com>

arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" =
DSI

This commit adds a device tree overlay for the Toradex Capacitive Touch
Display 10.1" on the Verdin DSI_1 interface. It configures the SN65DSI83
bridge, Riverdi LCD panel, and Ilitek ILI2132 touch controller, while
providing combined DTBs in the Makefile.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitiv=
e-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-displa=
y-adapter/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inc=
h-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-=
dsi.dtso
> new file mode 100644
> index 0000000000000..ed66feec94624
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.d=
tso

[ ... ]

> +	touchscreen@41 {
> +		compatible =3D "ilitek,ili2132";
> +		reg =3D <0x41>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
> +		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <49 IRQ_TYPE_EDGE_RISING>;

[Severity: Medium]
The comment indicates the interrupt pin is TOUCH_INT#, which typically deno=
tes
an active-low signal.

Is IRQ_TYPE_EDGE_RISING the correct trigger here?

Triggering on a rising edge for an active-low signal means the interrupt wi=
ll
fire only upon de-assertion. If the touch controller holds the line low unt=
il
the event is read via I2C, waiting for a rising edge could delay or prevent
the touch input event from being processed. Should this be configured as
IRQ_TYPE_EDGE_FALLING instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522161105.2775=
19-13-ivitro@gmail.com?part=3D5
