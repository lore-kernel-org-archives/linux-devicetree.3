Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E27E3CF05D
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785620561; cv=none; b=YySYiGh3OzVVIrePmC8btUDiqtkgsV2FRZ7QulAroYftRo4BRf00lnQnf3UPKep0YblIbjk/Fz7+tBlukxwSIjy7wolzFbix7n0Pw8vgDZDnLQUqJCsCfK+D1KMLpavLlfc95cF73u5q+w+eh9r2ryggc4HWDiz5WWyEcfQNA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785620561; c=relaxed/simple;
	bh=6FHDoaA0EzCXiZ6n7lfPWfAkiANFO06y3iqIZxR1fNQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aE9XYDr5JjH9qqCpBO9oQ6X0GC1sRaAUrNhojWKXwnojAs4cXYqU2e/BD/nBQEde5eWWGt40mBpujbUZD0MS1kAAc1GikFT8AgLv65ekZAr3K5qjuPq/wsdUS3z19v3NmQPcIs+3HZ92WhikZQ10EeWIn5XjFSWCh7lEKZFj+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcKJXKTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcKJXKTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15E61F00ACA;
	Sat,  1 Aug 2026 21:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785620560;
	bh=hBGLvfYjFNApjgbHUzufrErjxV9C+yzvyAvKQbp+kWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcKJXKTTm+CQKOU/b3Te30JqpC1xX2Aw13R5oV75bagy4oLfxiucO2vSQ1mfgKWUm
	 BRQF+nHB7ap5EY9Tj2lN5ZYfkRfJ3oOuJtDVN4mZTM/+8z5Pi5WN6uHY1BxJ0YVRb4
	 dqC8yTd0wwi/RmAV8eKBAFfI+QJkJF9y7Ra59ikOlAauK/Cin8aGjWIMMWZbzSXuhj
	 LfkCm/mr+8CG4lqfVHeu252MY0eLyDS1XSnDMzYiePXQ+yIsVvxqPNYbOX8C3qrf/1
	 f8jgNhOUSbarF2RAY47MDwjWLOMQTqWuPr6ZGiQWzXBR2/oLBCSKJN11PjKc4Vl/OQ
	 U6jWHezoBVddQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-tipd-ace3-v3-2-8332f2eca4fc@chaosmail.tech>
References: <20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech>
 <20260801-tipd-ace3-v3-2-8332f2eca4fc@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 21:42:39 +0000
Message-Id: <20260801214239.E15E61F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The newly extracted `core.c` retains I2C-specific casts in `tps257=
50_write_firmware()`, risking memory corruption for non-I2C buses.

Pre-existing issues:
- [Critical] tipd_suspend() and tipd_resume() unconditionally pass an inval=
id IRQ 0 to disable_irq() and enable_irq() if configured as a wakeup source=
 but lacking an interrupt.
- [High] tipd_resume() attempts to communicate with the device over I2C bef=
ore de-asserting its reset GPIO, causing a guaranteed communication failure.
- [High] Delayed works (`wq_poll` and `cd321x->update_work`) are queued but=
 not canceled on probe error paths, leading to a Use-After-Free.
- [High] Early returns in tipd_resume() skip enable_irq(), permanently disa=
bling a shared interrupt line.
--

--- Patch [2]: [PATCH v3 2/3] usb: typec: tipd: Factor out i2c specifics ---
commit 8d801170f1c1aaccc36ed5f0477a7ac708265867
Author: Alyssa Milburn <amilburn@zall.org>

usb: typec: tipd: Factor out i2c specifics

Make the core driver more bus-agnostic to prepare for SPMI variants of
the tipd chip.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index d5ee0af9058b9..31098bdce1096 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[Severity: High]
Since this commit prepares core.c for non-I2C buses, will the hardcoded
I2C casts remaining in tps25750_write_firmware() cause memory corruption
if an SPMI variant reaches this path?

For example:

drivers/usb/typec/tipd/core.c:tps25750_write_firmware() {
    struct i2c_client *client =3D to_i2c_client(tps->dev);
    ...
    client->adapter->timeout =3D msecs_to_jiffies(5000);
    client->addr =3D bpms_addr;
}

Could this overwrite memory at the client->adapter->timeout and
client->addr offsets for non-I2C devices?

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
> =20
> -	i2c_set_clientdata(client, tps);
>  	fwnode_handle_put(fwnode);
> =20
>  	tps->wakeup =3D device_property_read_bool(tps->dev, "wakeup-source");
> -	if (tps->wakeup && client->irq) {
> -		devm_device_init_wakeup(&client->dev);
> -		enable_irq_wake(client->irq);
> +	if (tps->wakeup && tps->irq) {
> +		devm_device_init_wakeup(tps->dev);
> +		enable_irq_wake(tps->irq);
>  	}
> =20
>  	return 0;
> @@ -1887,15 +1760,14 @@ static int tps6598x_probe(struct i2c_client *clie=
nt)
> =20
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(tipd_init);

[Severity: High]
This is a pre-existing issue, but does the error path in tipd_init()
leak the delayed works?

If tps->data->connect() succeeds and queues cd321x->update_work, or if
the polling mode queues tps->wq_poll, and a subsequent step fails, we
take the err_disconnect path.

Does this path exit and drop the device structure without calling
cancel_delayed_work_sync(&tps->wq_poll) or tps->data->remove(tps) to
cancel pending works, potentially causing a use-after-free when the tps
struct is freed?

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

[Severity: Critical]
This is a pre-existing issue, but can this pass an invalid IRQ 0 to
disable_irq() and enable_irq_wake()?

If the device specifies a wakeup-source in the device tree but has no
interrupt configured, tps->wakeup will be true while tps->irq is 0.

Could calling disable_irq(0) inadvertently disable critical system
interrupts, such as the primary system timer?

[ ... ]

> -static int __maybe_unused tps6598x_resume(struct device *dev)
> +int tipd_resume(struct tps6598x *tps)
>  {
> -	struct i2c_client *client =3D to_i2c_client(dev);
> -	struct tps6598x *tps =3D i2c_get_clientdata(client);
>  	int ret;
> =20
>  	ret =3D tps6598x_check_mode(tps);

[Severity: High]
This is a pre-existing issue, but does tipd_resume() attempt to
communicate with the device before it is taken out of reset?

When the device lacks a wakeup source but has a reset GPIO,
tipd_suspend() asserts the reset GPIO.

During tipd_resume(), we call tps6598x_check_mode() which tries to read
from the device. However, the reset GPIO is not de-asserted until later:

drivers/usb/typec/tipd/core.c:tipd_resume() {
    ...
    } else if (tps->reset) {
        gpiod_set_value_cansleep(tps->reset, 0);
        ...
    }
}

Will this lead to a guaranteed communication failure during resume?

[Severity: High]
This is also a pre-existing issue, but do the early returns from
tps6598x_check_mode() and tps->data->init() skip re-enabling the
interrupt?

If tipd_resume() encounters an error here, it returns early and skips:

drivers/usb/typec/tipd/core.c:tipd_resume() {
    ...
    if (tps->wakeup) {
        disable_irq_wake(tps->irq);
        enable_irq(tps->irq);
    }
    ...
}

Could this permanently disable a shared interrupt line?

> @@ -1946,25 +1815,22 @@ static int __maybe_unused tps6598x_resume(struct =
device *dev)
>  	}
> =20
>  	if (tps->wakeup) {
> -		disable_irq_wake(client->irq);
> -		enable_irq(client->irq);
> +		disable_irq_wake(tps->irq);
> +		enable_irq(tps->irq);

[Severity: Critical]
This isn't a bug introduced by this patch, but can this pass an invalid
IRQ 0 to disable_irq_wake() and enable_irq()?

As in tipd_suspend(), if the device specifies a wakeup-source in the
device tree but has no interrupt configured, tps->wakeup will be true
while tps->irq is 0.

Could calling enable_irq(0) corrupt the IRQ state for critical system
interrupts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-tipd-ace3-=
v3-0-8332f2eca4fc@chaosmail.tech?part=3D2
