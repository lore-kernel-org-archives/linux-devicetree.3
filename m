Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D3229B8D0
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780259440; cv=none; b=CCc2QYNv2ViSNGHOavsLa72/KOs8I2ynJJtx6jdWI8h7HuybrzyzRCxTqGzzWLMljo7wRxgu0KYbjtXk05Md/7c+oETmMY7dyV0AYwQoJnwsgyraNe3cUd8z4RmVzGSi0dmvOqZpBvkLYeR40TrBbrzAu/qbww/qikj7XtZSsOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780259440; c=relaxed/simple;
	bh=Zw0TArCKUl3ZzoXyDgAsyr6URlAZ+5V6Pdmwf9DdS7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KMNVyI9X7aRco/9rPyI/37Xu45eo6lU/9zBO4zGyIzUBrR3s4KTcTNb/KxIAB5BjdwEDFpf5bSdy2ZMXkQPYZyQatKeZGGwiF1JtsEhxB/VStzMR9Q4IZ2KPk2s9yfzOa72eHDOHdJodIW98btipv0ohnKbOl1LOxp3ZPFnlfns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYytz4/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYytz4/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526D01F00893;
	Sun, 31 May 2026 20:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780259438;
	bh=HDzBJ+dr0+JrfhW5HktUia315uPkmXR4BWTKxUxGN5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aYytz4/vL9W13uMcE0ZSYbKsY8snq2eufzWAuLx+4XLJ1emvJK7gMm7wPb3xGUF0c
	 TcU1Jmk4R6TPHhUMGC3dhT7pMbhL3+iK679NLXYdFEcqK2SoUlP/MP5jQ1ykDccRUI
	 n0973BLalf1qDo5KlTsilwbtGx3VOKkS+i+B52nhw8XAq6KYrFyAnS9RzGcz+tp4aC
	 WRja+u/LheqoTg/NM0p27gABnm0+nBgMrb8F/cBFMojsNgnEbXP5kWhxtKM342UJNJ
	 zQKuQdemdXuxRD/2R0gxIDZy/c8IY/0fSfpnMZi4gFd8ZXPj5Dtu1GaeB56FPAACh+
	 hl7IGa+570dGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] iio: light: veml6031x00: add support for
 triggered buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260531-veml6031x00-v4-3-e64f7fdce38d@gmail.com>
References: <20260531-veml6031x00-v4-3-e64f7fdce38d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 20:30:37 +0000
Message-Id: <20260531203038.526D01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Spurious I2C read of configuration register when the soft timestam=
p channel is enabled without both ALS and IR.
- [High] Uninitialized padding bytes in the `scan` structure leak kernel st=
ack memory to user-space.

Pre-existing issues:
- [High] Mixed devm-managed PM runtime GET and manual autosuspend PUT cause=
s the usage counter to underflow on driver unbind.
--

commit a608e278d687a935cb2bc7ba944ea15e822ef8ce
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for triggered buffers

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index 6f9a7bad44d44..facb1b8e42418 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
[ ... ]
> @@ -469,6 +500,82 @@ static const struct iio_info veml6031x00_info =3D {
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

[Severity: High]
Does this initialization leave compiler padding bytes uninitialized?

The scan struct has 4 bytes of compiler padding between the chans array (4
bytes) and the timestamp field (aligned to 8 bytes). Using =3D { }
zero-initializes the defined fields but leaves the padding bytes uninitiali=
zed
in C.

Since iio_push_to_buffers_with_ts() copies the entire 16-byte struct to the
IIO ring buffer, could this leak uninitialized kernel stack padding to
user-space? An explicit memset(&scan, 0, sizeof(scan)) is typically used to
prevent this.

> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
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
Does this loop fail to skip the software-only timestamp channel?

The iio_for_each_active_channel() macro iterates over all set bits in
active_scan_mask, including the timestamp channel bit
(VEML6031X00_SCAN_TIMESTAMP).=20

Because the timestamp channel doesn't have an address,
iio->channels[ch].address will default to 0x00 (VEML6031X00_REG_CONF0).

Will this result in a spurious I2C read from the configuration register when
the soft timestamp channel is enabled without both ALS and IR, wasting I2C
bandwidth and populating the data array with unintended hardware data?

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
> @@ -576,6 +683,13 @@ static int veml6031x00_probe(struct i2c_client *i2c)
[ ... ]
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

[Severity: High]
This is a pre-existing issue, but does mixing devm-managed PM runtime GET a=
nd
manual autosuspend PUT cause the usage counter to underflow on driver unbin=
d?

Earlier in veml6031x00_probe(), devm_pm_runtime_get_noresume(dev)
increments the PM usage counter and queues a devres action to decrement it =
on
module unbind.

At the end of the probe function, the driver manually calls
pm_runtime_put_autosuspend(dev), decrementing the usage counter back to 0.

Upon driver unbind, the queued devres action will execute, dropping the usa=
ge
counter a second time. Could this underflow the PM usage counter to -1,
causing a WARN splat and corrupting the device's PM state? Should this be
using the non-devm pm_runtime_get_noresume(dev) if it manually drops the
reference in probe?

> =20
>  	ret =3D devm_iio_device_register(dev, iio);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-veml6031x0=
0-v4-0-e64f7fdce38d@gmail.com?part=3D3
