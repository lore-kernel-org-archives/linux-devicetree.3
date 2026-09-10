Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6C513565
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059553; cv=none; b=iJo3VHj80F/vnkRVCMI9ki/6HuU0i35JncxoxzATXm1qFDB20VaqmviMnRUJcTfEW9kE/K8+6GynJXK3dAaEpVX+QvaFkriaOYC4BEi3xNOMpd4nQ3oiWyFaZEnWleAvPqog71FWN2iEkMC1CAL0/xvVH7SbKvkmvxU7ji65R28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059553; c=relaxed/simple;
	bh=s00bcymjWKDPqjmrnUKqY+/zxsTl/oO2W5WAJysnfjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KcsofwB7EvZEpHxeo9LdITTdBsoQ67XZJD/JZNHgHeoEIVBxnA3gjs3O1HbAVf1SM51hJ3CfOGRo1zvHfQEiKjVIcU98Rf3tiFZ/ncvNgOimNH5nwQcFgfdF6bU9X93uB+xTUhVFLslm8q5CLv6XG8TKf36p8RmE89MJHTiaYAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMAziVTN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMAziVTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135791F00893;
	Thu, 10 Sep 2026 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059544;
	bh=uUt3MBJJKXpXxszFETKAk9WC86KrwuQHMBF/uZSCym8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SMAziVTN1k/VpugvSnPgCswQ9ZvDtRp8PvCTlzfKjiaY7qGTic/U40CMN35zExufl
	 jTqAdUMvYDE4fIVeO8hK2FPLgblLrGCJ0VgJbZL7E7N47NXxO0h51/iJbn3+QtzWYU
	 QuWaRJFpAvBpGHnsTVcT+zkwny+NrX5UptARCnX/H2eSxfI95UBw68Q6GyGXcvJlqs
	 +ZgH9pNQ2RklwvVSJdT55BLS3eH+iMALRy7dpjh4vQ2AajAE3RaSQJLFyeL4Xykr6C
	 6quheM6ZilpUwPMpmLPEaDH/axhb1yMd8PBkoiqEt1XgexbnNHkFZ4g5262NCLN60v
	 ysJOOnEHxyNoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-tipd-ace3-v7-3-6c6ebe2193f2@chaosmail.tech>
References: <20260910-tipd-ace3-v7-0-6c6ebe2193f2@chaosmail.tech>
 <20260910-tipd-ace3-v7-3-6c6ebe2193f2@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 16:59:03 +0000
Message-Id: <20260910165904.135791F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Probe function fails to catch a 0 return value from of_irq_get_b=
yname(), erroneously passing IRQ 0 to devm_request_irq().
- [Medium] spmi_command_sleep() is called without waiting for the correspon=
ding sleep interrupt in sn201202x_remove and the probe error path, causing =
a teardown race.
- [Low] devm_request_irq() is called with a NULL devname argument.

Pre-existing issues:
- [High] Calling disable_irq(0) when tps->irq is 0 and wakeup-source is def=
ined.
--

commit 50826c85c86e2d8bfcd4558e78d047469a9a4cbf
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support

This commit adds support for the sn201202x (ACE3) controller, a tipd
variant that uses a similar register map exposed over a logical register
interface on the SPMI bus.

[ ... ]
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index bdcc6f75d93fe..82145c9f1cc8c 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1962,11 +1962,32 @@ static const struct tipd_data tipd_tps25750_data =
=3D {
>  	.connect =3D tps6598x_connect,
>  };
> =20
> +static const struct tipd_data tipd_sn201202x_data =3D {
> +	.irq_handler =3D cd321x_interrupt,

[Severity: High]
This is a pre-existing issue, but utilizing the tipd core suspend/resume=20
infrastructure with a device that might not have an IRQ mapped can cause=20
a system hang.

If a device tree or ACPI config defines "wakeup-source" but lacks an "irq"=
=20
property, tps->irq will default to 0. During system suspend, tipd_suspend()=
=20
only checks tps->wakeup:

drivers/usb/typec/tipd/core.c:tipd_suspend() {
    ...
    if (tps->wakeup) {
        disable_irq(tps->irq);
        enable_irq_wake(tps->irq);
    }
    ...
}

Will this cause disable_irq(0) and enable_irq_wake(0) to be called? On=20
architectures like x86 where IRQ 0 is a critical system interrupt (the PIT=
=20
timer), disabling it can hang the kernel.

> +	.irq_mask1 =3D APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
[ ... ]
> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> index 0000000000000..a165ec39a8ed8
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c
[ ... ]
> +static int sn201202x_probe(struct spmi_device *device)
> +{
[ ... ]
> +	tps->irq =3D of_irq_get_byname(device->dev.of_node, "irq");
> +	if (tps->irq < 0)
> +		return tps->irq;

[Severity: Medium]
Does this check miss the case where of_irq_get_byname() returns 0?=20

If the device tree is malformed or IRQ mapping fails, of_irq_get_byname()=20
can return 0. Passing IRQ 0 to devm_request_irq() can conflict with critica=
l=20
system interrupts instead of aborting the probe gracefully. Should this che=
ck=20
be <=3D 0?

> +	irq_select =3D of_irq_get_byname(device->dev.of_node, "select");
> +	if (irq_select < 0)
> +		return irq_select;
> +	irq_sleep =3D of_irq_get_byname(device->dev.of_node, "sleep");
> +	if (irq_sleep < 0)
> +		return irq_sleep;
> +	irq_wake =3D of_irq_get_byname(device->dev.of_node, "wake");
> +	if (irq_wake < 0)
> +		return irq_wake;

[Severity: Medium]
Similarly, do these checks also need to verify that the returned IRQs=20
are not 0?

> +
> +	init_completion(&sn->select_completion);
> +	init_completion(&sn->sleep_completion);
> +	init_completion(&sn->wake_completion);
> +
> +	ret =3D devm_request_irq(&device->dev, irq_select, sn201202x_irq,
> +			       0, NULL, &sn->select_completion);

[Severity: Low]
Is it intentional to pass NULL as the devname argument here?

The IRQ name will appear as "(null)" in /proc/interrupts and tracing output=
,=20
which might degrade observability and debugging tools. Could a descriptive=
=20
string be provided instead?

> +	if (ret)
> +		return ret;
> +	ret =3D devm_request_irq(&device->dev, irq_sleep, sn201202x_irq,
> +			       0, NULL, &sn->sleep_completion);

[Severity: Low]
Does this also need a valid devname instead of NULL?

> +	if (ret)
> +		return ret;
> +	ret =3D devm_request_irq(&device->dev, irq_wake, sn201202x_irq,
> +			       0, NULL, &sn->wake_completion);

[Severity: Low]
Does this also need a valid devname instead of NULL?

> +	if (ret)
> +		return ret;
> +
> +	spmi_device_set_drvdata(device, tps);
> +	tps->regmap =3D devm_regmap_init_sn201202x(device, &tps6598x_regmap_con=
fig);
> +	if (IS_ERR(tps->regmap))
> +		return PTR_ERR(tps->regmap);
> +
> +	ret =3D spmi_command_wakeup(device);
> +	if (ret)
> +		return ret;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;
> +
> +	ret =3D tipd_init(tps);
> +	if (ret)
> +		spmi_command_sleep(device);

[Severity: Medium]
Could this create a race condition during driver teardown on the error path?

If the hardware is slow to enter sleep, the sleep interrupt might fire afte=
r=20
the IRQ handler is freed by devm when probe fails, potentially causing an=20
unhandled interrupt. Should this wait for the sleep completion like the=20
wakeup path does?

> +	return ret;
> +}
> +
> +static void sn201202x_remove(struct spmi_device *device)
> +{
> +	struct tps6598x *tps =3D spmi_device_get_drvdata(device);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +
> +	tipd_remove(tps);
> +	spmi_command_sleep(sn->sdev);

[Severity: Medium]
Similarly, does this need synchronization with the sleep interrupt before=20
remove completes?

> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-tipd-ace3-=
v7-0-6c6ebe2193f2@chaosmail.tech?part=3D3
