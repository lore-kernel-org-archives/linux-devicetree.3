Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9546EF92
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934905; cv=none; b=QCZ4tJzV0n+6jQ/X1XMJ+W7++legisz/YcYKkKu0M/Dnf+/XGQIjqn698RKvykiJJPauqgEpLHm3fsyfdAK8rQjbW+EJQ9OnOuwghsxGqUCDY+Ex1Od95PVpLichWaRn06wj7OK/hMRYILWJJUpk8lzGj0LY3KM+glUVTMQHiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934905; c=relaxed/simple;
	bh=rlezwxAsSt/n9sIxHV1KIlUM40FhdP+GvFyZqumk6XA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tKxf+OPXchptS/vWdAYMxmThdB46c/2lUq49cJPcnU7oLt6SEOelssXMI3r+e+x4lWa8gL4XhBYd07SJbGlB3eOqxBDcNoBb9+RrdeJyBbb2rsWnMErLulPTGtIb92TU3IjiMyVIxRB8WF+UG3JMEGp1CWpKYOzSf0Dtx+ZG0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3OMT+KZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3OMT+KZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2F91F000E9;
	Wed,  5 Aug 2026 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934904;
	bh=CjU96llk/prciewblnNRqDg8c3TdiZlDKd9p3knkfBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3OMT+KZ1V3pj1RoESh+TDHYO55NWx+FS/RokveXgHMBfx20mFkO98VJ+hkIdUU3Y
	 lXDTJ7Armrvp6hiD7+AUAp+xBlR5rqV47QIMH3I+6EU+GwAQbe+V/BMU4tA7n0Tl9Z
	 KkYW0LEWjN7lHJupQ/XqkfnSFvOf++iIksRGMdc9qZe+CVzn//bAhzAUEhIqaMLdCP
	 fH69S20E7lZFAxIB5ZuC0VPW7vngaGN1ypSv5sCenE+zTt554tJ212dZaJavHF/L9P
	 H78IGP9s11mqRYzbnt98rO30GSOfOctoZ2WDaRmwSK3h4tP82X3aHBNFIV2KfCQEV3
	 M1zDD0Oe0W6Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/36] pinctrl: airoha: an7581: fix mux/conf of
 pcie_reset pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805123408.3767648-7-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-7-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:01:43 +0000
Message-Id: <20260805130143.DF2F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing DT Binding Update for new pinmux function and groups.
- [Low] Unused macro AIROHA_PINCTRL_GPIO.
--

--- Patch [6]: [PATCH v10 06/36] pinctrl: airoha: an7581: fix mux/conf of p=
cie_reset pins ---
commit 54ed88634fb21e810e128e4d6842ad8043183d6b
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7581: fix mux/conf of pcie_reset pins

This commit fixes the pin numbering for pcie_reset pins, adjusting them
from 61-63 to 60-62. It also introduces proper pinmux implementations for
setting pcie_reset pins as GPIOs or PWM.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index ffbc7b3c61812..4be694b8ea778 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -907,7 +914,8 @@ static const char *const pwm_groups[] =3D { "gpio0", =
"gpio1",
>  					  "gpio40", "gpio41",
>  					  "gpio42", "gpio43",
>  					  "gpio44", "gpio45",
> -					  "gpio46" };
> +					  "gpio46", "gpio47",
> +					  "gpio48", "gpio49" };

[Severity: Medium]
Does adding the new gpio47, gpio48 and gpio49 groups to the pwm function
without updating the device tree binding schema cause dtbs_check validation
errors?

[ ... ]
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

[Severity: Low]
Is this macro needed? It appears AIROHA_PINCTRL_GPIO is never used in the
driver, as all configurations rely on the AIROHA_PINCTRL_GPIO_EXT macro
instead.

[ ... ]
> @@ -1804,6 +1875,7 @@ static const struct airoha_pinctrl_func en7581_pinc=
trl_funcs[] =3D {
>  	PINCTRL_FUNC_DESC("i2s", i2s),
>  	PINCTRL_FUNC_DESC("emmc", emmc),
>  	PINCTRL_FUNC_DESC("pnand", pnand),
> +	PINCTRL_FUNC_DESC("gpio", gpio),

[Severity: Medium]
Are there corresponding schema updates in the yaml for the newly introduced
gpio function? Without them, a user configuring the gpio function in their
board's device tree might encounter schema validation errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D6
