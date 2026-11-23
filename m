Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469184;
	b=W6JySevQQw+gB/qE9wEXdEWHpq3OWRc+KCZjTz2+y42nCDwljNd4Infmh/FIGMLCuwq2
	 UYB0H8U4EyG1GHxxHYaxGIDGbKS62ckEnzho+Kt7Bz4J1QD6RUwlhCBKxxSh/H02AnemN
	 w1aBR3zhHOzTGUVXkwwQ4L4e1BEn6SSOaCE/6a7/lhGbaK7Juir07xvTeaCqQiIewei80
	 xO9zh4p09StKwwifgFmN+MR1i8IKl5DAZI6YMztlXGF8IOv3NQUPQpdv1D2H+Y1R1u3wk
	 Vs05jU6FBGT8hPlANGvWlgMm997LMG6b/Y4bJvVMNGP+KeVmCM/iQU5vdkPGtM9mYOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469184;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wsF3FcMOWXNGCdyKh3w151th1Q3GCd1mjJvb9cvO8Jg=;
	b=s5mWmiJQpgVoy67XzDK/ZBGzG3BD0sEpA+8J6JZ/8MPAsen/hBUPh9fABnwCQOtULTRb
	 z5OjESBzFnKDGQjccjgkeJw4ySCzh+KsQ4BtdnzrfejP8GtF736W3KS6e4jNCZwx0upi1
	 HmorYNpDCTAbGUOjZzaQtIMh9EG8mlY6MPKBa7mYEckgboe6F55MZc0J+HqLLXSMR4j2g
	 N7+fxKxITM2agTTTTVWIz81omzmew4U0MZ8XjpYCr7fVi+tEb30B1u2wm26TIEJos8oYU
	 iHzbiLfz++Ownvge8WELvTR7o7xrFyqLA3PBF0LQ69V/+jhW6qJjHj+JTPdFP9iJuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=6vEAmynK;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5E606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 21:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=6vEAmynK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=wsF3FcMOWXNGCdyKh3w151th1Q3GCd1mjJvb9cvO8Jg=; t=1795469183; x=1796678783; 
	b=6vEAmynK8NdH1vZvFU93tf8Yl7LFRr0KCZuxwt1cvFDfGFK2RdFytQ/sxlH2WY1yDNjkRodrd/h
	3KqDtRyHOHAgC/GxWjuLfcbe5oSv/3L9YyQvc1XluRbKsWR2XscUa+5np3j9xIoRNq4fEktCG46qG
	u7IyiP1A0JU1tKp0M4uI6iXCoJcotODT59cvZBMlJ0aTELLQGQjh2NbAGyAekLLkTGDlxDyy33RUj
	grKlqO20AUjHsrJkeWSLEwMZoK6pF5OGxHcxCdOY3cPNjBo94Y0GJpN9zvwHD4+cKLpCN+QSEaIKz
	8A3zeByqwQPwVmLOAb7ZIoc2+LyL0zyeNo4A==;
Date: Mon, 23 Nov 2026 22:26:15 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@kernel.org, Russell King <linux@armlinux.org.uk>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux@yoavmoshe.com
Subject: Re: [PATCH 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
Message-ID: <20261123222615.7ef78105@kemnade.info>
In-Reply-To: <sashiko-outbox-230043@kernel.org>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
	<20261123-imx6-idlestop-v1-3-e32f1f44e46f@kemnade.info>
	<sashiko-outbox-230043@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026 20:59:52 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ARM: dts: imx: kobo-clarahd: missing Signed-off-by trailer in
>   commit message
> - [High] ARM: dts: imx: overriding gpt1 per clock with 32K CKIL degrades
>   system timer
> --
>=20
> commit f6e6f44334678659ba2ecc2406ebe0d33a2e4544
> Author: Andreas Kemnade <andreas@kemnade.info>
>=20
> > ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer
> >
> > To avoid depending on PLL infrastructure for timekeeping, use 32K timer
> > for the timer. =20
>=20
> [Severity: High]
> The commit message is missing a Signed-off-by: tag.

$ ~/b4/b4.sh prep --check
Checking patches using:
  [...]/kernel/scripts/checkpatch.pl -q --terse --no-summary --mailback --s=
howfile=20
---
=E2=97=8F 6bea654204f1: ARM: imx: enable STOP-ON mode in idle if wakeup req=
uirements permit
=E2=97=8F 3e7a75764adb: timer-imx-gpt: Allow 32K clock to be used as a cloc=
k source
=E2=97=8F 54e9ec84fcf0: ARM: dts: imx: kobo-clarahd: Use 32K clock for the =
timer
---
Success: 3, Warning: 0, Error: 0

That is weird. Checkpatch called via b4 does not complain.=20
but direct call does complain

 scripts/checkpatch.pl -g HEAD
ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 11 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

Commit 54e9ec84fcf0 ("ARM: dts: imx: kobo-clarahd: Use 32K clock for the ti=
mer") has style problems, please review.

>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/=
arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> > index 1000ee8b807aa..2e907c4163629 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> > @@ -46,6 +46,11 @@ &gpio_keys {
> >  	pinctrl-0 =3D <&pinctrl_gpio_keys>;
> >  };
> > =20
> > +&gpt1 {
> > +	clocks =3D <&clks IMX6SLL_CLK_GPT_BUS>,
> > +		 <&clks IMX6SLL_CLK_CKIL>;
> > +};
> > +
> >  &i2c1 {
> >  	pinctrl-names =3D "default","sleep";
> >  	pinctrl-0 =3D <&pinctrl_i2c1>; =20
>=20
> [Severity: High]
> Does overriding gpt1's per clock with the 32.768 kHz IMX6SLL_CLK_CKIL
> degrade system timekeeping on i.MX6SLL, where gpt1 is the only system
> timer?
>=20
> In drivers/clocksource/timer-imx-gpt.c, mxc_clockevent_init() registers
> the clockevent device with a hardcoded min_delta of 0xff ticks:
>=20
> drivers/clocksource/timer-imx-gpt.c:mxc_clockevent_init() {
> 	...
> 	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
> 					0xff, 0xfffffffe);
> 	...
> }
>=20
probably that min_delta should be set to 3 with a 32.768kHz clock as
other drivers do.

> At 32768 Hz, 255 ticks is ~7.78 ms, so clockevents_program_event() clamps
> every timer or hrtimer wakeup below 7.78 ms (including scheduler ticks at
> CONFIG_HZ >=3D 200 and short cpuidle sleeps) to 7.78 ms.
>=20
> At 32768 Hz, mxc_clocksource_init() also reduces sched_clock and
> clocksource resolution to ~30.5 us, and register_current_timer_delay()
> rejects imx_delay_timer because its resolution exceeds 1000 ns, falling
> back to loop-based udelay() on a board with cpufreq scaling.  In addition,
> the GPT clock inputs are internal to the i.MX6SLL SoC, so overriding the
> per clock in the board DTS does not describe board-specific hardware.
>=20
As stated, using that 32K clock has drawbacks, so it is a tradeoff.
Only if this additional idle state improves PM, that drawbacks should be
imposed on boards.=20

Regards,
Andreas
