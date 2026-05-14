Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB03C1F5A
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759778; cv=none; b=eygZ65GB1neLC1NyiaeLiCxUUn92PnDwI8HCS2IBp3zgY6DX9QHWF3/2isTlRD+x83bB0EzT+5rpoOwxr93f4JRZ5e5yA5S/yOsVcm++D+5Vn1qPee1ND1j5BCx7lCxjFUihKy41BupCMGJF/Zv/nueFxjcp8NYBv5ARhwdAOJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759778; c=relaxed/simple;
	bh=J2rs8MEnKNieMKjIyet36OQfJ3qrKMeQkz3DkZJEdX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CawsodYCy37TepyRPgslSnf/m2xH7ddpflMnzul8CogLLdMHHbnFwVoDnrZdVtU5Oh5aRsqegPZ764kNKcXt0UlGfQxf85OPICe9LDowM6Yic0EfW07DLpfxerT3nN1ZIm1CXpMIG2O/MRWwNJre0U4AEIei3UrfZtMPwnplsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7W5jpZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7W5jpZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB337C2BCB3;
	Thu, 14 May 2026 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759778;
	bh=J2rs8MEnKNieMKjIyet36OQfJ3qrKMeQkz3DkZJEdX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=u7W5jpZieIoQ6n1azA+inoBtniXPk2+mkMssT2HNvSvE71t475RJmbhmvFjszc+2k
	 fqQosOUIFmZZP+GTBFQSxqbMsI1t7umPuESaw0jFBzDbYn3fzVwSXvk4wfHR+8Be6b
	 doQWUzBexiFKfC5pLSOSh4SoLj5nUT4THRR3YHpGxrw/+CnFG88S/5ZRyn8ad7k+sR
	 wCqNVtqkPsE8FT4q17cdCzco1mqRi9EPVrKLN/QLlHrUNYsEG2pQI61nDJc05JqVNZ
	 mIxaHKadBzQdgo2s7N/NXaS4XK73m7uCsI9ltTgi8+G8keyI1ymFZ/eJ1oLDQMAkcI
	 aNIlrmORGOcUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/16] arm64: dts: ti: beagley-ai: Enable HDMI
 display and audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-beagley-ai-display-v2-16-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-16-9e9bcefde6bc@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:56:17 +0000
Message-Id: <20260514115617.BB337C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] DSS1-VP1 is used for HDMI but its clock is incorrectly parented to=
 the DSI PLL instead of the HDMI PLL.
- [Low] The audio data output pin (MCASP1_AXR0) is incorrectly configured a=
s an input pad.
- [Low] The `main_gpio0_ioexp_intr_pins_default` pinctrl node is defined bu=
t never referenced.
--

commit 1eb95c0c9f0fb3307ec8c94675cccb93d5f763f4
Author: Andrew Davis <afd@ti.com>

arm64: dts: ti: beagley-ai: Enable HDMI display and audio

This commit enables HDMI support for the BeagleY-AI platform. It configures
the TIDSS display controller and IT66122 HDMI bridge, along with the requir=
ed
pinmux, clocks, and audio endpoints.

> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/=
boot/dts/ti/k3-am67a-beagley-ai.dts
> index 5255e04b9ac76..b7bcc90005d70 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts

[ ... ]

> @@ -185,6 +213,20 @@ J722S_IOPAD(0x0240, PIN_INPUT, 7) /* (B24) MMC1_SDCD=
.GPIO1_48 */
>  		bootph-all;
>  	};
> =20
> +	main_i2c1_pins_default: main-i2c1-default-pins {
> +		pinctrl-single,pins =3D <
> +			J722S_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C24) I2C1_SCL */
> +			J722S_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (A22) I2C1_SDA */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_gpio0_ioexp_intr_pins_default: main-gpio0-ioexp-intr-default-pins {
> +		pinctrl-single,pins =3D <
> +			J722S_IOPAD(0x0110, PIN_INPUT, 7) /* (G27) MMC2_DAT1.GPIO0_67 */
> +		>;
> +	};

This pinctrl group is defined but doesn't seem to be referenced by any node=
's
pinctrl-0 property in this file. Was the corresponding I2C IO expander devi=
ce
node left out of this patch?

[ ... ]

> @@ -227,6 +269,47 @@ vdd_3v3_sd_pins_default: vdd-3v3-sd-default-pins {
>  			J722S_IOPAD(0x0254, PIN_OUTPUT, 7) /* (E25) USB0_DRVVBUS.GPIO1_50 */
>  		>;
>  	};

[ ... ]

> +	main_mcasp1_pins_default: main-mcasp1-default-pins {
> +		pinctrl-single,pins =3D <
> +			J722S_IOPAD(0x0090, PIN_INPUT, 2) /* (P27) GPMC0_BE0n_CLE.MCASP1_ACLK=
X */
> +			J722S_IOPAD(0x0098, PIN_INPUT, 2) /* (V21) GPMC0_WAIT0.MCASP1_AFSX */
> +			J722S_IOPAD(0x008c, PIN_INPUT, 2) /* (N23) GPMC0_WEn.MCASP1_AXR0 */

Should this be configured with PIN_OUTPUT? The serial-dir property in the
mcasp1 node sets the first serializer (AXR0) as a transmitter.

> +		>;
> +	};
>  };

[ ... ]

> @@ -399,4 +546,54 @@ &sdhci1 {
>  	status =3D "okay";
>  };
> =20
> +&dss1 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&dss1_pins_default>;
> +
> +	clocks =3D <&k3_clks 232 8>,
> +		 <&k3_clks 232 0>,
> +		 <&k3_clks 232 4>;
> +
> +	assigned-clocks =3D <&k3_clks 241 0>, /* DSS1-VP0 */
> +			  <&k3_clks 240 0>, /* DSS1-VP1 */
> +			  <&k3_clks 245 0>; /* DPI Output */
> +
> +	assigned-clock-parents =3D <&k3_clks 241 2>, /* PLL 17 HDMI */
> +				 <&k3_clks 240 1>, /* PLL 18 DSI */

Are these clock parent assignments swapped?

The comments here and in the it66122 node indicate HDMI is serviced
by DSS1-VP1. However, this configuration maps DSS1-VP1 to PLL 18 DSI,
and DSS1-VP0 to PLL 17 HDMI.

Driving the HDMI video port with a PLL tuned for DSI displays might
result in incorrect pixel clock frequencies.

> +				 <&k3_clks 245 2>; /* DSS1-DPI0 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-beagley-ai=
-display-v2-0-9e9bcefde6bc@ideasonboard.com?part=3D16
