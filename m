Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCB23EDAAE
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742384; cv=none; b=fjf5K5wRJP4VPvmNB/9PUztzK9KUfgR1RURf8ahN5Z4nq1arxMtj8kS2vOAzI2Rs4Q0RBkOM382NaS9B059cm50DK5uAwBzd1a6fJm+13OdW7W/uYSATMJu/hW+EftBNEatz3wR30rqMcHKUuCG2lmFejkoGLsdYKVBYLU2erAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742384; c=relaxed/simple;
	bh=0+IwrBV28aCuRXggvy87Pnh0OkueBTW/44xZq4fyGWk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i8q9puZKb78rmRMY75C3uUvD5b6YkKLERKlx4CQY70pWcvzd3bHeg2gxrr520ByxsHhInkPnWzIXnG2sxknCMqYUZce1wn1qjB5Ws/JcnKkxxm7KnwsFlXBLE7qGlO+8byyh5/wNUdqwj/s/5wJ8YXYur3ycJByVeuY61HBaaCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eI0kVTV0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eI0kVTV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707DB1F000E9;
	Wed, 26 Aug 2026 11:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787742378;
	bh=xuzOIiaXyhOUhhgwY02aAjweFTXAqHHgZUxH3amT6hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eI0kVTV0w4QtEOsb4k0XdazuMHHBA16/GXQWbw9A5pYYuQdsm9ne/viWMC6QqoEf/
	 6/LPA7eEGBW8wvX0QAFSIFgs1JnGjN4P06td914veHI22iR1uIqlg0aoWsk6B3Ptc0
	 ype7mdcSuT1yR4Hrsl0SHzumNJ6ZsJU1dMIoIAONGSa0K1kqg6Sjyu/zgB+8AOJzbB
	 jV8NDsSdJUUUv6fF/UrhQ5lzU6C+qGOM6FFeZe1VaVQWAhkivZrjq+BJYFapxjWNyD
	 qmDzkgxDBRq6hmtv/Wci1E8xZAOmSti4fO0OMtdov9WS5Ahf0Jkoql2/Bdw2FOR/61
	 3NQ0sXYI1JgoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826-tipd-ace3-v6-2-e919f39a93a2@chaosmail.tech>
References: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
 <20260826-tipd-ace3-v6-2-e919f39a93a2@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:06:17 +0000
Message-Id: <20260826110618.707DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A delayed work item is queued but never cancelled on the probe err=
or path in polling mode, leading to a Use-After-Free.
- [High] Suspend and resume callbacks operate blindly on IRQ 0 if the `wake=
up-source` property is present but no valid IRQ is configured.
- [High] If hardware checks fail during `tipd_resume()`, early return leave=
s the system IRQ permanently disabled.
--

commit 74c8f85f00d632452859f6773ca966726049ba5e
Author: Alyssa Milburn <amilburn@zall.org>

usb: typec: tipd: Factor out i2c specifics

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 522f56742aa9b..fb7bb68731bc5 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
[ ... ]
> @@ -1887,14 +1760,14 @@ static int tps6598x_probe(struct i2c_client *clie=
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
>  		dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
>  		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
> @@ -1905,13 +1778,12 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
>  	if (ret)
>  		goto err_disconnect;

[Severity: High]
This is a pre-existing issue, but can this error path in tipd_init() lead
to a use-after-free?

If tps->data->connect() fails in polling mode (where tps->irq =3D=3D 0), ret
will hold the error code. The polling work is then queued in the else
branch.

Because ret is non-zero, the "if (ret)" check triggers a jump to
err_disconnect. The error handling path misses calling
cancel_delayed_work_sync(&tps->wq_poll). When the devres framework frees
the tps structure upon probe failure, the scheduled delayed work might
execute and access freed memory.

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
>  	} else if (tps->reset) {
>  		gpiod_set_value_cansleep(tps->reset, 1);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does tipd_suspend() blindly
operate on IRQ 0?

During probe, tps->wakeup can be set to true if the wakeup-source property
is found in the device tree, even if no valid IRQ is configured
(tps->irq =3D=3D 0).

If this happens, tipd_suspend() will pass IRQ 0 to disable_irq() and
enable_irq_wake(), which could crash the system or disable critical system
timers (such as the PIT on x86).

[ ... ]
> -static int __maybe_unused tps6598x_resume(struct device *dev)
> +int tipd_resume(struct tps6598x *tps)
>  {
> -	struct i2c_client *client =3D to_i2c_client(dev);
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
>  	int ret;
> =20
>  	ret =3D tps6598x_check_mode(tps);
>  	if (ret < 0)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but could this early return in tipd_resume()
leave the system IRQ permanently disabled?

If tps6598x_check_mode(tps) fails on resume, the function returns early
before balancing the disable_irq() call from suspend with enable_irq().

This creates an unbalanced IRQ depth, keeping the IRQ line disabled, which
will break any other devices sharing the same IRQ.

[ ... ]
> @@ -1991,25 +1859,22 @@ static int __maybe_unused tps6598x_resume(struct =
device *dev)
>  	}
> =20
>  	if (tps->wakeup) {
> -		disable_irq_wake(client->irq);
> -		enable_irq(client->irq);
> +		disable_irq_wake(tps->irq);
> +		enable_irq(tps->irq);
>  	} else if (tps->reset) {
>  		gpiod_set_value_cansleep(tps->reset, 0);
>  		msleep(TPS_SETUP_MS);
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but similar to the suspend path,
will tipd_resume() pass IRQ 0 to disable_irq_wake() and enable_irq() if
no IRQ is configured but the wakeup-source property is present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-tipd-ace3-=
v6-0-e919f39a93a2@chaosmail.tech?part=3D2
