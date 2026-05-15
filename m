Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5830B501
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778812135; cv=none; b=TPONrlb4WDqHUAtDywqhioZtKYfvltVEEABhqYuZidqhwsk502WCGGj2XOn41c2LQG1JWvTk/ndxTe1U2tqdcN5fep8S5IOrIJec0NYNrBXh8zjRhBa00f4asoEjm8XySOPjmikr8QFr1ORKw8nLAn8MyrOOwpzp5oP9BKkK6pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778812135; c=relaxed/simple;
	bh=WsZVYOr1fBUAlMFY0arhUAgoB51e3hbKWLQramDqTBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NUwg1pvRkn2s8ZgmZuV88XqvuUhZp2JOKhjNk2e/ZMZJiK9St3W9MP4YkiWE3EfP0TQ+pdj82ausrkgLDV0J2xj0YqucGOymua6Hcq2sYrRECExNazmroP2SwW0L61rrk8uYF/kfhwoqFIpVPrqMTwvzmV4bHYX/IrkgtupcOtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDK4WxTH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDK4WxTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCECC2BCB3;
	Fri, 15 May 2026 02:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778812134;
	bh=WsZVYOr1fBUAlMFY0arhUAgoB51e3hbKWLQramDqTBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=WDK4WxTHG56b3UvhPBQCxmUQjsL5QnrEVwxkXSiewmmwxZeJf03WVaD7MVRsFVU8p
	 ce5u0oeoQvaQLnhl7ly3QDLKx7MbCsIvRysdt8U790snHRFa+dbkwLpr5wW6S4nGVR
	 VwhWA7BYvfgrEBOewPXnOOVGPHWTDW0Um7KoM5zLYopvVr1dncK/NW4hEqzrNMFPr/
	 dOWShKuH+UMx0/0cMJXglX8Pd6k8JbhHdbVKktE0igvoClmTSBnvPWSma772v6t2Zd
	 HEKg1LBxLkVu54ilDlNOALCBAL620AgEmxdpkXN2AZn2mwR8AJUUKoCiBzs9atd6jp
	 2p4MomloFYDDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 02:28:53 +0000
Message-Id: <20260515022854.5CCECC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Memory leak of temporary DT parsing arrays on consumer probe paths
- [Medium] Silent ignoring of unsupported pin configurations
- [Low] Build failure due to dynamic mask in `field_prep()`
- [Low] Signed integer overflow during pin mux configuration
- [Low] Unnecessary Kconfig dependencies selected
--

commit 03445610d24a54757505c7f2def35cc4894dd19f
Author: Jia Wang <wangjia@ultrarisc.com>

pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver

This commit adds the pinctrl driver for the UltraRISC DP1000 pinctrl
controller.

> diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultraris=
c/Kconfig
> new file mode 100644
> index 0000000000000..ba8747b90127d
> --- /dev/null
> +++ b/drivers/pinctrl/ultrarisc/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PINCTRL_ULTRARISC
> +	tristate
> +	depends on OF
> +	select PINMUX
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINCONF
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIOLIB
> +	select IRQ_DOMAIN_HIERARCHY
> +	select MFD_SYSCON

This isn't a bug, but is it necessary to select IRQ_DOMAIN_HIERARCHY and
MFD_SYSCON here? The driver code doesn't seem to include the corresponding
headers or use their APIs.

[ ... ]
> diff --git a/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c b/drivers/pinc=
trl/ultrarisc/pinctrl-ultrarisc.c
> new file mode 100644
> index 0000000000000..774746943e283
> --- /dev/null
> +++ b/drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c
[ ... ]
> @@ -0,0 +1,746 @@
[ ... ]
> +static int ur_write_pin_conf(struct ur_pinctrl *pctldata, unsigned int p=
in, u32 conf)
> +{
> +	const struct ur_port_desc *port_desc;
> +	struct ur_pin_val pin_val;
> +	unsigned long flags;
> +	void __iomem *reg;
> +	u32 reg_offset;
> +	u32 val;
> +	u32 shift;
> +	u32 mask;
> +
> +	if (ur_pin_num_to_port_pin(pctldata->match_data, &pin_val, pin))
> +		return -EINVAL;
> +
> +	port_desc =3D &pctldata->match_data->ports[pin_val.port];
> +	reg_offset =3D ur_get_pin_conf_offset(port_desc, pin_val.pin);
> +	reg =3D pctldata->base + reg_offset;
> +	shift =3D (pin_val.pin % UR_CONF_PIN_PER_REG) * UR_CONF_BIT_PER_PIN;
> +	mask =3D GENMASK(UR_CONF_BIT_PER_PIN - 1, 0) << shift;
> +
> +	raw_spin_lock_irqsave(&pctldata->lock, flags);
> +	val =3D readl_relaxed(reg);
> +	val =3D (val & ~mask) | field_prep(mask, conf);

Does this cause a build failure? The field_prep() macro strictly enforces
that its mask argument must be a compile-time constant. Because mask is
calculated dynamically based on pin_val.pin, the driver will fail to compil=
e.

> +	writel_relaxed(val, reg);
> +	raw_spin_unlock_irqrestore(&pctldata->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ur_set_pin_mux(struct ur_pinctrl *pctldata, struct ur_pin_val=
 *pin_val)
> +{
> +	const struct ur_port_desc *port_desc =3D &pctldata->match_data->ports[p=
in_val->port];
> +	void __iomem *reg =3D pctldata->base + port_desc->func_offset;
> +	unsigned long flags;
> +	u32 val;
> +
> +	raw_spin_lock_irqsave(&pctldata->lock, flags);
> +	val =3D readl_relaxed(reg);
> +	val &=3D ~((UR_FUNC0 | UR_FUNC1) << pin_val->pin);

Could this shift result in a signed integer overflow?

UR_FUNC0 is 1 and UR_FUNC1 is 0x10000, so their bitwise OR is 0x10001. If
pin_val->pin is 15, left-shifting 0x10001 by 15 results in 0x80008000.
This shifts a bit into the sign bit of a 32-bit signed integer.

Should these macros be defined with unsigned literals, such as 1U and
0x10000U?

> +	val |=3D pin_val->mode << pin_val->pin;
> +	writel_relaxed(val, reg);
> +	raw_spin_unlock_irqrestore(&pctldata->lock, flags);
> +
> +	return 0;
> +}
[ ... ]
> +static int ur_config_to_hw(unsigned long config, u32 *conf)
> +{
> +	enum pin_config_param param =3D pinconf_to_config_param(config);
> +	u32 arg =3D pinconf_to_config_argument(config);
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> +		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_DIS);
> +		return 0;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_UP);
> +		return 0;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
> +		FIELD_MODIFY(UR_PULL_MASK, conf, UR_PULL_DOWN);
> +		return 0;
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		for (u32 i =3D 0; i < ARRAY_SIZE(ur_drive_strengths); i++) {
> +			if (ur_drive_strengths[i] !=3D arg)
> +				continue;
> +			FIELD_MODIFY(UR_DRIVE_MASK, conf, i);
> +			return 0;
> +		}
> +		return -EINVAL;
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +	case PIN_CONFIG_INPUT_ENABLE:
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +	case PIN_CONFIG_PERSIST_STATE:
> +		return 0;

Does this code silently ignore unsupported configurations?

Returning 0 here tells the pinctrl framework that the configurations were
successfully applied, even though no hardware state was modified. Should
this return -ENOTSUPP for configurations the hardware doesn't support?

> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
[ ... ]
> +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> +				struct device_node *np,
> +				const char *propname,
> +				struct ur_legacy_prop_data *prop)
> +{
> +	struct ur_pinctrl *pctldata =3D pinctrl_dev_get_drvdata(pctldev);
> +	int rows;
> +
> +	rows =3D pinctrl_count_index_with_args(np, propname);
> +	if (rows < 0)
> +		return dev_err_probe(pctldev->dev, rows, "%pOF: invalid %s count\n",
> +				     np, propname);
> +
> +	prop->pin_vals =3D devm_kcalloc(pctldev->dev, rows, sizeof(*prop->pin_v=
als),
> +				      GFP_KERNEL);
> +	if (!prop->pin_vals)
> +		return -ENOMEM;
> +
> +	prop->group_pins =3D devm_kcalloc(pctldev->dev, rows, sizeof(*prop->gro=
up_pins),
> +					GFP_KERNEL);

Will this leak memory when consumer devices defer probe?

The devm_kcalloc() allocations are tied to pctldev->dev, which is the pinct=
rl
provider device. Since ur_legacy_parse_prop() is called from dt_node_to_map
during the consumer's probe sequence, these allocations will remain on the
provider's devres list and accumulate each time the consumer defers probe.

Should standard kcalloc() be used here instead and explicitly freed at the
end of ur_legacy_dt_node_to_map()?

> +	if (!prop->group_pins)
> +		return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ultrarisc-=
pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=3D6
