Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05A13C9C4
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 02:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782180209; cv=none; b=F5sAf0yp40Uit/M+esVClcUKHuut24sdxme5o573yFIevWsRHU4iZ90QI2RSzY97Mg9aTsFmoCt1TgKSstDaOPV+OOg0DFuCokyxudFCsVjqsMH6sw+UshCKwVCMSdQHIBNB/P6OpmgsUsNKgCUnixXNoYQgEq/bOg8OMB9gpLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782180209; c=relaxed/simple;
	bh=DF4EwXyrrVnmUJ2PVqczyKK2S2m2x0xalODXPB5q7ec=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RaSPrDydKmURyxSRzX0p3k52WE2vTXs3j2DlfcVcuLTxEKoJpGePpq1SXuKvdjqFFqJ/xUxHJEP47U3YYHPLd4upf2aycTnJZo9FfvoC9c5J905I9COi2pwjSkytb4EwiUvk6ycA1rJvH8/F7EYczLUjJIjzdsIPcUwQtGeA1TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oqoi6ri3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oqoi6ri3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66DF1F000E9;
	Tue, 23 Jun 2026 02:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782180207;
	bh=K0Wm8cwzvXXgZU1L6P4DZ49tvt+ZWL4bH9MThcjOAzc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oqoi6ri3ZWjyOVx6zEGA+EvZDjNZIrCnY7CJgdZDjNGKzcU7QENOtV+9X878cV0ei
	 ce1wUdFXjygeZcFENsjQxbwZQgqSVjHF5caWUspdpKTTZtmLoZ0vQ+6R/Y580H6SJQ
	 yCppMSqvv3rp2wW0kOLI31YH1rrR/8kHmqM+MWp3VU9KSfFDdah9Dq6iWFpp7fxkHg
	 4lWmooQU0j/ep0BHxCUpQ0Qjx8BVWHfXUzG/kIw6Ad89LvhTETOadH5pLPxWVc0E2R
	 QPJiwSml9OeAkABR+ILj6nydQ7jFzHEtPmQT+f1zwOEsQbE+mJFhnV1AMgXZUo2xRd
	 6JqysrT/hJd8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/5] iio: adc: versal-sysmon: add I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623014036.3865402-4-salih.erim@amd.com>
References: <20260623014036.3865402-1-salih.erim@amd.com>
 <20260623014036.3865402-4-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 02:03:27 +0000
Message-Id: <20260623020327.A66DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Non-atomic I2C read transaction releases the bus lock, making it v=
ulnerable to bus interleaving.
--

commit 0b46526090ca97299b6d37544af48b39e72bb565
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add I2C driver

This commit adds an I2C transport driver for the Versal SysMon block,
allowing external masters to read voltage and temperature measurements. It
implements a regmap backend using I2C but does not support events due to
the lack of an interrupt line.

> diff --git a/drivers/iio/adc/versal-sysmon-i2c.c b/drivers/iio/adc/versal=
-sysmon-i2c.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/versal-sysmon-i2c.c
[ ... ]
> +static int sysmon_i2c_reg_read(void *context, unsigned int reg,
> +			       unsigned int *val)
> +{
> +	struct i2c_client *client =3D context;
> +	u8 write_buf[8] =3D { };
> +	u8 read_buf[4];
> +	int ret;
> +
> +	put_unaligned_le16(reg >> 2, &write_buf[SYSMON_I2C_REG_OFS]);
> +	write_buf[SYSMON_I2C_INSTR_OFS] =3D SYSMON_I2C_INSTR_READ;
> +
> +	ret =3D i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D sizeof(write_buf))
> +		return -EIO;
> +
> +	ret =3D i2c_master_recv(client, read_buf, sizeof(read_buf));

[Severity: High]
Does this sequence allow another device to interleave its I2C traffic on a
shared bus?

Looking at sysmon_i2c_reg_read(), the register read operation is split into
separate i2c_master_send() and i2c_master_recv() calls.

Because i2c_master_send() releases the I2C adapter bus lock before returnin=
g,
another kernel thread can perform a bus transaction between these two calls.

If an intervening bus transaction occurs, could it reset the sysmon device's
I2C state machine, discarding the previously written command payload and
corrupting the subsequent read?

Would using i2c_transfer() to perform both the write and read messages as a
single atomic transaction prevent this interleaving?

> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D sizeof(read_buf))
> +		return -EIO;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623014036.3865=
402-1-salih.erim@amd.com?part=3D3
