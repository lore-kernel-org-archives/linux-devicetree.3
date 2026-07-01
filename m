Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084BB2253EC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 03:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782876649; cv=none; b=eJUhpaEJdKemlu4unoJEHz8tywno8XuMZKPgxgeONn8jZYkBM29fwwUU19rTc3Ms/HOmbFml2fKeAbsjEoa2D9dnMbzbFcgJSwFUtk85MgHEAVleSXf4tLh2IxFCUklQoqSrrvViyYALQZ2rSYl+SxJ+2+TXvI8mk7bV0qjnACo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782876649; c=relaxed/simple;
	bh=8CEvaFOXr7nj85sZYsEvvWFQuOabEQqrfW/c4osJlHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rsKgsoKMGrMSAyiXXGXh8nfKqnVzerLlH1L0ErzgFivnd9GLfhqnMsHNeuNwgacYGNiZ3Y5cqboQ9+KAnvsyik2sQKM1tzQgKI6dR+SdoIvjP6gyiPXRZNsP5t/AXtX0CDbCsuox0GXS1a1vUOAYYEn2U3BeEjUhLUG8Kloj/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+Hz/Ldy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+Hz/Ldy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9C21F000E9;
	Wed,  1 Jul 2026 03:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782876647;
	bh=R2YB6btAgBeLG2OlIga+YCpFOhyVqDB2IebzDAlDJws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+Hz/LdyzKyng1ixoPwgFFETB9O2gkYtOkyzbpOLWEJDW0Z+LNiea38fuoSiwgPFj
	 JOBa2TEJ4TEuxmjd8sXL40JozlOwBeMBhGfFjmDidq62ZGlYQs1ZSiLGJ+lsFfYZyw
	 4huqob4fv4gOkY0jYcHdbWUAgtKB6DNWA7C8XJsKaZ9dH6e4s8x9704PRaFUQsFkTy
	 Isgoh9hU08E9O78T5K9RLhTqrdDLRJXGEgDiycDpaFFxWcoPj7ViGxkUWMiuYNTTU4
	 X6IoGWv8/MovZcd1nnHFoIzLn4UAgR78RjGD1kWBmAvyURa2/yU3iXscf5WC39OkmJ
	 WMutyLmvYlgmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] pwm: tegra: Add support for Tegra264
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-t264-pwm-v6-6-2718f61f411f@nvidia.com>
References: <20260701-t264-pwm-v6-0-2718f61f411f@nvidia.com>
 <20260701-t264-pwm-v6-6-2718f61f411f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 03:30:46 +0000
Message-Id: <20260701033046.AF9C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing initialization of CSR_1.DEPTH for Tegra264 can cause inc=
orrect PWM frequency and duty cycle if the hardware reset state or bootload=
er configuration is not 255.
--

commit 3a866062b05a26bd8399e91a9683b58d16e08587
Author: Mikko Perttunen <mperttunen@nvidia.com>

pwm: tegra: Add support for Tegra264

This commit adds support for the Tegra264 PWM controller. It introduces
handling for a new register layout where the enable bit is moved to a
separate CSR_1 register.

> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> index ad75e4ee34102..5cdbe120ba2d8 100644
> --- a/drivers/pwm/pwm-tegra.c
> +++ b/drivers/pwm/pwm-tegra.c

[ ... ]

> @@ -215,6 +257,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
> =20
>  static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pw=
m)
>  {
> +	struct tegra_pwm_chip *pc =3D to_tegra_pwm_chip(chip);
>  	int rc =3D 0;
>  	u32 val;
> =20
> @@ -222,20 +265,21 @@ static int tegra_pwm_enable(struct pwm_chip *chip, =
struct pwm_device *pwm)
>  	if (rc)
>  		return rc;
> =20
> -	val =3D tegra_pwm_readl(pwm, TEGRA_PWM_CSR_0);
> +	val =3D tegra_pwm_readl(pwm, pc->soc->enable_reg);
>  	val |=3D TEGRA_PWM_ENABLE;
> -	tegra_pwm_writel(pwm, TEGRA_PWM_CSR_0, val);
> +	tegra_pwm_writel(pwm, pc->soc->enable_reg, val);

[Severity: Medium]
Will this lead to incorrect PWM frequency and duty cycle if the hardware
or bootloader does not initialize the DEPTH field to 255?

Since CSR_1 is read-modify-written here to set the enable bit, the DEPTH
field (bits 30:15) is left uninitialized and relies on the pre-existing
state from the bootloader or hardware defaults.=20

However, in tegra_pwm_config(), the driver calculates the frequency
divider and duty cycle assuming a hardcoded depth of 256:

tegra_pwm_config()
    ...
    c *=3D TEGRA_PWM_DEPTH;
    c =3D DIV_ROUND_CLOSEST_ULL(c, period_ns);

If CSR_1.DEPTH is not set to 255 (which corresponds to a hardware depth
divisor of 256), could this mismatch result in incorrect frequencies
or clipping of the output duty cycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-t264-pwm-v=
6-0-2718f61f411f@nvidia.com?part=3D6
