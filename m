Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768536;
	b=LaJCiz2JxFbdAWjAYMt4OaHvWJbBW6Whva3QysoZY4IGxRPY76NPna5bRRo3T1aBGjc9
	 UrnfserzNaG4USdc9dT5Mmc7rGjvi3FJJF9l1vObU2hLONN9d8Amvfjd4pHTDM1lZXBhC
	 S9/nLMNWdKWZv1OQx/Cq+Z0d50RLNDfQONbBMVp60oWozLpo1p/s5U5nN2SF+EfcBMSQv
	 MI/XhF6Y3wlomrjvTkird+EjC5wOU+A53MC0zlW3PwV8LvJmHcWbxtND7SVpHGR5H6OV/
	 AGF2tpsDKTy0SnKMmo7gOTe7cj2i781rp+Wb6fgbxWrT7/9xIRozbvSW8C4sqenIEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Wlr+iarKK4PUcbE8qN6EfQeglLxBl+x5LqpLnTnZpfk=;
	b=CFJo6TFz+yjpfJe3qDWRadtanaRIAMy0gk/J5bH0v+fF//o4U1cpRm59LqIl9ONflPYf
	 5TLSxY4hd8qdt/hZBFJrPoje92TVmZHqGOh/Eer/T+ixKriqN22B1LPHLsFGUjaYk11rT
	 WI8BcJ9wbCACs38nNucEZ6QB4agQ39TaI/mVuaxE5ciRxtLIkuAULKqjV1yfB6qPZMnVT
	 MAG9z0n9grwRgQYxrTsaU3dkkbrgqRyaI9DuVapDPzWUO+Vdl5P/DByClaUeoH3nbr4/e
	 obYJMKaSkz1BEIQOZAIRCzzjDW8LyXqLZ5AGArqiDTpJ4XYeMT6Uo0ugm/yVsgsj6zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUOm36fJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18E606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UUOm36fJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73361F000C4;
	Sun, 15 Nov 2026 18:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794768535;
	bh=Wlr+iarKK4PUcbE8qN6EfQeglLxBl+x5LqpLnTnZpfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUOm36fJWaL/6GmX5ViqPeqaE09mXXjP8W3jwKa2sPUxQDqos9K/ikJi+mrkyqLGF
	 BEFKny/yd3ft5f6l53hmvWYsSj4OWDX1rjBNI1pkGVDuWhkk6jSPb9CXmFX0gpAU5b
	 oWExr0NBOLth1wiSXlGCN9mx0QLGkhG/C/F3nlXvKRp9osj+yqelRASDpM8FVDlpth
	 WIYCCsK5JnmKCb3m8n+CbBwglq62se0CfHIht+7ZoxPhzJrllpkch47RWT3JkcCpq3
	 SpJM5Yml1olphhLx0AK13fyib+i35ETeF48KCMCXQRINikxXmnGzRgMWnTMF2e+LZm
	 3ac2KXXdNMy9g==
Message-ID: <sashiko-outbox-215731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i2c: tegra20: Add driver for Tegra20 I2C target
 controller instances
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Dietrich" <marvin24@gmx.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115182616.354580-2-marvin24@gmx.de>
References: <20261115182616.354580-1-marvin24@gmx.de>
 <20261115182616.354580-2-marvin24@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 18:48:55 +0000
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
- [Medium] i2c: tegra20: stale nack state in tegra_i2c_target_init() and
  ISR
- [Medium] i2c: tegra20: premature I2C_SL_RCVD write in
  tegra_i2c_target_isr()
- [Low] i2c: tegra20: non-existent DT binding file path in MAINTAINERS
--

commit 984ca1174b44aa257a978385bffb75aa11d826f5
Author: Marc Dietrich <marvin24@gmx.de>

i2c: tegra20: Add driver for Tegra20 I2C target controller instances

This commit adds a driver for the NVIDIA Tegra20 I2C controller operating
exclusively in I2C target mode.

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
exist?  Commit "dt-bindings: i2c: Add Tegra20 I2C target controller" adds
the nvidia,tegra20-i2c-target compatible string to the existing
Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml file instead.

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

[Severity: Medium]
Does writing 0 to I2C_SL_RCVD here release the bus before I2C_SL_CNFG_NACK
is updated for the new write transfer?

This write happens before the I2C_SL_STATUS_END_TRANS check clears a prior
transfer's NACK state and before i2c_slave_event(...,
I2C_SLAVE_WRITE_REQUESTED, ...) can set NACK for the new transfer, so the
hardware can ACK or NACK the first data byte using stale I2C_SL_CNFG_NACK
configuration.

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
Can i2c_dev->nack remain stale across repeated-start transfers or system
suspend/resume?

In tegra_i2c_target_isr(), tegra_i2c_target_set_nack(i2c_dev, false) is
only called when I2C_SL_STATUS_END_TRANS is set.  If a write transfer sets
i2c_dev->nack =3D true and the bus controller issues a repeated start
(asserting I2C_SL_STATUS_RCVD without I2C_SL_STATUS_END_TRANS),
i2c_dev->nack and I2C_SL_CNFG_NACK stay asserted into the new transfer.

Similarly, tegra_i2c_target_resume() calls tegra_i2c_target_init(), which
clears I2C_SL_CNFG_NACK in hardware without resetting i2c_dev->nack =3D
false.  If the system suspends while i2c_dev->nack is true, after resume
the hardware ACKs incoming write bytes on the bus while the "!i2c_dev->nack"
check in tegra_i2c_target_isr() silently drops all I2C_SLAVE_WRITE_RECEIVED
events until the next STOP condition.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115182616.3545=
80-1-marvin24@gmx.de?part=3D2
