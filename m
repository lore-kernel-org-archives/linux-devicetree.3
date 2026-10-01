Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D8A43DEB8
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843784; cv=none; b=j39pRfA+rQyhy3yelfS1rysSjsZmnvo7WLAhctec70wLrqlAxV/wBFn56UnmDax0lhqU7KT7DPlxxNY32RrpCfkzDUVTfByCT+6ToEAwHi7I2dU3OjjQn8S6U5h7c1x1D6o0RSBNfyFPFIwmJzGidQMVaZlV04v1VYOcZcx5p6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843784; c=relaxed/simple;
	bh=fGuVxrprWjEsO2IHXCEdPOIQeZch2PX6ouisv0zeaII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tkHhpihJLHOUJxXtwLJPWtUj48z2F7anENhC7t4trK/xVLaMuhAWL2IclZYxyPiIeZfWpsT2CjGB2D2nauOiTjeGw5k67ABeMq7sivcCtIFrxru1SR8MOl+27Z9XekRLEfWzwAt0+syCGlIrCZsLU9dD3ay/IpioYzoFHRaFXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlsdJRyD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlsdJRyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31B61F00898;
	Thu,  1 Oct 2026 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843783;
	bh=5GQd7YtkqleScBXHUSzsRLijCfeJL4BL9lnsmUzazdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NlsdJRyDRHqMfC0CGm2fPR2tFNPOaAMrygzR7cRkb7fZUJfMPFaZO7AD344l2lDTl
	 3OMlnbw0pgY43oxEtmMbDQqrbPXbFB+1t+6aPTd8H8QUsAADBxdbO8UjCfo3FYjBap
	 Vl1Y3tHwE6IjqDIxTdnD0vVK6o3aAj0IsrjW+6QPpTb0RPuVAMDZWb/BaqWVJXcJAV
	 sJ+Zx86DvdtsX5aL+8Nu1lZiKbV/kx4uhDdAar80Ubs1bNVzcah8YaYrn2ZQ5BKayh
	 OXIFXJKqDILJSLsogMsSnAEmC9a2Tzoaq9BQQBYEklBlpMxLWHE4KIPQHXgJyobaLO
	 XdminKdGklT2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] clocksource/drivers: Add support for the Renesas
 RZ/N1 timers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SGVydmUgQ29kaW5hIChTY2huZWlkZXIgRWxlY3RyaWMp?= <herve.codina@bootlin.com>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20261001082225.125956-3-herve.codina@bootlin.com>
References: <20261001082225.125956-1-herve.codina@bootlin.com>
 <20261001082225.125956-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 08:36:22 +0000
Message-Id: <20261001083622.C31B61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] time: rzn1: missing bitwise inversion of down-counter breaks timek=
eeping
- [Medium] time: rzn1: low clocksource rating prevents selection of high-re=
s timer
--

commit 0212f7a729b347a614f1987ed20d902b4286e999
Author: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>

clocksource/drivers: Add support for the Renesas RZ/N1 timers

This commit introduces a new clocksource driver for the Renesas RZ/N1 SoCs
timer block. It provides support for the 8 available timers (6 16-bit and
2 32-bit timers) to be used as clock events, clocksource, and sched_clock.

> diff --git a/drivers/clocksource/timer-rzn1.c b/drivers/clocksource/timer=
-rzn1.c
> new file mode 100644
> index 0000000000000..25ebebff3c639
> --- /dev/null
> +++ b/drivers/clocksource/timer-rzn1.c
[ ... ]
> +static u64 notrace rzn1_sched_read(void)
> +{
> +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_=
REG);
> +}
> +
> +static u64 rzn1_clksrc_read(struct clocksource *cs)
> +{
> +	return readl_relaxed(rzn1_sched_clock->base + RZN1_TIMER_CURRENT_COUNT_=
REG);
> +}

[Severity: High]
The RZ/N1 timer is a down-counter (it uses a LOAD_COUNT register and counts
down to 0), but the sched_clock and clocksource subsystems require
monotonically increasing counter values.

Will returning the raw down-counter value cause the delta between consecuti=
ve
reads to be negative, underflowing into a massive positive time jump? This
breaks core timekeeping, scheduling, and RCU.

Does this require bitwise inversion of the read value (e.g.,
~readl_relaxed(...)) to return an increasing counter?

> +static struct clocksource rzn1_clocksource =3D {
> +	.name =3D "rzn1_timer_clocksource",
> +	.rating =3D 200,
> +	.flags =3D CLOCK_SOURCE_IS_CONTINUOUS,
> +	.read =3D rzn1_clksrc_read,
> +};

[Severity: Medium]
The 32-bit RZ/N1 timer has a higher resolution (25 MHz) than the ARM arch
timer (6.25 MHz), but the standard ARM arch timer has a rating of 400.

Will statically defining this clocksource's rating as 200 prevent it from
being selected over the lower-resolution ARM arch timer?

(Note that the clock event device correctly receives a rating of 460 in
rzn1_timer_clkevt_init_ced() for this exact reason.)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001082225.1259=
56-1-herve.codina@bootlin.com?part=3D2
