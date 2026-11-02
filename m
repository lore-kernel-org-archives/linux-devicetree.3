Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612838;
	b=guQUqEsF9j3LEoJQIbWn59l4GoIh9JXX5v0Rk06ksNO3ff2J628P2pRtJwxGVdnP8RrA
	 wUbtcMCZc3/OSYLNOjORaaGhBOkTQVzmm0kd0t9LBv00+HVHeGKmUgQ2fn2WrjfNd2Ex7
	 of//Yf7FCI+oGJT/DIrRF5X0mpja29ivYODAS/K+Tbnx+1ohf2sUEGvcFqO0pT3pck1aT
	 ifdk3/cQI97jUQdvEBoUxWNMsQVRqj8Z116nOWHYhzaE6YhUN+fuC/Iyu9u4Durn70V9p
	 LqumtaHgKho1QQCuDCAJ7zqIDdi6hYB0Ih9wnObzp/nDaw2RVCgcJ94AICPvhBKW85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j4gbJz/SIjzmhR2NlwmUamNvOM8ko6HYSxUhx8D2LOg=;
	b=QHmBMcSgRUlAB8+39iaz+SBVfZtHwUkUPQKmZibbUt4lhEmircGK66FbAKCcqUrLPM6j
	 p9S/ca93hK/TUBjxkgDR10cBvuUH87gC312tBSM3AoHmJt4OI8kMqNQe2tdfb6AxCBGoO
	 BEbPOu6sCR1E2aCfLjBuCQ+HvIQx0wfqS9HGMNVA5K+w+yOS+/RraG2JXdClk3SHBzoDd
	 Ejuf9DLYan99FlycoHZDWcbNzBSszXKeEhSo34MxScxQgey7a0TziBYZmvxQXtrdon/py
	 5Rk9fMgjkpi82gPMhOrfe+lCZZ/VXUvtR5P4aOU8ZJmLNPvUGsVFLwlf8b8aYqiiTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=apE9mHY9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF1606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=apE9mHY9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9271F000C1;
	Mon,  2 Nov 2026 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612838;
	bh=j4gbJz/SIjzmhR2NlwmUamNvOM8ko6HYSxUhx8D2LOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apE9mHY9qN1Gb5hcHt3nOzv9mIxiC74xuIfre4YYREOn9BC+O0VUx/TnQ6Aly9UY9
	 ms1RsR4StydwrvIMAql8rrv330uO4aIHwSkHbOu8On/fVTxfioxUa823oRhp13SSEN
	 nkWRdgDsN4mYt7n/9gicJxp1eNSoGv4/wdp3hYPP6mH2SCMZKK2DCpc/pmQEUVx++X
	 LfHLBykOdmhgaJZRZ0gm1FVpEXkRfvmPGHDQskBmaKWWnd9AzsLKBEh04rkNH+D7bM
	 C4kwiW1S2wmgPXCsO+dDhHLS39MJG7z/sHPEyhbjfKSNbbrhsb4cvXKc8Kz8vudb77
	 7G+xRGZkJmtow==
Message-ID: <sashiko-outbox-193205@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] iio: imu: adis16607: Add FIFO-based
 buffered/triggered capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-adis16607-v5-6-4f98b0d271ac@analog.com>
References: <20261102-adis16607-v5-0-4f98b0d271ac@analog.com>
 <20261102-adis16607-v5-6-4f98b0d271ac@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 09:47:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: imu: adis16607: level IRQ storm via has_fifo in adis16607_pro=
be()
--

commit 4d8ecf6737569661c0f9a47d7a29ff4680559b17
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add FIFO-based buffered/triggered capture

This commit adds buffered capture support to the adis16607 IMU driver using
the device's hardware FIFO, draining samples in a trigger handler signaled =
by
the level-high DEV_NOK interrupt and exposing watermark sysfs attributes.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> index 5e2c999e68ac5..bd7752f7a1ec8 100644
> --- a/drivers/iio/imu/adis16607.c
> +++ b/drivers/iio/imu/adis16607.c

[ ... ]

> @@ -229,6 +263,304 @@ static const struct adis_ops adis16607_ops =3D {

[ ... ]

> +/*
> + * Drain the device FIFO. Triggered by the DEV_NOK interrupt, which fire=
s on
> + * any DIAG_STAT flag, not just FIFO_THRESH_MET - the DIAG_STAT read bel=
ow
> + * both checks which flag(s) raised the interrupt and clears the latched
> + * status, and must happen before any FIFO pop, or we'd pop for nothing =
on
> + * an unrelated flag.
> + */
> +static void adis16607_fifo_drain(struct iio_dev *indio_dev, s64 irq_time=
stamp)
> +{
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +	u8 fifo_sample[ADIS16607_FIFO_DATA_LEN];
> +	u16 diag_stat, word_cnt, sample_cnt;
> +	s64 timestamp;
> +	int ret;
> +
> +	adis_dev_auto_lock(&st->adis);
> +
> +	/* Check if FIFO threshold is met */
> +	ret =3D __adis_read_reg_16(&st->adis, ADIS16607_REG_DIAG_STAT, &diag_st=
at);

[ ... ]

> +static irqreturn_t adis16607_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +
> +	adis16607_fifo_drain(indio_dev, pf->timestamp);
> +	iio_trigger_notify_done(indio_dev->trig);
> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> @@ -737,6 +1098,7 @@ static const struct adis_data adis16607_data =3D {
>  	.prod_id_reg =3D ADIS16607_REG_DEV_ID,
>  	.prod_id =3D 0x6000,
>  	.unmasked_drdy =3D true,
> +	.has_fifo =3D true,
>  	.init =3D adis16607_init,
>  	.self_test =3D adis16607_self_test,
>  	.status_error_msgs =3D adis16607_status_error_msgs,

[ ... ]

> @@ -855,6 +1220,25 @@ static int adis16607_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
> =20
> +	/*
> +	 * DEV_NOK stays asserted until DIAG_STAT is read, so the interrupt
> +	 * must be level-triggered, active high.
> +	 */
> +	irq_type =3D irq_get_trigger_type(spi->irq);
> +	if (irq_type !=3D IRQ_TYPE_LEVEL_HIGH)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid interrupt type 0x%x specified\n",
> +				     irq_type);
> +
> +	st->adis.irq_flag =3D IRQF_TRIGGER_HIGH;
> +
> +	ret =3D devm_adis_setup_buffer_and_trigger_with_attrs(&st->adis, indio_=
dev,
> +							    adis16607_trigger_handler,
> +							    &adis16607_buffer_ops,
> +							    adis16607_fifo_attributes);

[Severity: High]
Does setting has_fifo =3D true in adis16607_data combined with a level-high
interrupt and devm_adis_setup_buffer_and_trigger_with_attrs() in
adis16607_probe() cause a kernel warning and a level-IRQ storm when buffered
capture is enabled?

When adis->data->has_fifo is set, devm_adis_probe_trigger() in
drivers/iio/imu/adis_trigger.c requests the physical SPI interrupt as a
threaded IRQ with iio_trigger_generic_data_rdy_poll() as the thread functio=
n:

	if (adis->data->has_fifo)
		ret =3D devm_request_threaded_irq(&adis->spi->dev, adis->spi->irq,
						NULL,
						&iio_trigger_generic_data_rdy_poll,
						adis->irq_flag | IRQF_ONESHOT,
						indio_dev->name,
						adis->trig);

Meanwhile, devm_adis_setup_buffer_and_trigger_with_attrs() registers
adis16607_trigger_handler() on a separate virtual subirq thread via
devm_iio_triggered_buffer_setup_ext() with iio_pollfunc_store_time() as its
top-half handler.

When the level-high DEV_NOK interrupt fires, irq_thread_fn() runs
iio_trigger_generic_data_rdy_poll() in process context with local CPU
interrupts enabled. That calls iio_trigger_poll() -> generic_handle_irq() ->
handle_simple_irq() -> handle_irq_event() -> __handle_irq_event_percpu(),
which runs iio_pollfunc_store_time() and then hits the hardirq-context check
in kernel/irq/handle.c:__handle_irq_event_percpu():

	if (WARN_ONCE(!irqs_disabled(),"irq %u handler %pS enabled interrupts\n",
		      irq, action->handler))
		local_irq_disable();

More importantly, __handle_irq_event_percpu() only wakes the separate pollf=
unc
consumer thread for adis16607_trigger_handler() asynchronously and returns
immediately. iio_trigger_generic_data_rdy_poll() then returns IRQ_HANDLED to
irq_thread_fn(), which calls irq_finalize_oneshot() and unmasks the physical
level-high spi->irq line before adis16607_trigger_handler() ->
adis16607_fifo_drain() has run and read ADIS16607_REG_DIAG_STAT over SPI.

Because DEV_NOK remains asserted high until ADIS16607_REG_DIAG_STAT is read=
 in
adis16607_fifo_drain(), unmasking spi->irq immediately after waking the
consumer thread causes the level-high interrupt to re-fire in an interrupt
storm (and can starve the consumer thread on a single CPU). In addition,
because no validate_trigger or validate_device callback is set, binding
another device to this trigger or vice versa would leave nothing reading
ADIS16607_REG_DIAG_STAT to clear DEV_NOK.

Since hardware FIFO capture is the only buffered mode supported by this
device, should adis16607_probe() register the buffer with
devm_iio_kfifo_buffer_setup_ext() and request the threaded IRQ directly
instead of going through an IIO trigger?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-adis16607-=
v5-0-4f98b0d271ac@analog.com?part=3D6
