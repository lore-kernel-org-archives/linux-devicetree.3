Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE442BC31
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104719; cv=none; b=KJ3oQGRnI0+VfATC8JOodjBOLIVPtz5iRes6zbdipEniXuC5SsgvUsh2rV/S9h/miXQ6WfIRnV5crfnOh/Iv2/PeWQ8m+1n8k3UvDrh5UOAIa6fjq4WR0tFLQuiHpN8sBM1x19o8OX1zKyHqerVuMxYMKxfycbvYpYkqovaiw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104719; c=relaxed/simple;
	bh=V91eXKnGzQoDAqO1bKKEFsOfOdg0vS9hRh4A4zMCx98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SJ4jjB9eUcbQNW5Ws8YPgmnlPjvnoLV3ZeGbyfxE/qmz6yKn3C922fYZL1PqnS6f+SvnbBavSvMtgNC8C4AzEZ97TFWYV17UEvClSZHRC0KY3kCcoesp0uBGFqW2Kd9DjwWV8Cwp6et/BuRMuf6TttPaWFZJCDPjFdxJthUMBOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFemzua1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFemzua1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7F91F000E9;
	Wed, 15 Jul 2026 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104718;
	bh=2KhS/UIcK/QfLj46ig62CJ5pfEEEfJ8rSFIPGvNPOf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dFemzua1eDDn0OoJluEKzP2hA5Fb80OhsEoVz1SYFjoBFfiLLgDZXBugbvBub7o+W
	 EjwCFGJQcCGSEI3COt5WZ/uJRTkOxO8oZkVjAJR9L4Od574UaWn2lqCMVLOkZwXqiy
	 6VXkM0XiIUqh4j9TeCUt7z+6mCEA2mpzBtAA6JfO8noyi8WXrrOZRJK5jxF5HgSafA
	 J7rZLANC9BKF6409mMtuRh9/J8Fm9WDT2PLLryWtaaTi0C+YbSy7RdeGlNkPUccdlW
	 pk1J0J1DlTBh9BGr/B4ZgubbLB87Yp5IH+mBczhXF9kpS4SbPqypeIBqRunZMxhazC
	 ui7yGB5GXpsrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: light: ltr501: Add ltr329 driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715-liteon-ltr329-v1-3-31f027051594@geanix.com>
References: <20260715-liteon-ltr329-v1-0-31f027051594@geanix.com>
 <20260715-liteon-ltr329-v1-3-31f027051594@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 08:38:37 +0000
Message-Id: <20260715083837.9F7F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Probe error paths skip device power-down, leaving the sensor act=
ive and leaking power.

Pre-existing issues:
- [High] Asymmetric teardown of the devm-managed IRQ and manual IIO device =
unregistration leads to a Use-After-Free on the IIO event interface.
- [High] Enabling the software timestamp channel on sensors without proximi=
ty support causes the trigger handler to hang and drop all captured data.
--

--- Patch [3]: [PATCH 3/3] iio: light: ltr501: Add ltr329 driver support ---
commit 6c505591ba68d4c8fcdd0eb98eb4532e6610696f
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Add ltr329 driver support
   =20
This adds support for the LTR-329ALS-01 chip, which is similar to
LTR-303ALS-01, except for interrupt, which LTR-329ALS-01 chip does not
have.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 7d045be78c6df..815b67a10837d 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1257,6 +1269,18 @@ static const struct ltr501_chip_info ltr501_chip_i=
nfo_tbl[] =3D {
>  		.channels =3D ltr301_channels,
>  		.no_channels =3D ARRAY_SIZE(ltr301_channels),
>  	},
> +	[ltr329] =3D {
> +		.partid =3D 0x0A,
> +		.als_gain =3D ltr559_als_gain_tbl,
> +		.als_gain_tbl_size =3D ARRAY_SIZE(ltr559_als_gain_tbl),
> +		.als_mode_active =3D BIT(0),
> +		.als_gain_mask =3D BIT(2) | BIT(3) | BIT(4),
> +		.als_gain_shift =3D 2,
> +		.info =3D &ltr301_info_no_irq,
> +		.info_no_irq =3D &ltr301_info_no_irq,
> +		.channels =3D ltr301_channels,

[Severity: High]
This is a pre-existing issue, but does using ltr301_channels cause the
trigger handler to hang if the timestamp channel is enabled?

Looking at ltr301_channels, the timestamp channel occupies scan_index 2. If=
 a
user enables the timestamp channel, bit 2 is set in active_scan_mask.

However, ltr501_trigger_handler() assumes bit 2 is always the proximity
sensor:

ltr501_trigger_handler() {
        ...
        if (test_bit(2, indio_dev->active_scan_mask))
                mask |=3D LTR501_STATUS_PS_RDY;

        ret =3D ltr501_drdy(data, mask);
        ...
}

Since sensors using ltr301_channels lack a proximity sensor, the hardware
ready bit is never set. Could this cause ltr501_drdy() to loop and drop
data?

> +		.no_channels =3D ARRAY_SIZE(ltr301_channels),
> +	},
>  };

[ ... ]

> @@ -1531,6 +1555,11 @@ static int ltr501_probe(struct i2c_client *client)
>  		return ret;
> =20
>  	if (client->irq > 0) {
> +		if (!ltr501_has_irq_support(data->chip_info)) {
> +			dev_err(&client->dev, "chip does not support irq\n");
> +			return -EINVAL;
> +		}

[Severity: Medium]
Does this early return bypass device power-down on probe failure?

If the device tree specifies an IRQ for a chip that does not support it,
this will return -EINVAL directly instead of jumping to the
powerdown_on_error label, which could leave the device powered on.

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
risk when the threaded IRQ is requested here?

The driver uses devm_request_threaded_irq() during probe but manually calls
iio_device_unregister() in ltr501_remove().

Because devm-managed resources are freed after ltr501_remove() completes,
the interrupt remains active while iio_device_unregister() destroys the
event interface.

If an interrupt fires during this window, ltr501_interrupt_handler() calls
iio_push_event(), which accesses the freed event interface structure.

> +
>  		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
>  						NULL, ltr501_interrupt_handler,
>  						IRQF_TRIGGER_FALLING |

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-liteon-ltr=
329-v1-0-31f027051594@geanix.com?part=3D3
