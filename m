Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53D42B73B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175212; cv=none; b=MIzUROM6WZ9BHKG68Mq7a2QTV+T+Vy5RQunXCLF6bnxM61FcO2qaPuRQVQm86dJ5Dkq2q0a22xXmQTUklXq36ZsvJvVEbg3G8iLhZLOE9IchY02SbG+uJb7mR2mo07mUOxRU/cBYJXRkhLGZeZDy9ybWmnEfrQoTsxwO9Rduw1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175212; c=relaxed/simple;
	bh=AxnoqDnzufnhL+ZVsj3Fr+Nn3NL3HyosZjk1xJqGOY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eslPRl8XpFyOgr4iiKwoJXqxFj2ls/Akqvdz0g8RdnW/51FKnO1XOr3csBRUn2uwFn4znd62Yodm1mGPDibc8bv6/XWTFxSaZ78FNv3Z38/AJjvV2zS7B2+l6fFVCkyQNLV2GCR3deCreLBJRvgUd8z/EOSOOvfSOrBxE/U19sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1G9NzIB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1G9NzIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387CB1F000E9;
	Mon, 27 Jul 2026 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175210;
	bh=C0fw28Xr3XoLHm6qaaQsosGILvPAjBqhbsOPyD3/YJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1G9NzIBpmYcSRMLg1RMSNz7XP1aINIaJMay2BcNropif0ISmbYrMKDd0+ZTDpB1F
	 7R6I4cavb0Cpr2YVkNechucPO/sZEwEv29eSn2nhGd7Ki3ycbrZbSB9S4MSoff5w5m
	 u012vRNz8UQTS3udJ9NcoMzvWlkuiAbuHJ/t4fx7dbxjO2Lqj0ksllIO/gC4MoKLOV
	 Dg1kcnlQBNCNYtAiSUcjIu8OpuqBbfiaTpLbbjQ+y9q5HP/83INrItoaV4m7bq17L2
	 HIOW0WCC2EQvupUjcvBDx86BAtC8WHq/UVzExq9A5sC89CP7QaTaATjmLWZbr4W5av
	 2l+3dPOCecoQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/35] pinctrl: airoha: an7583: fix muxing of
 non-gpio default pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727174141.664933-12-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-12-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:00:09 +0000
Message-Id: <20260727180010.387CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-binding schema for AN7583 is missing updates for the new 'gp=
io' function and the new PWM pin groups ('gpio49'-'gpio51').
--

--- Patch [11]: [PATCH v8 11/35] pinctrl: airoha: an7583: fix muxing of non=
-gpio default pins ---
commit e4ec6983016069c1ffe244ab5f67a3aac86bb346
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: fix muxing of non-gpio default pins

This commit fixes the pinmux implementation for AN7583 by addressing issues
with pcie_reset pins and PWM pins. It adds new gpio pin groups and a
dedicated gpio function to ensure proper pin mode configuration.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 8815b25edcee7..b7a234ce77558 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -938,7 +963,8 @@ static const char *const an7583_pwm_groups[] =3D { "g=
pio0", "gpio1",
>  						 "gpio42", "gpio43",
>  						 "gpio44", "gpio45",
>  						 "gpio46", "gpio47",
> -						 "gpio48" };
> +						 "gpio48", "gpio49",
> +						 "gpio50", "gpio51" };

[Severity: Low]
Does this change also require an update to the device tree bindings?

The dt-binding schema in=20
Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml still
restricts the pwm function to end at gpio48. Using these newly added pwm
groups in a device tree will cause dtbs_check validation to fail.

[ ... ]

> @@ -1900,6 +1972,7 @@ static const struct airoha_pinctrl_func an7583_pinc=
trl_funcs[] =3D {
>  	PINCTRL_FUNC_DESC("pcm_spi", an7583_pcm_spi),
>  	PINCTRL_FUNC_DESC("emmc", emmc),
>  	PINCTRL_FUNC_DESC("pnand", pnand),
> +	PINCTRL_FUNC_DESC("gpio", an7583_gpio),
>  	PINCTRL_FUNC_DESC("pcie_reset", an7583_pcie_reset),

[Severity: Low]
Should the gpio function be added to the enum of allowed functions in the
airoha,an7583-pinctrl dt-bindings?

Currently, the yaml schema does not include gpio in its allowed mux
functions, which will result in validation warnings if used in device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D11
