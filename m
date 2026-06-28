Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C67D3B47DD
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658538; cv=none; b=TbjgRPp4qcaHfSWrn7iuR8Qox9rTtJcMTN70HzzHVf9M4vxK63dENF04bQl1yD7ZPDApzc3VYG+ZsZ9TszsGYB3CgwTd8HBdrtufVNXSS5TOY4q7GPM1mFVBkZPXrSjucClzztC1FOiyzNilbkNT50SYCanOGakyN+T1/3QbWyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658538; c=relaxed/simple;
	bh=/2f/0IOTXHahflqxNSBkTrjNiUlHTfwMgEDd/0L9jAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=byZSsv1yPNye6YVpBDEsfbxC0MI2pJemu4YFNb3n+B6CK4HrO54bnsQ8OO/qrVhw0M82rV0/AZYb6cEsMV0XvKzndJ2Mnxi46cIr5x4Qfxk63nf+K1HhPL+BUyc5cLxicHbHm+bIBvQGZTOJm0V3rRH5PiJYnRqWhIYXItE0Hbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxzU8zVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxzU8zVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD5E1F000E9;
	Sun, 28 Jun 2026 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658537;
	bh=s/luCMsQj3hWTdX+kJluHsSM9tCIMuF1a7XchLR3ovE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TxzU8zVlOuWZe0LgN7n3bNSfRRxttLnOeV61STxNyLZUXQ+GNGCMzDdArlrQj16Bt
	 i92QesamM6/d+EyhXHdGjYni9kZpEHMBr+/IH801vlcsbeng/+sQyE1OuUI8T2xiHB
	 AYbsyeEz6GVatayq1aPs3tQSCO9EQjoH2tUopTTdAPYR6dooy+xqN5ykS29SIuAx4J
	 Irzlv+ZUNmYov24gebCdO9kozD0XvA9SYOoKNntawm169JTh/IqAYITH3HmMX9FEQ1
	 uNVNTTtp6QWZ6k/wTvRw4NnvtB9kHWQt5N1lpcYsW0nNRncg1wJf3+Q7K5Rr+Z/FSP
	 bzkppo0gGIYgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/17] pinctrl: airoha: add support of an7563 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:55:36 +0000
Message-Id: <20260628145536.EFD5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `hsuart_cts_rts` pin group introduces a pin claiming gap and=
 an order-dependent hardware routing bug that can silently disable UART CTS=
/RTS.
- [Low] The `i2c` and `spi` pin groups are defined and registered but are c=
ompletely unreachable, resulting in dead code.
--

commit 80f4c6428d6088ebf03f569dea1ce788b34979a5
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add support of an7563 SoC

This patch adds support of Airoha an7563 SoC pin controller.
Also it adds corresponding device tree binding schema.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/ai=
roha/pinctrl-an7563.c
> index 0000000000000..40cbbe90cc464 100644
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
> @@ -0,0 +1,1115 @@
[ ... ]
> +static const int hsuart_cts_rts_pins[] =3D { 14, 15 };
> +static const int i2c_pins[] =3D { 30, 31 };
> +static const int jtag_udi_pins[] =3D { 7, 8, 9, 10, 11 };
> +static const int jtag_dfd_pins[] =3D { 7, 8, 9, 10, 11 };
> +static const int pcm1_pins[] =3D { 22, 23, 24, 25 };
> +static const int pcm2_pins[] =3D { 1, 2, 3, 4 };
> +static const int spi_pins[] =3D { 32, 33, 34, 35 };

[Severity: Medium]
Are pins 16 and 17 missing from hsuart_cts_rts_pins[]?

The hsuart_cts_rts function (defined later in uart_func_group) configures t=
he
hardware routing for all 4 UART pins, but this array only claims pins 14
and 15.

Could this leave pins 16 and 17 vulnerable to being concurrently claimed as
GPIOs while still being forcefully routed to UART in hardware?

[Severity: Low]
Are the i2c_pins and spi_pins groups actually reachable?

These groups are defined in pinctrl_groups but do not appear to be included=
 in
any function's group array (such as i2c_groups or spi_groups). This means t=
hey
cannot be selected via a function mux.

Additionally, the device tree schema strictly forbids the use of the 'group=
s'
property in 'conf' nodes, preventing direct configuration. This seems to le=
ave
them as unused dead code.

[ ... ]
> +static const struct airoha_pinctrl_func_group uart_func_group[] =3D {
> +	{
> +		.name =3D "hsuart",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
> +			GPIO_HSUART_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +	{
> +		.name =3D "hsuart_cts_rts",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK,
> +			GPIO_HSUART_MODE_MASK | GPIO_HSUART_CTS_RTS_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +};

[Severity: Medium]
Could the hsuart function unintentionally disable CTS/RTS hardware routing?

If a device tree requests both "hsuart" and "hsuart_cts_rts" (as shown in t=
he
dt-binding example) but they are applied such that hsuart goes last, it will
actively clear the CTS/RTS bit set by hsuart_cts_rts.

This happens because the hsuart mask explicitly includes
GPIO_HSUART_CTS_RTS_MODE_MASK but the value only sets GPIO_HSUART_MODE_MASK.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628143733.2736=
51-1-mikhail.kshevetskiy@iopsys.eu?part=3D17
