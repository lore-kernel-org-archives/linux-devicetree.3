Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158BB2701DC
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579861; cv=none; b=R5NfQr9GOeAkeZYaOIOfntCZqfNMTmYU1naXN4GYNH13/vhl2hkODqpR9mCBwVknTgcQ3WFNarkOhgIaN0iBO/cdE+vajFzIA036xU67I4QWAPg+/VU0VvGzmFW+VvbbgKe3+NkAxpkBRFkzlqN+9u8GYLEpUO30tiC8GPJe23U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579861; c=relaxed/simple;
	bh=3tYlN6P93a5TWxYfGbSaO4vFQpLeDqXojeN7/BBFhwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CoNNHtvwwb25caoGYvBr3+mXxm/W4TewcSQPEC625ThTgjjD6pcGxIRTTY2vPccnwW102YX05Qwpo3tdXnVAUvDFsW2HYE+2jqYKowz7Fl5iIRgCXkOwOenhpbGuCUhCuP/caTdPNjkskFIc9CWjpwmyfo6LB+yZuo66XOw9kgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+EX0MxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+EX0MxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752CA1F000E9;
	Sat, 27 Jun 2026 17:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782579859;
	bh=jX2xF7kk2wDJ0AmMifASqGO5serm4SZZOEi7hxjjcl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k+EX0MxBkHL+5k15Syyt6sa+ByAv5k8lbcEsQ+4COTmWjORQZ+PlZUseYr3/CICmm
	 Hdfd8GiE6LZNceSHMKwbv9+bWI6bI+yDHxHMir0xqVpg9SHsf59hGhbYRaqYpciu2Y
	 vJnda4svu6h9bbkpXa3syXgRg5znfhqCWX/pNuIR15d1yY1K1F3lpsgJxacqdjsQ5g
	 kGSBnCqb0j4hQD/lkkDSy8zvpl5PURgfnoUU6XvSpmqZzNv5UFcPh2uj/nNoqWo0Nz
	 eozK6sGH2G3rn6FsMXLSol3d6wPDlL1Ra3EdT7GGg2oCEswbUINaIeLhHQJX7TelXK
	 U80oufsypjqfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] pinctrl: samsung: Add Exynos8855 pinctrl
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260627171228.2687857-4-alim.akhtar@samsung.com>
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165414epcas5p183d43baad4cbc682cdc8aeca5f4b427a@epcas5p1.samsung.com>
 <20260627171228.2687857-4-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 17:04:18 +0000
Message-Id: <20260627170419.752CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect Wakeup Interrupt Initialization Callback for CMGP pin co=
ntroller
--

commit 603cd3e67c5aa008772144faa081414df87774ab
Author: Alim Akhtar <alim.akhtar@samsung.com>

pinctrl: samsung: Add Exynos8855 pinctrl configuration

Add pinctrl configuration for Exynos8855. The bank type
macros are reused from EXYNOS850 and GS101 SoC.

> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index fe9f92cb037ea..1aa977d2a1f80 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
[ ... ]
> +static const struct samsung_pin_ctrl exynos8855_pin_ctrl[] __initconst =
=3D {
> +	{
> +		/* pin-controller instance 0 ALIVE data */
> +		.pin_banks	=3D exynos8855_pin_banks0,
> +		.nr_banks	=3D ARRAY_SIZE(exynos8855_pin_banks0),
> +		.eint_wkup_init =3D exynos_eint_wkup_init,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> +	}, {
> +		/* pin-controller instance 1 CMGP data */
> +		.pin_banks	=3D exynos8855_pin_banks1,
> +		.nr_banks	=3D ARRAY_SIZE(exynos8855_pin_banks1),
> +		.eint_gpio_init =3D exynos_eint_gpio_init,

[Severity: High]
Does this incorrectly assign the GPIO interrupt initialization callback ins=
tead
of the wakeup interrupt initialization callback?

Looking at exynos8855_pin_banks1, the banks are defined using
GS101_PIN_BANK_EINTW, meaning they are marked as EINT_TYPE_WKUP.

If .eint_wkup_init is NULL and .eint_gpio_init is used, exynos_eint_gpio_in=
it()
will skip these banks because they are marked as EINT_TYPE_WKUP.

Will this cause external wakeup interrupts on the CMGP pin controller to fa=
il
since their IRQ domains are never initialized?

> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> +	}, {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627171228.2687=
857-1-alim.akhtar@samsung.com?part=3D3
