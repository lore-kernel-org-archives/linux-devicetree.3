Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E92F9D98
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010381; cv=none; b=IPjc6ob+Q0gcGJUtcHL2Fw5lGh9CVfWRyVj657b50kxFVuL5Wf7twdIQs+fTJdjvnN8HhzcWZPjIIlkLc3fyZmktZlOYGj61J7+SIOWodSwBGL4OGW3xgm6+aDR8HFupJbB/mSyIH7FBybvnGxRON/eArd9oHhfI2uL0mk9fP9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010381; c=relaxed/simple;
	bh=vMxX5WHHFmRAbnkBivvIpN9jWCdgwZsmUMVTFLRirFo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dyMKQ4W8wWTC4Gwlwo6iCqrM+kg6v3jZdCQFzvw7Edhbj3rMB7OQD36tUHGtRmVFwFxVxNh68/aL8GbPltpTCCsv9VzQlgj52MQxcgB61ycRMILK5E4F9Vduj1MLiTn4maxGNKCEd7uTi1K8fynGpquAEtmAfPMWD/gvQ0bIYTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5xrtbQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5xrtbQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894331F000E9;
	Thu,  6 Aug 2026 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786010379;
	bh=ae9Ck/o/64W7GZBu3tt/3v87l9CqkYkyF1uIg4y/fmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5xrtbQSby5ON2CmvJ0Y8aEr+VJkNdedB0LdTF2a63Gt5w9Wpbv5sIep/EXooDHf0
	 nxvwxT4aaGFtsOMMXyTkmjeTBJIpc40TVQ9h/e/sQJ0ADZ6gvCUFx6brzE8Zi8gnCX
	 LmMMm45I/RlOK406LH8ohIc7YQjLdmrxV3QYT+tywmK42Q1Gi/6Qh7Ph2SVNodHJLq
	 qP4bdH2Z48YPNDxp4wS8BpaZ4PXdL1Rmo1EGIWWy1MqLXaAdvAGQ2tHZrNqAzKST2C
	 z4DrS+M5dvVnRWU0//tX++Uxx0iwIaEK79CnR6TwmASJ0NV8BIUtUvnJ0c58KlW/sB
	 dOWyU1ri2Sqkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:59:39 +0000
Message-Id: <20260806095939.894331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the probe error =
path fails to cancel delayed work queues (`wq_poll` and `update_work`) when=
 returning an error, leading to a use-after-free.
- [High] This problem wasn't introduced by this patch, but the suspend and =
resume functions blindly call disable_irq() and enable_irq_wake() on IRQ 0 =
if wakeup is enabled but no IRQ is present.
--

--- Patch [2]: [PATCH v4 2/3] usb: typec: tipd: Factor out i2c specifics ---
commit 5612453a5a25a0abc22f1c5e791d782754b002b9
Author: Alyssa Milburn <amilburn@zall.org>

usb: typec: tipd: Factor out i2c specifics
   =20
Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index d5ee0af9058b9..a3b946f5aaf0a 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[ ... ]

> @@ -1842,14 +1716,14 @@ static int tps6598x_probe(struct i2c_client *clie=
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
> @@ -1860,13 +1734,12 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
>  	if (ret)
>  		goto err_disconnect;

[Severity: High]
This isn't a bug introduced by this patch, but if tipd_init() encounters an
error after scheduling the polling delayed work, will this jump to
err_disconnect without cancelling the work?

If a device lacks an IRQ and falls back to polling mode, but
tps->data->connect() fails, the wq_poll delayed work is queued but ret
remains non-zero. The function then jumps to the err_disconnect path, which
lacks a call to cancel_delayed_work_sync(&tps->wq_poll) or
cancel_delayed_work_sync(&cd321x->update_work).

Can this lead to a potential use-after-free when the work executes later on
freed memory?

[ ... ]

> @@ -1910,29 +1782,26 @@ static void tps6598x_remove(struct i2c_client *cl=
ient)
>  	if (tps->reset)
>  		gpiod_set_value_cansleep(tps->reset, 1);
>  }
> +EXPORT_SYMBOL_GPL(tipd_remove);
> =20
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
This is a pre-existing issue, but does this check safely handle misconfigur=
ed
devices?

If a device is configured via Device Tree with the wakeup-source property b=
ut
lacks an interrupts property, tps->irq will be 0, but tps->wakeup will
evaluate to true.=20

During tipd_suspend(), the code checks tps->wakeup without validating
tps->irq, blindly invoking disable_irq(0) and enable_irq_wake(0). Could
disabling IRQ 0 inadvertently disable essential system interrupts like the
system timer, leading to system freezes or panics during suspend?

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

[ ... ]

> @@ -1946,25 +1815,22 @@ static int __maybe_unused tps6598x_resume(struct =
device *dev)
>  	}
> =20
>  	if (tps->wakeup) {
> -		disable_irq_wake(client->irq);
> -		enable_irq(client->irq);
> +		disable_irq_wake(tps->irq);
> +		enable_irq(tps->irq);

[Severity: High]
This is a pre-existing issue, but similar to tipd_suspend() above, could th=
is
blindly invoke disable_irq_wake(0) and enable_irq(0) if tps->irq is missing
but wakeup is enabled?

>  	} else if (tps->reset) {
>  		gpiod_set_value_cansleep(tps->reset, 0);
>  		msleep(TPS_SETUP_MS);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-tipd-ace3-=
v4-0-79855b150914@chaosmail.tech?part=3D2
