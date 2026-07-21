Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CA408618
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615625; cv=none; b=ReYTBVvYfSp8/DmIuX9cQxbVgxa+r45BBiO3e3xxkey/cpI0v63kh1wCd71tz/XzJeVtSYo743BMpCbNpNJHEmtvTLfkuSLw6rkplPrss0hsBNbT6lHZgG2Eq6trI+14ILCpdrQn07svzE023R5j3mOL71stdONnQ0cb47Oya/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615625; c=relaxed/simple;
	bh=R2cus8mzMVCi/bdgSb+aiL/ck0VF5LQSm2QuMh4EdSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BgL3M0lCLAPwWmvn0dF/NvQ2Y30d5geu0iYzSUBlziWcScerxbJNUzbtQTO2OfFP88j4jWE6KNaN8+FEemRx4jYOLWn0Wrc43uQXvip0pebeLWbeTltfd2Z+ta1LvQVzIqcH9z/pY0pMKgXKmj6F5NzkH62gm2W02b9bVPETdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyxqWQDH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyxqWQDH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6561F00A3A;
	Tue, 21 Jul 2026 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784615623;
	bh=3DRdl0Tjthb/W1wXvG4iHU/LnJT40of05T4c4nX21hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RyxqWQDH26eo2hqqMDKi/FgWZQKRVW2o2ByUyPwNnOXRx9HZedjpaDgdt4W8POA1x
	 2X8CaVkgLGf9NUs09mzptUsEru93QLg5Pgp63gkoAPjHtipVgMZwwbqbvlDcEFpmMt
	 OLOFy7GFl7sZdnHEjXSATbfBrSsFOsPS70aKY8z+dwnd2MJaL4+nJLAlVlE3bkmSQH
	 WrlfVMUG/j8RavqiQWx6/3WrdBi6covZkITOUwRD1z25C3kPqN6L99PZzVnu23bBsd
	 HpJbdLt84XqTX0ng67w7bC6PpsLN6bih+2pQGko2Hwz0iMUgaLCp845RcpKvoK/rzh
	 AZXMxz32v6nxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260721062308.536947-3-cwweng.linux@gmail.com>
References: <20260721062308.536947-1-cwweng.linux@gmail.com>
 <20260721062308.536947-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:33:43 +0000
Message-Id: <20260721063343.9C6561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The apply callback returns early when !state->enabled, dropping =
updates to polarity, period, and duty_cycle.
--

--- Patch [2]: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller suppor=
t ---
commit cacbb01a99a86c07f6c67c4f1ef4d561c3481e94
Author: Chi-Wen Weng <cwweng@nuvoton.com>

pwm: Add Nuvoton MA35D1 PWM controller support

Adds a PWM framework driver for the Nuvoton MA35D1 EPWM controller.
The driver supports 6 PWM channels, utilizing up-counting, auto-reload,
and independent output modes.

> diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
> new file mode 100644
> index 0000000000000..4073cb72054a2
> --- /dev/null
> +++ b/drivers/pwm/pwm-ma35d1.c

[ ... ]

> +static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +			     const struct pwm_state *state)
> +{
> +	struct nuvoton_pwm *nvtpwm =3D nuvoton_pwm_from_chip(chip);
> +	unsigned int ch =3D pwm->hwpwm;
> +	u64 duty_cycles, period_cycles;
> +	u64 divisor;
> +	u32 cmpdat, period, prescale;
> +	int ret;
> +
> +	if (!state->enabled) {
> +		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POEN,
> +				MA35D1_PWM_POEN_EN(ch), 0);
> +		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CNTEN,
> +				MA35D1_PWM_CNTEN_EN(ch), 0);
> +
> +		return 0;
> +	}

[Severity: Medium]
Does this early return violate the PWM framework API contract by failing to
apply the full requested state?

If a consumer calls pwm_apply_state() with state->enabled =3D false but inc=
ludes
updated polarity, period, or duty_cycle parameters, those changes appear to
be silently dropped because of this early return.

Since nuvoton_pwm_get_state() reads the configuration directly from hardware
registers, wouldn't subsequent state reads return stale values and desynchr=
onize
the PWM core's cached state from the actual hardware configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721062308.5369=
47-1-cwweng.linux@gmail.com?part=3D2
