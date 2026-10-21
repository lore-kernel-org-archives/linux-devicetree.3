Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612007;
	b=MYMSQqEC5pe7VQ8+Hm5QLjWcP7IF3+f9U+gAWk6mjzJhiRszsctihfDsFtZl29KCrdWx
	 +3F9mNlcg1NSOZzVz6LqCIIhSbnLuGFDwGJhRASy28iKv9XIsUd97c10DwF+9LOkp6EF6
	 M+t+rQh2qknzQRV49EcnhhK5y2Qb1qsy3GA+l+jucqp24wwk+g1wdfC8bBq0isSfLvY10
	 xiipS/j/8Aw9rdBLAlqGkuQBfkhrDbTojxIvF8reS/sU7uCRxXz5UHdOUN9UjXmwjPs7v
	 rh7cH76ImVzdMwz/kfD1FWySrL35G99QwAuFjDb72AtgqhlPbmhGeGuLLkAca2XByXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612007;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ov4FasaxfoGYlTAYQZQ6wPy50m4JyMZky1AxK9uxQAk=;
	b=aTjrINeZEnXTxBRyhBV3pqygnnEdiwABo174kOmlnypoZhBA0ZPyv9ikYMod3FMXmXr1
	 RSla2o9K3Kr69Q3ZSyTlwMy4x0XPmSBia56tUA3n0Em1Jov9i4gsL6pHr8nFJxR9l1Eqr
	 VMPpXjQ/4OLjXeht9atXP2ghBtx/1+HhDw7wS0BB/PEc42EPxHoWvTvWfMTAJEqI5iqYh
	 XjnOx3Y9f8D221byLqUu0RvT4cNNTMw2gxkO17W/GYs76aqVJJNeFoZdoPHJ3UaU54++Q
	 dXZy8d0j75OVjytXlxAAGvds0CRhqLsPRBCAxPEculVC5NC1/Xxhls6Hs/ZX/L0xx1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kNPJ+wro;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD24606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kNPJ+wro
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13881F000C1;
	Wed, 21 Oct 2026 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612007;
	bh=Ov4FasaxfoGYlTAYQZQ6wPy50m4JyMZky1AxK9uxQAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kNPJ+wrovqjFm6hPh+U4KIcgKaue5GNtYuRk0mu71MWnuE4r1XPnMyoA9ojlVXO1I
	 XwhZQR9eeiSAzHQfS9m3Eov+XQ7+WRn5y8+r/V7ZhZ3UN4wkmoM1vNJ9H7xY/k6neS
	 9c1seLdHHBlVs2xq5L4HFXgv+lRpPSSBfPBaiLd4GzymJDA4Yz6rbX8NTF9e3C0fWv
	 gf8PTWU6vTRGdwJ9f8AU7E25ZTDrW/2W6pA2FUOvLbcawi4+ezjCaL0sjcG1ERo00J
	 OBCUeWGBR4smueE1YCdTAQA2GjiQaN5CaAqn+QG6d8w18s/Kp+mmhdJEAwoVb87qJG
	 G9slJKTO0dpfg==
Message-ID: <sashiko-outbox-180598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed: add Intel AVCRP BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Glazik" <dawid.glazik@linux.intel.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <d9c937882d8c9dd9ad13ae6d22bbf2cec7c37a7a.1792613583.git.dawid.glazik@linux.intel.com>
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
 <d9c937882d8c9dd9ad13ae6d22bbf2cec7c37a7a.1792613583.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 19:46:46 +0000
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
- [Medium] ARM: dts: aspeed: avcrp: pinmux conflicts on uart3, uart4, and g=
pio0
--

commit 01d3c06dda0485c95a5f1bf0fb7cf7492e56bdd4
Author: Dawid Glazik <dawid.glazik@linux.intel.com>

ARM: dts: aspeed: add Intel AVCRP BMC

This commit adds the initial device tree for the Intel AVCRP BMC platform
based on the Aspeed AST2600 SoC.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 0000000000000..010ace09d90ff
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,322 @@

[ ... ]

> +&gpio0 {
> +	gpio-line-names =3D
> +		/*A0-A7*/ "", "", "", "", "SMB_CPU_PIROM_SCL", "SMB_CPU_PIROM_SDA",
> +				"SMB_IPMB_STBY_LVC3_SCL", "SMB_IPMB_STBY_LVC3_SDA",
> +		/*B0-B7*/ "", "", "", "FM_CPU1_ERR2_LVT3_N", "", "",
> +				"FM_BMC_BMCINIT_R", "FP_ID_LED_N",

[ ... ]

> +		/*L0-L7*/ "", "", "", "", "PREQ_N", "TCK_MUX_SEL", "", "",
> +		/*M0-M7*/ "", "", "", "", "", "", "SPA_SOUT", "SPA_SIN",

[ ... ]

> +};

[ ... ]

> +&uart1 {
> +	status =3D "okay";
> +};
> +
> +&uart3 {
> +	status =3D "okay";
> +};
> +
> +&uart4 {
> +	status =3D "okay";
> +};

[Severity: Medium]
Should &uart3 and &uart4 override pinctrl-0 =3D <>; here, and should the
pinctrl-claimed pins in &gpio0 be cleared from gpio-line-names?

In arch/arm/boot/dts/aspeed/aspeed-g6.dtsi, uart3 and uart4 default to
pinctrl_txd3_default / pinctrl_rxd3_default (pins L4 and L5) and
pinctrl_txd4_default / pinctrl_rxd4_default (pins B6 and B7). In &gpio0
above, those pins are named as board lines PREQ_N, TCK_MUX_SEL,
FM_BMC_BMCINIT_R, and FP_ID_LED_N.

Because aspeed_g6_pinmux_ops in drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
sets .strict =3D true, probing &uart3 and &uart4 claims exclusive mux
ownership of L4-L5 and B6-B7 via pin_request() in drivers/pinctrl/pinmux.c.
This muxes those balls to TXD3/RXD3 and TXD4/RXD4 and causes any subsequent
request for those lines via aspeed_gpio_request() -> pinctrl_gpio_request()
to fail with -EINVAL.

Also, in &gpio0, pins A4-A7 (SMB_CPU_PIROM_SCL, SMB_CPU_PIROM_SDA,
SMB_IPMB_STBY_LVC3_SCL, SMB_IPMB_STBY_LVC3_SDA) and M6-M7 (SPA_SOUT,
SPA_SIN) still have gpio-line-names entries even though they are claimed by
&i2c12 (pinctrl_i2c13_default), &i2c13 (pinctrl_i2c14_default), and &uart1
(pinctrl_txd1_default / pinctrl_rxd1_default).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792613583.gi=
t.dawid.glazik@linux.intel.com?part=3D2
