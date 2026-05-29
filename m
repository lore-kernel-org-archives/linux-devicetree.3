Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FEA18DB1A
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780027517; cv=none; b=m+jsViqnpkjb3tVHGcgN9YN7HyGZ71v7oFc+5e3o2KBxgLxrPSeF2cr8iuCI9/oCzgb1wXkOEv1RoOdb95Kp85/lDwsC7rD4jz4AX6wIFDNqx3aIlIOftVmvvF+LJimpBD2BkTIVEPF1OOMUFU7DqRVaBW0zv7Bxn0SRvky1B8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780027517; c=relaxed/simple;
	bh=x1VS4UR/JdpWVYiWhTtigCNb6MWWAmacrG/WPeg5tK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nydCs60AYacCMC+h7k9KhSJvnlE5wS8aC4/vZdL/Gf1+LC7U9QSEsCHEDQpa7mPfgvJ4vgRMe55jIa+DK6iDLLeVynh0n9DBzQ5iQf/l0HXv+GQxraChNEg5PtIaFHLfZM6hkAxsM5UukfzrtaCC5T4w6KHnwp9z/Udjk3RVcm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ro1Fcayp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ro1Fcayp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD111F00893;
	Fri, 29 May 2026 04:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780027515;
	bh=mena1tK4AnU+anxNQ8NciiOtob8BwjiJE8otWsr9wSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ro1FcaypV591s31vnQGuzo07o3HeTwye3TVttRmEeqtRb1VyTg0L/kxg4EA3sbRD8
	 kzuLg0eVQl1CKyWz/ojGYjkgHE+G9/z62UdEJL2JWpmOU83pvKCriQJRTWZSUqND/Q
	 Q9WE5OlLUyvWywtwEGbwNMwOEJ1pDTWt3kSeLd+pWlMqn2x2neAhPtZLjZpMVeOZvE
	 cvqCYM4zDOJKe+pHm+52kXUIN/coLC0kQiHpuxD95afwwqKHfDuYxJpikwFPpHd6ZR
	 TvzUhX7TPDB8WPsACbTduPsHKIOG37iwHnWRDJqLJE806DCGT0OoucPe+w2Jj7Kt5v
	 bgYpHp9ymhr9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] pwm: tegra: Parametrize duty and scale field
 widths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529-t264-pwm-v5-5-7bf9e405a96a@nvidia.com>
References: <20260529-t264-pwm-v5-5-7bf9e405a96a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 04:05:14 +0000
Message-Id: <20260529040515.3FD111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Division by zero kernel panic in `tegra_pwm_probe` if the retrieve=
d clock rate is less than `TEGRA_PWM_DEPTH` (256).
- [High] Integer truncation of 64-bit PWM state values to 32-bit signed int=
egers in `tegra_pwm_config` leading to a division by zero kernel panic.
--

commit 0c0ba991124cb1c177969041379fb6a95cd2a4c9
Author: Mikko Perttunen <mperttunen@nvidia.com>

pwm: tegra: Parametrize duty and scale field widths

This patch parametrizes the scale field width for the Tegra PWM driver to
accommodate wider fields in Tegra264. It separates the depth value from the
duty field width and removes the duty field width definition.

> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> index c82d537436a0f..7c7b884d44363 100644
> --- a/drivers/pwm/pwm-tegra.c
> +++ b/drivers/pwm/pwm-tegra.c

[ ... ]

> @@ -105,22 +107,22 @@ static int tegra_pwm_config(struct pwm_chip *chip, =
struct pwm_device *pwm,
> =20
>  	/*
>  	 * Convert from duty_ns / period_ns to a fixed number of duty ticks
> -	 * per (1 << TEGRA_PWM_DUTY_WIDTH) cycles and make sure to round to the
> +	 * per TEGRA_PWM_DEPTH cycles and make sure to round to the
>  	 * nearest integer during division.
>  	 */
> -	c *=3D (1 << TEGRA_PWM_DUTY_WIDTH);
> +	c *=3D TEGRA_PWM_DEPTH;
>  	c =3D DIV_ROUND_CLOSEST_ULL(c, period_ns);

[Severity: High]
This is a pre-existing issue, but could this division result in a kernel
panic if period_ns becomes zero?

The core PWM framework provides 64-bit unsigned integers for the duty cycle
and period. When tegra_pwm_apply() passes these to tegra_pwm_config(), they
are cast to 32-bit signed integers (int duty_ns, int period_ns).

If a user sets a period of 4294967296 ns (2^32 ns, roughly 4.29 seconds) via
sysfs, the 64-bit value gets truncated to period_ns =3D 0.=20

Since the DIV_ROUND_CLOSEST_ULL() division occurs before any bounds checking
against min_period_ns, does this allow an unprivileged user with sysfs acce=
ss
to trigger a division by zero exception and panic the kernel?

[ ... ]

> @@ -319,7 +321,7 @@ static int tegra_pwm_probe(struct platform_device *pd=
ev)
> =20
>  	/* Set minimum limit of PWM period for the IP */
>  	pc->min_period_ns =3D
> -	    (NSEC_PER_SEC / (pc->clk_rate >> TEGRA_PWM_DUTY_WIDTH)) + 1;
> +	    (NSEC_PER_SEC / (pc->clk_rate / TEGRA_PWM_DEPTH)) + 1;

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to a division
by zero exception during probe?

If clk_get_rate() returns a rate less than TEGRA_PWM_DEPTH (256) or fails
and returns 0, the denominator (pc->clk_rate / TEGRA_PWM_DEPTH) evaluates
to 0.

Will the subsequent NSEC_PER_SEC / 0 operation cause an immediate kernel pa=
nic
during boot? Should the driver validate pc->clk_rate and return an error if
it is too low?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-t264-pwm-v=
5-0-7bf9e405a96a@nvidia.com?part=3D5
