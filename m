Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749195;
	b=ob52neTlHOd9nMe3U8ZQ9DCeMQkstJ3u7P4I2lDeyyturD11ezi9QLkoxJrvaPZjCnCw
	 u9gqgRlTjsaf2BiPubYxhWeLMqegZ9ZWopmpTAFvqIe33U0q1F7wumaZ5hNrhD3BZOezo
	 XXbPd5WR/sQN1gxlHh2fRCbt2cugFu8vzZ66eUaVaOKx/RweT4vVtYijZPS3E+IjN+s0q
	 4xCJr8TxXqG62pMWCRSw0b8AzUXV7LlLimsqkU5Niu9hYLBy3cSE3pK5h1chPhvEFw/1j
	 zH6o16JXe/zRA9C4Viaxbbpx3UBeeTprvF3viOUws6WaJ/QRbAMukCs0xmZuq3yJEaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749195;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RBcGM5u1LKeJ2f1kJTIqj+s2bgpsEGrJQgrYUMlq5b8=;
	b=H2y7muWU4Qoe/7SyY+tnxWwGvRj7RifHOEJXJKxr8gDf2iXpSmr453HZxrq4qXsbTwHR
	 eNlHAnnQ8ksI1eXhrthjZIhn3BTLfmNqwL1mxPnooWbrzYuP5pX6jLkjr5r7XN40MrTWW
	 m1pNS3BOPJ3WoQYZViacEJSNohBBj/lDBfzB4uL/4oMN8cgCOPrtawXeBzgi7RKQYUQIm
	 U1qwTyGkBbW9bDtOrjY3THqNNgxfnroyhpy4l+6UIlZs31MOK0qBqozYIf7ZRWDF458p0
	 NMeeOvH62WZ/aYp58gu4mvnIvRVHhxRWr1LO4YKkptHCjdJe+E8EdOQ+7OvUcBufroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONIDOHHD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F6D606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONIDOHHD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8571F01828;
	Fri, 23 Oct 2026 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749195;
	bh=RBcGM5u1LKeJ2f1kJTIqj+s2bgpsEGrJQgrYUMlq5b8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ONIDOHHDqvOBlh4iBNX38CVDsPOZddSzybob0GWAhDns9mYCyvIa2HMT2WUJwsNcx
	 KULLG6aEfTeVT7arEA4JkvswZ7C2B+9HDZ7ZdH1oayHeGI95UQKCIIcG6eRaPD9EeF
	 VxJ5cw/043cMck39Iwqvibi2rTUourvFoa2eIKwsIIYUsOmSZubYm4Eg8vdlOIubOk
	 CWyJbbxvGOFcY3pAL3IqNyLa5SKRWkgXRpYpF9PGW0QWDfR4wq9+pWPZgTPQ+4idDn
	 Oei4Ij2hgITOFsrgsUdO0idZO4+760erL9Soq4E3b0WABVkWmqYHxI/jvmNp9ZEXLX
	 DGMAKEh5dTXOw==
Message-ID: <sashiko-outbox-182642@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] iio: imu: adis16607: Add FIFO-based
 buffered/triggered capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-adis16607-v4-6-a4d541ebfd13@analog.com>
References: <20261023-adis16607-v4-0-a4d541ebfd13@analog.com>
 <20261023-adis16607-v4-6-a4d541ebfd13@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 09:53:14 +0000
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
- [High] iio: imu: adis16607: unset irq_flag in adis16607_probe() forces ed=
ge IRQ
- [Medium] iio: imu: adis16607: stale FIFO data and uncleared DIAG_STAT on =
re-enable
- [Low] iio: imu: adis16607: direct access to private masklength in push he=
lper
--

commit f5af8f0b1c54166ac9ed077db3f6e76ce908f907
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add FIFO-based buffered/triggered capture

This commit adds buffered capture support to the adis16607 IMU driver using
the hardware FIFO, triggered by the DEV_NOK interrupt line when the configu=
red
FIFO watermark is met.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> index 2dda306d7b547..b1f3667d8ce34 100644
> --- a/drivers/iio/imu/adis16607.c
> +++ b/drivers/iio/imu/adis16607.c

[ ... ]

> @@ -215,6 +244,286 @@ static const struct adis_ops adis16607_ops =3D {
>  	.reset =3D adis16607_reset,
>  };

[ ... ]

> +static void adis16607_fifo_push_sample(struct iio_dev *indio_dev,
> +				       u8 *fifo_data, s64 timestamp)
> +{
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +	u16 msw, lsw;
> +	s32 val24;
> +	int bit, offset =3D 0;
> +
> +	memset(st->data, 0, sizeof(st->data));
> +
> +	for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->masklengt=
h) {

[Severity: Low]
In include/linux/iio/iio.h, struct iio_dev declares masklength with the
__private annotation, which triggers a sparse noderef warning when accessed
directly in adis16607_fifo_push_sample().

Should this use iio_for_each_active_channel(indio_dev, bit) (or
iio_get_masklength(indio_dev)) instead of accessing indio_dev->masklength
directly?

[ ... ]

> +static int adis16607_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +	struct adis *adis =3D &st->adis;
> +	u16 threshold;
> +	int ret;
> +
> +	adis_dev_auto_lock(adis);
> +
> +	/* Flush FIFO to start clean */
> +	ret =3D __adis_write_reg_16(adis, ADIS16607_REG_USER_FIFO_CFG,
> +				  ADIS16607_FIFO_FLUSH_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable FIFO with watermark threshold (in word count) */
> +	threshold =3D st->fifo_watermark * ADIS16607_FIFO_WORDS_PER_SAMPLE;
> +	return __adis_write_reg_16(adis, ADIS16607_REG_USER_FIFO_CFG,
> +				   threshold & ADIS16607_FIFO_THR_MASK);
> +}
> +
> +static int adis16607_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +	struct adis *adis =3D &st->adis;
> +
> +	adis_dev_auto_lock(adis);
> +
> +	/* Disable FIFO */
> +	return __adis_write_reg_16(adis, ADIS16607_REG_USER_FIFO_CFG, 0);
> +}

[Severity: Medium]
Can stale FIFO samples from a previous capture session be pushed into the
IIO buffer when the buffer is disabled and re-enabled?

During buffer disable in iio_disable_buffers(),
iio_trigger_detach_poll_func() disables the IRQ before calling
adis16607_buffer_postdisable(). Because adis16607_buffer_postdisable() only
writes 0 to ADIS16607_REG_USER_FIFO_CFG without flushing the FIFO or reading
ADIS16607_REG_DIAG_STAT, any samples enqueued before USER_FIFO_CFG is clear=
ed
remain in the hardware FIFO, and ADIS16607_FIFO_THR_MET_MASK can remain
latched in DIAG_STAT with DEV_NOK asserted.

On a subsequent buffer enable, iio_enable_buffers() enables the trigger IRQ
before calling setup_ops->postenable:

drivers/iio/industrialio-buffer.c:iio_enable_buffers() {
	if (iio_dev_opaque->currentmode =3D=3D INDIO_BUFFER_TRIGGERED) {
		ret =3D iio_trigger_attach_poll_func(indio_dev->trig,
						   indio_dev->pollfunc);
		if (ret)
			goto err_disable_buffers;
	}

	if (indio_dev->setup_ops->postenable) {
		ret =3D indio_dev->setup_ops->postenable(indio_dev);
}

If the interrupt fires immediately when iio_trigger_attach_poll_func() calls
adis_enable_irq(), adis16607_trigger_handler() can run before
adis16607_buffer_postenable(), see ADIS16607_FIFO_THR_MET_MASK still set in
DIAG_STAT, and pop the leftover samples from the previous session with
timestamps from the new session.

Additionally, adis16607_buffer_postenable() flushes the FIFO without reading
ADIS16607_REG_DIAG_STAT to clear any latched fault or threshold flags holdi=
ng
DEV_NOK asserted. Should adis16607_buffer_postdisable() also flush the FIFO
and clear DIAG_STAT, or should the FIFO and DIAG_STAT cleanup happen before
the trigger IRQ is enabled?

[ ... ]

> @@ -690,6 +1023,7 @@ static const struct adis_data adis16607_data =3D {
>  	.prod_id_reg =3D ADIS16607_REG_DEV_ID,
>  	.prod_id =3D 0x6000,
>  	.unmasked_drdy =3D true,
> +	.has_fifo =3D true,
>  	.post_reset_setup =3D adis16607_post_reset_setup,
>  	.self_test =3D adis16607_self_test,
>  	.status_error_msgs =3D adis16607_status_error_msgs,
> @@ -765,6 +1099,8 @@ static int adis16607_probe(struct spi_device *spi)
>  	indio_dev->info =3D &adis16607_info;
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
> =20
> +	st->fifo_watermark =3D ADIS16607_MAX_FIFO_WM;
> +
>  	st->adis.ops =3D &adis16607_ops;
> =20
>  	ret =3D devm_regulator_get_enable(dev, "vdd");
> @@ -803,6 +1139,13 @@ static int adis16607_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_adis_setup_buffer_and_trigger_with_attrs(&st->adis, indio_=
dev,
> +							    adis16607_trigger_handler,
> +							    &adis16607_buffer_ops,
> +							    adis16607_fifo_attributes);
> +	if (ret)
> +		return ret;

[Severity: High]
Does leaving st->adis.irq_flag unset in adis16607_probe() force the DEV_NOK
interrupt to be requested as rising-edge triggered instead of level-trigger=
ed?

While adis16607_data sets .has_fifo =3D true and DEV_NOK is a level-trigger=
ed
signal that stays asserted until ADIS16607_REG_DIAG_STAT is read,
adis16607_probe() never initializes st->adis.irq_flag from
irq_get_trigger_type(spi->irq). As a result, st->adis.irq_flag is 0
(IRQF_TRIGGER_NONE) when devm_adis_setup_buffer_and_trigger_with_attrs() ->
devm_adis_probe_trigger() -> adis_validate_irq_flag() runs:

drivers/iio/imu/adis_trigger.c:adis_validate_irq_flag() {
	unsigned long direction =3D adis->irq_flag & IRQF_TRIGGER_MASK;

	/* We cannot mask the interrupt so ensure it's not enabled at request */
	if (adis->data->unmasked_drdy)
		adis->irq_flag |=3D IRQF_NO_AUTOEN;
	/*
	 * Typically this devices have data ready either on the rising edge or
	 * on the falling edge of the data ready pin. This checks enforces that
	 * one of those is set in the drivers... Defaults to
	 * IRQF_TRIGGER_RISING for backward compatibility with devices that
	 * don't support changing the pin polarity.
	 */
	if (direction =3D=3D IRQF_TRIGGER_NONE) {
		adis->irq_flag |=3D IRQF_TRIGGER_RISING;
		return 0;
	} else if (direction !=3D IRQF_TRIGGER_RISING &&
		   direction !=3D IRQF_TRIGGER_FALLING && !adis->data->has_fifo) {
		dev_err(&adis->spi->dev, "Invalid IRQ mask: %08lx\n",
			adis->irq_flag);
		return -EINVAL;
	} else if (direction !=3D IRQF_TRIGGER_HIGH &&
		   direction !=3D IRQF_TRIGGER_LOW && adis->data->has_fifo) {
}

Because direction is IRQF_TRIGGER_NONE, adis_validate_irq_flag() takes the
first branch and sets IRQF_TRIGGER_RISING before reaching the has_fifo chec=
k.
devm_adis_probe_trigger() then passes IRQF_TRIGGER_RISING to
devm_request_threaded_irq(), which overrides the firmware/devicetree
IRQ_TYPE_LEVEL_HIGH trigger configuration in __setup_irq().

If the interrupt controller rejects rising-edge mode on that line, probe
fails. If it accepts rising-edge mode, any condition where DEV_NOK is alrea=
dy
asserted when the IRQ is enabled, or remains asserted across
adis16607_trigger_handler() (for example, if a DIAG_STAT bit re-asserts aft=
er
the initial __adis_read_reg_16() while the multi-sample adis16607_fifo_pop()
loop is still running), will not generate a new rising edge and will stall
FIFO capture.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-adis16607-=
v4-0-a4d541ebfd13@analog.com?part=3D6
