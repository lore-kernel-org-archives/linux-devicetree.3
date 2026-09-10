Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55863B6377
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059398; cv=none; b=ghCiD/CnyZwAHaFyiaQTO++adGjrhUwk/DlBtxa+bxVbM9KSFDjYV/U/6OFXhOaPUxORY8P+qy3tco8u3uowkxNTYiRlR3kxLPlndiAnUq8weJYG5UmopOpUesl64k87XM9woWd+KL1Jgu2ltCf5MiX+p7TLxC9L+F9RMsmWlRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059398; c=relaxed/simple;
	bh=adgX/oms3NTLH7YsFj4WKj5O5AUU4KLAAqNys/66/6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c8qm/0Qr3GwQJn/XZONXi4E44kZ90yyxJB3lIycUds1Dew3T3rV2pjvI9kSYgPLoWJvfWshcn4FAEA6gegZfBsoEIkj4eodyRmwvC5NkHgiY3o4lcQmnnVmgCdwA0UKSXVFTpk3kuwiIORc2FATMVVDYR59O2oqA3DcEi+b9t4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEx4kTu7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEx4kTu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357181F000FF;
	Thu, 10 Sep 2026 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059396;
	bh=GAeurZRep4J4j8eeFarOPRx9b8TtBM9ZejbCv06AcYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IEx4kTu71K22kN++sy3PWtSLYOn2TkRSTCEI+vXlC8V140rnptbSKSVUI5aFKNUh2
	 h1tfCnRR5TDDgXPt9hlo4dwIQWPBdKGa1DbZBL/EMI5+jobLmoofqKWYWAK3e5CX/W
	 6H2Ta80zY7RIVhuRsJIpbNf8QrVOjFHsTrRA/Oejf0t9MWoclPViE0CKVg7HeYNqjA
	 OLMXrivx4TweqDzIAGiIAkJ8HOJp1JpLpDEJd8kQZ+cO7YnQLXJ4XxKtskGqxGVCog
	 V4M59hfSI2jN369lMP6gRhF/vG1ZAR8W7yFiY+AvbftB6wJSfSruTWzp5WZp9rCSJ/
	 iaVlDSUfFRAvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-tipd-ace3-v7-2-6c6ebe2193f2@chaosmail.tech>
References: <20260910-tipd-ace3-v7-0-6c6ebe2193f2@chaosmail.tech>
 <20260910-tipd-ace3-v7-2-6c6ebe2193f2@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 16:56:35 +0000
Message-Id: <20260910165636.357181F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `tipd_suspend()` and `tipd_resume()` blindly operate on IRQ 0 if t=
he device has a `wakeup-source` property but no valid interrupt line.
- [High] Probe failure in polling mode causes a Use-After-Free because `tps=
->wq_poll` is queued but never canceled in the error path.
- [High] Device is accessed over I2C before being taken out of reset during=
 resume, causing a persistent failure.
--

commit 483e340a7e2db3c0bcd0902d89a807ddfbd80a8f
Author: Alyssa Milburn <amilburn@zall.org>

usb: typec: tipd: Factor out i2c specifics

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1898,14 +1771,14 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
[ ... ]
>  	if (tps->irq) {
>  		ret =3D devm_request_threaded_irq(tps->dev, tps->irq, NULL,
>  						tps->data->irq_handler,
>  						IRQF_SHARED | IRQF_ONESHOT,
>  						dev_name(tps->dev), tps);
>  	} else {
>  		dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
>  		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
> @@ -1916,13 +1789,12 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
>  	if (ret)
>  		goto err_disconnect;

[Severity: High]
This is a pre-existing issue, but does this leak memory or cause a
use-after-free if the probe fails while in polling mode?

If the device is configured in polling mode (no IRQ specified) and the call
to tps->data->connect() fails, ret holds a non-zero error code. The polling
work tps->wq_poll is queued here, and then the code jumps to err_disconnect.

Looking at the err_disconnect path in tipd_init():

err_disconnect:
        tps6598x_disconnect(tps, 0);
err_unregister_port:
        tps->data->unregister_port(tps);
...
        return ret;

The error path returns without canceling the queued work. When devres frees
the tps structure, the delayed work timer can still fire 500ms later, which
would lead to a use-after-free when it accesses the freed memory.

Could we add a cancel_delayed_work_sync() call in the error handling path?

[ ... ]

> -static int __maybe_unused tps6598x_suspend(struct device *dev)
> +int tipd_suspend(struct tps6598x *tps)
>  {
>  	if (tps->wakeup) {
> -		disable_irq(client->irq);
> -		enable_irq_wake(client->irq);
> +		disable_irq(tps->irq);
> +		enable_irq_wake(tps->irq);

[Severity: High]
This isn't a bug introduced by this patch, but could this blindly operate
on IRQ 0 during system suspend?

If a device is configured in polling mode, tps->irq is 0. If that device
also has the wakeup-source property set in its device tree, tipd_suspend()
will call disable_irq(0) and enable_irq_wake(0). On architectures where
IRQ 0 is a system interrupt (such as the timer tick on x86), disabling it
can cause a hang during suspend.

[ ... ]

>  	} else if (tps->reset) {
>  		gpiod_set_value_cansleep(tps->reset, 1);
>  	}
> =20
> -	if (!client->irq)
> +	if (!tps->irq)
>  		cancel_delayed_work_sync(&tps->wq_poll);
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(tipd_suspend);
> =20
> -static int __maybe_unused tps6598x_resume(struct device *dev)
> +int tipd_resume(struct tps6598x *tps)
>  {
>  	int ret;
> =20
>  	ret =3D tps6598x_check_mode(tps);

[Severity: High]
This is a pre-existing issue, but will this I2C read persistently fail
during resume?

In tipd_suspend(), if the device lacks a wakeup source but has a reset GPIO,
it is put into reset. However, during tipd_resume(), the very first operati=
on
is a call to tps6598x_check_mode(tps), which attempts an I2C read.

Since the device is still in reset when this I2C read is attempted, the read
will fail and return an error early, leaving the device permanently in reset
after a system suspend.

[ ... ]

>  	if (ret < 0)
>  		return ret;
> =20
> @@ -2002,25 +1870,22 @@ static int __maybe_unused tps6598x_resume(struct =
device *dev)
>  	}
> =20
>  	if (tps->wakeup) {
> -		disable_irq_wake(client->irq);
> -		enable_irq(client->irq);
> +		disable_irq_wake(tps->irq);
> +		enable_irq(tps->irq);

[Severity: High]
This isn't a bug introduced by this patch, but similar to the suspend path,
will this operate on IRQ 0 if the device has a wakeup-source property but
no valid interrupt line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-tipd-ace3-=
v7-0-6c6ebe2193f2@chaosmail.tech?part=3D2
