Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2CC3DD87B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138934; cv=none; b=kTl+c7OIJ88jkZtM7lNaj2W5fhmvMYrcxVAhOV//S0/qd/QG1KckuuCCIu9Eta8J+n3WgdikRauWxjX40FirYd6TLP7Q3hPAkHOxWC/dNn0wEXPT77YHO4taP/MMxsT0luultCzkJflIYN0GturCZ7ABEV+uj6o2zI/xvyn20ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138934; c=relaxed/simple;
	bh=90tbCF3uBbNvD2wMqxOi5fc603kOW1ZdzhxHJCssqn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EZE5+D6Gz8IYqiWg89/S9DEq+r+piFPTC9AYefdRwKNAFsfL5THISuhh3SbyiEJeB1XIhiThxcBa0UwRCG26fEftl5srBNpSSE73y90tDeuolw7f7m9AaZpZ8KC5GcZNIvvHJDtgFRnrnycKy+iGlprZo2YJnGt9tOKJlgtJ/BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kICKNtZi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kICKNtZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA481F000E9;
	Mon, 27 Jul 2026 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138933;
	bh=RS5bpHv8ucRS1t10LV1W+P9jinh9M3mDwq7A1V97Hk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kICKNtZiW1Kpvx2re1VeftBkC0IISLTwhTzDGiveYARqL/P93vavyhSOYSaNN1JuL
	 l6SJfx71cyLeqXnmBjg/JE30YZvkvDDn4AsnefKpLANFcj0QbjeMVd8lMf6zUIGSmC
	 hsgSpZt9/6EqZAXhK7IRrInbmU1KEL8nOJHxsgK6UeDk98vKuTnXYYADhTOl0iMz9N
	 ev+xgW7bcvvu+JBBRb6OJDkKcclzdDNMYgIUUbV6ajJaegi71ejPCofTpBQNHCNXyJ
	 JP/xtHmFl0HJFE8tO4StT7N7nJBwxvlD2u0ZZ8tLDQII+tSjXOJ7nwUu6WVfAcA5bl
	 tdFNt5tU/uWEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/34] pinctrl: airoha: an7581: fix mux/conf of
 pcie_reset pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727074234.3761170-9-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-9-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:55:32 +0000
Message-Id: <20260727075533.1EA481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The `AIROHA_PINCTRL_GPIO` macro is defined in the patch but is neve=
r used anywhere in the codebase.

Pre-existing issues:
- [High] The patch corrects the PCIe reset pinmux polarity for the EN7581 S=
oC but neglects to fix the identical issue for the AN7583 SoC, leaving its =
PCIe reset functionality broken.
--

--- Patch [8]: [PATCH v7 08/34] pinctrl: airoha: an7581: fix mux/conf of pc=
ie_reset pins ---
commit a65ef4d0c5f236d794130131b423b8c2bc834683
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins

This commit corrects the pin numbering for PCIe reset pins on the AN7581
SoC to match the datasheet. It also fixes the pinmux configuration so that
selecting the PCIe reset function correctly enables it, rather than setting
the pins as GPIOs.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index cad56ac3c0614..4bbda392625ad 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -1405,6 +1413,45 @@ static const struct airoha_pinctrl_func_group pnan=
d_func_group[] =3D {
>  	},
>  };
> =20
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

[Severity: Low]
Is it necessary to include AIROHA_PINCTRL_GPIO? It looks like this macro
is defined but never used anywhere in the codebase.

> +
> +#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
> +	{							\
> +		.name =3D (gpio),					\
[ ... ]
> @@ -1430,7 +1477,7 @@ static const struct airoha_pinctrl_func_group pcie_=
reset_func_group[] =3D {
>  			AIROHA_FUNC_MUX,
>  			REG_GPIO_PON_MODE,
>  			GPIO_PCIE_RESET2_MASK,
> -			GPIO_PCIE_RESET2_MASK
> +			0
>  		},
>  		.regmap_size =3D 1,
>  	},

[Severity: High]
This is a pre-existing issue, but by fixing the PCIe reset polarity for
the EN7581 SoC here, does the identical issue remain for the AN7583 SoC?

Looking at an7583_pcie_reset_func_group, it still configures the pins as
GPIOs rather than PCIe resets by using GPIO_PCIE_RESET0_MASK:

static const struct airoha_pinctrl_func_group an7583_pcie_reset_func_group[=
] =3D {
	{
		.name =3D "pcie_reset0",
		.regmap[0] =3D {
			AIROHA_FUNC_MUX,
			REG_GPIO_PON_MODE,
			GPIO_PCIE_RESET0_MASK,
			GPIO_PCIE_RESET0_MASK
		},
		.regmap_size =3D 1,
	},
...

Should an7583_pcie_reset_func_group be updated similarly to ensure PCIe
reset works correctly on the AN7583 SoC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D8
