Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023BE134CF
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729223; cv=none; b=Phw+s4fQZJMoPFLGCnMRhfN4V88DHjpLC/WtjtJsjbiAxU4r26upQlVAp53GiowPb7TGY07R5LE4ZrPGtubsj3UZEnaHumzjYnbNbUeGL2QPgxspvPZpilRm19RxNsgHHHUCctVj5/tNJQ/nmDYMWcJnKXZp6Yq3ZiCR4Cfzp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729223; c=relaxed/simple;
	bh=7ddaW5GncH3m2JTx4KPkqK2NOriK5O5N184N9ED/OXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JtHjqd8qFGe1N+CI9nvRiCZfRAfVuMCvtRJpeGwXh4U4/gNzRBZJEvSewiLnyLJvFUlpaeszfVnyQGhAOFkxJoOdafx+ekEj/dgCDbyfKKFSo4rMO3MfTc6HedljQwE5ZKg3BmUODVncpetL0iS6/ARfUTFyvgXdrQ7rcx0FbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvzaJpgK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvzaJpgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FBC1F000E9;
	Wed, 17 Jun 2026 20:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781729221;
	bh=XBI98JDUceHT46dCwbxEGzdHDof3785u/7hPvt5dTe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TvzaJpgKqHs5Vf9hpYzMgrCcEjqjXjT+c4Ufljd2psCGCXa8jivJ5U3F03RYXBr8b
	 hSv6tR2EmYaIuqvF9o+OhGvTwTonc5t3hwUH0tmmSie9nSaK0To7EuPy8NwnBCIXNb
	 hXqYAxVcjzZGJxf1XPwM5S53eU2APVpBslYqs7epmvmDin/haxLMreUgfiIlca/Reg
	 BzCS0IAOrwY8cChk4j8uFjc9gkw5hh0C+vWU19aNGOqut8yV3yyQenIT2Hvl/RuQt0
	 qJBl95EztmfK2Z8gBM8MEzhDEO7q9stGreinHF8cYC1qrVpz+C1EVF3jYpjGxsMPKo
	 E4Vt1MiLK5G0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/5] iio: adc: versal-sysmon: add I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617180147.3370346-4-salih.erim@amd.com>
References: <20260617180147.3370346-1-salih.erim@amd.com>
 <20260617180147.3370346-4-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 20:47:00 +0000
Message-Id: <20260617204701.67FBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Non-atomic I2C read operation splits the command write and data re=
ad into two distinct I2C transactions, risking state corruption from interl=
eaved bus traffic.
--

commit ae0266701d933c996d4059785f81513fb71dc331
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add I2C driver

This commit adds an I2C transport driver for the Versal SysMon block. It
provides an I2C slave interface that allows an external master to read
voltage and temperature measurements through the same register map used by
the MMIO path.

> diff --git a/drivers/iio/adc/versal-sysmon-i2c.c b/drivers/iio/adc/versal=
-sysmon-i2c.c
> new file mode 100644
> index 0000000000000..e9a7629159ab1
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
Does this sequence release the I2C bus lock between the command write and t=
he
response read?

Using i2c_master_send() followed by i2c_master_recv() will independently
acquire and release the I2C adapter lock, generating a STOP condition on the
bus between the two operations.

If other devices share this I2C bus, could an interleaved transaction reset
the SysMon's internal state machine and cause the subsequent read to return
corrupted data?

Should this be implemented using a single i2c_transfer() with two messages
(using a Repeated START), or explicitly wrapped in i2c_lock_bus() and
i2c_unlock_bus() if a STOP condition is strictly required by the hardware?

> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D sizeof(read_buf))
> +		return -EIO;
> +
> +	*val =3D get_unaligned_le32(read_buf);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617180147.3370=
346-1-salih.erim@amd.com?part=3D3
