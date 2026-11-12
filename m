Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510444;
	b=rCVUi2VB5jdAAC4Sty5+E+lEajR/f+BfudKuhAUEjl2NxzYzdxUNUyRGhLnSye9YGXhN
	 uP2lhTqfosd21p30DIgM3NFTqgZsSr+6oAF8f0OLImElXAyQEtLwpqqF5vqbXPbDGrRLZ
	 ICnWrhMhhG9Fwwifmud1Yd0kNuXRw/EiK297c8rEUSHj2FqZWb+XK28bsS8l1cBO23o12
	 q86EK+juoV/lU7njSzrlweFJP9cYasGGgFsj2NosvoUhf0WrkcJzICtNXtCGgPsCnx1s5
	 9kaDXwLF7Z9XacJLDzdCFuv1pkQqLfNUVUnJbVwWPt4BI3tLLdv3Q/9EJrfMqXr4asA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510444;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=12DTxDmr+DYGCXqY93yFnu2IaWZNuzV5e7vbpdhOsYM=;
	b=wv31K4pOn7g8oPXbakn/aNfyBqRMRUKOkZWknpOMwedz1Sf4ecAfoLMOrEEPqiiqmXKp
	 aB/CFDlBPPFGJPNVO8WYlelMmX7X+wfeMNwAKqBHV/DvkgclW1Wt7DIzVOOQLWh3e4BLQ
	 p5gpZ/rhiwHUVBlWczT1GT2P3u1fIDZBij4zQdYnvmqo7nyd6jWgASOkTgd4X6APrxoYI
	 hyT9UtZqBcLlGL0IVl/7YmX/bVxXx39gQDEiG71PjO+7lvNBieDnDWalpYi6edmN5tM0H
	 +KUEjg/QxGY1N5hLHrjwdvTrUANmmaj7aqNrV73zLrSdbAaNLeK/8d3PxT8Vm9KoqHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyJASQ4n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EFD606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyJASQ4n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD341F000C4;
	Thu, 12 Nov 2026 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510444;
	bh=12DTxDmr+DYGCXqY93yFnu2IaWZNuzV5e7vbpdhOsYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NyJASQ4n1vL2/tNVTnEbuzXx+GsaYfgeL5/M2IxyXjHPJJRor5Tez7BEjfStIeciu
	 OGhvE/EvihQ/K8hckLZSYXZSWHR0LUdsOYlhJ8yl8eRMdvUoAbU8X/51mBMiO0/FB+
	 0o5Xe8/zK5D5pSZv6fuiZeYaDVkK0OtHAwE7DrQ2rMay2aGN5pI8oDCg1clhlW7TH3
	 mlxxfCQQ3dQuzvBvGVYXpqqQ47xwYWVzLj7lD6F/0LWhEQ4y+RewdOaJJWi9AcCBgx
	 T+IeHfMtMo2vOBhcAJl1CKMo4HFCs80hZWJiS3cxV+X37fgwOiDdQOMvxAl9nIBg5m
	 2EobxG8TEwbCA==
Message-ID: <sashiko-outbox-211741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable
 SD/eMMC on SDHI0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.au@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:07:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] arm64: dts: renesas: rzg3l-smarc-som: sdhi0 pinctrl fails with
  -EINVAL
- [Low] arm64: dts: renesas: rzg3l-smarc-som uses RZG2L_PORT_PINMUX for
  SD0_CD
--

commit e86cb26292885aecdb37f14368a14d0f62f6aee6
Author: Biju Das <biju.das.jz@bp.renesas.com>

arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0

This commit enables SD card or eMMC support on SDHI0 for the RZ/G3L SMARC
SoM, selected via the SW_SD0_DEV_SEL macro.

> diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3l-smarc-som.dtsi
> index 091a227233cba..f6f4eed9a2ea6 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

[ ... ]

> @@ -216,7 +234,132 @@ i2c0_pins: i2c0 {
>  		pinmux =3D <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
>  			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
>  	};
> +
> +	sd0-pwr-en-hog {
> +		gpio-hog;
> +		gpios =3D <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name =3D "sd0_pwr_en";
> +	};
> +
> +	sdhi0_emmc_pins: sd0-emmc {
> +		sd0-clk {
> +			pins =3D "SD0_CLK";
> +			power-source =3D <1800>;
> +			drive-strength-microamp =3D <9000>;
> +		};

[Severity: High]
Does configuring power-source on the SD0_* pins cause sdhi0 probe to fail
with -EINVAL?

In drivers/pinctrl/renesas/pinctrl-rzg2l.c, the SD0_* entries in
rzg3l_dedicated_pins do not set PIN_CFG_IO_VMC_SD0 or PIN_CFG_SOFT_PS:

drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg3l_dedicated_pins[] {
    ...
	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
	  (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
    ...
}

When sdhi0 binds its pinctrl states (sdhi0_emmc_pins, sdhi0_usd_pins, or
sdhi0_usd_uhs_pins), rzg2l_pinctrl_pinconf_set() -> rzg2l_set_power_source()
-> rzg2l_caps_to_pwr_reg() returns -EINVAL, preventing SDHI0 from probing in
both eMMC and uSD modes.  (Dropping power-source from DT while keeping
drive-strength-microamp would instead leave the cached power_source at 0,
causing rzg2l_ps_to_iolh_idx(0) to return RZG2L_IOLH_IDX_MAX and read past
the end of hwcfg->iolh_groupb_ua[] in rzg2l_ds_is_supported().)

[ ... ]

> +	sdhi0_usd_pins: sd0-usd {
> +		sd0-cd {
> +			pinmux =3D <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
> +		};

[Severity: Low]
This isn't a bug since RZG3L_P5 expands to 5, but sd0-cd in both
sdhi0_usd_pins and sdhi0_usd_uhs_pins uses RZG2L_PORT_PINMUX(5, 0, 8)
instead of RZG3L_PORT_PINMUX(5, 0, 8) like the rest of this file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-sdhi_rzg3l=
-v1-0-ca30b209615d@bp.renesas.com?part=3D2
