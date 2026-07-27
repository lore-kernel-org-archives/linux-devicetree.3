Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED123393B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139535; cv=none; b=l32OPNiCsJSEsBTiiACG+Sh/u3zUuRlKDseMWg4+zWEP9XXcK1lxmLqVvrgOZ6NNJcBQVYd4eIrF/Eehl+c3BgYO4BqWqgX0itKQwCOkP4CXqfFAU70M11IK9wyzTguQQCqjvR27KuodPoKy+zf0Tdi090tCeowvcDiOzrNOLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139535; c=relaxed/simple;
	bh=RE5L3mjkYv3SK1cScHTbEC3pCa6lDLdvNMXZcVDVRCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gc8bDkYzG34xGcXe8NL8ylZfvmkvmhCFvRcz6LcvSw7L60F1BEt3Ih5ymIJjgVxQxIh3NyclWgBq7uTidOO5v11FyRq7LJHdsqTnvddkvpMCMNLQQHNrIIoLG9fy+YF/m8Y1DEu0pfVF84TcCPbhZDHTaYTIblsVJzrTQShEDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEdal9rh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEdal9rh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936501F000E9;
	Mon, 27 Jul 2026 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139533;
	bh=S5XvHeuVqjUArI7UHXv21CO6eJVBYHnLYqlVb88bBUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PEdal9rh3YA4j3G6yoEz/UHwsyFfYs5zWc4Xxfd4gTFly9DF2/N5gKQyMaIjBVJXV
	 fb+BbetPM+yI3E25SRgMsUmViIhlpB6bZ+jZKa8EkBYZrvnaR9qFiJMyvJ4MVS2lnG
	 SjY33GJsY4JlnwMWYcz4oZCfRV0fzEch3zibsQFRwsWTNYPJaQVN3NgiVV6U4IofIi
	 RcF15vXV4sc7+1TEqC4pi3H4lCTm2tnC1310r8NEYeT2BTqoy2vgIRk/CtGvSiWMal
	 ud5Mtx+FaKhPC0mWyk3jOimoHqWP9J5qNkJyLntidt+DWg5nTSp2RDrHygjYfcc+sa
	 iVUQ9Zc0f7Xrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 26/34] pinctrl: airoha: an7583: add support for
 pon_alt pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727074234.3761170-27-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-27-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:05:33 +0000
Message-Id: <20260727080533.936501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The introduction of the `pon_alt` pinmux introduces a new mux bit =
for pins 36-40 (gpio34-gpio38) but fails to update the GPIO and PWM functio=
ns to clear this bit, rendering these pins permanently stuck in `pon_alt` m=
ode if left enabled by a bootloader or dynamically switched by Linux.
--

--- Patch [26]: [PATCH v7 26/34] pinctrl: airoha: an7583: add support for p=
on_alt pinmux ---
commit b1dabfb03ae8c035084ec1f24b413e2c3334d17a
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: pinctrl: airoha: an7583: add support for pon_alt pinmux

This commit adds support for the pon pin function using the pon_alt pin gro=
up.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 9b5c7ea5e5472..7e94dcb3b61a5 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c

[ ... ]

> @@ -629,10 +632,19 @@ static const struct airoha_pinctrl_func_group pon_f=
unc_group[] =3D {
>  		.regmap[0] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_PON_MODE,
> -			GPIO_PON_MODE_MASK,
> +			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
>  			GPIO_PON_MODE_MASK
>  		},
>  		.regmap_size =3D 1,
> +	}, {
> +		.name =3D "pon_alt",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_PON_MODE_MASK | GPIO_PON_ALT_MODE_MASK,
> +			GPIO_PON_ALT_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
>  	},
>  };

[Severity: High]
Since pon_alt uses pins 36-40 (gpio34-gpio38) and sets GPIO_PON_ALT_MODE_MA=
SK
in REG_GPIO_PON_MODE, do we also need to add these pins to gpio_groups[]?

Currently, gpio34 through gpio38 appear to be missing from gpio_groups[]:

drivers/pinctrl/airoha/pinctrl-an7583.c:gpio_groups[] {
    ...
    static const char *const gpio_groups[] =3D {
    	"gpio39", "gpio40", "gpio41", "gpio42", "gpio43",
    ...
}

Without being in gpio_groups[], it seems impossible to select the "gpio"=20
function in the device tree to clear the pon_alt mux bit.

Additionally, will these pins get stuck in pon_alt mode if requested as PWM?

The PWM mapping for pins 36-38 uses AIROHA_PINCTRL_PWM_EXT:

drivers/pinctrl/airoha/pinctrl-an7583.c:pwm_func_group[] {
    ...
	AIROHA_PINCTRL_PWM_EXT("gpio36", GPIO36_FLASH_MODE_CFG),
	AIROHA_PINCTRL_PWM_EXT("gpio37", GPIO37_FLASH_MODE_CFG),
	AIROHA_PINCTRL_PWM_EXT("gpio38", GPIO38_FLASH_MODE_CFG),
    ...
}

This macro only seems to modify REG_GPIO_FLASH_MODE_CFG_EXT and does not cl=
ear
the GPIO_PON_ALT_MODE_MASK bit in REG_GPIO_PON_MODE. If a bootloader leaves
these pins in pon_alt mode, or if they are dynamically switched, won't the =
PWM
output fail silently because the pins remain multiplexed to pon_alt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D26
