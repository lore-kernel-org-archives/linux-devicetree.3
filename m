Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DAF222599
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129387; cv=none; b=gXGxR6P70pmilBIc9KoiFtc0e2RHyLtH+cyeMuT/JVRApPuZz3gkfxymCb8IViebENJIR3221eQm1cWAxpR2V01jsI4AQFO+LglgT+HUHn1UZrNkTaho0Ne5ItJy+BxoBUiCuzrW8AjLPfGt8uvWCVeWFEoYfZln9mhJxAv50u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129387; c=relaxed/simple;
	bh=mwmnYZ+xJFGL9zmF+Q/qkN7QlaYcYkfNKq6JQm4Ekrc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B6Y2ZoIhRczzQ+pCE4E+c9ocaOC4H9HTpwfLfG/ZWxvVcucs1+7eKXA0lDljJxGBaOQkkTvJOXp9rjONjbz1fgoeNhD0ej4pLMtZ8EQEh0IXIJj2QWYRt0MH3gaQITWXfxmpgaow0/97jjb4380Du33ABAGXU/kbQolY6OgUuoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmjWW+Qq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmjWW+Qq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5D71F000FF;
	Sun,  4 Oct 2026 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129386;
	bh=StWyMRkyltRcQIDIxnDK+FKwXefWKFn+zhBzTHeVaKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CmjWW+Qqxv/J5lTNoU6ZHBri7ptsDJ3iwROoY6Z536VroTa/G0GXUkwVNaL4e0PEX
	 Q1OJ5nk/hPrbTE6lRFvuM1H+1gY3mmiOjJffinGEejmKIvXnA0vZKAYHh7JaiAXRaF
	 lCnfrnnM8mbcifmJ/9u/WiQl7OaSHpfwx/UCJdNoUc3fyVpt5CUBoSRjLHBjOX89Av
	 odt4u9sN+C36xgN3OO8IBFY/y3KLqhANxC2WwyaDTKL0lNXhXRLA+Kp5MQyoDY1DLr
	 zWkwkJyUZPMjSx0py69nN1mYIOLfsu/9xNSsZDwS7Gvl7/ZGkzKf+kjVPtEWSOEWbf
	 OUuGSKgiPx4fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] ARM: tegra: lg-x3: Add flash LEDs controller
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261004154456.145362-6-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
 <20261004154456.145362-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 15:56:25 +0000
Message-Id: <20261004155625.DA5D71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: inaccurate modeling of single physical flash LED as=
 two nodes
--

commit a769a0c3851e51b75e86359c4dd2c87f24520282
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: lg-x3: Add flash LEDs controller node

This commit adds a device tree node for the TI LM3559 LED controller used f=
or
the flash LEDs in the LG X3 device. It also hooks up the new LED nodes to
the rear camera flash properties.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index 4cd2bbc94f9d7..99afd5d634e2b 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> @@ -1233,6 +1233,7 @@ rear-camera@10 {
>  			rotation =3D <90>;
> =20
>  			nvmem =3D <&m24c08>;
> +			flash-leds =3D <&lm3559_led0>, <&lm3559_led1>;

[Severity: Medium]
Does linking two separate flash nodes here force user-space applications to
coordinate both to achieve the intended brightness?

The V4L2 framework will expose two separate flash subdevices for a single
physical LED. Any user-space app using the camera flash will encounter this
quirk.

>  			lens-focus =3D <&dw9714>;
> =20
>  			assigned-clocks =3D <&tegra_car TEGRA30_CLK_VI_SENSOR>,

[ ... ]

> @@ -1267,6 +1268,35 @@ m24c08: eeprom@50 {
>  			vcc-supply =3D <&vio_1v8_rear>;
>  		};
> =20
> +		led-controller@53 {
> +			compatible =3D "ti,lm3559";
> +			reg =3D <0x53>;
> +
> +			enable-gpios =3D <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
> +			vin-supply =3D <&vdd_3v3_vbat>;
> +
> +			flash-max-timeout-us =3D <1024000>;
> +			ti,peak-current-microamp =3D <1400000>;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			/* single flash led is on 2 lines */
> +			lm3559_led0: led@0 {
> +				reg =3D <0>;

[Severity: Medium]
Does modeling this as two distinct logical LED nodes inaccurately describe =
the
physical hardware?

The comment explicitly acknowledges the hardware topology is one physical L=
ED
connected to two output lines. Device Tree principles dictate that the DT m=
ust
accurately describe the physical hardware structure.

Should a single physical LED be modeled as a single node with
led-sources =3D <0 1>; instead of two separate nodes? While the lm3560 driv=
er
may currently lack support for led-sources, modeling hardware based on
software driver limitations is generally discouraged.

> +
> +				flash-max-microamp =3D <393750>;
> +				led-max-microamp =3D <140625>;
> +			};
> +
> +			lm3559_led1: led@1 {
> +				reg =3D <1>;
> +
> +				flash-max-microamp =3D <393750>;
> +				led-max-microamp =3D <140625>;
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004154456.1453=
62-1-clamor95@gmail.com?part=3D5
