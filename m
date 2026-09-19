Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489B398910
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 23:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789858823; cv=none; b=copoXPjbup83w9lwIhS6JfoENfqX52J2SfpF2X4rsv9fpGKLjNFA7lBHpGbTT4ZnJZwziM5bbjx24U/x0Os6pxLbCDkulJPpYKVlBVZs2Xwr35BZwAVE0G2Z2GT43bymOAHRuYf4IZ2x4wCTHT65opxVfjx3GNrOtuFE0eBYCYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789858823; c=relaxed/simple;
	bh=0DqLZhnGiguHeWNw8aYpuKZ+r8Z0GJIFLwAU45LnjCY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jFDFqTdQ+vCwgXlzidb0IvZdRKNMsR9pEem4Oj0dgi4NvnsLh6Ps7xJ59RxPxTCPSpmHe3SrjfZZgeuhjxx9Rwxqk24np1zCVymbQmuPcrg4VLNmKUlGi8Wn4T5vPYP8gkhlxyUO4PHM0aR0Rut2wOlx6nK6XmgMo39u0JlsdWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3CjLMZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3CjLMZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39CE1F000FF;
	Sat, 19 Sep 2026 23:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789858822;
	bh=W6mN8A9DWn6P8+kbvO8t3ERh6hIjBIMl/hS38pPRaq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j3CjLMZa9cjja8NLYqr5GMDIGiq9ZO4Jdq/y9MKQE/0ejtJtcNhMj8wXUD+X9KsXu
	 fhUeo8FIe1S/jLtOR1hMfL5kQq8g0MQ9wjzopuWuclpRA7q3EoVq2y3JMTXw7uP0yp
	 BisPP4bk0jtE5EA2RoTopO0DWVXG4ROdWNpyvJ6ufq2inPS+jj8YAhaCw/C1ZeMc3P
	 eWieQpB3RqkGLqopNx4wjVsfQc3ItATxb1J9+7DsY37KDIOedru455+0lIUV+IveGe
	 /rR/tKEea9yBzWd+2KSO7mZIHOdFjErOV6cbQvCd+Sc4icLinfc6De5mwOgoy/sPZM
	 LT+vy1FMTVsNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: pressure: add Sensirion SDP31 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Abu Bakar" <m.abubakar365@yahoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260919223854.13437-3-m.abubakar365@yahoo.com>
References: <20260919223854.13437-1-m.abubakar365@yahoo.com>
 <20260919223854.13437-3-m.abubakar365@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 23:00:21 +0000
Message-Id: <20260919230021.B39CE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] iio: pressure: data race on global sdp31_crc8_table during concurr=
ent probes
- [Low] i2c: sdp31_id array uses positional instead of named initializers
--

commit 64f407e74ab363c060c44155c0fe0d881043f834
Author: Muhammad Abu Bakar <m.abubakar365@yahoo.com>

    iio: pressure: add Sensirion SDP31 driver
   =20
    Add an IIO driver for the Sensirion SDP31 differential pressure sensor.
    The device is accessed over I2C and reports differential pressure and
    temperature. Each measurement is validated using the sensor's CRC-8
    checksum.

> diff --git a/drivers/iio/pressure/sdp31.c b/drivers/iio/pressure/sdp31.c
> new file mode 100644
> index 0000000000000..934a3afcde7f3
> --- /dev/null
> +++ b/drivers/iio/pressure/sdp31.c
[ ... ]
> +DECLARE_CRC8_TABLE(sdp31_crc8_table);
[ ... ]
> +static int sdp31_check_crc(const u8 *word)
> +{
> +	if (crc8(sdp31_crc8_table, word, 2, SDP31_CRC8_INIT) !=3D word[2])
> +		return -EIO;
> +	return 0;
> +}
[ ... ]
> +static int sdp31_probe(struct i2c_client *client)
> +{
> +	struct iio_dev *indio_dev;
> +	struct sdp31_data *data;
> +	struct sdp31_reading r;
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data =3D iio_priv(indio_dev);
> +	data->client =3D client;
> +	mutex_init(&data->lock);
> +
> +	crc8_populate_msb(sdp31_crc8_table, SDP31_CRC8_POLY);

[Severity: High]
Is it possible for this crc8_populate_msb() call to race with concurrent re=
ads
of the same table?

DECLARE_CRC8_TABLE(sdp31_crc8_table) creates a global static array. If one
SDP31 device is actively queried from userspace, it reads from
sdp31_crc8_table in sdp31_check_crc().

If a second SDP31 device is probed simultaneously (for example, via a bus
rescan or hotplug event), sdp31_probe() will unconditionally write to this
global array without synchronization.

Could this initialization be protected with something like DO_ONCE(), or mo=
ved
to the module initialization phase?

[ ... ]
> +static const struct i2c_device_id sdp31_id[] =3D {
> +	{ "sdp31" },

[Severity: Low]
Should this array use named initializers to align with I2C subsystem
guidelines?

The I2C subsystem requires arrays of type struct i2c_device_id to explicitly
use named initializers.

Could this be updated to use explicit initialization, such as
{ .name =3D "sdp31" }?

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, sdp31_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919223854.1343=
7-1-m.abubakar365@yahoo.com?part=3D2
