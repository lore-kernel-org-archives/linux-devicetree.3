Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97AC367B73
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024532; cv=none; b=RxcSS7+dOt8McAduRY1MFDeDlpJi2GnZev6bxvBtb7fPSnjKlJMdnBUsMr/ah47SNA39bcFdyprGIkHrZdZNvYWdN1D/ADnczf9yxI5atCzrrl9emBKxGhI3cKbMHU6k3Wy7A64ew0EtjF+Hbw0hkKGpU6QQRjP1Q5eKvvQoSnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024532; c=relaxed/simple;
	bh=7uOkRA701VIy1v3uc1XWi5GMJ7zgB3SVC4l5FTP++Xs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dLsQ3WOJNdcKxyRUfFoTVZe2ZUgJa0SwaQmiJf8mySRgHn/4wKaJsUIfY5TWCEG0M320j57y5oHwAwbcRg00PnZy1gEqi5W50vmiuLwZngAO/SSnYl1XwHJzEleDUadrXfMhPstZsNo3DuU4UoAm0erRLdlb6fzGvmg1G7Sdyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrB2A+xE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrB2A+xE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676FF1F000E9;
	Fri, 29 May 2026 03:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780024530;
	bh=8JMnxDkodE7vC+K2EBuhTzI+xSgbqCL7v8h6aKBOXgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrB2A+xEz/AfO28QaYUy9LpyJyKpY18IA6UJM2ZKXAd/6oSRWleXxzFnhsLKO8eWI
	 7FeTUFjUef7jLVh2B7TUrKgoRIE93FSGZ0DMxbxEJ2q2RY4s13im8GXFSHEoBHP5+4
	 vGjSz6k7+FwfCSaEmrMPRHoW99c6IKJw2QMUatze6JUzXZd4sAvkqfGiMs6dPREgt/
	 Fd9XbwqxTeUJ9DjbTi4Cm4RqJU2vbvhluDLF6xTGhKOPvbbvk6WmiXElsv+eRgOUcD
	 dX0gmLDGnPpjk51AoqF4gbQPChd0BFn81RUbFLcZofTLc2uURcoHhj2XV2KTBwYYB5
	 qimX4I5tQo4Tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] pinctrl: qcom: spmi-gpio: Add level-shifter
 function support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-pinctrl-level-shifter-v2-4-3a6a025392bf@oss.qualcomm.com>
References: <20260528-pinctrl-level-shifter-v2-4-3a6a025392bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 03:15:29 +0000
Message-Id: <20260529031530.676FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Writing the software-defined `LEVEL_SHIFTER` function index to har=
dware registers causes register corruption.
- [High] Out-of-bounds array access when displaying pinconf debugfs for a l=
evel-shifter pin.
- [High] Use-After-Free of level shifter resources during driver unbind due=
 to reversed devm initialization order.
- [High] Failure to enforce mutual exclusivity between the bidirectional le=
vel shifter and physical GPIO functions.
- [Medium] Missing GET support for the newly added `qcom,1p2v-1p8v-ls-en` p=
in configuration.
--

commit febef2022fa1d171b552bf56874bdc04c2cb463b
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

pinctrl: qcom: spmi-gpio: Add level-shifter function support

This commit introduces bidirectional level shifter support for open-drain
signals. It adds a level-shifter function to the SPMI GPIO driver for speci=
fic
GPIO pairs managed via RPMh.

> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/q=
com/pinctrl-spmi-gpio.c
> index 268cfae706a82..741795ae261ef 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -137,6 +144,7 @@ enum pmic_gpio_func_index {
>  	PMIC_GPIO_FUNC_INDEX_DTEST2,
>  	PMIC_GPIO_FUNC_INDEX_DTEST3,
>  	PMIC_GPIO_FUNC_INDEX_DTEST4,
> +	PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER,
>  };

[ ... ]

> @@ -183,25 +191,86 @@ struct pmic_gpio_state {
>  	{"qcom,analog-pass",		PMIC_GPIO_CONF_ANALOG_PASS,	0},
> -	{"qcom,dtest-buffer",           PMIC_GPIO_CONF_DTEST_BUFFER,    0},
> +	{"qcom,dtest-buffer",		PMIC_GPIO_CONF_DTEST_BUFFER,	0},
> +	{"qcom,1p2v-1p8v-ls-en",	PMIC_GPIO_CONF_LS_ENABLE,	0},
>  };

[Severity: Medium]
Since this commit adds the PMIC_GPIO_CONF_LS_ENABLE property and handles it
in pmic_gpio_pinconf_group_set(), does it also need corresponding read
support?

The driver uses generic pinconf dumps but lacks a pin_config_group_get
implementation, and pmic_gpio_pinconf_pin_get() lacks a case for the new
parameter. This appears to break the symmetry of the pinctrl API, which
might cause programmatic reads of this configuration to fail with -EINVAL.

[ ... ]

> @@ -214,16 +283,16 @@ static const char *const pmic_gpio_groups[] =3D {
>  };
> =20
>  static const char *const pmic_gpio_functions[] =3D {
> -	[PMIC_GPIO_FUNC_INDEX_NORMAL]	=3D PMIC_GPIO_FUNC_NORMAL,
> -	[PMIC_GPIO_FUNC_INDEX_PAIRED]	=3D PMIC_GPIO_FUNC_PAIRED,
> -	[PMIC_GPIO_FUNC_INDEX_FUNC1]	=3D PMIC_GPIO_FUNC_FUNC1,
> -	[PMIC_GPIO_FUNC_INDEX_FUNC2]	=3D PMIC_GPIO_FUNC_FUNC2,
> -	[PMIC_GPIO_FUNC_INDEX_FUNC3]	=3D PMIC_GPIO_FUNC_FUNC3,
> -	[PMIC_GPIO_FUNC_INDEX_FUNC4]	=3D PMIC_GPIO_FUNC_FUNC4,
> -	[PMIC_GPIO_FUNC_INDEX_DTEST1]	=3D PMIC_GPIO_FUNC_DTEST1,
> -	[PMIC_GPIO_FUNC_INDEX_DTEST2]	=3D PMIC_GPIO_FUNC_DTEST2,
> -	[PMIC_GPIO_FUNC_INDEX_DTEST3]	=3D PMIC_GPIO_FUNC_DTEST3,
> -	[PMIC_GPIO_FUNC_INDEX_DTEST4]	=3D PMIC_GPIO_FUNC_DTEST4,
> +	[PMIC_GPIO_FUNC_INDEX_NORMAL]		=3D PMIC_GPIO_FUNC_NORMAL,
> +	[PMIC_GPIO_FUNC_INDEX_PAIRED]		=3D PMIC_GPIO_FUNC_PAIRED,
> +	[PMIC_GPIO_FUNC_INDEX_FUNC1]		=3D PMIC_GPIO_FUNC_FUNC1,
> +	[PMIC_GPIO_FUNC_INDEX_FUNC2]		=3D PMIC_GPIO_FUNC_FUNC2,
> +	[PMIC_GPIO_FUNC_INDEX_FUNC3]		=3D PMIC_GPIO_FUNC_FUNC3,
> +	[PMIC_GPIO_FUNC_INDEX_FUNC4]		=3D PMIC_GPIO_FUNC_FUNC4,
> +	[PMIC_GPIO_FUNC_INDEX_DTEST1]		=3D PMIC_GPIO_FUNC_DTEST1,
> +	[PMIC_GPIO_FUNC_INDEX_DTEST2]		=3D PMIC_GPIO_FUNC_DTEST2,
> +	[PMIC_GPIO_FUNC_INDEX_DTEST3]		=3D PMIC_GPIO_FUNC_DTEST3,
> +	[PMIC_GPIO_FUNC_INDEX_DTEST4]		=3D PMIC_GPIO_FUNC_DTEST4,
>  };

[Severity: High]
Should PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER be added to this array?

If pmic_gpio_pinconf_pin_dbg_show() formats the status of a level-shifter
pin, it dereferences pmic_gpio_functions[function]. For a level-shifter
pin, this would be index 10 (or potentially 12 for non-LV/MV pins), while
the array only has 10 elements.

Could this cause an out-of-bounds memory access that crashes the kernel when
reading pinctrl debugfs?

[ ... ]

> @@ -513,7 +639,8 @@ static int pmic_gpio_pinconf_pin_set(struct pinctrl_d=
ev *pctldev,
> =20
>  	pad =3D pctldev->desc->pins[pin].drv_data;
> =20
> -	pad->is_enabled =3D true;
> +	if (pad->function !=3D PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER)
> +		pad->is_enabled =3D true;

[Severity: High]
The commit message states that the level shifter must be mutually exclusive
with all existing functions and configurations. However, does this code
enforce that exclusivity?

If a device tree simultaneously assigns a normal function to a pin and
enables the level shifter on its associated group, pad->function will be
NORMAL.

Since the check above will pass, it will set pad->is_enabled =3D true,
potentially causing both the physical GPIO output buffer and the external
level shifter to drive the pin concurrently. Could this result in
electrical overstress?

[Severity: High]
Is there a risk of corrupting hardware registers with the LEVEL_SHIFTER
index?

When setting PMIC_GPIO_REG_MODE_CTL for non-LV/MV pins later in
pmic_gpio_pinconf_pin_set(), the driver does this:

        val =3D val << PMIC_GPIO_REG_MODE_DIR_SHIFT;
        val |=3D pad->function << PMIC_GPIO_REG_MODE_FUNCTION_SHIFT;

If pad->function is PMIC_GPIO_FUNC_INDEX_LEVEL_SHIFTER (10, 0b1010),
shifting it by 1 results in 20 (0x14). Since the hardware function field is
only 3 bits, this overflows and overwrites bit 4
(PMIC_GPIO_REG_MODE_DIR_SHIFT).

Since LEVEL_SHIFTER is a software-defined pseudo-function that physically
operates by keeping the pad disabled, should the driver explicitly bypass
hardware register writes for level-shifter pins?

[ ... ]

> @@ -1285,6 +1545,15 @@ static int pmic_gpio_probe(struct platform_device =
*pdev)
>  		}
>  	}
> =20
> +	/* Register level-shifter groups and function if hardware and DT both o=
pt in */
> +	if (hw_data->ls_config && hw_data->num_ls &&
> +	    of_property_present(dev->of_node, "qcom,rpmh") &&
> +	    of_property_present(dev->of_node, "qcom,pmic-id")) {
> +		ret =3D pmic_gpio_register_level_shifters(state, hw_data);
> +		if (ret < 0)
> +			return ret;
> +	}

[Severity: High]
Will this devres allocation order cause a Use-After-Free during driver
unbind?

Earlier in pmic_gpio_probe(), devm_pinctrl_register_and_init() is called to
register the pinctrl device. Then, pmic_gpio_register_level_shifters()
allocates the level shifter resources (ls_group_data, ls_group_names) using
devm_kcalloc and devm_kzalloc.

Because devres releases resources in LIFO order, the level shifter memory
will be freed before the pinctrl device is unregistered. Does this leave a
window where the pinctrl device remains active and exposed to userspace
(e.g. sysfs/debugfs) while its registered groups and functions point to
freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-pinctrl-le=
vel-shifter-v2-0-3a6a025392bf@oss.qualcomm.com?part=3D4
