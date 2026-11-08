Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174523;
	b=wbNcyQbJrCxZdODbLRnVtObTE/LvEGdUvYIK7RcosoUkscO3LkZJxa0SQiZke3GFjH8Q
	 o5e66j6JICcVZPSNF+e3mrjZ16Hvrr21VBWjdqyqGPvEwEKiyzed1xQmKer1WWEQEMAlW
	 pJICPGHOZlL36ozOi6kvO/YzhjYOPIkD31gTBLCelwTpsjK+O6KIEwcrmbCHHHLOfYoGZ
	 vq6Mt/5wueljzTGOstP3/CLkT2aV13Rqo5dHWGbubQmyrXz0BzlzhaVLacqW8HA2JnHlN
	 TBS/iU6eWr60k8z6lovRJVAE0lasXgkjyxwsx+Kphx6qTazE5nw7C/Mr3xXjVf42qzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174523;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2klD/Pgrnp8XUXgta1oWT8X4gL+2YBbpG94HlALOnLY=;
	b=nSACC/NarGcvzX6HWtpxggC1Mhb9xaeJJnKkDGEcrEqP9hltIN/EsLfbUGdXRRnLNGLV
	 DRaaVtag6yhgknw8BizjO/s6M3tGPKNgueueK9JZEz2ThjOYci3M2/CJkrtOoR4R5k8F5
	 rXBZnl2/0wTiU/gpkZg7tI18iiZxlJhOjfoequzOfVAtwP6GvoR+sxa9MfbUB2bAPji1q
	 H+naIit7eBe5pWbwcjy/jxaoiL8ftkxrATi0znnOFtCzi1y8KZtEmovBFbijflR3YLGCL
	 fIP8Q9xc1A0j4t9THFVCw2DRnSEhGr5nJTcZeaCDEmwNDiquPKIxOuK+x3fsn2AudSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZG77kgb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD9D606A326
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZG77kgb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5ED91F008A1;
	Sun,  8 Nov 2026 21:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794174523;
	bh=2klD/Pgrnp8XUXgta1oWT8X4gL+2YBbpG94HlALOnLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BZG77kgb1hOannBKEED0O9r1U7/QLBViD40YJOWWWtVqmwb5EGTdwzusFWUNuNmjb
	 N/Bh63UbsU9RazFd3irUOfvP9VO6ceMcGP+44/NFNH1xGaow7xjs91k1YQ+me5jYe6
	 EgeSHQGdqz+sB5Vj0GCMEQKgzCZJoBLf3yFm8HQBLjaXGnJ89bRZMbYn3lWIkcAVZH
	 3O+dY8kVKodp3N7bvnw9lF0j1C+4JBRIo0Gapuefr6KfE4wOEfoYhVhwuaut//Pdpy
	 /BWxy8+QqzFolYBLEgX7Ld5ZbEfZXEeiYDKCkaiKYBrhJ0LIlYLUm62bFK5M853/e7
	 zKRrXadqDERrg==
Message-ID: <sashiko-outbox-204092@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target
 controller instances
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Dietrich" <marvin24@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108212458.275980-3-marvin24@gmx.de>
References: <20261108212458.275980-1-marvin24@gmx.de>
 <20261108212458.275980-3-marvin24@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 21:48:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] i2c: tegra-target: stale nack state in
  tegra_i2c_target_init() and ISR
- [Medium] i2c: tegra-target: unclocked MMIO and unbalanced IRQ/clocks
  after resume error
- [Low] i2c: tegra-target: broken DT binding file path in MAINTAINERS
--

commit f38185c59a54e5417359880cac9a408a1a024e72
Author: Marc Dietrich <marvin24@gmx.de>

i2c: tegra20: Add driver for Tegra20 I2C target controller instances

This commit adds a driver for the NVIDIA Tegra20 I2C controller operating
exclusively in target (slave) mode.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ee846e37066d..e543fde8bdae4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27534,6 +27534,13 @@ R:	Dmitry Osipenko <digetx@gmail.com>
>  S:	Supported
>  F:	drivers/i2c/busses/i2c-tegra.c
> =20
> +TEGRA I2C TARGET DRIVER
> +M:	Marc Dietrich <marvin24@gmx.de>
> +L:	linux-tegra@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c-target.yaml
> +F:	drivers/i2c/busses/i2c-tegra-target.c

[Severity: Low]
Does Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c-target.yaml
exist?  The nvidia,tegra20-i2c-target compatible string is documented in
Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml, so this F:
entry points to a non-existent path and triggers a broken file pattern
warning in get_maintainer.pl.

> diff --git a/drivers/i2c/busses/i2c-tegra-target.c b/drivers/i2c/busses/i=
2c-tegra-target.c
> new file mode 100644
> index 0000000000000..6a8642983ea24
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-tegra-target.c

[ ... ]

> +static int tegra_i2c_target_init(struct tegra_i2c_target_dev *i2c_dev)
> +{
> +	u32 val;
> +	int err;
> +
> +	err =3D device_reset(i2c_dev->dev);
> +	if (err)
> +		return err;
> +
> +	val =3D I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
> +	      FIELD_PREP(I2C_CNFG_DEBOUNCE_CNT, 2);
> +	i2c_writel(i2c_dev, val, I2C_CNFG);
> +
> +	err =3D clk_set_rate(i2c_dev->div_clk,
> +			   i2c_dev->timings.bus_freq_hz * I2C_CLK_MULTIPLIER);
> +	if (err) {
> +		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
> +		return err;
> +	}
> +
> +	i2c_writel(i2c_dev, I2C_SL_CNFG_NEWSL, I2C_SL_CNFG);
> +
> +	/* only 7-bit target address is supported for now */
> +	val =3D FIELD_PREP(I2C_SL_ADDR1_7BIT_ADDR, i2c_dev->target->addr);
> +	i2c_writel(i2c_dev, val, I2C_SL_ADDR1);
> +	i2c_writel(i2c_dev, 0, I2C_SL_ADDR2);
> +
> +	return 0;
> +}

[ ... ]

> +static irqreturn_t tegra_i2c_target_isr(int irq, void *dev_id)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D dev_id;
> +	struct i2c_client *target =3D i2c_dev->target;
> +	bool read, new_xfer;
> +	u32 status;
> +	u8 val =3D 0xff;
> +
> +	status =3D i2c_readl(i2c_dev, I2C_SL_STATUS);
> +	if (!(status & I2C_SL_STATUS_SL_IRQ))
> +		return IRQ_NONE;
> +
> +	/* RNW is set if the controller reads from the target */
> +	read =3D status & I2C_SL_STATUS_RNW;
> +
> +	/* RCVD is set if the interrupt is for the address byte */
> +	new_xfer =3D status & I2C_SL_STATUS_RCVD;
> +
> +	if (!read) {
> +		val =3D i2c_readl(i2c_dev, I2C_SL_RCVD);
> +		if (new_xfer)
> +			i2c_writel(i2c_dev, 0, I2C_SL_RCVD);
> +	}
> +
> +	if (status & I2C_SL_STATUS_END_TRANS) {
> +		i2c_slave_event(target, I2C_SLAVE_STOP, &val);
> +
> +		if (i2c_dev->nack)
> +			tegra_i2c_target_set_nack(i2c_dev, false);
> +
> +		/* a new transfer may already have started */
> +		if (!new_xfer)
> +			return IRQ_HANDLED;
> +	}
> +
> +	if (read) {
> +		if (new_xfer) {
> +			udelay(I2C_READ_ACK_DELAY_US);
> +			i2c_slave_event(target, I2C_SLAVE_READ_REQUESTED, &val);
> +		} else {
> +			i2c_slave_event(target, I2C_SLAVE_READ_PROCESSED, &val);
> +		}
> +
> +		/* send the byte and release the bus */
> +		i2c_writel(i2c_dev, val, I2C_SL_RCVD);
> +	} else if (new_xfer) {
> +		/* the address phase is always acknowledged */
> +		if (i2c_slave_event(target, I2C_SLAVE_WRITE_REQUESTED, &val))
> +			tegra_i2c_target_set_nack(i2c_dev, true);
> +	} else if (!i2c_dev->nack) {
> +		if (i2c_slave_event(target, I2C_SLAVE_WRITE_RECEIVED, &val))
> +			tegra_i2c_target_set_nack(i2c_dev, true);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Can i2c_dev->nack remain stale across a Repeated START or across system
suspend and resume?

In tegra_i2c_target_isr(), tegra_i2c_target_set_nack(i2c_dev, false) is
only called when I2C_SL_STATUS_END_TRANS is set.  If a controller follows
a NACKed write with a Repeated START (where I2C_SL_STATUS_RCVD is set
without I2C_SL_STATUS_END_TRANS), i2c_dev->nack is never cleared, so a
new write transfer remains NACKed and skips I2C_SLAVE_WRITE_RECEIVED even
when I2C_SLAVE_WRITE_REQUESTED succeeds.

Similarly, tegra_i2c_target_init() writes I2C_SL_CNFG_NEWSL to
I2C_SL_CNFG, clearing I2C_SL_CNFG_NACK in hardware without resetting
i2c_dev->nack =3D false.  If the system suspends while i2c_dev->nack is
true, tegra_i2c_target_resume() -> tegra_i2c_target_init() leaves
hardware ACKing bytes on the bus while tegra_i2c_target_isr() silently
drops them because i2c_dev->nack is still true.

[ ... ]

> +static int tegra_i2c_target_suspend(struct device *dev)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D dev_get_drvdata(dev);
> +
> +	if (!i2c_dev->target)
> +		return 0;
> +
> +	disable_irq(i2c_dev->irq);
> +	tegra_i2c_target_deinit(i2c_dev);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks), i2c_dev->clocks=
);
> +
> +	return 0;
> +}
> +
> +static int tegra_i2c_target_resume(struct device *dev)
> +{
> +	struct tegra_i2c_target_dev *i2c_dev =3D dev_get_drvdata(dev);
> +	int err;
> +
> +	if (!i2c_dev->target)
> +		return 0;
> +
> +	err =3D clk_bulk_prepare_enable(ARRAY_SIZE(i2c_dev->clocks),
> +				      i2c_dev->clocks);
> +	if (err) {
> +		dev_err(dev, "failed to enable clocks: %d\n", err);
> +		return err;
> +	}
> +
> +	err =3D tegra_i2c_target_init(i2c_dev);
> +	if (err) {
> +		clk_bulk_disable_unprepare(ARRAY_SIZE(i2c_dev->clocks),
> +					   i2c_dev->clocks);
> +		return err;
> +	}
> +
> +	enable_irq(i2c_dev->irq);
> +
> +	return 0;
> +}

[Severity: Medium]
What happens in tegra_i2c_target_unreg_target() or a later
tegra_i2c_target_suspend() if tegra_i2c_target_resume() fails?

When clk_bulk_prepare_enable() or tegra_i2c_target_init() fails in
tegra_i2c_target_resume(), the clocks are left disabled and i2c_dev->irq
remains disabled, while i2c_dev->target is still non-NULL.  A subsequent
call to tegra_i2c_target_unreg_target() or tegra_i2c_target_suspend()
will then access I2C_SL_CNFG in tegra_i2c_target_deinit() with the
controller clocks disabled (which hangs the APB bus on Tegra20), call
disable_irq() a second time, and call clk_bulk_disable_unprepare() on
already disabled clocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108212458.2759=
80-1-marvin24@gmx.de?part=3D2
