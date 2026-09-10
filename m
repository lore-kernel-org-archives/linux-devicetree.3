Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B03379980
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023594; cv=none; b=qBJCRy/98s0RV8f1OBWCJISXkPvj9ZAXqrF7ulu2hOPJZZmPDwuTSq2YvIgbJvYFg/FydRB55vFX+PC1BSsXFMs+g3LLgpFotVeuNTpv9b5Ab0hr6xirIFHMHkUhzBx7oVCI9qCHmbd3P2+nLxxfc5BfviOIIxTLORgPNIw7K3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023594; c=relaxed/simple;
	bh=6lq1VucSYpuThhyai9c/dthn9Ro2S6RdsxqjX473aWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dfBS6wmCIxDXw98Xy0mc9D45ijGbbWRsWel/4l0hmvSZy2kfA6ZELWg39kmJFZa037X490H1olGCe8rbV1w8LK3TRAAYB94oXkLg5QeRQl1NwfoJhCEGSC+UzNlqG6cfSkFwobdHqkUzRTqYtU2FaJs2u7gexxn8dNnGq5sG8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI3CQFhj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI3CQFhj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7611F000FF;
	Thu, 10 Sep 2026 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789023592;
	bh=hkxegXEGH+mMqnsWk5I244m2+afBltMqMJvLmyAwMEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mI3CQFhjV7WJgEEZ3M0W36JN00VmdZiPhFj4aT4+BPA9cssuX0dxQBp/zKxtr+KMi
	 wxXBkShE2Z3K+YNY7j7IDMEU/Na4ujLcBwGbE1Jay/DTbyV3vu40hWsOg//6JjQCWY
	 gQM0ZDKyAqCyLL2T5dNAEGxGnNXNfqVT3S/JHKOzxOySDv03/vlIA22DXUsl3ecChU
	 w7VRKesw6MP8ikfxtzjn2+NpSZsZiuxJmzfeIeSl2utFJa8Eg4aEH1lbx8plRhcETc
	 Wh1VrkDyhXCHfLNxS+qY8cZa86OJ9PjEvxm1MSfjSXQ1bchDEX5lg3+QtZsMIETyXl
	 ZXMrsp5U2zy+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chang Yu" <marcus.yu.56@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910063813.56419-3-marcus.yu.56@gmail.com>
References: <20260910063813.56419-1-marcus.yu.56@gmail.com>
 <20260910063813.56419-3-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 06:59:51 +0000
Message-Id: <20260910065951.BD7611F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Device remains continuously active and measuring until the first=
 sysfs read due to missing idle trigger in probe.
- [Low] Missing <linux/delay.h> include for msleep().
--

commit 11270e0cc23d66ee1d725cbe09a1342ed010ace3
Author: Chang Yu <marcus.yu.56@gmail.com>

iio: light: add AS7343 multi-spectral sensor driver

This commit adds a new driver for the AMS AS7343 14-channel multi-spectral
sensor. It exposes 12 spectral channels via the IIO sysfs interface and
supports basic suspend/resume power management functionality.

> diff --git a/drivers/iio/light/as7343.c b/drivers/iio/light/as7343.c
> new file mode 100644
> index 0000000000000..8982cd6ec5d88
> --- /dev/null
> +++ b/drivers/iio/light/as7343.c
[ ... ]
> +static int as7343_read_raw(struct iio_dev *indio_dev,
> +			   struct iio_chan_spec const *chan, int *val,
> +			   int *val2, long mask)
> +{
[ ... ]
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		/* Wait until integration time passes for all 3 cycles. */
> +		msleep(160);

[Severity: Low]
Does this msleep() call require including <linux/delay.h>?

Building the driver on architectures where the header is not implicitly
included by other headers might result in a build failure.

[ ... ]
> +static int as7343_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable PM runtime\n");
> +
> +	/* Start measurements */
> +	ret =3D regmap_set_bits(data->regmap, AS7343_ENABLE, AS7343_ENABLE_SP_E=
N);
> +	if (ret)
> +		return ret;
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

[Severity: Medium]
Does this probe function leave the device continuously active and measuring
until the first sysfs read?

The code marks the device as active and starts measurements, but does not
appear to drop its usage count or trigger an idle state. The power manageme=
nt
core may consider it active with a zero usage count, but never automatically
suspend it.

This seems to leave the sensor taking measurements and drawing power
indefinitely, only resolving when the first sysfs read invokes
pm_runtime_resume_and_get() followed by pm_runtime_put().

Could pm_runtime_idle() be called before probe finishes, or should the devi=
ce
be transitioned to suspend instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910063813.5641=
9-1-marcus.yu.56@gmail.com?part=3D2
