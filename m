Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E383AC0C5
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140035; cv=none; b=DFQqzW4nJvkLLAEpHMSbimaK5sFnZDZDyy3o1rcZaWvQtj/3NQADVh0ePqp2rXvjv6Iz8q6/Di89n3vrZsm+KQlcK+UtVmzDJNg3zZ+ub/HflyETKfh35JO5Neb2IjyCEBQ79pUejga5SHOcM/zEQLfRIXTHGAnuLRnZDI4OX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140035; c=relaxed/simple;
	bh=UNgghkV84J9mfIQ0g/Msws5MgDymdcriIf1OcEs962Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B4SBfWNKzEJGXdRXw2xPUZM7ODuXOJdHTGRB5/H3HXawhSBWXiQqTp59Llb6cUGPwIf3b6CmpXOzfPFBAmHh+DBejqWrwpYOElMej1Ww4sV+QobD+hdwvYf1wopDJJqpoCR2JU2e99+qhhn3EXhmt6viRnL+MC+/7se9c6EPdM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQEtJgii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQEtJgii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31821F000E9;
	Mon, 27 Jul 2026 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785140033;
	bh=dFBZ/S6dQBOhurT/a8+y/GOsRqAbGsF0jWmOOJRvTMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQEtJgiitQ0ivl9MT/+gNFMPH4E0mwk2NCDr+BCpKmTppmZOBSQ5aK4eheXBTAnBP
	 oFn/3lHl3v/cdR1+DcdRt5Q5Ji6iAVvfeXr+L/XkFlaa9IGrajHPjVRLHQBC9HF9zY
	 b6SHsklbs3dpnO+48ioZUileJb+VzOfldCn7C3NjpJEnfqFC8FfI4bW3D1xaUcb1LV
	 TZpup9oq6vWbyUGdCIagWXRSW3G64aaBs8sIMLhTEStZws8mPP29razJd0Og0E/abt
	 Xs41QrwMm3L+P5gDRt7CSGFbG8Bd4++mET9J98l1Y7vRA0ObjPJtXLkry5BlYnhGA8
	 IiRKXHp8JZw0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 30/34] pinctrl: airoha: add support of en7523 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-31-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-31-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:13:52 +0000
Message-Id: <20260727081352.D31821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Missing hardware configuration for dedicated non-GPIO and PCIe r=
eset pins
- [Low] Dead code: Unused macro definitions

Pre-existing issues:
- [High] Driver probe failure due to hardcoded EN7581 syscon dependency
--

--- Patch [30]: [PATCH v7 30/34] pinctrl: airoha: add support of en7523 SoC=
 ---
commit cb202b59244d84caae5e01de5b50036f419bfc6e
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: pinctrl: airoha: add support of en7523 SoC

This patch adds support of Airoha en7523 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/ai=
roha/pinctrl-en7523.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
> @@ -0,0 +1,1124 @@

[ ... ]

> +#define REG_NPU_UART_EN				0x0220
> +#define JTAG_UDI_EN_MASK			BIT(4)
> +#define JTAG_DFD_EN_MASK			BIT(3)
> +#define NPU_UART_EN_MASK			BIT(2)
> +
> +#define REG_FORCE_GPIO_EN			0x0224
> +#define FORCE_GPIO_EN(n)			BIT(n)
> +
> +/* LED MAP */

[Severity: Low]
Are these register definitions for REG_FORCE_GPIO_EN and FORCE_GPIO_EN
utilized anywhere in this file? They seem to be defined here but never
mapped or used. Is this leftover code from another SoC driver?

[ ... ]

> +#define AIROHA_PINCTRL_GPIO(gpio, mux_val)			\
> +	{							\
> +		.name =3D (gpio),					\
> +		.regmap[0] =3D {					\
> +			AIROHA_FUNC_MUX,			\
> +			REG_GPIO_PON_MODE,			\
> +			(mux_val),				\
> +			(mux_val)				\
> +		},						\
> +		.regmap_size =3D 1,				\
> +	}
> +
> +#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\

[Severity: Low]
Is the AIROHA_PINCTRL_GPIO macro needed? It appears only
AIROHA_PINCTRL_GPIO_EXT is used below in gpio_func_group.

[ ... ]

> +static const struct airoha_pinctrl_conf pinctrl_pullup_conf[] =3D {
> +	PINCTRL_CONF_DESC(12, REG_GPIO_L_PU, BIT(0)),
> +	PINCTRL_CONF_DESC(13, REG_GPIO_L_PU, BIT(1)),

[Severity: Medium]
Should pins 2 through 9 be included in this configuration array?

The driver defines registers and bitmasks for configuring pull-up, pull-dow=
n,
and drive strength for these dedicated I2C, SPI, and UART pins (like
REG_I2C_SDA_PU), but they appear to be entirely missing from the
pinctrl_pullup_conf, pinctrl_pulldown_conf, pinctrl_drive_e2_conf, and
pinctrl_drive_e4_conf arrays.

Will device tree properties attempting to configure these electrical
characteristics fail?

[ ... ]

> +	PINCTRL_CONF_DESC(38, REG_GPIO_L_PU, BIT(26)),
> +	PINCTRL_CONF_DESC(39, REG_GPIO_L_PU, BIT(27)),
> +	PINCTRL_CONF_DESC(40, REG_GPIO_L_PU, BIT(28)),
> +	PINCTRL_CONF_DESC(41, REG_GPIO_L_PU, BIT(29)),
> +};

[Severity: Medium]
Are pins 40 and 41 correctly mapped here?

They are mapped to REG_GPIO_L_PU bits 28 and 29, but earlier in the file
PCIE0_RESET_PU_MASK and PCIE1_RESET_PU_MASK are defined as bits 8 and 9 of
REG_I2C_SDA_PU.

Will configuring the PCIe resets write to the wrong register?

[ ... ]

> +static struct platform_driver airoha_pinctrl_driver =3D {
> +	.probe =3D airoha_pinctrl_probe,
> +	.driver =3D {
> +		.name =3D "pinctrl-airoha-en7523",
> +		.of_match_table =3D airoha_pinctrl_of_match,
> +	},
> +};
> +module_platform_driver(airoha_pinctrl_driver);

[Severity: High]
This is a pre-existing issue, but will this driver successfully probe on
EN7523 hardware?

The core function airoha_pinctrl_probe() appears to unconditionally look up
the system controller using syscon_regmap_lookup_by_compatible() with the
hardcoded string "airoha,en7581-chip-scu". Since the EN7523 device tree
likely uses its own compatible string, won't this lookup fail and cause the
probe function to return -ENODEV?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D30
