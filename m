Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB09C3B1B3
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 04:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162266; cv=none; b=T4dffQQ/fpD1QuPidUzTzSsvB+DizjdWzM0KEl5MYdgDebLuZLkgklpdPAONIs1Qz0/ThDXCttkI6kqT1YtJgUpqoF1paBfdq1kpzFcM29Kinfnm9lgKPW0ptBQHDSkkyxp2dLripxZJQcK82RjaWofcuQvmOit+kFAUA6uDqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162266; c=relaxed/simple;
	bh=Zvc4XA0/HQiGyE4uSVvDzoMeOAxhP/FOOxZjLlENCgg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZNN+m0DZx81qiZkPrGgc1eW1OX9d4gH3p929T5stEcRUa3ojbNEURN1EyLKlkJZfcrCA4NC1oUU4WxE/R5vAa9J4TPPkp300/pMA/IZYiYRYBUQQwM37umTifj/2H+Doxk07khZVCKjgllN6wJvTZb1Se4Ca3ARCq7CClmWIcX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQUKPJf8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQUKPJf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567751F000E9;
	Sat,  8 Aug 2026 04:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786162264;
	bh=amyjNPkVX51GDCZnpXImEe+7tV4BW55gtyDZRLzoxSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gQUKPJf8svEedQSLNPLxKjsTQ5SAzbc4pvZmQvtXAe0DtKP1yWRTxY0AzjzZC2KQ/
	 aGPkc9QwgBzhAW8NkepSw4X2kYUF71iYMpB3F/9tw+74AXN31PbR7wz6Ddt7GXgDPX
	 WyBMxgqkzuSER1iNi9xnjiL0+MpJiR4JHrwadvyTYuD6pcbEtW+af0/y6gyaDcEFL8
	 Gp97BV6aDFZHcLbne15OS+oFRLl80CpsXAwfc84KZMxE/AXk2aaItx6KgCbP5/o0NB
	 mjcRI25KRzQllsPN20BlFfLcGi8VEN0YE3b86j5TMWA0IonkkOqh/jbucAjxmvdFG6
	 ODrKgYBqDNKxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] iio: adc: ti-ads1262: support per-channel
 sampling frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-ads126x-v3-3-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-3-f89925d72792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:11:03 +0000
Message-Id: <20260808041104.567751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Passing an `int *` to `div_u64_rem()` where a `u32 *` is expected w=
ill trigger a `-Wincompatible-pointer-types` error, breaking the build.
--

--- Patch [3]: [PATCH v3 3/9] iio: adc: ti-ads1262: support per-channel sam=
pling frequency ---
commit a46f605d6f5895d7bee6634dd981e6c2e2026419
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support per-channel sampling frequency

This patch adds per-channel sampling frequency support to the ti-ads1262
driver. The "available" attribute is assigned per-channel to eventually
support per-filter availability.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index d78e5e3ae13ee..b3b7b12491026 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> @@ -575,6 +688,36 @@ static const struct regmap_bus ads1262_regmap_bus =
=3D {
>  	.max_raw_write =3D ADS1262_MAX_REGMAP_WRITE,
>  };
> =20
> +static void ads1262_populate_samp_freqs(struct ads1262 *st,
> +					struct ads1262_channel *chan)
> +{
> +	int freq_Hz, freq_rem;
> +	u64 freq_uHz;
> +
> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(chan->samp_freqs); i++) {
> +		freq_uHz =3D div_u64(mul_u32_u32(st->clk_rate, MICRO),
> +				   ads1262_data_rate_div[i]);
> +		freq_Hz =3D div_u64_rem(freq_uHz, MICRO, &freq_rem);

[Severity: Low]
Will this cause a build failure due to incompatible pointer types?

div_u64_rem() expects a u32 * for its third argument, but freq_rem is
declared as an int. In modern kernel builds, -Wincompatible-pointer-types
warnings are treated as errors, which would break the build here.=20

Could freq_rem be declared as a u32 to prevent this mismatch?

> +
> +		chan->samp_freqs[i][0] =3D freq_Hz;
> +		chan->samp_freqs[i][1] =3D freq_rem;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-ads126x-v3=
-0-f89925d72792@gmail.com?part=3D3
