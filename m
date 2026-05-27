Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482423D75B0
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881808; cv=none; b=PEfj+JUf+RQWjn6eG+wZrMTEDb2CH89JVqokeeGnFStY0//zLrPgwTJpVIeUZ9c1JBOYTtdVR16uX0SIstQUm54pJwxpatdEZMEr3MC9EhWywa6mswte1YhLDoYs1JKrXjATcfd7Bz3pjGx/YN+rGBibiQrppz4sJ1nsixfGWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881808; c=relaxed/simple;
	bh=ak6xUzy4W4qUx1S+P/QfnPvzJOT4OdoHRsjdgyeVdOg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dIsjAZPfnteVvX3lLm7TI5f9LrY7MFhdS7Hsjv45v0P+Qrsmy4vIWvXkhe+USbaf4LGhwKfzWzJRYiVlRSDq8zFhupQgPsIUlP/nb9RXHbbVpJjhSkPcek8qbdnfwiCrCj102xVFcwwTcEtCRBCXYyUZ9A68/s3H8spMHfREPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6juO9Dz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6juO9Dz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E281F000E9;
	Wed, 27 May 2026 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779881802;
	bh=UwcLQpld3VejQyb6V934CJ9XfLKgiUS+nazETD3zKzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H6juO9DzPp/RmY4CSQ2nFnH+XC/UgMtsiAdmX2eEoHMc9/oQFbMibqsDzsIUp44h5
	 +e7i0+B9aHAynprUlrSJCzleYNcSAAkSZaezaF+fjhIA6miia3olpXmjIXn6dXB6XO
	 wyFaBnj4WSAHhlMbRBSScMjvmfZ/YFAjbV8Fws9BNpWRVHa4otDtblpUEEa9Ooz7i1
	 wPJXc1wQEHhHitqJyqIy/+94T8VX0zDYt6xkecY42G4H53Nob+l/LZwn38kWput3Lb
	 Z+/xiOuDNPBcxkkCl4I1Qb0bkZuvT9/I60Xex8L7ZuWyev7Fm20M92KlYi3Vz4K0Ba
	 UfvSbkY74i1cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] pinctrl: qcom: spmi-gpio: Add level-shifter
 function support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527-pinctrl-level-shifter-v1-4-1965461d0a7c@oss.qualcomm.com>
References: <20260527-pinctrl-level-shifter-v1-4-1965461d0a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 11:36:41 +0000
Message-Id: <20260527113641.D6E281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Out-of-bounds array access on the `pmic_gpio_functions` array when=
 reading pin configurations from debugfs.
- [High] Applying pin configurations to a level-shifter group incorrectly r=
e-enables the disabled GPIO pads and writes out-of-bounds function values, =
corrupting hardware mode control registers.
- [High] The driver fails to properly defer probing if the command DB (`cmd=
-db`) is not yet initialized.
- [High] The unconditional registration of level shifters breaks the probe =
sequence for existing devices that do not utilize them.
--

commit 0ccd51f9c406d2406a12a93ef3944f4bac8c5bdb
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

pinctrl: qcom: spmi-gpio: Add level-shifter function support

This commit introduces support for bidirectional level shifter modules
(BIDIR_LVL_SHIFTER) to the SPMI GPIO driver. It adds a new "level-shifter"
function to manage GPIO pairs that share physical pins with the level shift=
er,
controlling their state via RPMh.

> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index f159c56784b4f..d0144dbb7cfc8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c

[ ... ]

> @@ -137,6 +144,7 @@ enum pmic_gpio_func_index {
>  	PMIC_GPIO_FUNC_INDEX_DTEST2,
>  	PMIC_GPIO_FUNC_INDEX_DTEST3,
>  	PMIC_GPIO_FUNC_INDEX_DTEST4,
> +	PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER,
>  };

[Severity: High]
Does this code cause an out-of-bounds array access when reading pin
configurations from debugfs?

If a pin is configured as a level-shifter and its pad is enabled, reading t=
he
pin's debugfs node will index pmic_gpio_functions[10] (or [12] for non-LV/MV
subtypes due to the DTEST offset). Since PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER=
 was
added to the enum but pmic_gpio_functions was not updated, it seems this co=
uld
result in an out-of-bounds read that can crash the kernel or leak memory.

[ ... ]

> @@ -705,7 +835,25 @@ static int pmic_gpio_pinconf_group_set(struct pinctr=
l_dev *pctldev,
>  	if (!group)
>  		return -EINVAL;
> =20
> -	/* Iterate over all pins in the group and apply config to each */
> +	/* Handle group-level LS_ENABLE before iterating per-pin configs */
> +	for (i =3D 0; i < nconfs; i++) {
> +		if (pinconf_to_config_param(configs[i]) !=3D PMIC_GPIO_CONF_LS_ENABLE)
> +			continue;
> +
> +		if (!group->data) {
> +			dev_err(state->dev,
> +				"qcom,1p2v-1p8v-ls-en is only valid for level-shifter groups\n");
> +			return -EINVAL;
> +		}
> +
> +		ret =3D pmic_gpio_set_ls_rpmh(state,
> +					    (struct ls_pingroup_data *)group->data,
> +					    !!pinconf_to_config_argument(configs[i]));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Apply per-pin configs to each pin in the group */
>  	for (i =3D 0; i < group->grp.npins; i++) {
>  		pin =3D group->grp.pins[i];
> =20
> +		ret =3D pmic_gpio_pinconf_pin_set(pctldev, pin, configs, nconfs);
> +		if (ret < 0)
> +			return ret;
>  	}

[Severity: High]
Can applying pin configurations to a level-shifter group incorrectly re-ena=
ble
the disabled GPIO pads and write out-of-bounds function values?

In pmic_gpio_set_mux(), level-shifter pins correctly have their pads disabl=
ed.
However, when group-level pin configurations are applied
(e.g., qcom,1p2v-1p8v-ls-en), pmic_gpio_pinconf_group_set() delegates to
pmic_gpio_pinconf_pin_set().

The per-pin function unconditionally sets pad->is_enabled =3D true and writ=
es it
to PMIC_GPIO_REG_EN_CTL, re-enabling the pads. Furthermore, it shifts
pad->function (10) left by 1 (PMIC_GPIO_REG_MODE_FUNCTION_SHIFT), which
overflows the 3-bit mode mask and overwrites adjacent bits in
PMIC_GPIO_REG_MODE_CTL.

[ ... ]

> @@ -1177,6 +1333,96 @@ static const struct irq_chip spmi_gpio_irq_chip =
=3D {
>  	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
> =20
> +/**
> + * pmic_gpio_register_level_shifters() - Register level-shifter groups a=
nd function
> + * @state: PMIC GPIO state
> + * @hw_data: Hardware-specific data containing level-shifter configurati=
ons
> + *
> + * This function registers level-shifter support by:
> + * 1. Getting RPMh device reference and PMIC ID from device tree
> + * 2. Registering each level-shifter pair as a multi-pin group
> + * 3. Getting RPMh addresses from cmd_db for each level-shifter
> + * 4. Registering the level-shifter function once with all valid groups
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int pmic_gpio_register_level_shifters(struct pmic_gpio_state *sta=
te,
> +					     const struct pmic_gpio_hw_data *hw_data)
> +{
> +	struct device *dev =3D state->dev;
> +	const char **ls_group_names;
> +	int ret, i;
> +
> +	/* Get RPMh device reference for level shifter control */
> +	state->rpmh_dev =3D rpmh_get_ctrlr_dev(dev);
> +	if (IS_ERR(state->rpmh_dev))
> +		return dev_err_probe(dev, PTR_ERR(state->rpmh_dev),
> +				     "Level shifter needs rpmh device\n");
> +
> +	/* Get PMIC ID from device tree for RPMh resource name composition */
> +	ret =3D of_property_read_string(dev->of_node, "qcom,pmic-id",
> +				       &state->pmic_id);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "get qcom,pmic-id failed for rpmh resource\n");

[Severity: High]
Does the unconditional registration of level shifters break the probe seque=
nce
for existing devices that do not utilize them?

pmic_gpio_probe() unconditionally invokes pmic_gpio_register_level_shifters=
()
for any device matching qcom,pmh0101-gpio. If rpmh_get_ctrlr_dev(),
qcom,pmic-id property parsing, or cmd_db_read_addr() fails, the function
returns an error that aborts the entire GPIO controller probe. Existing dev=
ices
do not possess the newly introduced qcom,rpmh or qcom,pmic-id properties,
causing them to encounter a fatal -ENODEV during probe.

> +
> +	/* Allocate array to hold all level-shifter group names */
> +	ls_group_names =3D devm_kcalloc(dev, hw_data->num_ls,
> +				      sizeof(*ls_group_names), GFP_KERNEL);
> +	if (!ls_group_names)
> +		return -ENOMEM;
> +
> +	/* Register each level-shifter pair as a multi-pin group */
> +	for (i =3D 0; i < hw_data->num_ls; i++) {
> +		struct ls_config *ls =3D &hw_data->ls_config[i];
> +		struct ls_pingroup_data *ls_group_data;
> +		char rpmh_resource_name[32];
> +
> +		/* Allocate ls_pingroup_data for this level shifter */
> +		ls_group_data =3D devm_kzalloc(dev, sizeof(*ls_group_data),
> +					     GFP_KERNEL);
> +		if (!ls_group_data)
> +			return -ENOMEM;
> +
> +		ls_group_data->config =3D ls;
> +
> +		/* Compose RPMh resource name and get address from cmd_db */
> +		if (state->pmic_id && ls->rpmh_prefix) {
> +			snprintf(rpmh_resource_name,
> +				 sizeof(rpmh_resource_name),
> +				 "%s%s", ls->rpmh_prefix, state->pmic_id);
> +			ls_group_data->level_shifter_addr =3D
> +				cmd_db_read_addr(rpmh_resource_name);
> +			if (!ls_group_data->level_shifter_addr)
> +				return dev_err_probe(dev, -ENODEV,
> +						     "RPMh resource %s not found in cmd_db\n",
> +						     rpmh_resource_name);

[Severity: High]
Does this code fail to properly defer probing if the command DB (cmd-db) is
not yet initialized?

If the command database is not yet ready, cmd_db_read_addr() swallows the
-EPROBE_DEFER error and returns 0. The driver misinterprets this 0 as a mis=
sing
resource and returns a permanent -ENODEV via dev_err_probe(). The driver mu=
st
explicitly check cmd_db_ready() to correctly defer probing. Otherwise, it r=
aces
with cmd-db initialization and breaks on early probes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-pinctrl-le=
vel-shifter-v1-0-1965461d0a7c@oss.qualcomm.com?part=3D4
