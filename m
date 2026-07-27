Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C56841DE18
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169421; cv=none; b=N9diS714Tg4FZ4dMz07hVicKlDINq8frwf3MdI7NYFNbOhscYRvyxkTjjSMbfmNdkKg7GkDVKVW+KJUq9alo8Wdz83gJHBI2Nj9L7r90+vQsuhY7UqxZ1NQn3shBxsTt0rFd4+a9Xqm/6YJsRpcmCuW9GT1bzy5EMSqX5jPI52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169421; c=relaxed/simple;
	bh=sLHywt/SJf0UrMnLNVCvrp1fphK/KzzPZ9ZA9IBaIVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jE6z0tL9Qj8nXLcLCuNKKvqwMk/P+4i0eelopW82NDoSSnWtiScRcyHvynFToiU2ctbmnVhoOuvLXwfp/w1RAXr9uolXuPGQ26KAdKkqb2Pqk4zRZIJUPgGAK1cejc2fVxT/paP7TqhpY7v5c937anhyr9DWKarEGWhi+3ki4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIsusyu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIsusyu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C0D1F000E9;
	Mon, 27 Jul 2026 16:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785169418;
	bh=T/ft31bRF/6tZgrB6e+2cWY1c+NQk7U+eV90peZLa9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TIsusyu3ZHQz3MPvkMUeZk8v/LUuLYlk9dtbCurxawDU3MAxBk4kIFnIgGBLhRZVo
	 Hnyq+lhJWTejhCJJ8hF6xhOFDRvrJb0Bs/Hbphr8FASJhpQfy3iyF2q2YiEeh2p6Ae
	 yWBE1wnvR5iyDOXRZv2YVranUncIpto5hjB4obO1bGDBOj5D16sS6gr1Ua4MnXXrq3
	 k71r41lj3La++xopJlEUMIFvm6IKx8Xl4l6sw2M5t5ASWhKJwfMv1M55hU01cRunMK
	 FCl5DMGy22DI4GY0RXoabv3YS6xCXBxPVLodEezlmFeczDoL4DoqJfMGMsi9Ypm6Hj
	 kfZCKYv6UC18A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-tipd-ace3-v2-2-1345957bd635@chaosmail.tech>
References: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
 <20260727-tipd-ace3-v2-2-1345957bd635@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 16:23:37 +0000
Message-Id: <20260727162337.E7C0D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] I2C-specific code remains in the bus-agnostic core, causing memory=
 corruption on non-I2C buses.
- [Low] `tps6598x_pm_ops` is missing the `static` modifier.

Pre-existing issues:
- [High] Probe error path fails to cancel queued delayed works, leading to =
a Use-After-Free.
- [High] Suspend/resume functions blindly operate on IRQ 0 if `wakeup-sourc=
e` is present but no interrupt is supplied.
- [High] The polling delayed work re-arms itself unconditionally, leading t=
o a Use-After-Free when the driver is unbound.
--

--- Patch [2]: [PATCH v2 2/3] usb: typec: tipd: Factor out i2c specifics ---
commit 882592426a7c1d39d01dd47ae8a3f79d6c0d8efd
Author: Alyssa Milburn <amilburn@zall.org>
Subject: usb: typec: tipd: Factor out i2c specifics

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip.

> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip

[Severity: High]
Does the core driver still contain I2C-specific code?

Looking at tps25750_write_firmware() in core.c, it still uses
to_i2c_client(tps->dev):

	struct i2c_client *client =3D to_i2c_client(tps->dev);
...
	slave_addr =3D client->addr;
	timeout =3D client->adapter->timeout;

	client->adapter->timeout =3D msecs_to_jiffies(5000);
	client->addr =3D bpms_addr;

If this core code is used with SPMI variants, won't to_i2c_client() perform=
 an
invalid container_of() cast on the device pointer, resulting in memory
corruption when modifying the non-existent i2c_client struct?

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index d5ee0af9058b9..aadadfdc6ed12 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
[ ... ]
> @@ -1842,14 +1717,14 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
>  			goto err_unregister_port;
>  		ret =3D tps->data->connect(tps, status);
>  		if (ret)
> -			dev_err(&client->dev, "failed to register partner\n");
> +			dev_err(tps->dev, "failed to register partner\n");
>  	}
> =20
> -	if (client->irq) {
> -		ret =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +	if (tps->irq) {
> +		ret =3D devm_request_threaded_irq(tps->dev, tps->irq, NULL,
>  						tps->data->irq_handler,
>  						IRQF_SHARED | IRQF_ONESHOT,
> -						dev_name(&client->dev), tps);
> +						dev_name(tps->dev), tps);
>  	} else {
>  		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling=
\n");
>  		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
> @@ -1860,13 +1735,12 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
>  	if (ret)
>  		goto err_disconnect;
> =20
> -	i2c_set_clientdata(client, tps);
>  	fwnode_handle_put(fwnode);

[Severity: High]
This is a pre-existing issue, but if we take the goto err_disconnect path
here, are we leaking queued works?

If tps->data->connect() fails earlier, tps->wq_poll is already queued.
If cd321x_connect() queued cd321x->update_work, that is also queued.

When jumping to err_disconnect, the delayed works are never canceled before
the function returns and the devres-allocated tps object is freed. Could th=
is
cause a use-after-free when the works later execute on freed memory?

[ ... ]
> @@ -1887,15 +1761,14 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
> =20
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(tipd_init);
> =20
> -static void tps6598x_remove(struct i2c_client *client)
> +void tipd_remove(struct tps6598x *tps)
>  {
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
> -
> -	if (!client->irq)
> +	if (!tps->irq)
>  		cancel_delayed_work_sync(&tps->wq_poll);
>  	else
> -		devm_free_irq(tps->dev, client->irq, tps);
> +		devm_free_irq(tps->dev, tps->irq, tps);

[Severity: High]
This is a pre-existing issue, but doesn't tps6598x_poll_work() unconditiona=
lly
re-arm itself?

Looking at tps6598x_poll_work():

	queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
			   msecs_to_jiffies(POLL_INTERVAL));

Because the re-arming is unconditional, won't cancel_delayed_work_sync() he=
re
allow the work to just queue itself again immediately, resulting in a
use-after-free after the device is unbound?

[ ... ]
> -static int __maybe_unused tps6598x_suspend(struct device *dev)
> +int tipd_suspend(struct tps6598x *tps)
>  {
> -	struct i2c_client *client =3D to_i2c_client(dev);
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
> -
>  	if (tps->wakeup) {
> -		disable_irq(client->irq);
> -		enable_irq_wake(client->irq);
> +		disable_irq(tps->irq);
> +		enable_irq_wake(tps->irq);

[Severity: High]
This isn't a bug introduced by this patch, but if the device tree specifies
a wakeup-source but no interrupt is provided, tps->irq is 0 and tps->wakeup
is true.

Won't this call disable_irq(0) and enable_irq_wake(0), mistakenly manipulat=
ing
the wrong interrupt (such as the system timer)?

[ ... ]
> -static int __maybe_unused tps6598x_resume(struct device *dev)
> +int tipd_resume(struct tps6598x *tps)
>  {
> -	struct i2c_client *client =3D to_i2c_client(dev);
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
>  	int ret;
[ ... ]
>  	if (tps->wakeup) {
> -		disable_irq_wake(client->irq);
> -		enable_irq(client->irq);
> +		disable_irq_wake(tps->irq);
> +		enable_irq(tps->irq);

[Severity: High]
This is a pre-existing issue, but similar to suspend, if tps->irq is 0, won=
't
this resume path call enable_irq(0) and disable_irq_wake(0)?

> diff --git a/drivers/usb/typec/tipd/i2c.c b/drivers/usb/typec/tipd/i2c.c
> new file mode 100644
> index 0000000000000..1ea6ee59c8226
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/i2c.c
[ ... ]
> +static int __maybe_unused tps6598x_resume(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +
> +	return tipd_resume(tps);
> +}
> +
> +const struct dev_pm_ops tps6598x_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(tps6598x_suspend, tps6598x_resume)
> +};

[Severity: Low]
Should this dev_pm_ops struct be declared static to avoid namespace polluti=
on
and missing-prototype warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-tipd-ace3-=
v2-0-1345957bd635@chaosmail.tech?part=3D2
