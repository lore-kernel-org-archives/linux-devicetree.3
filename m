Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792885875;
	b=AAqJB9Hbx30oQ0/n9Dn0svBrxxVO44yNzy+Oge2ZkruxmxqA1uTHiJg1Z+qa/EOFGg/I
	 MJ3nxY8NOmdnEqMb+Mw65y7GXcX8KsRYYM1qztZEm+QxPJqJSqK0PmlwhL9TtDjkfaiAm
	 FZuCZgDf4qByIiZlK3CBDjFT5fabLycjMCjs3QnRO2+6MPpdfL0ehnnq+MqRFvWEl4mXY
	 IjTA8hlAoHQ3BMime6nGOUfWB1HwVlA40TsvclM73+GMJ4Cshwn4SwY+haABI6cJLW+mT
	 6QGXEiPLb1fyij5H5r4JtBsFjH344KUq7XIUXiZnpLILHBT565u4U0v06uk6TbpQMhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792885875;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JhxDMMjRlVsVxdfXGZ3Kjp9wAjocudtdfkRYELHsjng=;
	b=O0aXxPLZ9iLqg4UMzGQWqEfvEK8dbWMZ31rfWoCtRfe0ZIMTBejyMrh7cRSTdNef+KGq
	 F0vPKBLrS5EIHRWxfXflDIxPmCXRytaYUqO7EdBHktUdQ0cuW23z4YPqEh6dAI/iPKPL7
	 DUuHzSw/7klRV4mFn+/5nUyPy6/xgIX4Elj4gl2fjaakU+lcZ1N/Qt6mhLR0WuYuFqzsT
	 +HDis/5gmBdnsoK6Y3WfC0MAcUVM9/nXHKPahuM1SGTpuiBHRg8pnkMnPFoLJTv+jFiPk
	 TbCUdCgpz0yXzqVVEu9DVzLbs7zPWVhY4RPI593BiDa5H7zXITPMtXNwjywj/GR7YEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JscMD61r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB147606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 23:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JscMD61r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3F81F01825;
	Sat, 24 Oct 2026 23:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792885874;
	bh=JhxDMMjRlVsVxdfXGZ3Kjp9wAjocudtdfkRYELHsjng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JscMD61rfc8Z8hAwdQCaOJh+V6e3zhsr1dhGdzvA4ekMX8t38pfuHsHms7zXmkt8z
	 /ds2ObfxebT1X8AM4S6nS3RDxXXPUlvAsy4nAkpJlwNv6Eomh+fp6o6uxf5CfCIs49
	 2Nc4K/OcVDk3sVR9tWiHznYxm+AnyWQWbzdrgqkxVCfCWYMRHb3cHwxYSg79T53frM
	 v8E6fE6eFscaNRpG4ECt+TiWy33VHqlwOtMCNIpvnDtpIbgBoUPiqaqGtOPhPmZqwM
	 v46nhGmzqo+XKL1OXgfpbMFYgrPnvu47QD1dFu+KJjnsovpE3ODuznxDxXLs3L0Rkn
	 McDBLwD3UnWSw==
Message-ID: <sashiko-outbox-183952@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] iio: adc: ti-ads1298: fix the data read path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephan Costa Barros" <stephanbrrs8@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261024231335.280955-2-stephanbrrs8@gmail.com>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com>
 <20261024231335.280955-2-stephanbrrs8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 23:51:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iio: adc: ti-ads1298: race in ads1298_rdata_complete() before comp=
lete()
- [High] iio: adc: ti-ads1298: race in ads1298_buffer_predisable() on scan =
teardown
- [High] iio: adc: ti-ads1298: use-after-free on timeout in ads1298_wait_rd=
ata_idle()
--

commit f34a13120edd070609343b6d64ffb0e2efc8cfd5
Author: Stephan Costa Barros <stephanbrrs8@gmail.com>

iio: adc: ti-ads1298: fix the data read path

This commit separates the SPI transfer buffers onto dedicated cachelines,
tracks buffered mode and in-flight RDATA transfers with a waitqueue, handles
spi_async() and RDATA message errors, and reads single-shot data before
releasing direct mode.

> diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
> index 06c6353aa1b2e..1d32b1f47f726 100644
> --- a/drivers/iio/adc/ti-ads1298.c
> +++ b/drivers/iio/adc/ti-ads1298.c

[ ... ]

> @@ -185,10 +198,49 @@ static int ads1298_write_cmd(struct ads1298_private=
 *priv, u8 command)
>  	return spi_sync_transfer(priv->spi, &xfer, 1);
>  }
> =20
> +/* Whether no RDATA transfer is queued or in flight */
> +static bool ads1298_rdata_idle(struct ads1298_private *priv)
> +{
> +	guard(spinlock_irqsave)(&priv->irq_busy_lock);
> +	return !priv->rdata_xfer_busy;
> +}
> +
> +static int ads1298_wait_rdata_idle(struct ads1298_private *priv)
> +{
> +	if (!wait_event_timeout(priv->idle_wq, ads1298_rdata_idle(priv),
> +				msecs_to_jiffies(100)))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +/* Called with irq_busy_lock held */
> +static void ads1298_rdata_start(struct ads1298_private *priv)
> +{
> +	int ret;
> +
> +	ret =3D spi_async(priv->spi, &priv->rdata_msg);
> +	if (!ret)
> +		return;
> +
> +	/* No completion will run for this transfer */
> +	priv->rdata_xfer_busy =3D 0;
> +	if (!priv->buffered) {
> +		priv->rdata_status =3D ret;
> +		complete(&priv->completion);
> +	}
> +	wake_up(&priv->idle_wq);
> +}
> +
>  static int ads1298_read_one(struct ads1298_private *priv, int chan_index)
>  {
>  	int ret;
> =20
> +	/* A transfer left over from an earlier timeout must finish first */
> +	ret =3D ads1298_wait_rdata_idle(priv);
> +	if (ret)
> +		return ret;
> +
>  	/* Enable the channel */
>  	ret =3D regmap_update_bits(priv->regmap, ADS1298_REG_CHnSET(chan_index),
>  				 ADS1298_MASK_CH_PD, 0);

[ ... ]

> @@ -494,19 +544,32 @@ static void ads1298_rdata_complete(void *context)
>  {
>  	struct iio_dev *indio_dev =3D context;
>  	struct ads1298_private *priv =3D iio_priv(indio_dev);
> +	int status =3D priv->rdata_msg.status;
>  	int scan_index;
>  	u32 *bounce =3D priv->bounce_buffer;
> +	bool buffered;
> =20
> -	if (!iio_buffer_enabled(indio_dev)) {
> +	/* Only changes while no transfer is in flight */
> +	scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> +		buffered =3D priv->buffered;
> +
> +	if (!buffered) {
>  		/*
>  		 * for a single transfer mode we're kept in direct_mode until
>  		 * completion, avoiding a race with buffered IO.
>  		 */
> -		ads1298_rdata_unmark_busy(priv);
> +		priv->rdata_status =3D status;
> +		ads1298_rdata_release_busy_or_restart(priv);
>  		complete(&priv->completion);
>  		return;
>  	}

[Severity: High]
In ads1298_rdata_complete(), does calling
ads1298_rdata_release_busy_or_restart(priv) before complete(&priv->completi=
on)
leave a race window when recovering from a timed-out single-shot read or
unbinding the driver?

Inside ads1298_rdata_release_busy_or_restart(priv), priv->rdata_xfer_busy is
set to 0, wake_up(&priv->idle_wq) is called, and priv->irq_busy_lock is
released before complete(&priv->completion) runs:

    ads1298_rdata_complete()
        if (!buffered) {
            priv->rdata_status =3D status;
            ads1298_rdata_release_busy_or_restart(priv)
                priv->rdata_xfer_busy =3D 0;
                wake_up(&priv->idle_wq);
            complete(&priv->completion);
        }

If an earlier call to ads1298_read_one() timed out at
wait_for_completion_timeout() while its spi_async() transfer was still in
flight, a subsequent ads1298_read_one() call waiting in
ads1298_wait_rdata_idle(priv) can wake up as soon as priv->rdata_xfer_busy
becomes 0. Because ads1298_regmap_config uses REGCACHE_MAPLE and neither
ADS1298_REG_CHnSET(chan_index) nor ADS1298_REG_CONFIG4 is volatile, repeati=
ng
a read on the same channel hits the regmap cache without doing any SPI bus
transfers and reaches reinit_completion(&priv->completion) immediately:

    ads1298_read_one()
        ads1298_wait_rdata_idle(priv)
        regmap_update_bits(..., ADS1298_REG_CHnSET(chan_index), ...)
        regmap_update_bits(..., ADS1298_REG_CONFIG4, ...)
        reinit_completion(&priv->completion);

If reinit_completion(&priv->completion) runs before the previous transfer's
ads1298_rdata_complete() executes complete(&priv->completion), that late
complete(&priv->completion) signals the newly reinitialized completion. The
second ads1298_read_one() then returns the old sample from priv->rx_buffer
while the new conversion and its SPI transfer are still in flight after dir=
ect
mode is released.

Similarly, if ads1298_quiesce() is waiting in ads1298_wait_rdata_idle(priv)
during driver unbind, it can return as soon as priv->rdata_xfer_busy is
cleared, allowing devres teardown to free indio_dev and priv before
complete(&priv->completion) finishes executing.

Should complete(&priv->completion) be called before releasing
priv->rdata_xfer_busy and waking priv->idle_wq (or while holding
priv->irq_busy_lock, matching ads1298_rdata_start())?

[ ... ]

> @@ -549,14 +615,39 @@ static int ads1298_buffer_postenable(struct iio_dev=
 *indio_dev)
>  	if (ret)
>  		return ret;
> =20
> -	return ads1298_write_cmd(priv, ADS1298_CMD_START);
> +	scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> +		priv->buffered =3D true;
> +
> +	ret =3D ads1298_write_cmd(priv, ADS1298_CMD_START);
> +	if (ret) {
> +		scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> +			priv->buffered =3D false;
> +	}
> +
> +	return ret;
>  }
> =20
>  static int ads1298_buffer_predisable(struct iio_dev *indio_dev)
>  {
>  	struct ads1298_private *priv =3D iio_priv(indio_dev);
> +	int ret, ret2;
> +	int rate;
> +
> +	ret =3D ads1298_write_cmd(priv, ADS1298_CMD_STOP);
> +
> +	/*
> +	 * The conversion in progress completes and raises DRDY once more.
> +	 * Wait for it and for its transfer before the core tears down the
> +	 * scan.
> +	 */
> +	if (ads1298_get_samp_freq(priv, &rate) >=3D 0 && rate > 0)
> +		fsleep(2 * DIV_ROUND_UP(USEC_PER_SEC, rate));
> +	ret2 =3D ads1298_wait_rdata_idle(priv);
> =20
> -	return ads1298_write_cmd(priv, ADS1298_CMD_STOP);
> +	scoped_guard(spinlock_irqsave, &priv->irq_busy_lock)
> +		priv->buffered =3D false;
> +
> +	return ret ?: ret2;
>  }

[Severity: High]
Can an RDATA transfer still start or remain in flight when
ads1298_buffer_predisable() returns, racing with active_scan_mask teardown =
in
iio_disable_buffers()?

In drivers/iio/industrialio-buffer.c, iio_disable_buffers() frees and clears
indio_dev->active_scan_mask unconditionally after predisable() returns, even
when predisable() returns an error:

    iio_disable_buffers()
        if (indio_dev->setup_ops->predisable) {
            ret2 =3D indio_dev->setup_ops->predisable(indio_dev);
            if (ret2 && !ret)
                ret =3D ret2;
        }
        ...
        iio_free_scan_mask(indio_dev, indio_dev->active_scan_mask);
        indio_dev->active_scan_mask =3D NULL;

In ads1298_buffer_predisable(), ads1298_interrupt() remains enabled and
unconditionally increments priv->rdata_xfer_busy and calls
ads1298_rdata_start(priv) whenever a falling edge occurs:

1. If ads1298_write_cmd(priv, ADS1298_CMD_STOP) fails (so the chip keeps
   converting), if ads1298_get_samp_freq(priv, &rate) fails (so fsleep() is
   skipped while the last conversion is still running), or if the final
   interrupt is delayed past the two-period fsleep(), ads1298_wait_rdata_id=
le()
   can observe priv->rdata_xfer_busy =3D=3D 0 and return before the interru=
pt
   fires.

2. If the interrupt fires after ads1298_wait_rdata_idle(priv) drops
   priv->irq_busy_lock and before ads1298_buffer_predisable() acquires
   priv->irq_busy_lock to set priv->buffered =3D false, ads1298_interrupt()
   starts a new SPI transfer while priv->buffered is true, and
   ads1298_buffer_predisable() then sets priv->buffered =3D false while that
   transfer is in flight and returns without waiting for it.

3. While priv->buffered remains true during ads1298_wait_rdata_idle(priv),
   ads1298_rdata_release_busy_or_restart() continues starting new transfers=
 if
   priv->rdata_xfer_busy > 1, and if ads1298_wait_rdata_idle(priv) returns
   -ETIMEDOUT, iio_disable_buffers() still frees indio_dev->active_scan_mas=
k.

If ads1298_rdata_complete() reads priv->buffered =3D=3D true, it iterates
iio_for_each_active_channel(indio_dev, scan_index) and dereferences
indio_dev->active_scan_mask while iio_disable_buffers() frees it and sets it
to NULL. If the interrupt or completion runs after priv->buffered =3D false=
 is
set, ads1298_rdata_complete() takes the !buffered branch and overwrites
priv->rx_buffer and priv->rdata_status and completes priv->completion.

> @@ -569,6 +660,15 @@ static void ads1298_reg_disable(void *reg)
>  	regulator_disable(reg);
>  }
> =20
> +static void ads1298_quiesce(void *data)
> +{
> +	struct ads1298_private *priv =3D data;
> +
> +	/* No new transfer may start, and the last one must end, before teardow=
n */
> +	disable_irq(priv->spi->irq);
> +	ads1298_wait_rdata_idle(priv);
> +}

[Severity: High]
What happens in ads1298_quiesce() if the in-flight spi_async() transfer tak=
es
longer than the 100ms timeout in ads1298_wait_rdata_idle()?

Once spi_async(priv->spi, &priv->rdata_msg) succeeds in ads1298_rdata_start=
(),
the SPI controller owns priv->rdata_msg, priv->rdata_xfer, priv->rx_buffer,
and priv->tx_buffer until the completion callback ads1298_rdata_complete()
runs. In drivers/spi/spi.c, spi_transfer_wait() uses a minimum transfer
timeout of 200ms (2 * ms + 200ms), and messages can also wait behind other
transfers on the SPI controller queue.

Because ads1298_quiesce() calls ads1298_wait_rdata_idle(priv) with a bounded
100ms wait_event_timeout() and ignores the return value, any stalled or
delayed SPI transfer that exceeds 100ms causes ads1298_quiesce() to return
while the transfer is still active. Devres teardown then frees indio_dev and
priv while the SPI controller is still using priv->rdata_msg and its buffers
and before ads1298_rdata_complete() is invoked on the freed context.

Should teardown use an uninterruptible wait_event() so that devres cannot f=
ree
priv before the SPI controller finishes with priv->rdata_msg?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024231335.2809=
55-1-stephanbrrs8@gmail.com?part=3D1
