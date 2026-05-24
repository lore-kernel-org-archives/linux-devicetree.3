Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668F03B47E6
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779665391; cv=none; b=LxcjEobpi3gtalxv+7Zm6+WW0dSv8NCvig/IBwnS3ayQbckNER56GEKBGP9JEZglmwZL7eUyM2qQ05upd0PJKTr68DO89lQzijT/Bz+EBol4nstm6F3zC9CnhDeX4JPTeTlSAyoMTAvAa8digVjlm9mT8ePDWpINbcNc2Uyx9XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779665391; c=relaxed/simple;
	bh=MAE4aTfjJtuzRHcCaFSWjvMsNQmXTEpQ0FiJqmqY1DY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nctxSfs58GLcT4rLshll7m36OfWFShUi8sf2uqemINC9SdENtBSfo2UYG5zrJc38B5yeoqpN8LR3+QqVYFsAUjcwIPY3C81gfw4lx27LkrGiA/62WEEFiML7Y6yVLJtWkiJpEGDKVarJvzvE6fPwhv5VNSgW5jB/cYkjb9ZEylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/hsV4DZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/hsV4DZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4BF1F000E9;
	Sun, 24 May 2026 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779665390;
	bh=CV7y9+cLg4MU8M+o0O9OLIowq7+n9ggnd3zNe3xAgeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m/hsV4DZWPyLeQrgQzQ9CaYRDqzuIZ7YUko6E2oueYqCAe9f6rMRlEjKe24ZDl3Xt
	 bf3ycmNvPD/EOC87qsHmwdEufSk9LAUzcHwnRYymE6VgG4jZFbhV0WgYy7O+o2REpF
	 C3kbLxOYvQDyW2Zn8pdNIgHsmWext/Q1U0SjGsSwlJn8WWONmOQj7lsJKTOpjVt4ug
	 7L8xJN3FcM3SFX0tDyLUUHyg/poCADbyHMMtHg8V206d/go9sSpXOfM+fMy0ExIUD+
	 4zt3JL7dpL10SeParRGxbdYjtXguTm2CGZfSvY2ZvO1x0Svvn4SbNulVoMXL03W0zf
	 dQcNwTU2AqxJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] iio: light: veml6031x00: add support for
 triggered buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524-veml6031x00-v3-3-29165609b2b5@gmail.com>
References: <20260524-veml6031x00-v3-3-29165609b2b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 23:29:49 +0000
Message-Id: <20260524232949.CB4BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The trigger handler does not skip the soft timestamp channel, lead=
ing to an out-of-bounds array write and an invalid I2C read.
- [Medium] Runtime PM usage counter underflow on device unbind due to mixin=
g devm_pm_runtime_get_noresume() with a manual pm_runtime_put_autosuspend().
--

commit 7b07348868ecc638382ae3a2ca8a3bea1a0c8680
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for triggered buffers

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 50979d2392301..9968d4414dc96 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
[ ... ]
> @@ -461,6 +484,82 @@ static const struct iio_info veml6031x00_info =3D {
>  	.write_raw_get_fmt =3D veml6031x00_write_raw_get_fmt,
>  };
[ ... ]
> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	int ch, ret, i =3D 0;
> +	struct {
> +		__le16 chans[2];
> +		aligned_s64 timestamp;
> +	} scan =3D { };
> +
> +	if (*iio->active_scan_mask =3D=3D (BIT(VEML6031X00_SCAN_ALS) |
> +				       BIT(VEML6031X00_SCAN_IR))) {
> +		ret =3D regmap_bulk_read(data->regmap,
> +				       VEML6031X00_REG_ALS_L,
> +				       &scan.chans, sizeof(scan.chans));
> +		if (ret)
> +			goto done;
> +	} else {
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(data->regmap,
> +					       iio->channels[ch].address,
> +					       &scan.chans[i++],
> +					       sizeof(*scan.chans));

[Severity: High]
Does this loop properly handle the timestamp channel?

If the user enables the timestamp channel alongside ALS and IR, the timesta=
mp
bit is included in iio->active_scan_mask. The optimization check above will
evaluate to false, falling back to this else block.

Inside this loop, the timestamp channel isn't skipped. Since the soft
timestamp channel has no assigned address, does it default to 0 and
cause an unintended I2C read of the configuration register?

Additionally, scan.chans is defined as an array of 2 elements. Could this
cause an out-of-bounds write to scan.chans[2] as i increments, corrupting
the struct padding or timestamp field?

> +			if (ret)
> +				goto done;
> +		}
> +	}
> +
> +	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), pf->timestamp);
> +
> +done:
> +	iio_trigger_notify_done(iio->trig);
> +
> +	return IRQ_HANDLED;
> +}
[ ... ]
> @@ -564,6 +663,13 @@ static int veml6031x00_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_iio_triggered_buffer_setup(dev, iio, NULL,
> +					      veml6031x00_trig_handler,
> +					      &veml6031x00_buffer_setup_ops);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register triggered buffer\n");
> +
>  	pm_runtime_put_autosuspend(dev);

[Severity: Medium]
Can this manual pm_runtime_put_autosuspend() cause a usage counter underflow
on device unbind?

The driver acquires a runtime PM reference earlier using
devm_pm_runtime_get_noresume(), which registers a devres cleanup action to
decrement the usage counter on unbind.

With this manual put in probe, will the devres unbind action drop the
counter below zero and trigger a warning in the PM core?

> =20
>  	ret =3D devm_iio_device_register(dev, iio);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-veml6031x0=
0-v3-0-29165609b2b5@gmail.com?part=3D3
