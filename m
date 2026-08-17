Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB83624D7
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001818; cv=none; b=BgD3hcu9nHYe4FXyN3O8fDnkThk+wyzXk1Dl4YYtVFekVq2XiRJ9kXFBRfLZtqQI/CS2GT0viq4z/KWdYqoaxQzP4o2LOO7pgkiTvS2ARX9aT0otfet2+SxXjTWtXnP4fpz8DrarWYctWuKOAyIr2rx1OFmr/I5ClVkd/9HU980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001818; c=relaxed/simple;
	bh=HkM7KqCQq7DOBbuJ6Juj8Ab7KXGAN2PNArvVInUg3VI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bPbVlbjXKK3KOqxpkMB35vnQQouTZIYbc3n1kdeNYB7bvuPCZfdS2AVuo4/Vt47qZUn07Rej53jf7Vk7aQ9Eee7PuOV9KR/NTS7UkX+/nTCBbF3poOyu+e0hy80e/OVMcU3ykO05wEwquNb9UnN0/Z8kEevWq+DxaMmsihHjrzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGmm4ug2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGmm4ug2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AA41F000E9;
	Mon, 17 Aug 2026 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001816;
	bh=s+Xs0WVK+bk7aquTBYguJ9+H9rzt+GQVO4BP+ARxhqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BGmm4ug2YWkczKhYd3s60xagtc6X6owDc3aS2bz8f0CggNOH26n8hM7p5Vj3ywQNu
	 dnPR0HKdBy3VA7q42x6YMMrLxU5Mny1bU/0Nnt8nhKah3REJVgQOu5GcvXYiMrpijr
	 YHpSGDQabgsfnsEJXbfo0SZQNRbj3gIg/j3njqMzj9EbyB/J1ca6x4rl2gJe5qFF3/
	 b27cWYXExAShK7JeZChWoMRAVuSmAyaztATSN76CWG/iL7Rvrpj4KrmUOCaTV/TNl6
	 tWtCRlXY6+80V/piAscW8NIUncJSbMHXAbeP0WPph04XIGo8xrv0oTKKPEcJ4T74Lu
	 roZzn6zGmuETg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] iio: dac: ad5504: remove legacy platform data
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817211118.21833-4-0rayn.dev@gmail.com>
References: <20260817211118.21833-1-0rayn.dev@gmail.com>
 <20260817211118.21833-4-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 21:23:35 +0000
Message-Id: <20260817212336.63AA41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The driver deletes legacy platform data for configuring the output=
 range but fails to implement Device Tree parsing to replace it, leading to=
 incorrect IIO scale reporting.
- [High] Silent failure to probe if the optional 'vcc-supply' regulator is =
omitted from the device tree.

Pre-existing issues:
- [High] Missing mutex lock protecting shared SPI transfer buffers and devi=
ce state during concurrent sysfs accesses.
--

--- Patch [3]: [PATCH v4 3/6] iio: dac: ad5504: remove legacy platform data=
 support ---
commit e23f620a135f8935a12128aed6888332ecec66f8
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>
iio: dac: ad5504: remove legacy platform data support

This commit removes legacy platform data support from the AD5504 driver,
deleting the ad5504_platform_data structure and the fallback configuration
logic in the probe function.

> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 1793af0781dc7..79db277b776e2 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
[ ... ]
> @@ -287,16 +285,10 @@ static int ad5504_probe(struct spi_device *spi)
>  	st =3D iio_priv(indio_dev);
> =20
>  	ret =3D devm_regulator_get_enable_read_voltage(dev, "vcc");
> -	if (ret < 0 && ret !=3D -ENODEV)
> +	if (ret < 0)
>  		return ret;

[Severity: High]
Will this result in a silent probe failure if the optional vcc-supply
regulator is omitted from the device tree?

Since devm_regulator_get_enable_read_voltage() internally uses
devm_regulator_get_optional(), it returns -ENODEV if the regulator is
absent.

Propagating this error directly without logging causes the driver core to
treat it as a silent match rejection, whereas before it gracefully continue=
d.

> -	if (ret =3D=3D -ENODEV) {
> -		if (pdata->vref_mv)
> -			st->vref_mv =3D pdata->vref_mv;
> -		else
> -			dev_warn(dev, "reference voltage unspecified\n");
> -	} else {
> -		st->vref_mv =3D ret / 1000;
> -	}
> +
> +	st->vref_mv =3D ret / 1000;

[Severity: High]
Does this missing implementation of device tree parsing lead to incorrect I=
IO
scale reporting?

The code currently hardcodes the reference voltage to the vcc supply
voltage without providing a fallback to parse the newly added
output-range-microvolt property.

If a system has a 60V VCC supply but the R_SEL pin is configured for a
30V output range, the device will now incorrectly report a 60V scale to
userspace since the fallback logic was removed.

[ ... ]

[Severity: High]
This is a pre-existing issue, but is it possible for concurrent sysfs
accesses to corrupt memory or disrupt hardware state?

Looking at ad5504_spi_write() and ad5504_spi_read(), the shared spi buffers
are accessed without locking:

drivers/iio/dac/ad5504.c:ad5504_spi_write() {
    ...
    st->data[0] =3D cpu_to_be16(AD5504_CMD_WRITE | AD5504_ADDR(addr) |
                              (val & AD5504_RES_MASK));

    return spi_write(st->spi, &st->data[0], 2);
}

Additionally, in ad5504_write_dac_powerdown(), multiple SPI writes are
performed and st->pwr_down_mask is modified without serialization:

drivers/iio/dac/ad5504.c:ad5504_write_dac_powerdown() {
    ...
    if (pwr_down)
        st->pwr_down_mask &=3D ~(1 << chan->channel);
    else
        st->pwr_down_mask |=3D (1 << chan->channel);
   =20
    ret =3D ad5504_spi_write(st, AD5504_ADDR_CTRL,
                           AD5504_DAC_PWRDWN_MODE(st->pwr_down_mode) |
                           AD5504_DAC_PWR(st->pwr_down_mask));
   =20
    /* writes to the CTRL register must be followed by a NOOP */
    ad5504_spi_write(st, AD5504_ADDR_NOOP, 0);
    ...
}

Could concurrent reads or writes by userspace processes to sysfs attributes
interleave SPI commands or corrupt the DMA buffer in st->data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817211118.2183=
3-1-0rayn.dev@gmail.com?part=3D3
