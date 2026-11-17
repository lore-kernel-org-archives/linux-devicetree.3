Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938105;
	b=O73car/m8VIPa5dzBI3gF7toXBz1TR/JvaeJW+PdypEmg02BzNbMbOwAUcgnR9Ry3dwM
	 G7MzBGEDv+5kq1MYddS1q85WE4nSzTmrSX1JCfJ0CDsYY7vGgXxIXIDPyYJkGq79QlySL
	 FA1yRC00xfHOybsZ+hGWtDYINgmufTXBykzXgW8ns8uR1UKpRbjrURaXXjUfzpKtv8vje
	 wwHerD/7AN/VOqAJ57Lr9JJBzJfxlFkXg9F6p/5Z1QXXxrPCHOxXPiINQ5XueyRoXo+Ff
	 uvZiQCvKKUMoYPc0WRs9eSD+JN+sb1q3085I0epSYaxs2wno+K8Vyaf0wNT1j66f18A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YbCmz5nOuFiGTV5Lz3nwRsBcysEs1dYTr6WkkrqcuVk=;
	b=lJ46PnWzckvU5S8IKCHkQBl/feLncRiNFS5dLKWE5wKm/zKujMS3tYd+l+w76V1jMQxv
	 yfWO1lyFNhQOcodb8NyHXIqwC442DfJwPZwPDJ6HpgyZFpHop4IwiGFgkEwAUHS9/qMX6
	 SPPmdTxbB2k1Hpy95GE+xgdfd7Had1uJtSq/fUWqVlfm+VBDuTXrxbtlUoR3vz4Qndngw
	 p9n9Hiy/IkjkBCPXOzs27iYzmVe4d/K9cG4a3W9WEkDNqViDzl2oYLIdx+kit97RD7TfJ
	 ypOgHQ207CeQd4wNWMSGDVvHUQj5Jbj0CJIi/J9mfxAVUwG39IeqCw7/P/ex9T+C+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rx9i4rzk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66939606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rx9i4rzk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D681F000C5;
	Tue, 17 Nov 2026 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938105;
	bh=YbCmz5nOuFiGTV5Lz3nwRsBcysEs1dYTr6WkkrqcuVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rx9i4rzkNTnT8Ae5bBJA1SFrSSTTJlO+SamcwBHHfK1pWvvI/Ig2TBmcEFEsw6HfC
	 1/Ifrw6LqhN0pu174CaCTNhk8prgSl/DVmuFFvVP0NREBQ9tny1ZPeNQYCV0GEKAYm
	 PC+QepUekxmeUbXVPQvprNJBwwwhPgjKnXqJPzX7vrb5DAUHlG3apQSP/q2pVGkus0
	 AmeGA/dlsv0UMDnF6SPA4TyattuYgofKfeeUL/wnvb09E7knLYjO6i4qhHavskRsA3
	 yeLFsdHsoH9YdBxKHPiSXwKFIP3GHnwf5RZRdNCHQKDV/miqOEtOoby5b0rkf4SAb2
	 LW9SX69OfuDew==
Message-ID: <sashiko-outbox-219292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: proximity: add Imagis ISG5320A SAR sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWRpbCBIw7xzcmV2IFRlcGU=?= <tadilhusrev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117173333.1853986-3-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
 <20261117173333.1853986-1-tadilhusrev@gmail.com>
 <20261117173333.1853986-3-tadilhusrev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:55:04 +0000
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
- [Medium] iio: proximity: isg5320a: missing teardown on IRQ error in
  isg5320a_probe()
- [Low] iio: proximity: isg5320a: disable runtime PM in
  isg5320a_shutdown()
--

commit baa300415c1a96074ec67b396caa0dfe08ba9dae
Author: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

iio: proximity: add Imagis ISG5320A SAR sensor driver

This commit adds an IIO driver for the Imagis ISG5320A I2C capacitive
SAR/grip sensor, exposing a proximity channel and threshold events.

> diff --git a/drivers/iio/proximity/isg5320a.c b/drivers/iio/proximity/isg=
5320a.c
> new file mode 100644
> index 0000000000000..4df0e09d39143
> --- /dev/null
> +++ b/drivers/iio/proximity/isg5320a.c
[ ... ]
> +static int isg5320a_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D isg5320a_mode_normal(data);			/* :1621 */
> +	if (ret)
> +		return dev_err_probe(dev, ret, "start failed\n");
> +
> +	/*
> +	 * The chip is already active, so a later failure (e.g. the IRQ
> +	 * request below) must still put it back to sleep instead of leaving
> +	 * it scanning with nothing bound to it.
> +	 */
> +	pm_runtime_set_autosuspend_delay(dev, ISG5320A_AUTOSUSPEND_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	if (data->irq > 0) {
> +		irqflags =3D irq_get_trigger_type(data->irq);
> +		if (!irqflags)
> +			irqflags =3D IRQF_TRIGGER_FALLING;	/* :1932 */
> +
> +		ret =3D devm_request_threaded_irq(dev, data->irq, NULL,
> +						isg5320a_irq_thread,
> +						irqflags | IRQF_ONESHOT |
> +						IRQF_NO_AUTOEN,
> +						"isg5320a", indio_dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "irq request failed\n");
> +
> +		if (device_property_read_bool(dev, "wakeup-source"))
> +			device_init_wakeup(dev, true);
> +	}
> +
> +	/*
> +	 * Registered after the IRQ request, so devm's LIFO unwind runs this
> +	 * teardown (which may disable_irq()/disable_irq_wake() the IRQ in
> +	 * isg5320a_events_off()) before the IRQ itself is freed, not after.
> +	 */
> +	ret =3D devm_add_action_or_reset(dev, isg5320a_teardown, data);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does a failure in devm_request_threaded_irq() skip isg5320a_teardown()?

isg5320a_mode_normal() has already started the sensor and runtime PM is
enabled with an armed autosuspend timer, but isg5320a_teardown() is only
registered after devm_request_threaded_irq() succeeds.  If the IRQ request
fails (for example with -EPROBE_DEFER), the chip is left scanning, runtime
PM stays enabled on the unbound device, and the pending autosuspend timer
can fire isg5320a_runtime_suspend() while devres is freeing data->regmap
and indio_dev.

Requesting the IRQ (which uses IRQF_NO_AUTOEN) before calling
isg5320a_mode_normal() and enabling runtime PM would let
isg5320a_teardown() be registered immediately after pm_runtime_enable()
while still unwinding before the IRQ is freed.

[ ... ]
> +/* vendor isg5320a_shutdown(), :2071-2080, synchronized like isg5320a_te=
ardown() */
> +static void isg5320a_shutdown(struct i2c_client *client)
> +{
> +	struct isg5320a_data *data =3D iio_priv(i2c_get_clientdata(client));
> +	struct device *dev =3D data->dev;
> +
> +	guard(mutex)(&data->ev_lock);
> +
> +	if (data->ev_enabled) {
> +		isg5320a_events_off(data);
> +		pm_runtime_put_noidle(dev);
> +	}
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		isg5320a_mode_sleep(data);
> +}

[Severity: Low]
Can a concurrent sysfs access resume the sensor or re-enable events during
or after isg5320a_shutdown()?

Unlike isg5320a_teardown(), isg5320a_shutdown() runs while indio_dev is
still registered and does not call pm_runtime_disable(dev).  A concurrent
isg5320a_read_raw() -> isg5320a_get_sample() does not take data->ev_lock
and can runtime-resume the chip back into normal mode, or a later
isg5320a_write_event_config() call can re-enable the interrupt and wakeup
source after shutdown finishes:

CPU0                                  CPU1
isg5320a_shutdown()
  guard(mutex)(&data->ev_lock)
  !pm_runtime_status_suspended(dev)
  isg5320a_mode_sleep(data)
                                      isg5320a_read_raw()
                                        isg5320a_get_sample()
                                          pm_runtime_resume_and_get(dev)
                                            isg5320a_runtime_resume()
                                              isg5320a_mode_normal(data)
                                                <-- chip left scanning

Calling pm_runtime_disable(dev) before checking
pm_runtime_status_suspended(dev) and pm_runtime_set_suspended(dev) after
isg5320a_mode_sleep(data), as in isg5320a_teardown(), would prevent
later runtime resumes and event enables.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117173333.1853=
986-1-tadilhusrev@gmail.com?part=3D2
