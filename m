Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3E480DC4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268909; cv=none; b=N3jxxHKBRD44IhztIhG61uqTlXy2kmhoeunpXahGkUCIQIH3w4gNl8WpWOCd6P4pOt/oH7fuQQF8Y5fEAv7N0ogqSO3wdETrwn1aeNR2fz+fo26vvEnPJyXk5tSPz2zdRcGv/6VP6+fusYwaEuN+VG5BbRlUhdie3stQvgZCyCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268909; c=relaxed/simple;
	bh=S2qFI84iWZdU+DZQ6TyYcPq26Pl1B29nGtmEP/XrmjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NApXQSlogwKAzvuAxpGhwrwSdvPg1OuJTvwSr/YiPaiYRjSUSY4I0TbhCVCc/i/lTAlcfMOqEhmpacphkck5jMejBL9C908hRU5EUxHQd5alfEVt8shrRAp3AISKWKWJ5sfwmzvc/in9etzHDpkLZ4/wz+V4K3nIT7kjDLwwt2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkzZI6bA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkzZI6bA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7BB1F000E9;
	Tue,  1 Sep 2026 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268908;
	bh=K3H88/pj/pV17tYFSxYDzBaxz+T1ylMvkdxsTniI1gM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lkzZI6bAtvOyYZkuiBpDeQmQVb1BzrrxFAkskK4ZE3X3pV5XFS1Z095vlwkXxnuM/
	 tVGvdEudL3O2lbRi9ebI1QJ86+EX3F7gXDhhMy0JcQWkCUSPtEZhGjt4FFP6wdhqHs
	 YKpCdOwi9X9yTj+PdIOPk0RO78/jFbWVe95SX3BBGrcYoec4rQZE9ZCFg75gJ2PYpv
	 dEG/fiQalvddaqQQiotuwL+0SFvVXw6m4EbtNpvof5feXOzMNCRpV4EZA5xYI4RMuQ
	 7JdW3C8JppHFWvIDJhwdty7M3O0O0azGGFh2DhffjlWYRtt0Z141lrJ8O27Rp7/nYm
	 N4RSZzHCy/ZZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/4] iio: light: veml6031x00: add support for
 triggered buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-veml6031x00-v8-3-532cb4f2168a@gmail.com>
References: <20260901-veml6031x00-v8-0-532cb4f2168a@gmail.com>
 <20260901-veml6031x00-v8-3-532cb4f2168a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 13:21:47 +0000
Message-Id: <20260901132148.0D7BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Spurious I2C hardware read of CONF0 register in trigger handler
--

commit bd3b6c2cea8a14ae14e9c9db625cc2c4fc898c75
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for triggered buffers

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index f3772577a05d5..3d5a27a0baaed 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
[ ... ]
> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	struct regmap *map =3D data->regmap;
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) =3D { };
> +	unsigned int i;
> +	int ch, ret;
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(map, VEML6031X00_REG_ALS_L,
> +				       scan, 2 * sizeof(*scan));
> +		if (ret)
> +			goto done;
> +	} else {
> +		i =3D 0;
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(map, iio->channels[ch].address,
> +					       &scan[i++], sizeof(*scan));

[Severity: Medium]
Will this loop perform a spurious I2C hardware read of the CONF0 register?

When userspace enables the timestamp channel and only one of the data chann=
els
(ALS or IR), the first if condition fails and the code falls back to this
else block.

iio_for_each_active_channel() iterates over all set bits in the scan mask,
including the timestamp channel. Since .address is implicitly 0 for the
timestamp channel, does this mean regmap_bulk_read() will read from address
0 (VEML6031X00_REG_CONF0) when processing the timestamp channel?

Should there be a check to skip the timestamp channel before reading from t=
he
hardware, for example by checking if iio->channels[ch].type !=3D IIO_TIMEST=
AMP?

> +			if (ret)
> +				goto done;
> +		}
> +	}
> +
> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
> +
> +done:
> +	iio_trigger_notify_done(iio->trig);
> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-veml6031x0=
0-v8-0-532cb4f2168a@gmail.com?part=3D3
