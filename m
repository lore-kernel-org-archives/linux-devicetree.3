Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48FC3E763E
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147954; cv=none; b=G/C23VxnReKuxGV8kkih6FltzMFEZjVolNTSucshL/8hZC2J+iG1SwyvbRI2HwQR1gV7Ci5/j37e5QdwGK1f4+0Iy/wC4WRplkjQ4zuwjdJPFUFnQMrgi7wE5btw2xQbf7vyl873AHnQeMILiG0PTPfCfv+X2rP7rX66ypX+gRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147954; c=relaxed/simple;
	bh=u6ZrXfLqoiTrwuo/UQd6iOAlo2BujInW8Y1HBjcID1I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QZKQOjwEyHmfnfnK25EIoagYvOdsOBjSvJpJXgkZl81tG3PTohVRdOYoSnZjyp3yXcZ3Rrq9avfzvXJzqF4O3Qj6+fpbXPmB4S8AonrWmHElpkxHfEYfGmXDnxJ0NcUJ7Bo9QfNUgrat9ypPEnXnAfQ79nit6uFKOkPPlOUTeXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhhTKOMI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhhTKOMI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B771F000C4;
	Fri, 16 Oct 2026 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792147953;
	bh=f4yq0wS9dkLlqEgzuG09kMazUrnRKayn74sfIwAEUw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YhhTKOMIB8rS5UYaEeJOTIPICHoHLVB1A+laeFbdyk6d9aBSzW4eiA3dpB/r+JxDH
	 5uGnZ9RjBvVs1SQSSYejnIP5nryQIFYQqXw2nvf2/fDZ8t3/ddKDSkZIhr8A9DjHV2
	 JUnTQYXdKbG0Z1TsFeaC2MK4akJwoDTHVW4TvyPcauo5y8WgFsDLK4l4iUgDUDwqJI
	 Y+GdeL3FItxhbncidr5brT7Ujth2cVu3iaVAEII1vQPc8udLWr5gaZ9DItamOXQjaf
	 vFIljPY6uUx8wIIMBxMwl4NBlTGxCgmEZwD97WZWnCih49t8wFYHwIAQ73QRY/CNis
	 Ryex4mxbOfYkA==
Message-ID: <sashiko-outbox-174207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] ASoC: pcm179x: Add support for pcm1975
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9tYW4gU21yxb4=?= <roman@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-work-v2-5-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
 <20261016-work-v2-5-9340b9555fbb@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:52:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] sound: pcm1795 misidentified as pcm1792a on spi/i2c due to missi=
ng driver_data
- [Medium] ASoC: pcm179x: 16-bit format missing for PCM1795
- [Medium] ASoC: pcm1795: hw_params fails with -EINVAL for 32-bit LEFT_J st=
reams
--

commit 82f31b72b82184d1d5d7c469d77cb1c8fab51b6d
Author: Michael Trimarchi <michael@amarulasolutions.com>
Subject: ASoC: pcm179x: Add support for pcm1975

The commit adds support for the PCM1795 audio codec, introducing a new codec
model differentiation based on device match data. It adds device match tabl=
es
for OF along with SPI ID tables, and separate format handling tables and
startup constraints for the new model.

> diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-sp=
i.c
> index 4b873f2986c77..a6c6ac1eb97b2 100644
> --- a/sound/soc/codecs/pcm179x-spi.c
> +++ b/sound/soc/codecs/pcm179x-spi.c
[ ... ]
> @@ -31,13 +31,15 @@ static int pcm179x_spi_probe(struct spi_device *spi)
[ ... ]
>  static const struct spi_device_id pcm179x_spi_ids[] =3D {
>  	{ "pcm1792a", 0 },
> +	{ "pcm1795", 0 },
>  	{ "pcm1796", 0 },
>  	{ "pcm179x", 0 },
>  	{ },

[Severity: Medium]
Since the driver differentiates models using enum pcm179x_type where
PCM1795 is 1, will leaving the driver_data as 0 cause non-OF setups to
misidentify the PCM1795 as a PCM1792A?

When device_get_match_data() is called in pcm179x_common_init(), it will
resolve to 0 for these legacy boards. This could break audio playback
for formats encoded differently between models, such as 32-bit I2S.

Additionally, should the new models be added to the I2C ID table in
pcm179x-i2c.c for the same reason?

> diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
> index fae5de318b6ea..8e9b9e98c8dff 100644
> --- a/sound/soc/codecs/pcm179x.c
> +++ b/sound/soc/codecs/pcm179x.c
[ ... ]
> @@ -82,16 +94,53 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] =
=3D {
>  	{ SND_SOC_DAIFMT_I2S,     32, 5 },
>  };
> =20
> +static const struct pcm179x_fmt_table pcm1795_fmt[] =3D {
> +	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
> +	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
> +	{ SND_SOC_DAIFMT_RIGHT_J, 32, 1 },
> +	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
> +	{ SND_SOC_DAIFMT_I2S,     24, 5 },
> +	{ SND_SOC_DAIFMT_I2S,     32, 4 },
> +};

[Severity: Medium]
Is there a missing entry here for { SND_SOC_DAIFMT_LEFT_J, 32, 3 }?

Because PCM1795_FORMATS includes SNDRV_PCM_FMTBIT_S32_LE and the ASoC core
allows LEFT_J for all models, userspace can request 32-bit LEFT_J streams.

Without an entry in this table, pcm179x_fmt_value() will fail and return
-EINVAL during pcm179x_hw_params(), causing playback to fail at runtime.

> diff --git a/sound/soc/codecs/pcm179x.h b/sound/soc/codecs/pcm179x.h
> index 0039ca8ee7420..33971fa935469 100644
> --- a/sound/soc/codecs/pcm179x.h
> +++ b/sound/soc/codecs/pcm179x.h
[ ... ]
> @@ -8,8 +8,16 @@
>  #ifndef __PCM179X_H__
>  #define __PCM179X_H__
> =20
> -#define PCM1792A_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24=
_LE | \
> -			  SNDRV_PCM_FMTBIT_S16_LE)
> +enum pcm179x_type {
> +	PCM1792A,
> +	PCM1795,
> +	PCM1796,
> +};
> +
> +#define PCM179X_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_=
LE | \
> +			 SNDRV_PCM_FMTBIT_S16_LE)
> +
> +#define PCM1795_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_=
LE)

[Severity: Medium]
Does the PCM1795 support 16-bit audio streams?

The pcm1795_fmt table in pcm179x.c contains an entry for 16-bit Right-J:

        { SND_SOC_DAIFMT_RIGHT_J, 16, 0 },

By excluding SNDRV_PCM_FMTBIT_S16_LE from PCM1795_FORMATS, the ALSA core
unconditionally rejects all 16-bit streams at open time. This forces
userspace to upsample or pad streams, and makes the 16-bit Right-J
table entry unreachable dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-work-v2-0-=
9340b9555fbb@amarulasolutions.com?part=3D5
