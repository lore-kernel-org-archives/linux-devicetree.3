Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53E402444
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408579; cv=none; b=pFSenMKIJdnGhw258Db1K+h2zTbnNVid0FRq9e+p+A6PPAIuEMgiD7xD8ibCuqMtPWlPInP5/LPG9pm3+JRXHsaZWcGPd+yWx8e21bo2Ffn6ntb2Phf5iqGJlRZ5iOdeWoGg29H3pBIFFF20FWmCB/Ni3g/0Aa9YrwP/B98t3O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408579; c=relaxed/simple;
	bh=s/EaBjuTXhwcJt4L4udwmondIxAq4qkunZGdJ649I58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uop5WhB1dyCmyNuzeb2H9Yngd58Ug6op3woctxieD8wNER1sKIXQKM101xyBwXDy2DWSjucOVyEgPN/UIMdgUMecfoA3CLCTaTFi4Bf2Q1TatYrt5/Og8v/vuaZrLzVkUCztLG7rEVzCzN7RCzKiCHsf2lzN71iZFUrvn/FAlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBohSHw5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBohSHw5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AE31F000E9;
	Thu, 30 Jul 2026 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785408578;
	bh=Zs8TKF1W7Z8Vhgoa6saVEXri5T8KEk8eXGcXhBRkPp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kBohSHw5PO6ZhPDM/V1WCy5vRA9PWOoNBr/q3Oy+f/auUon4nmahU3VG7r7R135Pt
	 nR+I7ucz92XNaI6xKmY0IBkG7nJCRQMuWrB0qCi+Ia02YRGefZwmnLvvzgeS1jlggq
	 1jcaxN0dswJbdZTVPEAyGTIDxMz5EbutNW7CgKUiGMm/uDoloo6nsk5KypEQHnfcxa
	 SJuQnw4+Il0CyOrE4hM8U4Y7nfRZId27IESLbCxIqF55k1jsJC0xuaS7l9Wut5SeW/
	 myc7/AxnuiX/Nb6HKWbMAkg6KujNfL5kazI5HIsQj6CHLg4gbLFumalBDHgdlU1Kgt
	 vKmLnE/xPSkHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-rzg2-sr-boards-v4-5-08bc459578dc@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
 <20260730-rzg2-sr-boards-v4-5-08bc459578dc@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:49:37 +0000
Message-Id: <20260730104937.A4AE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The SDHI0 mux logical state mapping and GPIO polarity are inverted=
 relative to the shared device tree overlays, breaking both eMMC and microS=
D routing.
--

--- Patch [5]: [PATCH v4 5/5] arm64: dts: renesas: add support for solidrun=
 rzg2lc som and hb-iiot evb ---
commit 5989cde52b0b479fb2863119947d3305e7ea28ea
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb

Add support for the SolidRun RZ/G2LC SoM on Hummingboard IIoT.

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index 5242eff76ef54..79c06db9ab138 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -165,6 +165,15 @@ dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc=
-du-adv7513.dtb
>  r9a07g043u11-smarc-pmod-dtbs :=3D r9a07g043u11-smarc.dtb r9a07g043-smarc=
-pmod.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a07g043u11-smarc-pmod.dtb
> =20
> +dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044c2-hummingboard-iiot.dtb
> +r9a07g044c2-hummingboard-iiot-emmc-dtbs :=3D r9a07g044c2-hummingboard-ii=
ot.dtb rzg2l-sr-som-emmc.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G044) +=3D r9a07g044c2-hummingboard-iiot-emmc.dtb
> +r9a07g044c2-hummingboard-iiot-microsd-dtbs :=3D r9a07g044c2-hummingboard=
-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo

[ ... ]

> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/=
boot/dts/renesas/rzg2lc-sr-som.dtsi
> new file mode 100644
> index 0000000000000..59635ac842d36
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
> @@ -0,0 +1,374 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2LC Solidrun SOM
> + *
> + * Copyright 2023 SolidRun Ltd.
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */

[ ... ]

> +	sdhi0_mux: mux-controller-0 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		/*
> +		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
> +		 * on-SoM eMMC and board-to-board connector using one gpio:
> +		 * 0 =3D connector, 1 =3D eMMC.
> +		 */
> +		mux-gpios =3D <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;

[Severity: High]
Does this inverted mux logical state mapping break the eMMC and microSD rou=
ting?

The Makefile applies shared overlays (rzg2l-sr-som-emmc.dtbo and
rzg2l-hummingboard-iiot-microsd.dtbo) to this base DT.

The shared eMMC overlay hardcodes mux-states =3D <&sdhi0_mux 0>, and the
microSD overlay hardcodes mux-states =3D <&sdhi0_mux 1>.

Since this file defines the mux with GPIO_ACTIVE_HIGH and a logical mapping
of 0 =3D connector, 1 =3D eMMC (which is inverted from the G2L base DT that=
 uses
GPIO_ACTIVE_LOW and 0 =3D eMMC, 1 =3D connector), the shared overlays will =
request
the wrong logical states.

Will this cause the eMMC overlay to incorrectly route SDHI0 to the connecto=
r,
and the microSD overlay to incorrectly route it to the eMMC?

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-rzg2-sr-bo=
ards-v4-0-08bc459578dc@solid-run.com?part=3D5
