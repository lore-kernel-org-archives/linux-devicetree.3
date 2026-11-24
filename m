Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560973;
	b=udrrpk0umZ8Gq1YbBn1F3gHYi2WORqfRnrUs6v1bnsPg0GPMleBa76GG8OV6Z9MmhZWc
	 JDDW0rOnC6B4FwAjxSjfB/SQCrxQ/r1EBecFEXYohzkeZHBmKUnUDRrD8+99Skp7bh/pY
	 jTb7tLXfvfTT2Py6Db98VXeOyIX24JON9AlQV7yS4EB1dwobYKK/j4FnERVxevv/CByDR
	 j4b/cTAn2vHSDTOCbTWd6jGS3gurNcZHwp1fLLvKlmgXuexXnEAo2pBAX15JTyyByiiWC
	 mxbrxRBvfvBugEWPXqGRWMW7YnV5aftIyeWvSSXDPp5n1Suck5D9PuvdK3EIDw2ShdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560973;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=93VNakAAnbm/mSdqabhUySXbXA089MOyt/2uKJdTIBo=;
	b=gPsXPuOYclbYnU+Z/RoaKaEMHSGAUyKycJ+cUev+D5wW/iZqIbGwFF92ZTGsdec5mcPt
	 2cjx13lwf/Y7mqzwC93yiUVItsq7hESHJYEnmkmWx/rd7wJj4XdM4obmqCyBYdrqajlCQ
	 O9GlWrTTtdegbwi7orDSyt0N1CtueesF3Mh6ANdufqeDyoOhSh98UU6Yl5CbWwDh8qOqF
	 3Tzn/8gM0NUPRru8CVJGGx2x7wNHUFUwuLczbDt+w9C4fGOGisWlMHCWWVVusMK2FSGe6
	 /BgpngiyoXMKGNn8K2NrqpBVNcNfbwLWrBwVWdQXqhpmrksrxjNZpPe5uIiMDcFbwLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLRZH1bF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA35606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLRZH1bF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEE31F000CA;
	Tue, 24 Nov 2026 22:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795560973;
	bh=93VNakAAnbm/mSdqabhUySXbXA089MOyt/2uKJdTIBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CLRZH1bFOeyX166DfBN+Ivt28lTpprloHh3bT33Jxh9KlgYvqUpQdUEQ35F8EjWK8
	 ybYzv+9eXx1uRB4vTJv0j6KubB0Zun3vL8mfYo96oZ/cgHyb9lX22NAf/phJpG8TOH
	 LP5vt8NqXWRJZQlFFNIiZMeyAfwRo7xhqzQB1gnqmyO5wnp8ASNf8Dh/5nD4amHRzC
	 pLB8hqAC5j2dr80D8VdWreOpLMSowy7b8RlMl5Yd+XVW9nJGjZFMwZtERq2S8bGGCv
	 8PMB8ubMpElelz38XdA8ejz9GIq6OI09MDWrbXenjgJCZk0GeH3k3vvQSXC31BnkSG
	 160K22s5JrCfg==
Message-ID: <sashiko-outbox-232177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: light: add ams OSRAM TCS3430 XYZ and ambient
 light sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Ijtsma" <robertijtsma@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-iio-tcs3430-v1-2-0f2a38a6a4c1@gmail.com>
References: <20261124-iio-tcs3430-v1-0-0f2a38a6a4c1@gmail.com>
 <20261124-iio-tcs3430-v1-2-0f2a38a6a4c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:56:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: light: tcs3430: unscoped guard(mutex) in
  tcs3430_read_raw() switch cases
--

commit 9716c3f00abb68b36cb419ee8d2edca1a86defb1
Author: Robert Ijtsma <robertijtsma@gmail.com>

iio: light: add ams OSRAM TCS3430 XYZ and ambient light sensor driver

This commit adds an IIO driver for the ams OSRAM TCS3430 ambient light and
CIE 1931 XYZ tristimulus color sensor.

> diff --git a/drivers/iio/light/tcs3430.c b/drivers/iio/light/tcs3430.c
> new file mode 100644
> index 0000000000000..138c8ab649c4f
> --- /dev/null
> +++ b/drivers/iio/light/tcs3430.c

[ ... ]

> +static int tcs3430_read_raw(struct iio_dev *indio_dev,
> +			    const struct iio_chan_spec *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct tcs3430_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		guard(mutex)(&data->lock);
> +		ret =3D i2c_smbus_read_word_data(data->client, chan->address);
> +		if (ret < 0)
> +			return ret;
> +		*val =3D ret;
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE: {
> +		u32 itime_us =3D TCS3430_DEFAULT_ATIME_CYCLES * TCS3430_ATIME_STEP_US;
> +		u64 scale_nano;
> +		u32 rem;
> +		int gain;
> +
> +		scoped_guard(mutex, &data->lock)
> +			gain =3D tcs3430_gains[data->gain_idx];
> +
> +		scale_nano =3D div_u64(TCS3430_LUX_FACTOR * NSEC_PER_SEC * USEC_PER_MS=
EC,
> +				     (u32)gain * itime_us);
> +		*val =3D div_u64_rem(scale_nano, NSEC_PER_SEC, &rem);
> +		*val2 =3D rem;
> +		return IIO_VAL_INT_PLUS_NANO;
> +	}
> +
> +	case IIO_CHAN_INFO_HARDWAREGAIN:
> +		guard(mutex)(&data->lock);
> +		*val =3D tcs3430_gains[data->gain_idx];
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_INT_TIME:
> +		*val =3D 0;
> +		*val2 =3D TCS3430_DEFAULT_ATIME_CYCLES * TCS3430_ATIME_STEP_US;
> +		return IIO_VAL_INT_PLUS_MICRO;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

[Severity: High]
Do the guard(mutex)(&data->lock) declarations in case IIO_CHAN_INFO_RAW and
case IIO_CHAN_INFO_HARDWAREGAIN need enclosing braces or scoped_guard()?

Without braces, both __cleanup(class_mutex_destructor) guard variables are
scoped to the entire switch (mask) block.  This fails to build with Clang
because the following case labels jump into the scope of a cleanup variable
past its initialization, and on GCC builds reading sysfs attributes such as
in_illuminance_scale jumps past the guard initialization and runs
class_mutex_destructor() on an uninitialized lock pointer upon return.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-iio-tcs343=
0-v1-0-0f2a38a6a4c1@gmail.com?part=3D2
