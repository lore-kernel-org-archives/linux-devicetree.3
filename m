Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A33E443A97
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609740; cv=none; b=ZVl5coNMowmD4EXKVxn8WHJDwRCrNFkOGnoqWipa+h0Z1MvaLOg6mGiz6ac6EIZzXyKS/JWNmC19bUll3954nAUckKd91489rCpUS4B300Xp5HCHpYpepiWdjIQksgysdjUnCpXKalVivs0T59yq/TGRoPNr6PS3ZHIVp4hIOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609740; c=relaxed/simple;
	bh=DuIC8yxpqUXF77owLV9q+MZ+87gTHceGefORc/xjh74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WpqPpPUQuVDrVbzc+xLE6FvunSSYviGBTrlQquZE5hoSIuny87shwqvZdT2y51PyggMmMhxEbQYigCavVmZ0N2VMbLEAW6MCICP3ld1k+Qrxgd23xY9bipf9k8kYH2Tb4zl0WT9ZEB9tOKHmfdUxdvVx8nGZ1NwE2ptC+Sc1RAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK6aBe4o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK6aBe4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F106D1F000E9;
	Thu, 13 Aug 2026 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609739;
	bh=sZ9VTwK/wfGLqmQ+MDu6Mf23GPMoFkCDxywfuueNJDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fK6aBe4oaOpOu/JTCUrIfdPVFEJqVXQn1V1MPDhRfJzuLo8bTiouX2NVBpBYcmZKJ
	 ImNz5J4spD21YuUygwkUbNedI0b6fKPMvvq2C2ZpCCuqrDtF1wmVGzu10OuMOasg1z
	 GVw32LYn7TB7SwFpDPY3qryv59Sm82n/6QwqDQmnagSM7aW0K/oEByN1uzDrjr4wEj
	 rkIWkCJojQFZVtW9cVagPLoXnV2cTv5ZXsjSwQns0xoAYtzKHFGky8EPCtdAzN1eCx
	 ATgpv1Kdk9O7Q5nC1Rinl3LQ98+sjk/amr68vme2CoSRKczYhWi+0z8BfAZvHWj/al
	 DL85dfFGU+SVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] iio: accel: adxl367: add support for INT2
 interrupt pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260813081452.4289-4-antoniu.miclaus@analog.com>
References: <20260813081452.4289-1-antoniu.miclaus@analog.com>
 <20260813081452.4289-4-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 08:28:58 +0000
Message-Id: <20260813082858.F106D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver configures the interrupt map register based on a hardco=
ded name priority, but ignores the corresponding IRQ line and registers the=
 default `irq` parameter, risking an IRQ routing mismatch.
--

--- Patch [3]: [PATCH v2 3/3] iio: accel: adxl367: add support for INT2 int=
errupt pin ---
commit 89ea1f01faa6ff074e5199721996b317c618f006
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: accel: adxl367: add support for INT2 interrupt pin

The ADXL367 provides two independent interrupt output pins, INT1 and
INT2, each with its own event mapping register. This commit updates the
driver to determine the connected pin from the interrupt-names device tree
property and routes the interrupt mappings to the matching register.

> diff --git a/drivers/iio/accel/adxl367.c b/drivers/iio/accel/adxl367.c
> index 8c3de11a10a37..df385740b17b5 100644
> --- a/drivers/iio/accel/adxl367.c
> +++ b/drivers/iio/accel/adxl367.c

[ ... ]

> @@ -1426,6 +1430,31 @@ static int adxl367_setup(struct adxl367_state *st)
>  	return adxl367_set_measure_en(st, true);
>  }
> =20
> +static int adxl367_set_int_map_reg(struct adxl367_state *st)
> +{
> +	int irq;
> +
> +	irq =3D fwnode_irq_get_byname(dev_fwnode(st->dev), "INT1");
> +	if (irq =3D=3D -EPROBE_DEFER)
> +		return irq;
> +	if (irq > 0) {
> +		st->int_map_reg =3D ADXL367_REG_INT1_MAP;
> +		return 0;
> +	}
> +
> +	irq =3D fwnode_irq_get_byname(dev_fwnode(st->dev), "INT2");
> +	if (irq =3D=3D -EPROBE_DEFER)
> +		return irq;
> +	if (irq > 0) {
> +		st->int_map_reg =3D ADXL367_REG_INT2_MAP;
> +		return 0;
> +	}
> +
> +	/* No interrupt-names: default to INT1 for backwards compatibility. */
> +	st->int_map_reg =3D ADXL367_REG_INT1_MAP;
> +	return 0;
> +}
> +

[ ... ]

> @@ -1482,6 +1511,10 @@ int adxl367_probe(struct device *dev, const struct=
 adxl367_ops *ops,
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D adxl367_set_int_map_reg(st);
> +	if (ret)
> +		return dev_err_probe(st->dev, ret, "Failed to get interrupt\n");
> +
>  	ret =3D devm_request_threaded_irq(st->dev, irq, NULL,
>  					adxl367_irq_handler, IRQF_ONESHOT,
>  					indio_dev->name, indio_dev);

[Severity: High]
Could this cause a mismatch between the interrupt map register and the
requested irq line?

If a device tree specifies both interrupts but INT2 is listed first
(index 0), the SPI/I2C core passes the INT2 irq as the irq parameter to
adxl367_probe().

Meanwhile, adxl367_set_int_map_reg() checks INT1 first, configures the
sensor to route interrupts to the INT1 pin, and discards the retrieved
irq number.

Then devm_request_threaded_irq() registers the handler on the original irq
parameter (INT2). Does this result in the device signaling on INT1 while
the OS listens on INT2?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813081452.4289=
-1-antoniu.miclaus@analog.com?part=3D3
