Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C0043CE65
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740479; cv=none; b=HV/LC2fwf6Ga1O5VRpZaVu2Rf6Ci63IwCjKEEy9hygnXRDAQFfXrP6Q3EIOgBJdLI7rup8AaEOU9URdaCWtpBL2IQkhr9nct8MFaTjvI3cWl5saDk/i1koMuOohaZAPPU0AE5fI8gIerGapejUijYYhEGE94kvvcv9XwERasQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740479; c=relaxed/simple;
	bh=ChfO/xJzgs3/DNhgRoVJi237DWVzR0jWolvwynwapHA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DNaZfZuyBNQI/GBidbtG5Ya51Po1Eufp8uzFR3N7RWFWnE+IXAEM++3zcfg7lR6EEUWhwmH/RjmgJQSrq/P/l6vTau+I0sFTovx11nh4+CX2/s0X5VqvzYXZH26pK+PPcwVr1bZTeFrYg6D1HI4zaboVDCFMibbadvy03shPo50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdT9B/3Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdT9B/3Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7DC1F000E9;
	Wed, 22 Jul 2026 17:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784740478;
	bh=WZufqS7idykL1sTMUaY9sNjcWLyrXIDyF2GuUSP+1/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KdT9B/3YkmrbeNQ6pp3H4GX6Ekp4TavxHv/B9xNSGbTnIpWvteiepQUFRW2Qr1QNS
	 rW/GHSaPXKUs5Yhi1kEsHpD7Ubfto+4WsYO9AJIG31+jvvb4f5zEH/ewgm5Pm76gGh
	 sVzROoAgVLbJYnpZP1/vZFR6xZAiGGCFF3FNty6m2bUX6nqEnlLEIzTI47imFM8WKE
	 3nsi9i18IqrfGlXTxZQpx/wP0StBHjMDboh3gOMa0H/i4smzN/3E8mAjwnfMggryCi
	 BD5rdg3MEkdofhbPllTg1Fi7yuC+mVvKifiPBhuD+7YvnGsW3uizFDy/5Zc5o/U+ap
	 FQJz65GPJ4YYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 4/4] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722165806.161020-5-macroalpha82@gmail.com>
References: <20260722165806.161020-1-macroalpha82@gmail.com>
 <20260722165806.161020-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 17:14:37 +0000
Message-Id: <20260722171438.0D7DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The SD card slot 1 (&sdmmc) keeps its I/O voltage (VQMMC) active=
 while its core power (VMMC) is turned off during system suspend.
- [Medium] The DisplayPort alt-mode Vendor Defined Object (VDO) is configur=
ed with an invalid value of 0xffffffff.
--

--- Patch [4]: [PATCH V9 4/4] arm64: dts: rockchip: Add Anbernic RG Vita-Pr=
o ---
commit 9b7e292cd22ab667469b2d0609662deb58a25790
Author: Chris Morgan <macromorgan@hotmail.com>

arm64: dts: rockchip: Add Anbernic RG Vita-Pro

Add device tree for the Anbernic RG Vita-Pro, based on the Rockchip
RK3576. All hardware is currently working except for the accelerometer,
the touchscreen, the battery monitor, and DisplayPort over USB-C. PWM
is also missing currently, and as a result the LEDs and panel backlight
are currently controlled via GPIO but will be changed to PWM once
supported.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> new file mode 100644
> index 0000000000000..344ba18705338
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts

[ ... ]

> +	vcc3v3_sd_s0: regulator-vcc3v3-sd-s0 {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpio =3D <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&vcc_3v3_sd_s0_h>;
> +		pinctrl-names =3D "default";
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-name =3D "vcc3v3_sd_s0";
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};

[ ... ]

> +			vccio_sd_s0: pldo-reg5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-name =3D "vccio_sd_s0";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};

[Severity: Medium]
Will this configuration cause the SD card's internal I/O clamping diodes to
be forward-biased during system suspend?

Since vccio_sd_s0 (used as vqmmc-supply for the sdmmc node) remains active
with regulator-on-in-suspend, but vcc3v3_sd_s0 (used as vmmc-supply) is
powered off with regulator-off-in-suspend, this can back-power the SD card.

Over time this could lead to excess battery drain and hardware degradation
for both the SD card and the SoC's SD controller.

[ ... ]

> +			altmodes {
> +				displayport {
> +					svid =3D /bits/ 16 <0xff01>;
> +					vdo =3D <0xffffffff>;
> +				};
> +			};

[Severity: Medium]
Is 0xffffffff the intended Vendor Defined Object (VDO) value for the
DisplayPort alt-mode in husb311?

This value asserts undefined reserved bits and advertises mutually exclusive
capabilities (such as being both a DP plug and a receptacle simultaneously).
This violates the DisplayPort Alt Mode specification and could break
negotiation with compliant Type-C partners.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722165806.1610=
20-1-macroalpha82@gmail.com?part=3D4
