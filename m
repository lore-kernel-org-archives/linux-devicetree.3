Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BDF472533
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930073; cv=none; b=loiBkAT4Wknl8390N7n36U6ZsoKsWLkj9JF9XGk3KKcalSUHYhrzwVCfWjAORSW1Hv9qhDJeOLrLNCNUvwHFam2m3Q1WPNq29agUyoyQOh3wBQzwWNk/vGdcweuRfeqajqqwNcWyWICwLqDPT1yg5DRiVXbef/9hFRWu+iARxlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930073; c=relaxed/simple;
	bh=sn2pMVMU7IUNkycKgaCGAQRw6LZhMhJVqMMwRJSAP2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Drx/H9hrUSFVL2P11jC3ktYooBMAud++AnzwaT7rlOadSx6HGn7gdyv2CtVeFyB3mtjVNIEIfD2b0tgmtYhGupKP8sTcJ6ntI3aAfzVxC9LuxD/TOgEZJGvh4f4+AU9McedKiTCB4Q7gxY2n/Za6aRxeIRysV4nJyVefLI2gQkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBHmrLYu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBHmrLYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFC21F000E9;
	Fri, 28 Aug 2026 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930072;
	bh=6+6/d6j7Rz2jLO9munwkvZSXhqTl/XbU4BfMw5hl5tg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBHmrLYuXSUOYW0g2OXSH9VxQfqAyJQ9Bk0OTDknSxeSYAQjzTtu+zHKvoEmZc2+C
	 4tJ333JT5AETRugL8Jj7yELn1R6jm/6kkk4qQP/csXUCBBfafsQWBi9Pzfx7CKYnEz
	 SyFc6uQVZfLle2SLZ9p0PNqtZy+C0buiO+Dc5Lf/XKJBYFYdQs2ElWbsu2NB1qF2Oo
	 4DbLHCsV7SAY9ST+TPlwybAVNtpGib1v6VTGzH/mlJbr23SnApqdJbrm9kzLFWePcG
	 b124/zWueHXL2DWxYC52tgIIrgPiwX7yEkUciI/7oMNsPQ/0aNfBbEK223H+wV4MTm
	 i4c8F8v3NuK7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] iio: adc: rzt2h: expose sampling frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260828145943.2077589-7-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260828145943.2077589-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260828145943.2077589-7-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:14:31 +0000
Message-Id: <20260828151431.ACFC21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Spurious -ETIMEDOUT on single reads due to extremely short 1-jiffy=
 completion timeout
--

commit c401ad2e533dc2bc5a1b011d098327c8d7400f4f
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

iio: adc: rzt2h: expose sampling frequency
   =20
This patch exposes the sampling frequency as a per-channel
IIO_CHAN_INFO_SAMP_FREQ attribute to allow userspace control over conversion
time. It derives the frequency from the ADCLK rate and programs the sample
time into ADSSTRn for each enabled channel.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index d76226375f220..2e13f931a2e9a 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c

[ ... ]

> @@ -124,6 +146,8 @@ static int rzt2h_adc_read_single(struct rzt2h_adc *ad=
c, unsigned int ch, int *va
>  	/* Enable a single channel */
>  	writew(RZT2H_ADANSA0_CH_MASK(ch), adc->base + RZT2H_ADANSA0_REG);
> =20
> +	rzt2h_adc_set_sst(adc, ch, adc->sst[ch]);
> +
>  	rzt2h_adc_start(adc, RZT2H_ADCSR_ADCS_SINGLE);
> =20
>  	/*

[Severity: High]
This is a pre-existing issue, but does the newly introduced configurable
sampling frequency exacerbate a spurious timeout bug here?

In rzt2h_adc_read_single(), right below this hunk, the code calls:

	ret =3D wait_for_completion_timeout(&adc->completion, usecs_to_jiffies(1));

Because usecs_to_jiffies(1) evaluates to 1, the timeout is set to exactly
1 jiffy, which will expire at the very next timer tick.

If the tick fires immediately after the wait starts, it aborts almost
instantly (returning 0) before the hardware interrupt arrives, causing the
kernel to intermittently and incorrectly return -ETIMEDOUT to userspace
instead of the actual ADC reading.

Since the patch now allows increasing the hardware conversion delay (up to
268 cycles or ~5.36us at 50MHz ADCLK), does this widen the race window and
significantly increase the probability of this spurious timeout occurring?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828145943.2077=
589-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D6
