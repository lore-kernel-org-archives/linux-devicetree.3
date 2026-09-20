Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB913B8945
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923360; cv=none; b=jm64lMyz1TfgWiT3Lexs+cOSGQ3LrG+ZenPAxxwF8nYpH3q+SRyaNePUwVRCA+3EuvNQrYLsVdxmFz+16v7yIj/GOdf/75lO++HSLFTNljxicFGmInpjzOHUCJXLXaXR3mpHDiASVpMSu5Ku07m1ofLcsRbcF0+4vKutAMB55Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923360; c=relaxed/simple;
	bh=dFKzpYbaNrTVNCn0VqbK1qgDBX26bTHRLg1prroMU3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mzSSLP8w87f2/VD+NHFWouYofG4JJ+a+d3GM5XsYChG4C/KYOH9DLw+ybp8IC6HoagJFiwrrHJxmUra4yXwjpaiOomRjOQLf2P9ViSuucAdUwsrxnE2WeAeE+5OtT3bwsfVl7+ne0l4wumqoEzfI+28kNWgfyGRpB2ss2XvmDd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNuZ4FHK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNuZ4FHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09DA1F000FF;
	Sun, 20 Sep 2026 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789923359;
	bh=KX0MpK5kiY7odwXD1AwriYO3Jc0mU0gW7hMHR1a6MbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PNuZ4FHKaL9AiWLZe5aFiIGOP9wpwC7rGm8mgOQSvexhiUVh+Jjm7h+yF16JDa5MM
	 6Vb6YaFavtwdP5bkVCNK+v27WySqNyjNK6QlePASmeP0Ac7lXfiMDmBudNzLzDF14d
	 eiMM+zQ7l4SMTaNi/CzPc1mN50eFc8daSugy8Q+RbUcZRwi4rFFhRQ3HOYopX8Vq0W
	 kzIflyS96yaG8NiKb2bnCK9hSLyDBuYjaKxFO1gxV90sdNtNhTJYgKQu9S1ss6+oUe
	 Nw0YIsNTXJ6HemzKsgG0C8nXE2pbsoz+AvHa4DHEv53HZjtD440bvkpOGleALdKOTc
	 y7vyVH5UMrrdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: pressure: add Sensirion SDP31 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Abu Bakar" <m.abubakar365@yahoo.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920164724.32019-3-m.abubakar365@yahoo.com>
References: <20260920164724.32019-1-m.abubakar365@yahoo.com>
 <20260920164724.32019-3-m.abubakar365@yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 16:55:58 +0000
Message-Id: <20260920165558.B09DA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: sdp31: missing sensor power-on delay after vdd enable
--

commit 29a27ea5bbd1f787014c3c0a7f644c621fff7ae3
Author: Muhammad Abu Bakar <m.abubakar365@yahoo.com>

iio: pressure: add Sensirion SDP31 driver

Add an IIO driver for the Sensirion SDP31 differential pressure sensor.
The device is accessed over I2C and reports differential pressure and
temperature. Each measurement is validated using the sensor's CRC-8
checksum.

> diff --git a/drivers/iio/pressure/sdp31.c b/drivers/iio/pressure/sdp31.c
> new file mode 100644
> index 0000000000000..e661a7af86271
> --- /dev/null
> +++ b/drivers/iio/pressure/sdp31.c
[ ... ]
> +static int sdp31_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;   /* #5 */
> +	struct iio_dev *indio_dev;
> +	struct sdp31_data *data;
> +	struct sdp31_reading r;
> +	int ret;
> +
> +	/* #9: get and enable the sensor's supply (auto-disabled on remove). */
> +	ret =3D devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable regulator\n");
> +
> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	data =3D iio_priv(indio_dev);
> +	data->client =3D client;
> +
> +	ret =3D devm_mutex_init(dev, &data->lock);   /* #6 */
> +	if (ret)
> +		return ret;
> +
> +	/* #7: populate the shared CRC table exactly once, race-free. */
> +	DO_ONCE(crc8_populate_msb, sdp31_crc8_table, SDP31_CRC8_POLY);
> +
> +	/* Confirm the sensor is present and learn its scale factor. */
> +	ret =3D sdp31_measure(data, &r);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read from sensor\n");  /* #8=
 */

[Severity: Medium]
Will this I2C transaction fail if the sensor is still booting?

The driver calls devm_regulator_get_enable() to turn on the vdd supply and
then almost immediately calls sdp31_measure() to communicate with the senso=
r.
If the regulator physically toggles power, the sensor might still be in its
hardware initialization sequence and could NACK the initial I2C trigger
command.

Does this need a startup delay between enabling the regulator and the first=
 I2C
transaction to ensure the sensor is fully ready to process commands, preven=
ting
an unconditional probe failure on such platforms?

> +	if (!r.scale)
> +		return dev_err_probe(dev, -EINVAL, "invalid scale factor\n");
> +	data->dp_scale =3D r.scale;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920164724.3201=
9-1-m.abubakar365@yahoo.com?part=3D2
