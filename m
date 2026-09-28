Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA7413787
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606889; cv=none; b=DgeOIyNyH/2rn91l9QwBrwtwv8ScqvfANTsUHCo/FLr+ltE9m8mwokZX7UwR2efqYjcoPqG9VP4cC+Ix3HY6HfWp6mfxcMPCuFRebab6AvdxR8kcMAFy0meT/VrRXdL7c6yeql7KC2/g2bUQVAh0O6fgPiUGObFJA2nzXBPAEYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606889; c=relaxed/simple;
	bh=aUhpMQgSf7DIKDCNTzlyTi2ghkDy3aQnWb4lFGFouf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IJb5DsNZ02XLMcbIRqgksPiilXJ9eSIgBfX98PnZ3mHHwnC0Y6UPEgjs0kIeUwNyi1IjH7hqHiegriUCAul/T7SBEYTSqqvtsK7B39IWlFaHPtVPrdfC1McG8bObmalszBFhfi2Qhw85dfcB1Eh9R1gBagQGZYhLg/gKFPSM4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZ/evEyp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZ/evEyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E921F000FF;
	Mon, 28 Sep 2026 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790606888;
	bh=RHW+gLRI7YclUOb4PnaCswXIPWucHFQ9PPY5uG+eJdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZ/evEypykFQijZbPFuGiwyFQbrd1hvYOKhkfCTVSUJmo4bIixGZmMARhzGuuAkam
	 u2XsTiNQwp7JA7bV/oSYV0tkV3nJq05kd0Z6kav3Xgi62Q3aYOtoPFDcta81FIpLrG
	 cRKNV7hweYGa9168E1iOHrw9A2XJ01BYqRedX2jhSuDZk2Ag3YNf+jRaga6RQ7fuFd
	 HkCQugSskhNaVd9pEeHNVdzoPkGjrMdua+4jRCi/xZ86J4govz0GqNxbTQdLluk2C9
	 a5wbl3NevoOF0xfdP6dSgAzNWLfrcy81DGyhZVeU1dCYitKi6JNz2O3IUth23J7wRq
	 wWVGoOV3NQtzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <b26a359bb0b8f8637955cf3428d0db5137d932e1.1790606188.git.andrea.porta@suse.com>
References: <cover.1790606188.git.andrea.porta@suse.com>
 <b26a359bb0b8f8637955cf3428d0db5137d932e1.1790606188.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:48:07 +0000
Message-Id: <20260928144807.C4E921F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pwm: rp1: channel control register state loss across suspend
--

commit b77b6f077f5aa3ca8ba16d313a2e9952c97e47f7
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver
   =20
The Raspberry Pi RP1 southbridge features an embedded PWM controller with 4
output channels. This patch adds the supporting driver.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..a993b86a5bf85
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c

[ ... ]

> +static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	u32 value, polarity;
> +
> +	/* init channel to reset defaults, preserving the polarity bit */
> +	value =3D readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
> +	polarity =3D FIELD_GET(RP1_PWM_CHAN_CTRL_POLARITY, value);
> +	value =3D u32_replace_bits(RP1_PWM_CHAN_CTRL_DEFAULT, polarity, RP1_PWM=
_CHAN_CTRL_POLARITY);
> +	writel(value, rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));

[Severity: Medium]
Will this channel control mode configuration be lost if the hardware loses =
power
or is reset during system suspend?=20

The required MODE_TE_MS and FIFO_POP_MASK settings are initialized here, but
they do not appear to be restored anywhere on resume.

> +
> +	return 0;
> +}

[ ... ]

> +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> +				  struct pwm_device *pwm,
> +				  const void *_wfhw)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u32 value, ctrl;
> +
> +	/* set polarity */
> +	value =3D readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
> +	if (!wfhw->inverted_polarity)
> +		value &=3D ~RP1_PWM_CHAN_CTRL_POLARITY;
> +	else
> +		value |=3D RP1_PWM_CHAN_CTRL_POLARITY;
> +	writel(value, rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));

[Severity: Medium]
If the channel control register loses its state across suspend, could this
read-modify-write operation preserve the corrupted state?

If a PWM consumer calls pwm_apply_state() upon resume, it would invoke
rp1_pwm_write_waveform() and read the potentially zeroed state, modify only=
 the
polarity bit, and write the corrupted state back. This would cause the PWM
channel to fail to output correctly since the proper mode settings are miss=
ing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/ee0aa89faa14e0073f1=
271693bae28678652998b.1790606188.git.andrea.porta@suse.com?part=3D2
