Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277995;
	b=hGxFjHNIc0jnqsoUh/FoOGde7k1dyHgoceuCVvSxZEmXJt6r61I42tTUlB9F/dRrLrK9
	 vIDEzlTYcXV5EBTxwrojRdoG+jf1RLp4U5DG+OAxiT+YRW/b89cIJGVruoYZhJkt6RtUr
	 yE0X3XH8ZaF+B4EaZmxHo/QdvJWJc9rU+D4eV8OqQ3b0BHNZiPK6wnxzrfuXJYPzXqI0n
	 5+jQT5m+ebTJPCwAcv5QpJYiiuhEP4AqC59NLPk9TSNOQIIr2NDqqmJjeAgun8x8AQolu
	 N8KQe0s9cSsQX3dbBp90VtlU2hin5D75l2oEcZPR7vjVuSZBivab5nbDbAZUX0qF64A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277995;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nzCd6rPCfEwPcS+pM3dgdgLIwVq76LvPxTzrtkNh5og=;
	b=c5qeukFKRg2oOnKG/ndXvjzAYE/JPgQxfm6rFjBd+VEoZv4FhyQGfLuQ5j58JIZSKzXZ
	 AkdJ7F02b4H9OmqU536CL1wPVylRsP8He26q1/RhPwTWNYAZbwG9VqzdOIdKlvYVs4elJ
	 RlVVWcPH45lOm6Jq45JGUOWaDRoFHkO/E8Ry8uWlJXJi8DVVVRRTlbPIhG0cFH0q/aq5l
	 B5dVVR9XipNNLTb4Ln+pH6N1BKPpo43xVKa3n0IYfEl1E+dsclj+CluyLTUuFi4j7sio9
	 Nqcgp2q3eztFhFX/n09Add+5tR7lM9Eaouj7AuTxE/J/srDb9UD1/izLJrYOv+vGDtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWw4LnWi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E34606A32A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWw4LnWi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6307E1F008A6;
	Tue, 10 Nov 2026 02:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277994;
	bh=nzCd6rPCfEwPcS+pM3dgdgLIwVq76LvPxTzrtkNh5og=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LWw4LnWiAx6fbltvVellBtVJEHNc5d0XqVT4hMtS0KWNmwIHb502tdcC09S3b0emf
	 zOsuW0c3cmeHm+Q1vh4SQryAt8DI4ZoukPrYnlp0qdwR+QzmA7B3u13CRlSBys5xI9
	 F9vmcCS0CBSH4q93b5dIMB/bZiGxYiOG2WZiN9/uFvQI7Fi7UhTv/VIHv2JqbD8/Yt
	 6L/XcEEodoeABlHPQIk4B+31WA1Np7UdD/ApYMFSVCLrGmkT/RBLgQthaYP7Dldvwl
	 1b1YBxUltfaxif9UQLS6dqMtsMrqNws77WdkhiY1YGb5juCvnQCRwI7CO6KP3fG5CO
	 muFTmvbRZ2lOA==
Message-ID: <sashiko-outbox-206051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] iio: temperature: add support for Analog Devices
 MAX30210
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110021442.410-3-johnerasmusmari.geronimo@analog.com>
References: <20261110021442.410-1-johnerasmusmari.geronimo@analog.com>
 <20261110021442.410-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:33:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] iio: temperature: max30210: IRQ requested after
  devm_iio_device_register()
- [Medium] iio: max30210: status bits discarded in
  max30210_buffer_postenable()
--

commit 421e9f8d7f502a8b5bdb83438a4e54f4019fbac4
Author: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

iio: temperature: add support for Analog Devices MAX30210

This commit adds an IIO driver for the Analog Devices MAX30210 I2C
temperature sensor with support for direct reads, threshold events, and a
hardware FIFO buffer.

> diff --git a/drivers/iio/temperature/max30210.c b/drivers/iio/temperature=
/max30210.c
> new file mode 100644
> index 0000000000000..8866a476eb37c
> --- /dev/null
> +++ b/drivers/iio/temperature/max30210.c

[ ... ]

> +/* The core calls this after hwfifo_set_watermark(), so the watermark is=
 stable here. */
> +static int max30210_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct max30210_state *st =3D iio_priv(indio_dev);
> +	unsigned int status;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D max30210_autoconv_get(st);
> +	if (ret)
> +		return ret;
> +
> +	/* Read STATUS to clear a stale A_FULL so it cannot fire on the flushed=
 FIFO. */
> +	ret =3D regmap_read(st->regmap, MAX30210_STATUS_REG, &status);
> +	if (!ret)
> +		ret =3D regmap_set_bits(st->regmap, MAX30210_INT_EN_REG,
> +				      MAX30210_STATUS_A_FULL_MASK);
> +	if (ret)
> +		max30210_autoconv_put(st);
> +
> +	return ret;
> +}

[Severity: Medium]
Can reading and discarding MAX30210_STATUS_REG here drop pending
temperature threshold events?

MAX30210_STATUS_REG is clear-on-read and shared with
MAX30210_STATUS_TEMP_HI_MASK and MAX30210_STATUS_TEMP_LO_MASK.  When
threshold events are already enabled (st->autoconv_users > 0), reading
MAX30210_STATUS_REG without reporting those bits clears any pending alarm
in hardware and causes a concurrent max30210_irq_handler() to read 0 and
return IRQ_NONE.

In addition, when st->autoconv_users =3D=3D 0, calling max30210_autoconv_ge=
t()
before reading MAX30210_STATUS_REG starts autonomous conversions before
clearing the stale status byte.

[ ... ]

> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	if (!client->irq)
> +		return 0;
> +
> +	/*
> +	 * Request the IRQ after registering the IIO device so devm tears it
> +	 * down first on removal, before the event interface is freed.
> +	 */
> +	return devm_request_threaded_irq(dev, client->irq, NULL,
> +					 max30210_irq_handler, IRQF_ONESHOT,
> +					 indio_dev->name, indio_dev);
> +}

[Severity: Medium]
As reported by Jonathan Cameron on v4 [1], does registering the IIO device
before requesting client->irq expose the buffer and event interfaces
before the interrupt handler is installed, and invert the teardown order
on removal?

During probe, userspace can enable the buffer or threshold events (or
disable the buffer and hit synchronize_irq(st->irq) in
max30210_buffer_predisable()) before devm_request_threaded_irq() runs.  On
driver unbind, devres frees client->irq before devm_iio_device_unreg()
runs iio_device_unregister() -> iio_disable_all_buffers() ->
max30210_buffer_predisable(), which then calls synchronize_irq(st->irq) on
the already-freed IRQ, and before max30210_quiesce() disables hardware
interrupts.

The event interface is freed in iio_dev_release() (bound to
devm_iio_device_alloc()) rather than iio_device_unregister(), so
requesting the IRQ and registering max30210_quiesce() before
devm_iio_device_register() still tears down the IRQ before the event
interface is freed.

[1] https://lore.kernel.org/r/20261017230705.678a791c@jic23-hlaptop

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110021442.410-=
1-johnerasmusmari.geronimo@analog.com?part=3D2
