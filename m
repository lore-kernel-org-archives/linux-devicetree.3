Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAF3CF201
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166897; cv=none; b=aOyM820/ZIhz3i/rWHRV7/aDZPlqskUgkJrZr89UwAxNPKxUf5737UsOb1L6UZeja0uGvx8IFHivM6GOjE0TwhwiYPoe0hnIrcrgrrJH1/CeOZ4eYJMHEqK/17ZywqyoN6SkL4d0dccCq5Nn6Tt8lZvPI5bbFjQrXzHjHMF7psY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166897; c=relaxed/simple;
	bh=dD5bPgP2/EN2EEDjEGKKNTmKB0E8BHeFRuzFhNdfF3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D3NVWdVE+/r2kadAvWSNh7avOpYK04KcdsHyCnOF7cnQ2Df0hbp40PzgLRCwdt3WeNKvo16dDhCZ7uratUSMSjP1YH2Zr5lKniZgiLgcnjg6m8AUZ4rMHAi+S0u90Yz7Ws4B7vpZIPm9h9ViFGzVUzU3/8mwHyg2Uj293ZWwe5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxHa3o++; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxHa3o++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2813D1F00A3D;
	Mon, 31 Aug 2026 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166895;
	bh=PxZ0bQdF56ZcEl16r1v7Zu6W99EAqPHCOtNsJWouD5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GxHa3o++lNOmXO+inn7HDjJ+dPH5kA9Ug2w75c/qlObFQrFsMqQ0RYEBvzakMj7MS
	 c06QzP4xQCac78TyDgXaxG9CRpaPA9APTJMttI+gpDBLvXyr82Do8R3hBdBeHX4AIL
	 KCUlHzaKRmBSejZJJTfslNmdRZBuRkSGNLNRCNzJhdz86R6/lP27AF8p8c65+DNw9W
	 aOh/ErxQHO0dWNt126eEGWoMKjuAUHTM54BP874oKKjEk+Pv2Af80CCaFUiKZPXT3H
	 QWojl6wd7SSAeD10cnXFFqjGJnaOO832DfKhwmdDvh7f7+SNW0suE1Y4LcXlwTaDX4
	 wtkicO1VG5yJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] iio: accel: adxl367: add support for INT2
 interrupt pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831083122.3486-5-antoniu.miclaus@analog.com>
References: <20260831083122.3486-1-antoniu.miclaus@analog.com>
 <20260831083122.3486-5-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 09:01:34 +0000
Message-Id: <20260831090135.2813D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Late IRQ lookup in probe causes hardware power leak and repeated=
 boot delays on deferral.
--

commit 0e4e153b16fef4a252e91734fb90f0480bca69d2
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: accel: adxl367: add support for INT2 interrupt pin

The ADXL367 provides two independent interrupt output pins, INT1 and
INT2, each with its own event mapping register. This commit determines
the connected pin from the interrupt-names device tree property and
routes the interrupt mappings to the matching register.

> diff --git a/drivers/iio/accel/adxl367.c b/drivers/iio/accel/adxl367.c
> index 54c4d12267901..9a2312da6238c 100644
> --- a/drivers/iio/accel/adxl367.c
> +++ b/drivers/iio/accel/adxl367.c
[ ... ]
> @@ -1423,6 +1427,36 @@ static int adxl367_setup(struct adxl367_state *st)
>  	return adxl367_set_measure_en(st, true);
>  }
> =20
> +static int adxl367_set_int_map_reg(struct adxl367_state *st, int irq)
> +{
> +	int ret;
> +
> +	/*
> +	 * Route the mappings to whichever of INT1/INT2 is named in the
> +	 * interrupt-names property. -EINVAL (property absent) and -ENODATA
> +	 * (name not listed) are not errors; anything else is.
> +	 */
> +	ret =3D fwnode_irq_get_byname(dev_fwnode(st->dev), "INT1");
> +	if (ret > 0) {
[ ... ]
> @@ -1479,6 +1513,11 @@ int adxl367_probe(struct device *dev, const struct=
 adxl367_ops *ops,
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D adxl367_set_int_map_reg(st, irq);
> +	if (ret < 0)
> +		return dev_err_probe(st->dev, ret, "Failed to get interrupt\n");
> +	irq =3D ret;
> +

[Severity: Medium]
Since fwnode_irq_get_byname() inside adxl367_set_int_map_reg() can return
-EPROBE_DEFER if the interrupt controller is not yet ready, will placing th=
is
lookup after adxl367_setup() cause repeated boot delays and leave the device
powered up on deferral?

Looking at adxl367_probe(), it resets the hardware, sleeps for 15ms, and ca=
lls
adxl367_setup() which powers up the device into measurement mode.

If adxl367_set_int_map_reg() then returns -EPROBE_DEFER, the probe aborts
without an error cleanup path to power down the device.

Could this software resource acquisition be performed before the hardware
interaction to avoid unnecessary boot stalls and power leaks during probe
deferral?

>  	ret =3D devm_request_threaded_irq(st->dev, irq, NULL,
>  					adxl367_irq_handler, IRQF_ONESHOT,
>  					indio_dev->name, indio_dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831083122.3486=
-1-antoniu.miclaus@analog.com?part=3D4
