Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139BD395ADE
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856695; cv=none; b=J/k6V1+GMi/9nwHRVC4Y1CaJzzxI742AcPH4OmPkdTE9SQ9P4Fja2PcobjSJEXYGL8BAyLUMNqUwcaq12FJ7CTyqTkK2f8Kl9GHNyvVOProvH/Stpsl7LY4IacLTeBAqLFu75kLu2y3+My9KFegbLDk0+CBtHf1wugTk8DVDObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856695; c=relaxed/simple;
	bh=nkKSPbeNQPJuehSYz6DJZi6qSgO8K/wRUdgckdcVdJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XC5aOrSP8tKvKF0DJoU+G+SeZBevKpr49CtL4B+kT2l+it+Q/Kz413KYhy8pDTBSg/x64FQl9Epd97/18wanPMz7W0zJN+wjLU24abg57xCNLUKTPlVv3g0EHY89kcqejE77icMhr7zA/j+64fOmi3vgyrxkbxfxPJHKqm9hUz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1vUIKBD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1vUIKBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD6B1F00A3A;
	Tue,  8 Sep 2026 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788856693;
	bh=1qOEDtLsiilriH7Ow6f4PJknW/aCIesA4qKnvnKuyso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z1vUIKBDb1jLogWbGz7AfRy+Us9hmKoK0O/Wkru3qkhw2b8tIZ5fO38ooVI0HWAtw
	 oB+Gugeyce4XPrtXYwZKLfALAhiWieidtCWzeJl44lbqy+Hym3/gwnFa0isMtj3tFX
	 DLsnAMR1Vx4VQCp1GMSqQAg1bG4RtVIa32PVw8GeMPub1yklsoT/SvuKXPipaOp9oN
	 XruOG5l95dtNeoeBEgEIyPxkTSiymHykjRARp6n61J0BPBTekN89cxaoGe5ODELcbt
	 cl66zNuA+BBP6MKF0kJAmfECab/q3XZPnR3+idFojlNR4XN8VZbmS5fXA5WTV5kpJu
	 lZ08L8UhiEzbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] pwm: add Axiado AX3000 PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-axiado-ax3000-pwm-v4-2-19a03671cd5b@axiado.com>
References: <20260908-axiado-ax3000-pwm-v4-0-19a03671cd5b@axiado.com>
 <20260908-axiado-ax3000-pwm-v4-2-19a03671cd5b@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 08:38:12 +0000
Message-Id: <20260908083812.BFD6B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] axiado_pwm_read_waveform() misreports the physical HIGH output (fr=
om disabled hardware or zero high time) as a logical LOW state (disabled or=
 0% duty). This causes subsequent legitimate disable/0% duty requests to be=
 silently ignored by the PWM framework.
--

commit 18ec5556f23b44b5a016987a2b7c91a3e21eced6
Author: Petar Stepanovic <pstepanovic@axiado.com>

pwm: add Axiado AX3000 PWM driver

This commit introduces the PWM framework driver for the Axiado AX3000 and
AX3005 SoCs. It implements support for period, duty-cycle, and enable-state
configuration using a constant-low hardware representation for the logically
disabled state.

> diff --git a/drivers/pwm/pwm-axiado.c b/drivers/pwm/pwm-axiado.c
> new file mode 100644
> index 0000000000000..e1d4088096949
> --- /dev/null
> +++ b/drivers/pwm/pwm-axiado.c
[ ... ]
> +static int axiado_pwm_read_waveform(struct pwm_chip *chip,
> +				    struct pwm_device *pwm,
> +				    void *_wfhw)
> +{
> +	struct axiado_pwm_chip *axpwm =3D pwmchip_get_drvdata(chip);
> +	struct axiado_pwm_waveform *wfhw =3D _wfhw;
> +	u32 period;
> +	u32 duty;
> +	u32 ctrl;
[ ... ]
> +	ctrl =3D readl(axpwm->base + AXIADO_PWM_CTRL_REG);
> +	period =3D readl(axpwm->base + AXIADO_PWM_PERIOD_REG);
> +	duty =3D readl(axpwm->base + AXIADO_PWM_HIGH_REG);
> +
> +	/* The constant-low encoding doesn't hold the period, so restore it. */
> +	if (period =3D=3D AXIADO_PWM_PERIOD_CONST_LOW) {
> +		period =3D axpwm->cached_period;
> +		duty =3D 0;
> +	} else if (duty > period) {
> +		duty =3D period;
> +	}
> +
> +	*wfhw =3D (struct axiado_pwm_waveform) {
> +		.period =3D period,
> +		.duty =3D duty,
> +		.enabled =3D !!(ctrl & AXIADO_PWM_CTRL_ENABLE),
> +	};
> +
> +	return 0;
> +}

[Severity: High]
Does this mistakenly report a physical HIGH state as a logical LOW state?

When the hardware is physically disabled (ctrl & AXIADO_PWM_CTRL_ENABLE is
0) or the high time is zero, the hardware drives the output HIGH according
to the commit message.

However, axiado_pwm_read_waveform() appears to map a disabled controller
to an enabled state of false, and a zero high time to a duty of 0. Shouldn't
a zero high time be translated to a 100% duty cycle to reflect the actual
physical output?

If the system boots with the hardware disabled or with zero high time, this
logic will cache the state as logically disabled or 0% duty. If a consumer
later requests to legitimately disable the PWM (which requires a physical L=
OW
output via the constant-low encoding), won't the core framework see an
exact state match and short-circuit the update?

This seems like it would silently skip the write operation and leave the
output permanently stuck HIGH when the system expects it to be safely turned
off.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-axiado-ax3=
000-pwm-v4-0-19a03671cd5b@axiado.com?part=3D2
