Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784269;
	b=pHUWa3HNRFO842FtIPeMrGnT8KT6ycsuEQxYQEVYHg23c726RrlPyMggUcnpY16Qu1lJ
	 N2JJZLlHFQn0MgLrOLnhVfOHpZdTFlkdBQlA9LcKkAn0CjgY/g6qGyeyDUyD7XrDrJ0Mq
	 VNqtosXAKsyXSbbRWTOzQcUMoaf6SWYsogtLWCb4LiKDyB7KPVfWwWU7usQpYRrSdhCrh
	 1qorBr7HCXmiymmh/s/ohCDkhDzZfv8MfzrsBXd9OLVtOBI2/VvQGuSU66qCYMmneDkg8
	 ngpVwRx753bfANp2kqD+y7izc6BjoUUDBbcknNK2GGLKDyDlN9Od/7aKbylGeXWcLpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784269;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9QGSwm9Eu4PPXaPQ8GPjGQLCK3FUulWZM+Ce/QNh/pw=;
	b=Virfvik5VQHG3kApwmSrM33saa9RZsoYIRfOmWBy9NWPkwnLcWbvEdkWkzdLpQuwwRt5
	 05hMXa6JUzAf0+xcBW39lfpuJp9nycFN9qQmW3GmcImDhM2uWGxvzbU1URuBq4X5hSM6g
	 17uu7LIXVXwFUtugvgSIG7xEiHqswHfF+skffC5WOsjA+CtfLr22Yy52SX27iuhw9H4fM
	 3ymkiA/ESj13P1XJ+N7d4PP5nsOHdqHrrMBh6mgWosVn1sm31aOYtkfNFVUbmnXhUopdm
	 bRNk2AyAKE7UZIK+0APYXECt/SElDpWT7uiiDe3BFfqeP6RuUEiOB9Qu3SuczHuticw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iI3HMy34;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FDD606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iI3HMy34
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C5F31F00919;
	Wed,  4 Nov 2026 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793784268;
	bh=9QGSwm9Eu4PPXaPQ8GPjGQLCK3FUulWZM+Ce/QNh/pw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iI3HMy348pONSLjiBdAsc9Ry/MBqd3FRoXP1HKOys8kWPqi9NOv8DZosrZ/X3dcP5
	 fFpCdHsWv9WK7mKP75Bw+wjL9O6A5coQqDgZmuBr2mHmaHb+wNlLRnwf/uofjGZMMK
	 Td+zmZ8c7FjnTmeni48ph9oZ7ugVB348E7hbkeBUHnZUw/zgFNDBWQC0BE6XbBGU1n
	 MSd/LiMJO4UMDYd+aQf/pQ/cBtsC1dZY0stkWxUkrPLeOko+a7g8gBVLYJnoHAhyQv
	 pVXIdnEcHVQTTitkVq3lmMKSXjWN/DMcUDcyG2n68VdLmripQsLY/7bFd2XM+QL1Qq
	 JBUsBydiEc/bA==
Message-ID: <sashiko-outbox-196952@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104091136.151269-3-cwweng.linux@gmail.com>
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
 <20261104091136.151269-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 09:24:27 +0000
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
- [High] iio: adc: ma35d1: unclocked MMIO access when disabling buffer or s=
uspending
--

commit 42a7961767520f06d7be9ff697854a2064ddd67f
Author: Chi-Wen Weng <cwweng@nuvoton.com>

iio: adc: Add Nuvoton MA35D1 EADC driver

This commit adds an IIO ADC driver for the Enhanced Analog-to-Digital
Converter on Nuvoton MA35D1 SoCs, supporting single-ended and differential
inputs, direct conversions, and triggered buffered capture using sample
module 0.

> diff --git a/drivers/iio/adc/ma35d1_eadc.c b/drivers/iio/adc/ma35d1_eadc.c
> new file mode 100644
> index 0000000000000..b45ad3ef52645
> --- /dev/null
> +++ b/drivers/iio/adc/ma35d1_eadc.c
> @@ -0,0 +1,912 @@

[ ... ]

> +static void ma35d1_adc_hw_disable_action(void *data)
> +{
> +	struct ma35d1_adc *adc =3D data;
> +
> +	if (adc->clk_enabled)
> +		ma35d1_adc_hw_disable(adc);
> +}

[ ... ]

> +static int ma35d1_adc_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ma35d1_adc *adc =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	guard(mutex)(&adc->lock);
> +
> +	ret =3D ma35d1_adc_disable_irq(adc);
> +	if (ret)
> +		return ret;
> +
> +	synchronize_irq(adc->irq);
> +
> +	return regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
> +			    MA35D1_EADC_STATUS2_ADIF0);
> +}

[ ... ]

> +static int ma35d1_adc_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct ma35d1_adc *adc =3D iio_priv(indio_dev);
> +	struct regmap *map =3D adc->regmap;
> +	int ret;
> +
> +	ret =3D iio_device_suspend_triggering(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&adc->lock);
> +
> +	ret =3D ma35d1_adc_disable_irq(adc);
> +	if (ret)
> +		goto resume_triggering;
> +
> +	synchronize_irq(adc->irq);
> +
> +	ret =3D regmap_clear_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);
> +	if (ret) {
> +		/*
> +		 * ADCIEN0 is enabled only while a conversion is active. Holding
> +		 * adc->lock here guarantees that no conversion is in progress, so
> +		 * leave it disabled. The next conversion enables it again.
> +		 */
> +		goto resume_triggering;
> +	}
> +
> +	adc->suspended =3D true;
> +	clk_disable_unprepare(adc->clk);
> +	adc->clk_enabled =3D false;
> +	mutex_unlock(&adc->lock);
> +
> +	return 0;
> +
> +resume_triggering:
> +	mutex_unlock(&adc->lock);
> +	iio_device_resume_triggering(indio_dev);
> +
> +	return ret;
> +}
> +
> +static int ma35d1_adc_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct ma35d1_adc *adc =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	mutex_lock(&adc->lock);
> +
> +	ret =3D clk_prepare_enable(adc->clk);
> +	if (ret)
> +		goto unlock;
> +
> +	adc->clk_enabled =3D true;
> +	ret =3D ma35d1_adc_hw_init(adc);
> +	if (ret) {
> +		clk_disable_unprepare(adc->clk);
> +		adc->clk_enabled =3D false;
> +		goto unlock;
> +	}
> +
> +	adc->suspended =3D false;
> +	mutex_unlock(&adc->lock);
> +
> +	return iio_device_resume_triggering(indio_dev);
> +
> +unlock:
> +	mutex_unlock(&adc->lock);
> +
> +	return ret;
> +}

[Severity: High]
Can ma35d1_adc_buffer_predisable() and ma35d1_adc_suspend() access EADC MMIO
registers while adc->clk is disabled?

During system suspend, ma35d1_adc_suspend() sets adc->suspended =3D true, c=
alls
clk_disable_unprepare(adc->clk), and sets adc->clk_enabled =3D false. If a
subsequent ma35d1_adc_resume() fails in clk_prepare_enable() or
ma35d1_adc_hw_init(), its error path leaves adc->clk_enabled =3D false and
adc->suspended =3D true while any previously enabled triggered buffer remai=
ns
active.

When userspace later disables the buffer or unbinds the driver (or if the
driver is unbound while suspended, since devm_iio_device_register() teardown
runs iio_device_unregister() -> iio_disable_all_buffers() ->
ma35d1_adc_buffer_predisable() before ma35d1_adc_hw_disable_action()),
ma35d1_adc_buffer_predisable() unconditionally calls ma35d1_adc_disable_irq=
()
and regmap_write(adc->regmap, MA35D1_EADC_STATUS2, MA35D1_EADC_STATUS2_ADIF=
0)
without checking adc->suspended or adc->clk_enabled, accessing MMIO registe=
rs
with the peripheral clock gated.

Similarly, if another suspend cycle runs after a failed resume,
ma35d1_adc_suspend() does not check whether the device is already suspended
before accessing registers, calling clk_disable_unprepare(adc->clk) a second
time, and calling iio_device_suspend_triggering(indio_dev) again.

Should ma35d1_adc_buffer_predisable() and ma35d1_adc_suspend() check
adc->suspended (or adc->clk_enabled, as ma35d1_adc_hw_disable_action() does)
before touching the hardware registers and disabling the clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104091136.1512=
69-1-cwweng.linux@gmail.com?part=3D2
