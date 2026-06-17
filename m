Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843DF2E739F
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665750; cv=none; b=i23hn+Qey+nGUiWl7RcFE+laYUgnvmqvVelRblGh0/4LflV+SykdnlmEBxPmgCDxuI8Xel/ujSPjc+tluheoWQVBL6RvlHvQU83fvqRohy4i/7dQ7LwxeM8afa+5iBHbUqhQ06KDwCYdjNDXlzx/LOD/INkOtGwRgJFYET7aqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665750; c=relaxed/simple;
	bh=JAD8vh19oFIVK0ryhsPUAYGd5203o6gGYOwQSDFXVLo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L8yVofPhrn5wzSO64RCvThxmStOwSViKMyF9SPNunAq5J+TvsS7Ik2nsW4RqUX4PvqX3YfuqGkaaeXIhf4gtCXxrxi4hHKBvhD9IDfKhCE7Iyivl9uNRQpsr/FmOO6G446ypP0fwB7ZjzD9Y+SE6K2jRj6+lzygvaT+oEmTqQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oY3jSRjn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oY3jSRjn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68541F000E9;
	Wed, 17 Jun 2026 03:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781665749;
	bh=ZhZ5uSD3aNcSmm/CdO2KI2x9ez4wBX7Ff38ACkgqM7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oY3jSRjnm9jU3UTRM5enhu736B07AYC06HQNRIc/FbVdFs8yPnsjRKQd225XPijDw
	 rMXSwZzEhgvt5INLMLw/Y1c/lGTM9Wuxxi2V7G5+jxEwdM0b3Gefetn1UTpz8rubxY
	 QejKFPH63s2K03xaGS/DTMsae2s67efMwQDo8MQpyDYTbKKOrLPwkwz4gQ139tnBGH
	 NtH6YwwasUguWKfaWZIW9e1JNngFNwt8lctrNmTxZMe97ORfL80QIp2UxPFQGPlDNX
	 nD9Od5otV991aVhiDQTz4QVBQrLTJKYrBN+Dzz2Po4essMTuX1eh7VZIaOXhLOY98Z
	 UmxjjCaOj3iEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617025925.2539334-3-cwweng.linux@gmail.com>
References: <20260617025925.2539334-1-cwweng.linux@gmail.com>
 <20260617025925.2539334-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 03:09:08 +0000
Message-Id: <20260617030908.D68541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver unconditionally clobbers PWM waveform generator and c=
ontrol registers in probe(), breaking seamless handover for active PWM chan=
nels.
--

commit 1c5d12cc5f94bf9ab4e36bc34c306ce883661f7e
Author: Chi-Wen Weng <cwweng@nuvoton.com>

pwm: Add Nuvoton MA35D1 PWM controller support

Add a PWM framework driver for the Nuvoton MA35D1 PWM controller.

> diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
> new file mode 100644
> index 0000000000000..c07eedeca035b
> --- /dev/null
> +++ b/drivers/pwm/pwm-ma35d1.c

[ ... ]

> +static void nuvoton_pwm_init(struct nuvoton_pwm *nvtpwm)
> +{
> +	u32 ctl1_mask =3D 0;
> +	u32 wgctl0_mask =3D 0;
> +	u32 wgctl0_val =3D 0;
> +	u32 wgctl1_mask =3D 0;
> +	u32 wgctl1_val =3D 0;
> +	int ch;
> +
> +	for (ch =3D 0; ch < MA35D1_PWM_NUM_CHANNELS; ch++) {
> +		/* CNTTYPEn =3D 00: up counter type */
> +		ctl1_mask |=3D nuvoton_pwm_ctl1_cnttype_mask(ch);
> +
> +		/* CNTMODEn =3D 0: auto-reload mode */
> +		ctl1_mask |=3D MA35D1_PWM_CTL1_CNTMODE_MASK(ch);
> +
> +		/* ZPCTLn =3D 10: output high at zero point */
> +		wgctl0_mask |=3D nuvoton_pwm_wgctl_zero_mask(ch);
> +		wgctl0_val |=3D MA35D1_PWM_WGCTL_ZERO_HIGH(ch);
> +
> +		/* PRDPCTLn =3D 00: do nothing at period point */
> +		wgctl0_mask |=3D nuvoton_pwm_wgctl_period_mask(ch);
> +
> +		/* CMPUCTLn =3D 01: output low at compare up point */
> +		wgctl1_mask |=3D nuvoton_pwm_wgctl_cmp_up_mask(ch);
> +		wgctl1_val |=3D MA35D1_PWM_WGCTL_CMP_UP_LOW(ch);
> +
> +		/* CMPDCTLn =3D 00: do nothing at compare down point */
> +		wgctl1_mask |=3D nuvoton_pwm_wgctl_cmp_down_mask(ch);
> +	}
> +
> +	for (ch =3D 0; ch < MA35D1_PWM_NUM_CHANNELS; ch +=3D 2) {
> +		/* OUTMODEn =3D 0: independent mode */
> +		ctl1_mask |=3D MA35D1_PWM_CTL1_OUTMODE_MASK(ch);
> +	}
> +
> +	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CTL1, ctl1_mask, 0);
> +	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_WGCTL0,
> +			wgctl0_mask, wgctl0_val);
> +	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_WGCTL1,
> +			wgctl1_mask, wgctl1_val);
> +}

[ ... ]

> +static int nuvoton_pwm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (nvtpwm->clkrate > NSEC_PER_SEC)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "PWM clock out of range (%lu)\n",
> +				     nvtpwm->clkrate);
> +
> +	nuvoton_pwm_init(nvtpwm);

[Severity: Medium]
Will this unconditionally clobber the waveform generator and control
registers for all channels during probe()?

If the bootloader has already enabled a PWM channel (such as for a regulator
or display backlight) with a different waveform configuration, altering the=
se
global control registers while the channel is running might corrupt its out=
put.

Also, since nuvoton_pwm_get_state() relies on PERIOD and CMPDAT values,
altering their hardware interpretation here means the PWM core will inherit
an incorrect initial state.

Should the driver check if channels are already active via CNTEN and POEN
before modifying their configuration to allow for a seamless handover?

> +
> +	chip->ops =3D &nuvoton_pwm_ops;
> +	chip->atomic =3D true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617025925.2539=
334-1-cwweng.linux@gmail.com?part=3D2
