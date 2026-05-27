Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FF33F4105
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879559; cv=none; b=TTUqaY5fFsoVVXbGBqE+KqdaiQ5LGMz8D32L/p7xI84mJ8c1S2QUBD51garOFYkLyIqBL+03F9cy7AJewGUf7EgxATmAvBvximGjL6zUvmjx5fOr6Pfat8SmqQRwxt/hzoTCJxvNx0T/z6VD16RCv9Utn8timQwFbdAtOWQwXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879559; c=relaxed/simple;
	bh=YO7bqmk3ZLelh+1X+XQEf7WVWzmDJ+cfz6bn/RB2dZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xu6svl/+CI2o+xiGBIx0saRYPxqNQ6kolE9DSMcAkWmwh8W8kk3txoxlQm/qFB8jvq/PoqWUb0GMcFUe6JaH7pPWnZsMzqXGlL3URO9HRTwuKtl1Y1xeqw8NHpB2Bcosl2z5+5qD2vqpUhjF8kEB+9NTSUvLm9TH5VSNBOUEhJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOqGU9S7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOqGU9S7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7831F000E9;
	Wed, 27 May 2026 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779879556;
	bh=DqcK2NvHl8rzjjE/1cYTraXE2UcHunAXh3swPg2kZag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bOqGU9S75EiGIr5sa+Vf5cHK7LZoCfWKd+Q7mhhSsy7rQmhovhMr2ezj942fODzPm
	 Ruhi3g5WtrevNcqF2LV7zH9jqDNmdS8EBHP8PcM5d1LKTqjx7ckrD+0OpLytxfBYJS
	 Cy7d1Bi7GpzpwsKH9wNwxo5f+yYEOHPKUI/fOm7scEJcCEoMidtuKuYIaiXWhS/uiZ
	 U5GC1Av0gJr9mA65MIhmBGI5Einr4HIBYnR5u0/lcZeZkwGl1lDZ6ZoNeIq9f2u9Pz
	 HyHRWjvQJEX/hMWRL2D3sdull+4eW1LsYjk9zG83l0aGDNREuc2MsKp4ucIp9b2Ruj
	 IIOmvTx6wYxSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] pinctrl: qcom: spmi-gpio: Rearchitect for flexible
 group support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-pinctrl-level-shifter-v1-3-1965461d0a7c@oss.qualcomm.com>
References: <20260527-pinctrl-level-shifter-v1-3-1965461d0a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:59:15 +0000
Message-Id: <20260527105915.9D7831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect registration sequence breaks pinctrl hogs and exposes an=
 uninitialized controller.
- [Low] Missing Kconfig dependencies for generic pinctrl APIs.
--

commit a1bdf02d93e7a07ac0395bf90452b7604f1cb0ac
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

pinctrl: qcom: spmi-gpio: Rearchitect for flexible group support

This commit transitions the spmi-gpio pinctrl driver to use generic pinctrl
groups and functions instead of treating every individual pin as a separate,
fully-featured group.

> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index cdd61dae74cf9..f159c56784b4f 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
[ ... ]
> @@ -253,139 +254,124 @@ static int pmic_gpio_write(struct pmic_gpio_state=
 *state,
>  	return ret;
>  }
> =20
> -static int pmic_gpio_get_groups_count(struct pinctrl_dev *pctldev)
> -{
[ ... ]
>  static const struct pinctrl_ops pmic_gpio_pinctrl_ops =3D {
> -	.get_groups_count	=3D pmic_gpio_get_groups_count,
> -	.get_group_name		=3D pmic_gpio_get_group_name,
> -	.get_group_pins		=3D pmic_gpio_get_group_pins,
> +	.get_groups_count	=3D pinctrl_generic_get_group_count,
> +	.get_group_name		=3D pinctrl_generic_get_group_name,
> +	.get_group_pins		=3D pinctrl_generic_get_group_pins,
>  	.dt_node_to_map		=3D pinconf_generic_dt_node_to_map_group,
>  	.dt_free_map		=3D pinctrl_utils_free_map,
>  };

[Severity: Low]
The driver was migrated to use generic pinctrl APIs, but does the Kconfig f=
or
CONFIG_PINCTRL_QCOM_SPMI_PMIC select GENERIC_PINCTRL_GROUPS and
GENERIC_PINMUX_FUNCTIONS?

If these are not enabled by another driver during a randconfig build, could
this lead to unresolved symbol errors when using these generic APIs?

[ ... ]
> @@ -1129,11 +1236,11 @@ static int pmic_gpio_probe(struct platform_device=
 *pdev)
[ ... ]
>  	state->chip =3D pmic_gpio_gpio_template;
>  	state->chip.parent =3D dev;
>  	state->chip.base =3D -1;
>  	state->chip.ngpio =3D npins;
>  	state->chip.label =3D dev_name(dev);
>  	state->chip.of_gpio_n_cells =3D 2;
>  	state->chip.can_sleep =3D false;
> =20
>  	state->ctrl =3D devm_pinctrl_register(dev, pctrldesc, state);
>  	if (IS_ERR(state->ctrl))
>  		return PTR_ERR(state->ctrl);
> =20
> +	/* Register pin groups - each GPIO is a group for standard functions */
> +	for (i =3D 0; i < npins; i++) {
> +		ret =3D pinctrl_generic_add_group(state->ctrl,

[Severity: High]
Does registering the pinctrl device before adding the generic groups and
functions break pinctrl hogs?

devm_pinctrl_register() internally invokes pinctrl_enable(), which attempts
to immediately parse and claim pinctrl hogs from the device tree via
pinctrl_claim_hogs(). Because the generic group and function radix trees are
empty at this exact moment, pinmux_func_name_to_selector() and
pinctrl_get_group_selector() will fail, silently dropping the hardware hogs.

Could this also expose the pinctrl device to concurrent consumers before it
is fully populated? Should the driver use devm_pinctrl_register_and_init(),
populate its generic structures, and then explicitly call pinctrl_enable()?

> +						pmic_gpio_groups[i],
> +						&pindesc[i].number, 1, NULL);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to register group %s\n",
> +				pmic_gpio_groups[i]);
> +			return ret;
> +		}
> +	}
> +
> +	/* Register standard functions - all GPIOs support these */
> +	for (i =3D 0; i < ARRAY_SIZE(pmic_gpio_functions); i++) {
> +		ret =3D pinmux_generic_add_function(state->ctrl,
> +						  pmic_gpio_functions[i],
> +						  pmic_gpio_groups, npins, NULL);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to register function %s\n",
> +				pmic_gpio_functions[i]);
> +			return ret;
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-pinctrl-le=
vel-shifter-v1-0-1965461d0a7c@oss.qualcomm.com?part=3D3
