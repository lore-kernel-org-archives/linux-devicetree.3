Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ECF36E470
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620714; cv=none; b=jk19tcCp4Sxji1GvFCxYhDtIdJcNKoW60+xxysJiTkpV0qXTNR8T4oxGhuHZiNW1CyIbEWPwyHcRaGpJR0godcgtD85mu50XYCm4j2xubiMdlYQ9NfBoqpsgGE6Q73+3q0eeOH/7IzUrR6J8QaD/cHkKOwncta9jz4dWb/OICAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620714; c=relaxed/simple;
	bh=aDkGa1fHOoX9CWecRRiXkMOqeEGb+j1cjyZUGETQMCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JfvNY5p11mUJuvA/0F4nsjvvYonLhvqBc2Myqi6scz+sgztEz3VfnxLQq0s86Dv9501HZZjXNfgkiMkLfjuG7CgGWtDtx7SM3xrESco/Kf9czoGoCZ2gCy32WQF7Y1GghsVb1/faONHvVwwt0FGP98Aj3C+wlcpo343ynGBu2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIU0DITV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIU0DITV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974DA1F00A3A;
	Tue, 16 Jun 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620712;
	bh=kE6vZIkSlfVVvnbSnfCxpcpg9N3s5fE6t9Jl3TUBOmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oIU0DITVtVNoroAvdvyR2Y2b+2341fazRBhhCrwRy85xCyZNz4k6VJYDe9anN1Uqi
	 SWmIbfDMzdh1Hi6lA7eIQyvxG8tXUujcMUTcQaI7fuMuDyaLTqPEY+xFfA0ZdSD8LM
	 ADenS24n2MBHTQuvnAZ79/k6kFug/nRis3l9Yo/Qp0CDWSGe2Phx8lPQFsACHDYEqS
	 Ddvd+xaVkwp/n1If/dBe2YvYd3ZcFDNTb8G62EdxBN6YLoyrLsPsXoNIy+bwliUF8m
	 I3VzKSrdYc7ubFPQ8XYqwRQTZhPWfYcwCdMB9ggzjR32jvXWGrPjxeyDoGcHbgVzMd
	 439FPPGSpuLcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] ARM: dts: mediatek: mt6323: add AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-mt6323-adc-v3-4-1c27c588185d@protonmail.com>
References: <20260616-mt6323-adc-v3-4-1c27c588185d@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:38:31 +0000
Message-Id: <20260616143832.974DA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional dereference of `dev->parent->parent` can lead to a k=
ernel panic.
- [High] The driver actively powers down the AUXADC clock and disables the =
1.8V voltage reference during initialization.
--

commit 0ad66b352744a9242754a09a7f9af3042d3da009
Author: Roman Vivchar <rva333@protonmail.com>

ARM: dts: mediatek: mt6323: add AUXADC support

Add the devicetree node for the mt6323 AUXADC.

> diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/m=
ediatek/mt6323.dtsi
> index c230c865116d0..c070f4b0936c2 100644
> --- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
> @@ -14,6 +14,11 @@ pmic: mt6323 {
>  		interrupt-controller;
>  		#interrupt-cells =3D <2>;
> =20
> +		mt6323_adc: adc {
> +			compatible =3D "mediatek,mt6323-auxadc";
> +			#io-channel-cells =3D <1>;
> +		};

[Severity: High]
This isn't a bug introduced by this patch, but adding this devicetree node
exposes a pre-existing issue in the mt6323-auxadc driver. Can the driver
panic if it evaluates dev->parent->parent as NULL?

In drivers/iio/adc/mt6323-auxadc.c:mt6323_auxadc_probe():

    regmap =3D dev_get_regmap(dev->parent->parent, NULL);

If the device is instantiated directly without a parent (such as via a
standalone devicetree node or manual sysfs binding), platform_device_add()
sets dev->parent to &platform_bus. Because platform_bus.parent is NULL,
passing NULL to dev_get_regmap() will cause an immediate kernel panic when
devres_find() attempts to acquire the devres_lock spinlock.

[Severity: High]
This is also a pre-existing issue, but does the driver actively power down
the AUXADC clock and disable the 1.8V voltage reference during initializati=
on?

In drivers/iio/adc/mt6323-auxadc.c:mt6323_auxadc_init():

    ret =3D regmap_set_bits(map, MT6323_TOP_CKPDN2, AUXADC_TOP_CKPDN2_CTL_C=
K);

And later in the same function:

    ret =3D regmap_set_bits(map, MT6323_AUXADC_CON27,
                  AUXADC_CON27_VREF18_ENB_MD |
                  AUXADC_CON27_MD_STATUS);

In MediaTek PMIC terminology, CKPDN stands for Clock Power Down (setting the
bit to 1 actively powers down the clock), and ENB stands for Enable Bar
(an active-low enable signal, where setting the bit to 1 disables the
reference voltage). By setting these bits to 1 instead of clearing them to =
0,
the driver appears to disable the hardware it is attempting to initialize,
which could cause subsequent ADC read operations to time out and fail.

>  		mt6323_leds: leds {
>  			compatible =3D "mediatek,mt6323-led";
>  			#address-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-mt6323-adc=
-v3-0-1c27c588185d@protonmail.com?part=3D4
