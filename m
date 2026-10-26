Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012684;
	b=ax2c9O/Hhh5KhtM66s2NJkjRXdyMKqPbnaUPqCkPxHYZ4oqocjG0emPG9lj4PjHcSavB
	 MRCjmzj5fWuwJnx5mb2wlQNIw8mBHA87HBVLZVlccpBsFAdV/zjY/raQ2rx6gKukvHbCj
	 rfQK2utC8jtxBHStXadG/4Lsb0gN34sBIvBx6oEt5QXE7QAYFQdBPMhsKTWMtv+gR7xYQ
	 8G86x2Kq60MnX1jFrxJVd7GY0Sotym/VL7CdA8nDTmYsUTtPSYAwqyTQR7s63to9Nuzud
	 LlpQGQFwLLsb3JKe+O+XC/6yIKS3YuJpowBvAxnhKCKsnhE2i7eBXwctPVSoMIrx5bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012684;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yOytjuxm2VPI6ZmRWHuHj5ozVw7qYmrrwuWxtBI4JfM=;
	b=UMpUNViRVLFqsCALHJ/ODIeksOuKkuEuh2+U5h59CeeNuQQdV3vYshpVmepL/PrXz+gp
	 rrYDr2+2CFy96Z9JP2M5hArhQgNC1hEqDHoogqwv+emutTjTnALGkIqoOFTaNDe9JTylC
	 oq8Rq36hBKmuzf3jpxyOO34KFyBX3hEimqQwlfhPoWbVjBo06U9ovs8zSydTSRMBrCJvL
	 lhpAHWBdLJt9Eef4MSvypfxSDv9K+udGy9jrnIMczP1MmEW4CNsWFXJRt+Njy+B+7xJPq
	 JS7nUfIt/DXh8ItkjMbAXJoxgW2xjOY2nlUdIQEldiVV2tJZ0SpAqxWXrrmSx/6auCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3C7zhPx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F154C606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3C7zhPx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5269F1F01825;
	Mon, 26 Oct 2026 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012683;
	bh=yOytjuxm2VPI6ZmRWHuHj5ozVw7qYmrrwuWxtBI4JfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3C7zhPx4sAHjJuPJYewlSEhXLWdg632eqAP4AZdMsLaWBXiqnCbznRAEpORFdSBE
	 vdklt96trB5dDEuKaoOPTaYCMiDcoRNoE/8chg4+bluOw6IqRdEAvqXUO0is7mwBN4
	 NaG6ytj26dvk8bsVy1KsL1mL0oeWYhQf5pIbfh8hEJpnWwqLZ5CERHjvIgv6I6k7TM
	 f39KLPlePLsWYiJlrFkTbYlLujVJlnQgNfrZ0ErigrAN72F1p0h+s4P8yskljZeRw7
	 WEkbEOqarBHIhScDMF7cEbImImi8i2NEaQfIUTnkB9dTpmMA1tqAUtYjjZfU9f5aSp
	 3vERxR13yOX4g==
Message-ID: <sashiko-outbox-185048@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026102658.968138-1-m.szyprowski@samsung.com>
References: <CGME20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0@eucas1p1.samsung.com>
 <20261026102658.968138-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:04:42 +0000
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
- [Medium] arm64: dts: exynos: undocumented wlf,reset-gpios and wlf,ldoena-=
gpios in tm2
--

commit d7eced1233f0545ac05280c98b1abea17e17ed8c
Author: Marek Szyprowski <m.szyprowski@samsung.com>

arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO properties

This commit renames the wlf,reset and wlf,ldoena properties in the wm5110
audio-codec node of exynos5433-tm2-common.dtsi to wlf,reset-gpios and
wlf,ldoena-gpios.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch=
/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 0ad02a098765d..44e03e38c2c43 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -1346,8 +1346,8 @@ wm5110: audio-codec@0 {
>  		wlf,gpsw =3D <0x1>;
>  		wlf,inmode =3D <2 0 2 0>;
> =20
> -		wlf,reset =3D <&gpc0 7 GPIO_ACTIVE_HIGH>;
> -		wlf,ldoena =3D <&gpf0 0 GPIO_ACTIVE_HIGH>;
> +		wlf,reset-gpios =3D <&gpc0 7 GPIO_ACTIVE_HIGH>;
> +		wlf,ldoena-gpios =3D <&gpf0 0 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Does renaming these properties to wlf,reset-gpios and wlf,ldoena-gpios cause
a dtbs_check schema validation regression for exynos5433-tm2.dtb and
exynos5433-tm2e.dtb?

The wm5110 node (compatible =3D "wlf,wm5110") is validated against
Documentation/devicetree/bindings/mfd/wlf,arizona.yaml, which references
Documentation/devicetree/bindings/regulator/wlf,arizona.yaml and sets
unevaluatedProperties: false.

In Documentation/devicetree/bindings/mfd/wlf,arizona.yaml, the standard
reset property is reset-gpios (without the vendor prefix), while wlf,reset
is marked deprecated:

  reset-gpios:
    maxItems: 1

  wlf,reset:
    description:
      GPIO specifier for the GPIO controlling RESET
    deprecated: true
    $ref: /schemas/types.yaml#/definitions/phandle-array
    maxItems: 1

Similarly, Documentation/devicetree/bindings/regulator/wlf,arizona.yaml only
defines wlf,ldoena:

  wlf,ldoena:
    description:
      GPIO specifier for the GPIO controlling LDOENA.
    $ref: /schemas/types.yaml#/definitions/phandle-array
    maxItems: 1

Neither schema defines wlf,reset-gpios or wlf,ldoena-gpios. In
drivers/mfd/arizona-core.c, arizona_dev_init() requests "reset" for the
standard reset-gpios binding:

	if (!arizona->pdata.reset) {
		/* Start out with /RESET low to put the chip into reset */
		arizona->pdata.reset =3D devm_gpiod_get(arizona->dev, "reset",
						      GPIOD_OUT_LOW);

while arizona_of_get_core_pdata() only requests "wlf,reset" as a fallback f=
or
the old non-standard wlf,reset property via of_find_gpio_rename() in
drivers/gpio/gpiolib-of.c.

Also, can the Kconfig mismatch described in the commit message actually
occur? In drivers/gpio/gpiolib-of.c, of_find_gpio_rename() guards the
"wlf,reset" and "wlf,ldoena" rename entries with:

#if IS_ENABLED(CONFIG_MFD_ARIZONA)
		{ "wlf,reset",	NULL,		NULL },
#endif

and:

#if IS_ENABLED(CONFIG_REGULATOR_ARIZONA_LDO1)
		{ "wlf,ldoena",	NULL,		NULL },
#endif

The consumers in drivers/mfd/arizona-core.c and
drivers/regulator/arizona-ldo1.c are built under the exact same Kconfig
options in drivers/mfd/Makefile and drivers/regulator/Makefile:

obj-$(CONFIG_MFD_ARIZONA)	+=3D arizona.o
obj-$(CONFIG_REGULATOR_ARIZONA_LDO1) +=3D arizona-ldo1.o

When CONFIG_MFD_ARIZONA or CONFIG_REGULATOR_ARIZONA_LDO1 is disabled, the
corresponding driver is not built at all, and when enabled (either built-in
or as a module), IS_ENABLED() evaluates to true in gpiolib-of.c.

Should wlf,reset instead be replaced with the documented reset-gpios proper=
ty
 while keeping wlf,ldoena matching the binding schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026102658.9681=
38-1-m.szyprowski@samsung.com?part=3D1
