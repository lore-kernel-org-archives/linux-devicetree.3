Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FD01A267
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781930894; cv=none; b=aNlQ0CSTvhNNIjwfquT7CNVFyZ4xDuHgbp08MibD/xed1q5RCIq2LACw4HsNustrLL54I50qrEGIOCPek+Miu12eK7buUikeHwckixRu3Hnp+ftNOvOhd6jvMXzwusxuXQ4X8YKZWcZBN2cCJR18pI+XybgvRsy0cE7Zy3IJGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781930894; c=relaxed/simple;
	bh=CtwOYY7YE2qPkvPxUfrp+pcKbtOabVaE+KyGoK0b1Vk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UFik3bhRIwzy6poLq4z5LcDhY/NVkDvNWLF7IvsnPFZ2tHR4E1wVU4OY4qT+NH5ME9UAHri04C3q17KTS5Lwqbx4bbJ7R+zigNcxcJIirmEMfssHVknwKEJUC6ntiGPNofcLNaFYhxifQ1JFTQYlYEgrnisIy/5s4kgPrSzXXSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dpz5QwoC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dpz5QwoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13B31F000E9;
	Sat, 20 Jun 2026 04:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781930893;
	bh=ngrGAt3vyccEOuLxH5aYARtQ0rKSIbTVSdpEQSaB27U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dpz5QwoCuvdOZrkYww7bTv8XEUhZLTwXltWcyjNwn8XwDf0qxAunkQ1snqb49ZWjG
	 iG3vk3tZCvT4gR6GQTLEV78go2YTTB2HqrsVL/IQMh2dH5JR/ZPSYrQmaxPe1K38f7
	 +UK05OgM5qfTHjqObKsT06Su4fiMb6KbRvQrYy1w5+uhVxv/nubPTED4PSneE3J3Ol
	 VyTDe5bZyjWEOqDDh6C/uNe6JeV2uTGEkbQuLAuabRBZbB1U2TcfpY4VsNnYZ+hH8O
	 5BzmDmPtP9v3WKgBXyVIFNeeXKU701L2Uv/pDf1u4WxQ/TkiP6oskKljNSnH7ezJIc
	 /U2xI0HU7oKVA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] iio: temperature: Add STS30 temperature sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxwell Doose" <m32285159@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260620044010.1082621-3-m32285159@gmail.com>
References: <20260620044010.1082621-1-m32285159@gmail.com>
 <20260620044010.1082621-3-m32285159@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 04:48:12 +0000
Message-Id: <20260620044812.E13B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The return value of `sts30_reset()` is ignored during probe, allow=
ing phantom device registration on failure.
- [High] The driver implements a Clock Stretching Disabled I2C sequence but=
 uses Clock Stretching Enabled command codes, resulting in a protocol misma=
tch.
--

commit 1a183c37bbba5fe87dfcc6019f964e51526fec2b
Author: Maxwell Doose <m32285159@gmail.com>

iio: temperature: Add STS30 temperature sensor driver

Add a driver for the Sensirion STS30 family of temperature sensor
drivers over I2C. The driver supports single-shot non-clock stretched
readings using a specified delay based on the repeatability/delay.

> diff --git a/drivers/iio/temperature/sts30.c b/drivers/iio/temperature/st=
s30.c
> new file mode 100644
> index 0000000000000..b49deb1d62c21
> --- /dev/null
> +++ b/drivers/iio/temperature/sts30.c

[ ... ]

> +#define STS30_MEAS_SIZE 3
> +
> +#define STS30_COMMAND_READ_HIGH_REPEAT 0x2C06
> +#define STS30_COMMAND_READ_MED_REPEAT 0x2C0D
> +#define STS30_COMMAND_READ_LOW_REPEAT 0x2C10

[Severity: High]
The commit message mentions using non-clock stretched readings, but are
these the correct commands? According to the STS3x datasheet, the 0x2Cxx
series commands are for "Clock Stretching Enabled", which require a
Repeated START condition between the write and read phases.

[ ... ]

> +static int sts30_read(struct sts30_data *data, u16 command, u16 *val)
> +{
> +	u8 tmp[2];
> +	u8 buf[STS30_MEAS_SIZE];
> +	int ret;
> +
> +	put_unaligned_be16(command, tmp);
> +
> +	ret =3D i2c_master_send(data->client, tmp, sizeof(tmp));
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D sizeof(tmp))
> +		return -EIO;
> +
> +	fsleep(data->delay);

[Severity: High]
Will sending a STOP condition here abort the measurement? Since
i2c_master_send() issues a STOP condition rather than a Repeated START,
this sequence violates the protocol for the Clock Stretching Enabled
commands (0x2Cxx) defined above.

Should this use the "Clock Stretching Disabled" commands (e.g., 0x2400)
instead, or alternatively use a single i2c_transfer() with a Repeated START?

[ ... ]

> +static int sts30_probe(struct i2c_client *client)
> +{
> +	struct iio_dev *indio_dev;
> +	struct sts30_data *data;
> +	int ret;

[ ... ]

> +	ret =3D sts30_reset(data);
> +
> +	return devm_iio_device_register(&client->dev, indio_dev);
> +}

[Severity: High]
Is it intentional to ignore the return value of sts30_reset() here?

If the reset fails due to the hardware being missing or a broken I2C bus,
this will unconditionally register a phantom device to userspace. Should we
check 'ret' and return the error code instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620044010.1082=
621-1-m32285159@gmail.com?part=3D2
