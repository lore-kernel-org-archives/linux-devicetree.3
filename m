Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B442EEC7
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457655; cv=none; b=m9pbAuSlpvJAnYJf1mmUzkTY85sZ19nbrfmHOhdSp+sPB3dkdGdiNxMxhVXBo4zffMp62vXbJKpgs9mV67+OT78DGM+D8jzFWKjQ0s84QOXBmFqmgCCGpDjpjrVgSOdjqFj/L9J2yxs+Sn1H/HT9QCKrkg5RSqDf3SmM31ptq3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457655; c=relaxed/simple;
	bh=IZ7t0+fQ+uc06sWFfUrwfIe0RU4SHRfoTk1iOfzJ3Pw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A3hzD4aK6gnlussn9O68tMEPDT19ZgPZDyndn2RjLSVzKbhUh36tJTAinvpSZNICw1kuELuByoCxWn8if/1OHc/kt6WhUCgvINWMHOaG14ez15gzUdkqjnfdsqYwuLlCCiqMW1ba7fZp999ohUonNfOvpDCfR2MT5Xt2tTa7B0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksVhl1bz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksVhl1bz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917A01F000E9;
	Fri, 22 May 2026 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457649;
	bh=wnalCbYFhzXy7OmhnHWU2esKIm8Md1TNR1/a0h/UnDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ksVhl1bzd+nXd7QipXv6ftDd/1I/iqvnRyI5gjnZSpG8jBnkKD6653WSWOOrpYLSx
	 HwVqDV5jvdu9MjiP48BY5ze3WFAI5uvQUlPp4ZuN2tp5RaM2PN3Uz8TWcNeiCR71rv
	 Py59YhckWyJU30CIeXga6jPT+wPdXGIJGePme4cu0H9PbEC+Bg+IVrboB2NAgdjuZr
	 T+NN6qSpgg/wBpaWvalJm4CADhTV4zm2TdRbLqpwyHDRqy/ji9onxM5qNrXJ47Mmdi
	 H/1X9IqHNCQteCZTtTlRwluAq5ai7707ksD6m63HuQLyw2uk54aTQCfhHaa2QnsMbt
	 SLqT8nxbKnyvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:47:29 +0000
Message-Id: <20260522134729.917A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The Goodix GT911 touchscreen node specifies `reset-gpios` but omit=
s the required `irq-gpios` property, silently disabling the driver's hardwa=
re reset and power management logic.
- [High] The device tree relies on hardware components (SGM3804 regulator a=
nd SY7758 backlight) that currently have no supporting driver or device tre=
e binding in the kernel.
- [Medium] The `mdp_vsync_active` and `mdp_vsync_suspend` pinctrl states ar=
e defined but never referenced in the display or MDSS nodes, preventing the=
 hardware VSYNC signal from being routed.
- [Low] The backlight node is named `sy7758@2e` instead of a generic name l=
ike `backlight@2e`.
--

commit a7774645b5e43100828950906f34539f8e7aadef
Author: KancyJoe <kancy2333@outlook.com>

arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display nodes

This commit adds device tree nodes for the dual DSI panel, the SGM3804
regulator, and the SY7758 backlight controller. It also enables the GPU
and the touch controller to provide full display support.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/=
arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d9..af890e76813b7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
[ ... ]
> @@ -1016,6 +1040,30 @@ wcd_usbss_sbu_mux: endpoint {
>  	};
>  };
> =20
> +&i2c4 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	touchscreen@5d {
> +		compatible =3D "goodix,gt911";
> +		reg =3D <0x5d>;
> +
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <162 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios =3D <&tlmm 161 GPIO_ACTIVE_HIGH>;

[Severity: High]
Is the irq-gpios property missing from this node?

The Goodix driver requires retrieving the interrupt GPIO via the irq-gpios
property to execute its hardware reset sequence, as the INT pin state
determines the I2C address.

When irq-gpios is omitted, the driver's irq_pin_access_method falls back
to IRQ_PIN_ACCESS_NONE. This completely bypasses the goodix_reset()
function during probe.

Additionally, goodix_suspend() and goodix_resume() will return early without
issuing the deep sleep command, which can cause power drain during system
suspend.

> +		VDDIO-supply =3D <&vreg_l14b_3p2>;
> +		AVDD28-supply =3D <&vreg_l14b_3p2>;
> +
> +		touchscreen-size-x =3D <1440>;
> +		touchscreen-size-y =3D <2560>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&ts_reset_default>, <&ts_irq_default>;
> +	};
> +};
> +
[ ... ]
> @@ -1053,6 +1101,49 @@ redriver_ss_in: endpoint {
>  	};
>  };
> =20
> +&i2c9 {
> +	status =3D "okay";
> +
> +	/* Screen power */
> +	regulator@3e {
> +		compatible =3D "sgmicro,sgm3804";

[Severity: High]
Do these components currently have supporting drivers and device tree bindi=
ngs
upstream?

Because there are no existing drivers for sgmicro,sgm3804 or silergy,sy7758
in the kernel, they will not probe.

When the panel driver attempts to acquire its essential supplies (vsp-suppl=
y,
vsn-supply, and backlight), it will hit a permanent -EPROBE_DEFER, preventi=
ng
the entire display subsystem from initializing.

> +		reg =3D <0x3e>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sgm3804_default>;
> +
> +		vin-supply =3D <&vph_pwr>;
> +
[ ... ]
> +	/* Backlight */
> +	sy7758_backlight: sy7758@2e {

[Severity: Low]
Could this node be named using a generic class like backlight@2e?

The Devicetree Specification recommends using generic node names that refle=
ct
the function of the device rather than the specific model or IC name.
Non-generic names can trigger validation errors during dt_binding_check.

> +		compatible =3D "silergy,sy7758";
> +		reg =3D <0x2e>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sy7758_default>;
> +
> +		vddio-supply =3D <&sy7758_vdd33_reg>;
> +		enable-gpios =3D <&tlmm 164 GPIO_ACTIVE_HIGH>;
> +	};
> +};
[ ... ]
> @@ -1411,6 +1603,20 @@ fan_int: fan-int-state {
>  		bias-pull-up;
>  	};
> =20
> +	mdp_vsync_active: mdp-vsync-active-state {
> +		pins =3D "gpio86";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync_suspend: mdp-vsync-suspend-state {
> +		pins =3D "gpio86";
> +		function =3D "mdp_vsync";
> +		drive-strength =3D <2>;
> +		bias-pull-down;
> +	};
> +

[Severity: Medium]
Are these mdp_vsync pinctrl states supposed to be referenced in the panel or
MDSS nodes?

They appear to be defined here but are never assigned to the pinctrl-0 or
pinctrl-1 properties of the display components. Command-mode panels typical=
ly
rely on this Tearing Effect (TE) signal to synchronize frame updates.

Without routing the signal, the display controller may fall back to software
synchronization or timeout waiting for TE interrupts, which can result in
frame drops or tearing.

>  	upd720201_avdd33: upd720201-avdd33-state {
>  		pins =3D "gpio123";
>  		function =3D "gpio";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-topic-sm86=
50-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org?part=3D1
