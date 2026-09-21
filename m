Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C01A6834
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980842; cv=none; b=RWoUP9eDwarSdHu5jUgzNdkE/9zrpbpF/QB/ZDaXNGUJOP6oJK4M47mPTZJIhmfg4ONdoUwZYEsFbtdr+0+7zd8KBA0ARssBZhkw2AO1PwRX/wgxUFv6atpZm1aj0T9DoclI98ktrrlgb1ZDEW9NIY9gIQswyUnRQjrIS2v4bos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980842; c=relaxed/simple;
	bh=JVw+eq/0XE7vpUeWsHSGNNS2nC7yR0pm9SA7exWM2sI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EY35BSmRc/ek9NU6nORCT5a7yEOJ426uPJWfITTNMfe50+yz2nfqm55Yv1d8Qg2MUm1KxNKh0lt9tGpb5URRoUwi/sSzOHcL0On7nDdZ7iZ2emnqwnlkYzr2eCthKOg9afDQF9at8TCCTmH+AbpbYQooGqlvNNH1/Ro698zgSUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0P5DV0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0P5DV0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFFE1F000FF;
	Mon, 21 Sep 2026 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789980840;
	bh=QyY+vyjLojducOaU2s1AG1eZD9ONu73w+m/Xjyy7pJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F0P5DV0THPpaZalCer02EW8Cz5J/8gypMsqGjaky6LydiqLYGRC1AaF1KefxfoSOu
	 9uYb244gwlMV09cGrwnweHqJtCJvoK866amuYldaiNqziGngyrcWV/bjM+xY8n33zd
	 a+9bgb+5PoX/sBiOtNtuIPtKuHXmK8Xypqi7CitTQCHkQFcTK3YiQREwjQUXM6bXIc
	 fiKVE00dMnvvOCU/ODJlWbRHBpiZeYnvwFBG5/jpIDIM1+iRlJ7M77CbIKS2yDpmC3
	 5rTE0jK00wSdhxnOXKnpvFxX2JB4zYQmMtgLg1/JQO+DGMHmZRnM/rRlrJRaDoC8H0
	 Q9+h/Gr5xsVTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260921083753.1109826-3-zychennvt@gmail.com>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
 <20260921083753.1109826-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 08:53:59 +0000
Message-Id: <20260921085359.DEFFE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] i2c: ma35d1: missing register restore after system resume
- [High] i2c: ma35d1: system suspend aborted by enable_irq_wake failure
--

commit b259b8f6191b7d3a9bf1070672a2bb0522d35137
Author: Zi-Yu Chen <zychennvt@gmail.com>

i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support

This commit introduces the Nuvoton MA35D1 I2C driver, which supports standa=
rd,
fast, and fast-plus modes. The driver provides both controller and target
functionality.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..9b1872b8033f1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
> @@ -0,0 +1,781 @@
[ ... ]
> +static void ma35d1_i2c_reset(struct ma35d1_i2c *i2c)
> +{
> +	unsigned int clkdiv, slvaddr;
> +
> +	clkdiv =3D readl(i2c->regs + MA35_CLKDIV);
> +	slvaddr =3D readl(i2c->regs + MA35_ADDR0);

[Severity: High]
Does this code read a potentially corrupted CLKDIV value from hardware
instead of using a saved configuration?

If the system was suspended and power was dropped, this register might be
lost. The recovery function would then read a default CLKDIV of 0, which is
later written back, permanently corrupting the bus frequency.

[ ... ]
> +static int ma35d1_i2c_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +	int ret;
> +
> +	/* Prepare for wake-up from I2C events if target mode is active */
> +	if (i2c->target) {
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
> +
> +		/* Setup wake-up control */
> +		writel(0x1, i2c->regs + MA35_WKCTL);
> +
> +		/* Clear pending wake-up flags */
> +		val =3D readl(i2c->regs + MA35_WKSTS);
> +		writel(val, i2c->regs + MA35_WKSTS);
> +
> +		ret =3D enable_irq_wake(i2c->irq);
> +		if (ret)
> +			return ret;

[Severity: High]
Could this fail the entire system suspend sequence if the I2C interrupt
cannot be configured as a wakeup source?

If the underlying IRQ controller does not support irq_set_wake() for this
interrupt line (which is common on many ARM platforms without dedicated
wake routing), enable_irq_wake() will return -ENXIO or -EINVAL.

Propagating this error to the PM core violently aborts the sleep transition
whenever target mode is enabled.

[ ... ]
> +static int ma35d1_i2c_runtime_resume(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_enable(i2c->clk);

[Severity: High]
Does this function need to restore the CLKDIV and CTL0 registers?

These registers are lost during a system suspend (S3) if the power domain
drops power.

If the registers aren't restored, the first transfer attempted after system
resume writes STA to an otherwise zeroed CTL0, leaving the controller and
interrupts disabled. This results in a 5-second timeout, after which the
error path resets the controller but writes back a default CLKDIV.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921083753.1109=
826-1-zychennvt@gmail.com?part=3D2
