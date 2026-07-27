Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316C23536B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176207; cv=none; b=XTuTQIG9rZNuyQ9wlXgtpHKVZjrnbJJlNk/19QjCRoyxwA4qFKbnN+hWGQ0bcxUnIwwn/y+o8uMhumbybAww5GM4a7NDcNzamRdqQpf3UnV19QnTo3H7WZnse3sKFiqwSIBrcVUfLyZhHyfiMZ/GhszPFP5QCmLBJi591dVQyp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176207; c=relaxed/simple;
	bh=9o9Ox3WTTSMMDv4+9zZ5nb2yhTG4r/otyQm2S+Hv2HA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QeF00/teMXGRjl3BbpZEGjh594rKdccH1iEbTDzZrp8NAYTCVxHmLQyA4/ccbMswx7fP3h9YGbAmYiCLaBblZcLIRfAadoNP6pQW03IkHlcHOOhQ9n/qK614KfzO7Mm3SFs+ltBub4PTLgmqhJKUqXNnB4/61KShJJu3IKaQW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EU7RcvF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EU7RcvF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAE41F000E9;
	Mon, 27 Jul 2026 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785176205;
	bh=Cvttoh++tGq/BaWlHDcV8mFQFwLCwv6BQgNMozRoYf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EU7RcvF98G0KfN+8V3tHhgmhHde8Xd2DNtNQU7/9IEw4dq9x0E2lcRsuG55TMYIFQ
	 Z2lV5/g/S63l5p4VjUePyaINibBI+k3AOT6A6hTcrwbO8nVZKnwsCO+osV8bWRWiA/
	 rxP0u+zOiQb4kyygmP/DR/4hOtLXRBRoSprWGUOWXEJvUIV97sN42ZHmRA36uatRCC
	 AI9VpoLd3/8JyaZ/UNGkhLg6+WTLRtVoR4ONFfj82aZXuD8CK/lREtrG0bSXC8MJfY
	 ZoQP+zI0Lf+Ojbj4iZj2qZ1c5GtznVFgtqYhCdjz5JjKpU5CgESY0Th9MsKjdFjSMZ
	 4YLhehPSJSzHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 34/35] pinctrl: airoha: add support of an7563 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-35-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-35-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:16:44 +0000
Message-Id: <20260727181645.4FAE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing pinmux functions to restore dedicated GPIO pads to GPIO mo=
de and standalone pads to their native functions, and the MDIO function fai=
ls to clear GPIO override bits.
--

--- Patch [34]: [PATCH v8 34/35] pinctrl: airoha: add support of an7563 SoC=
 ---
commit 17737ef79ed00a92161a7a544b4f3bec1f3d0e5c
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
pinctrl: airoha: add support of an7563 SoC

This commit introduces support for the Airoha AN7563 SoC pin controller. It
provides pin definitions, group mappings, and pinmux functionalities for va=
rious
interfaces like PON, MDIO, I2C, and PWM.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/ai=
roha/pinctrl-an7563.c
> new file mode 100644
> index 0000000000000..40cbbe90cc464
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

[Severity: High]
Does this code leave the I2C_SCL_GPIO_MODE_MASK and I2C_SDA_GPIO_MODE_MASK
bits set when configuring the mdio function?

If these pads were previously overridden to GPIO mode (for instance, by the
bootloader), setting the SGMII MDIO mode bit here might not be sufficient to
restore MDIO functionality if the GPIO override bits aren't also cleared.

[ ... ]

> +static const struct airoha_pinctrl_func_group gpio_func_group[] =3D {
> +	AIROHA_PINCTRL_GPIO_EXT("gpio28", GPIO28_FLASH_MODE_CFG,
> +				GPIO_PCIE_RESET0_MASK),
> +	AIROHA_PINCTRL_GPIO_EXT("gpio29", GPIO29_FLASH_MODE_CFG,
> +				GPIO_PCIE_RESET1_MASK),
> +	AIROHA_PINCTRL_GPIO_EXT("gpio30", GPIO30_FLASH_MODE_CFG,
> +				I2C_SCL_GPIO_MODE_MASK),
> +	AIROHA_PINCTRL_GPIO_EXT("gpio31", GPIO31_FLASH_MODE_CFG,
> +				I2C_SDA_GPIO_MODE_MASK),
> +	AIROHA_PINCTRL_GPIO("gpio32", SPI_CLK_GPIO_MODE_MASK),
> +	AIROHA_PINCTRL_GPIO("gpio33", SPI_CS_GPIO_MODE_MASK),
> +	AIROHA_PINCTRL_GPIO("gpio34", SPI_MOSI_GPIO_MODE_MASK),
> +	AIROHA_PINCTRL_GPIO("gpio35", SPI_MISO_GPIO_MODE_MASK),
> +	AIROHA_PINCTRL_GPIO_EXT("gpio36", GPIO36_FLASH_MODE_CFG,
> +				UART_TXD_GPIO_MODE_MASK),
> +	AIROHA_PINCTRL_GPIO_EXT("gpio37", GPIO37_FLASH_MODE_CFG,
> +				UART_RXD_GPIO_MODE_MASK),
> +};

[Severity: High]
Is this missing definitions for gpio0 through gpio27?

If these dedicated GPIO pads are ever configured for an alternate function
like PWM, it appears they cannot be switched back to GPIO mode via the pinc=
trl
subsystem because they are omitted from this function group.

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
Should this list include native pad functions for I2C, SPI, and UART1?

If the bootloader leaves these standalone pads in GPIO mode, there currently
appears to be no pinmux function available here to clear the GPIO override
bits and restore their native interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D34
