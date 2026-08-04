Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37AB4746D4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860833; cv=none; b=dGDaUb3C/1/nvbUq/IrZrAjj9Dw3nrUliV4gdwyArpYJQ+3qLr67ehpzBJFp3MYgqGJlm8XxU6RI9nrr54opqQZ8cPmvm7PUhFNSDSvfSrg5JCPs8WVG8PvpPLPuVPTolCTho3Of00t2PvdZyjfuJHgMBAtIDO+Pp4xKsK4TF/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860833; c=relaxed/simple;
	bh=ijDd0o74DOLs/yuSC2y0dxfzHLCZ+Sf1rIm0d+BESWE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Weth4AZ5meqmOA/IO2I+Vsqw4WXIczqnwQclDzglepbGh3n3+c0VMM4S8RQhDUxVYiKw6HkGLnZ9XRTPV7CFv9qDS7T2duLXd8sUr969biErGbhBRNVGwBRFVS925M+D84nbNsgw/0ZnJLBTn9mH5NyZ/8H1QSJXUND43oVX2dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSzD1rdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSzD1rdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342551F000E9;
	Tue,  4 Aug 2026 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860832;
	bh=DO5zvOTbMO116eGAKrv8r6HWaCa0sNUKBAY+KK5Tzus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SSzD1rdt6jHhkRYxvWV/G+Ej26YXPvcOb+fC80DKe9/T2w+ORisqgnmIpmhPQnI1j
	 j9llNMX2NWyAofIT6EjV5r+iLesEZozZHMxZvBQe0jLLOszc+WIY6hD68bFugUkJW1
	 Yq99SoZ3umWpkhBVPcLatyV1WUFU9y7R5hGBnI5bjaH4KOz6yrCG16HrFarVk02vjV
	 WwDkKRL1p7jt2+1FfDvWSbJ3/p7eNmvaedQSQEXYlO4fNIf14Ad4ykVLtC/twQW1WI
	 YODUjnLMrpDqsJ+dpULLbLh7gyclj09BKfiPhdUioWWcxPBTEyVabfm91npuxmA0VG
	 wfauf3QLIl8RQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/36] pinctrl: airoha: an7581: fix mux/conf of
 pcie_reset pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804160419.3592327-7-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-7-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:27:11 +0000
Message-Id: <20260804162712.342551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The newly introduced `AIROHA_PINCTRL_GPIO` macro is completely unus=
ed.

Pre-existing issues:
- [High] The patch fixes the pcie_reset pin muxing for EN7581 by clearing t=
he mask in REG_GPIO_PON_MODE, but fails to apply the identical fix to AN758=
3.
--

--- Patch [6]: [PATCH v9 06/36] pinctrl: airoha: an7581: fix mux/conf of pc=
ie_reset pins ---
commit c635409b9a1090e964e56f47b67fd7f0f0235294
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins
   =20
This commit fixes the pinmux configuration for pcie_reset pins on the EN7581
SoC by mapping them to the correct pins (60-62) and updating their muxing
logic to allow proper configuration as PCIe reset, GPIO, or PWM pins. It al=
so
introduces new GPIO and PWM macros to handle the corrected pin functionalit=
ies.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -1406,6 +1414,45 @@ static const struct airoha_pinctrl_func_group pnan=
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
> +

[Severity: Low]
Is this AIROHA_PINCTRL_GPIO macro used anywhere? It appears that only the
AIROHA_PINCTRL_GPIO_EXT variant is actually used to configure the new GPIO
functions for pins 47, 48, and 49 below, leaving this base macro unused.

> +#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)	\
> +	{							\
> +		.name =3D (gpio),					\
> +		.regmap[0] =3D {					\
> +			AIROHA_FUNC_PWM_EXT_MUX,		\
> +			REG_GPIO_FLASH_MODE_CFG_EXT,		\
> +			(mux_val),				\
> +			0					\
> +		},						\
> +		.regmap[1] =3D {					\
> +			AIROHA_FUNC_MUX,			\
> +			REG_GPIO_PON_MODE,			\
> +			(smux_val),				\
> +			(smux_val)				\
> +		},						\
> +		.regmap_size =3D 2,				\
> +	}
> +

[ ... ]

> @@ -1431,7 +1478,7 @@ static const struct airoha_pinctrl_func_group pcie_=
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
This is a pre-existing issue, but while this patch fixes the multiplexing
for en7581 by setting the hardware mux value to 0 here in
pcie_reset_func_group[], should the identical fix be applied to
an7583_pcie_reset_func_group[]?

Looking at an7583_pcie_reset_func_group[] further down in the file, it still
sets the hardware mux values to GPIO_PCIE_RESETx_MASK instead of 0, which
would cause the AN7583 PCIe resets to continue being incorrectly multiplexed
as GPIOs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D6
