Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C83E0230
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139652; cv=none; b=GXWNr0U0oR+UiC9BH+mHOkKtJh8nWg806wS/jdlLCh1ziw0g3YMOR0fjgGflv2qKa14v+45lHEuz6wKiseTN9b0RBgCD1omXNzmBpQVx+On7/vCSaCk5OkGmdC87ylNhqxS8nH7op/N8F4rV2NgvHj8kx31rj8l7TTu6LfhIZsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139652; c=relaxed/simple;
	bh=wkQkhKy1WoH3F9zWE8DgnlHZ6QseN8FYhhjcz4eNczs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lDsMnaLyNkvpISa5T8nAmdkBmc9PyE11Cg3g4V2r/SOV8KeCu+4TOQ2SndCyEzgflpi4KuyecAaJMejhkxP4YcnkjGgX+afkbMZpVQVSK6fJp4ic2NVqBy7e++kFQ2gubhUiwhSaKyPFNtm+F8xOCxa7CTP/lZjnobRmK3wUKlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy2EJrNu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy2EJrNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F6C1F000E9;
	Mon, 27 Jul 2026 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139651;
	bh=drMZEKvjyeKJtok9+DmTvbc54SaMl85p3Sxfffuv6m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cy2EJrNuLtICIzv26UBq4HJ4cuP2a8n5DXlLU2G5ZEJdHtVxl4mGhRvj80JKZ01pI
	 8XcMlgpd+pk1bOOysgScA7ySYDqSKpbU/qS0nohVDD5VGP5l3av0UssMod0DfpDGOp
	 DmjDj7ycooGkKzjjiNLziFwD2bwW/UmisAXTazrGOopBK2cHSfUgrhCh4oujS0K+9k
	 uy6zP69e82lzkzXL5EduR4TlyXOhc5vVfRWlLbyg7QKAO1j0ytXcPhj8n5s6gbiKWs
	 FvG4vmxnY/vTVN31JGXV51uubyfn65fzF5RUv5jMTKOSZjePYZh6j0EbAJq16UsPGy
	 StT5kjo5mJcQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 33/34] pinctrl: airoha: add support of an7563 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727074234.3761170-34-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-34-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:07:30 +0000
Message-Id: <20260727080731.59F6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing pinmux functions to restore default pad behaviors (I2C, =
SPI, UART) and failure to clear GPIO mode override bits when selecting alte=
rnate functions (MDIO, PNAND).
- [Medium] The `hsuart_cts_rts` pin group alters the mux state of the base =
HSUART pins without claiming them, causing potential pin conflicts and DT a=
pplication order races.
--

--- Patch [33]: [PATCH v7 33/34] pinctrl: airoha: add support of an7563 SoC=
 ---
commit fc95ee9a88a14501536fae31cd14f1346c7074c0
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add support of an7563 SoC

This patch adds support of Airoha an7563 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/ai=
roha/pinctrl-an7563.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c

[ ... ]

> +static const struct airoha_pinctrl_func_group mdio_func_group[] =3D {
> +	{
> +		.name =3D "mdio",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_SGMII_MDIO_MODE_MASK,
> +			GPIO_SGMII_MDIO_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +};

[Severity: Medium]
Does this configuration properly clear the GPIO mode override bits if the
bootloader left these pads in GPIO mode?

Looking at mdio_func_group, it only sets GPIO_SGMII_MDIO_MODE_MASK.
However, MDIO shares the I2C_SCL and I2C_SDA pads. If the bootloader
previously set I2C_SCL_GPIO_MODE_MASK and I2C_SDA_GPIO_MODE_MASK, they
would not be cleared here, potentially leaving the pads in GPIO mode
instead of routing them to MDIO.

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
Will applying the hsuart group silently disable CTS/RTS if it happens to be
evaluated after hsuart_cts_rts? The hsuart function clears the
GPIO_HSUART_CTS_RTS_MODE_MASK bit.

Additionally, hsuart_cts_rts modifies GPIO_HSUART_MODE_MASK (which routes
pins 16 and 17) despite those pins not being claimed by the group in
hsuart_cts_rts_pins. Could this allow the pinctrl core to mistakenly grant
pins 16 and 17 to another driver as GPIOs, creating a silent hardware
conflict?

[ ... ]

> +static const struct airoha_pinctrl_func_group pnand_func_group[] =3D {
> +	{
> +		.name =3D "pnand",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_PARALLEL_NAND_MODE_MASK,
> +			GPIO_PARALLEL_NAND_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +};

[Severity: Medium]
Is this missing the clearing of SPI GPIO mode override bits? Similar to the
MDIO function above, if the bootloader leaves the shared SPI pads in GPIO
mode, setting only GPIO_PARALLEL_NAND_MODE_MASK might not be enough to route
them to the PNAND controller.

[ ... ]

> +static const struct airoha_pinctrl_func pinctrl_funcs[] =3D {
> +	PINCTRL_FUNC_DESC("pon", pon),
> +	PINCTRL_FUNC_DESC("sipo", sipo),
> +	PINCTRL_FUNC_DESC("mdio", mdio),
> +	PINCTRL_FUNC_DESC("uart", uart),
> +	PINCTRL_FUNC_DESC("jtag", jtag),
> +	PINCTRL_FUNC_DESC("pcm", pcm),
> +	PINCTRL_FUNC_DESC("spi", spi),
> +	PINCTRL_FUNC_DESC("pnand", pnand),
> +	PINCTRL_FUNC_DESC("gpio", gpio),

[Severity: Medium]
Are we missing function descriptors to restore the default I2C and base
SPI/UART pad functions? Since there are no i2c, spi (base), or uart
functions registered here, it appears there is no way for Linux to clear the
GPIO override bits if the bootloader initialized them as GPIOs, which could
leave those hardware blocks unusable.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D33
