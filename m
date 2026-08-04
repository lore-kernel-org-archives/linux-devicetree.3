Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D945A2A4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861364; cv=none; b=QnqN6RVG72Ik/ewk4Tvkn4/eWgq2+5xuYiPthXFuAWTyCR4IV0o/SO43E9h/R/WAO44OkSDzS1STfxnVclIxNlA7YlAljZ9FiNYu4kW/hyyaz73ASU34MZRvvhMg0LmCbM6JJqm6AWLZ68Jip83FO3RkVTaFCvnUmsSIUPrhjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861364; c=relaxed/simple;
	bh=YW7qwUDKeR73p08pfNHJZD0yCw47c84KXFYn+5LIYdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jy9PeN/Y1dYnspRuhBoIdxREeyASleYYwP9pTvHRFBeQV2U75yxJwqQ5EolUAOlvsQLhsBvRfYvA3EqSZ2RghvGnljuA7ciM8JaO48NL71+rJ/Z5F9L1EJ2DhCAR2/4UwhJs6CTX4L8XD0pZrcd1K4ws2p9NJ8yPZ+Hd2MN2wQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnGE0ewK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnGE0ewK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1638A1F000E9;
	Tue,  4 Aug 2026 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861354;
	bh=A6K14RFCNbKeKOMYOcKe2gdgUzTsJsoiHWC6K+Y8hpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YnGE0ewKR5tkzu5mq2ovTz2mwm+ddQKBtusLPd+ziiNz+LKye/x4JzFdne8INJnsN
	 c+J7xlVCiLKoMEUI/UvUVVyFR8YxYfPjeA+EVXNlgrI+1X64LAZb6MK2m6twezt5eA
	 6mDeqfHyknj5jGnk4iydzuxplVf0fkVa8BlhhSJlxAPmlTBuwDkg1mKZ/LdsafUb1I
	 666/9b9iRkVU9hbc/FiUhH/ZxKgvXejMllF8sV8V4KPa56dOWKmPL+kYefG46N+XOx
	 7cG8CYxMGhapgCQ7uhYHiOknkPHa5YYF139xdem/dGY8xNq9eS330QTzjiM7Ob+ICU
	 L6FWK7rONXKPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 35/36] pinctrl: airoha: add support of an7563 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-36-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-36-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:35:53 +0000
Message-Id: <20260804163554.1638A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing i2c, spi, and uart configurations to clear GPIO mode bits =
on standalone pads.
- [Medium] Missing gpio function support for pins 0-27 prevents restoring t=
hem to GPIO mode.
--

--- Patch [35]: [PATCH v9 35/36] pinctrl: airoha: add support of an7563 SoC=
 ---
commit 6207c71cb41f704bc923f2a3370df4d4674e76e8
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

    pinctrl: airoha: add support of an7563 SoC
   =20
    This patch adds support of Airoha an7563 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/ai=
roha/pinctrl-an7563.c
> new file mode 100644
> index 0000000000000..40cbbe90cc464
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-an7563.c

[ ... ]

> +static const char *const gpio_groups[] =3D {
> +	"gpio28", "gpio29", "gpio30", "gpio31", "gpio32",
> +	"gpio33", "gpio34", "gpio35", "gpio36", "gpio37"
> +};

[Severity: Medium]
Will this prevent restoring pins 0-27 back to GPIO mode if they were config=
ured
for alternate functions (like PWM or PON) by the bootloader?

Since pins 0-27 are omitted from this group and gpio_func_group[], users wo=
n't
be able to explicitly request them as "gpio".

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

[Severity: High]
Does this leave pins 30 and 31 stuck in GPIO mode if the bootloader previou=
sly
set I2C_SCL_GPIO_MODE_MASK or I2C_SDA_GPIO_MODE_MASK?

It looks like this function doesn't clear those GPIO mode bits when enabling
MDIO.

[ ... ]

> +static const struct airoha_pinctrl_func_group spi_func_group[] =3D {
> +	{
> +		.name =3D "spi_quad",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_SPI_CS1_MODE,
> +			GPIO_SPI_QUAD_MODE_MASK,
> +			GPIO_SPI_QUAD_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	}, {
> +		.name =3D "spi_cs1",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_SPI_CS1_MODE,
> +			GPIO_SPI_CS1_MODE_MASK,
> +			GPIO_SPI_CS1_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +};

[Severity: High]
Is the "spi" group (pins 32-35) intentionally omitted here?

Without it, there appears to be no way to clear the SPI_*_GPIO_MODE_MASK bi=
ts
to restore the base SPI functionality if the bootloader configured these pi=
ns
as GPIOs.

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
> +	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
> +	PINCTRL_FUNC_DESC("pwm", pwm),
> +	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
> +	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
> +	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
> +	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
> +	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
> +	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
> +	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
> +	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
> +};

[Severity: High]
Does this code completely omit the "i2c" function?

It seems missing from this array, meaning I2C cannot be selected via the de=
vice
tree to clear the I2C_SCL/SDA_GPIO_MODE_MASK bits on pins 30 and 31.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D35
