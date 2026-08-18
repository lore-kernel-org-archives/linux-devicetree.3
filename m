Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F2746C835
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054162; cv=none; b=ZAD0nSTH8AZr7QMaVkU8fEf4/Bm8dA2hWx3PGbkVjVYuKBJ+I3s7sPJERabIRYOebML+OdDvBw2q6JcalRNNELkJZbeHFpWBp1wVnzuK8QopjWzttr14nRkTkVzlO2Jqy9I4MS8TfhKZCSJiXqNLsdKkQpBsBu5vxy13wczXC00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054162; c=relaxed/simple;
	bh=vQEySfrbMI8wNEVNg2IUcDu7n0M7C+PhNSBsdoTzmhw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EKjkR/kCfClrjY2Nj2e8q+AmSPeN1lwS+RQb+MDPv3ptsfVTUAmz9OqdEbHtoqiivKESPG5cHR9Whg3iOY1SRMlFsvyu7MuV1Je0OvGM9Us574f8NXFe/wC2PNPMyY2xSThV98a6HFe0xsef22Zwgkq/n2VVW/36wo1Jp4kep2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOVr+0i+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOVr+0i+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E881F000E9;
	Tue, 18 Aug 2026 11:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787054160;
	bh=1oKqNvxayAcpnEcWwqUePPlMBBqZFyflQRrF3E6wccU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOVr+0i+ClBhj/llSYrcBcIHNlPIPKprYJRV/72rGXuZ+KEboucNq+337GDOCRPwK
	 NbcFN5zJObwEYDffXEtbeXQYAaZ4qUnFJXLVfnbSsyadbyjI5evb7Ivjdo2i3e8Xpy
	 JboH72709eGx8bmpJggXd9hSPAeDuFR6LQwTnA5A02+iYZS4+ydWg2tTEgYW7TQg4O
	 /QIoJ+g1yR+7YdjfJPN50EADod5aIj+Y8fLfIfF+IxaswYzz7wsJ3UfRhtzJMNHViN
	 BnksNGkwpdOjR2h6b+Fbu+6zEfZQpEsU9iJW05wFK9JfonDcLKGZkfQ8E/rpjGpYR1
	 sKd7CqSz6B0UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] iio: light: veml6031x00: add support for
 triggered buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-veml6031x00-v7-3-2b0de0f20edf@gmail.com>
References: <20260818-veml6031x00-v7-0-2b0de0f20edf@gmail.com>
 <20260818-veml6031x00-v7-3-2b0de0f20edf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 11:56:00 +0000
Message-Id: <20260818115600.A3E881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The trigger handler performs a spurious I2C read of the configur=
ation register when the soft timestamp channel is enabled.
--

--- Patch [3]: [PATCH v7 3/4] iio: light: veml6031x00: add support for trig=
gered buffers ---
commit ad14fde3718bccd7b3598fb39633f0d8bcdf444b
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for triggered buffers

This commit adds triggered buffer functionality for the ALS and IR channels
provided by the device.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 348bc28859d6f..e6ca98414a01c 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> @@ -482,6 +514,79 @@ static const struct iio_info veml6031x00_info =3D {

[ ... ]

> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	struct regmap *map =3D data->regmap;
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) =3D { };
> +	unsigned int i =3D 0;
> +	int ch, ret;
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(map, VEML6031X00_REG_ALS_L,
> +				       scan, 2 * sizeof(*scan));
> +		if (ret)
> +			goto done;
> +	} else {
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(map, iio->channels[ch].address,
> +					       &scan[i++], sizeof(*scan));

[Severity: Medium]
Does this loop also execute for the timestamp channel if it is enabled?

If the soft timestamp channel is enabled without both ALS and IR being
enabled simultaneously, iio_for_each_active_channel() will iterate over it.
Because the timestamp channel's address field defaults to 0, does this
result in a spurious I2C read from address 0x00 (VEML6031X00_REG_CONF0) into
the buffer padding on every trigger event?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-veml6031x0=
0-v7-0-2b0de0f20edf@gmail.com?part=3D3
