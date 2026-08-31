Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147C9474266
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191570; cv=none; b=f4b5sKY5P3xhj0QecKjPaj3BsunWxYKTz3h0ffzF/cf7Qg63VkPm3iWU1705PS4dFXwj4kJDRsGnpLWdRe6aZGzUyLP5QKQEcSss9x/MTpj4YLb6i0DMcfMlKxkQPk18cTwjgUV/b+KUoNzVsJSfbbUDrRfVz+2/lgrLTys8Y7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191570; c=relaxed/simple;
	bh=OSpepKEK0wmSPUNwM5NJlismhwOQ/kkJpCXBZ5fZ0Ow=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nvxfzFcL44RSZqkXVNh+mTxLIWJdmJpKkB73627T6R1OdFTimlwmQPElkRg0+fZOMTsBvhm2lxpgFZaSQp4Ffm0lBYZulxpiHZqwbU2c4VLHhGsOLYD+oaAtTX+bOVuaLV1g/QDdJile0tNJIRFJ4QWzxsuiOuGlYI4bMNthvL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdmTIP+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdmTIP+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4166C1F000E9;
	Mon, 31 Aug 2026 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788191568;
	bh=16EiUpUS+iAthf+FtNWsxt1iwKNT/E8dIjW4IJFycXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdmTIP+D2Pwh2Xb18oCNxSWCqZhIAUdZHQYb+T00zaDT68uGyiY+Up5CNAD5vnQuJ
	 aFArqaWZFvwr/J07B9EmrEIvdFnVz2/fH4uLRMeFYZBNTWXEtHMAEuPiG9c7QIuJFn
	 54XqJlvNRhWmsj2SR1HD5lNo/KLQDOr5VYZ5h3PWvD8jNr2LrqpUwezQoxMhcnaBRU
	 88Rwb9mNeDfQJObvLfI4uZUfUdrQx0OvRgCi2Yz1x1GWO/uu6zbtWCGeM7zg1EMGNY
	 eUCkVl2qVd9SSuxSm85pwiIUtRU1BOLRZWxNMuTXO6fqOhOTTUCVErDIPz4XFWjPcw
	 bPwrYvx3wNGbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831134334.196359-3-stefan.popa@analog.com>
References: <20260831134334.196359-1-stefan.popa@analog.com>
 <20260831134334.196359-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:52:47 +0000
Message-Id: <20260831155248.4166C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing return length check for i2c_smbus_read_i2c_block_data() =
allows short reads to be silently treated as valid 32-bit IV data.
- [Medium] The commit message claims to expose a 'hardware-gain' attribute,=
 but the code does not implement it.
--

commit 87fd945caf9aab4104e807fcc33f50c06d67bb4c
Author: Stefan Popa <stefan.popa@analog.com>

    iio: adc: add MAX40080 current-sense amplifier driver
   =20
    The MAX40080 is a bidirectional current-sense amplifier with an
    integrated 12-bit ADC and an I2C/SMBus interface. It measures the
    voltage across an external shunt resistor and the input bus voltage,
    storing the results in an internal FIFO.

>     Add a direct-mode IIO driver exposing the current and voltage channels
>     with raw, scale and hardware-gain attributes, a configurable

[Severity: Medium]
The commit message claims to expose a hardware-gain attribute, but is this
actually implemented in the code?

Looking at max40080_channels, the promised hardware-gain attribute appears =
to
be structurally omitted in favor of standard scale representations:

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..6864ce1cb0633
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c
[ ... ]
> +static const struct iio_chan_spec max40080_channels[] =3D {
> +	{
> +		.type =3D IIO_CURRENT,
> +		.indexed =3D 1,
> +		.channel =3D 0,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),

[ ... ]

> +static int max40080_read_iv_once(struct max40080_state *st, u32 *iv)
> +{
> +	__le32 buf =3D 0;
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_i2c_block_data(st->client, MAX40080_REG_IV,
> +					    sizeof(buf), (u8 *)&buf);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
Does this code silently treat short I2C block reads as valid data?

Since i2c_smbus_read_i2c_block_data() returns the number of bytes read
on success, checking only if ret < 0 ignores the returned length. If the
transfer returns fewer bytes than requested, the unpopulated MSB retains
its initialized zero value, which could cause a persistent validation failu=
re
and timeout loop in the caller.

> +
> +	*iv =3D le32_to_cpu(buf);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831134334.1963=
59-1-stefan.popa@analog.com?part=3D2
