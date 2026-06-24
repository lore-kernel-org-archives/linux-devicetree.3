Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F73BAD9A
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312619; cv=none; b=jTOX0pl77BifdnR2ME45wPBBFODM2rCTZ7sWLiPhH8dxjZ/r9Fx79kWEANoWnipUBc85NOCY3i5WbNX6aDS1aBV/rpZW1eyTeb5guo7CD1h1zE3g0/bDBm+WsO0/Hte5NuDmuCHiN1Xt9tN/w+/uqP1pCGFQ5P+Whh4bWGF7VKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312619; c=relaxed/simple;
	bh=MFV9e1HkQro1M43us8gm0VH6T+1oiPKWErN4ZV23xrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pyLwSeIWZb4VhxO1RAoBcaHhazbI1KKvJQvJy6Ojj2Dj4mhgiEGWhmHy/1LgIBilhIOidhspuauUQEWxr+LxFF49vcbMlPA34Tmm9RcrJP7K87AhkXryrU7lQYBbLjEWphsHuH0eyJ3K9O6JodqBoaiWhu6CzjDqvOEtceFANZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEmjAT3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEmjAT3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2830B1F000E9;
	Wed, 24 Jun 2026 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312618;
	bh=cU9GjT2JKDhWKNhpeTdZxiNU7pOOq3ZIu8DslJV8uaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEmjAT3sjD+6SFWt+iREhQIaZ1Q5QFwIPkRs1VsazkEk2jOCRH93tVBEBa2f3C43r
	 VZTviOAXo920bSa/LQDijKzOZRrUeb9KIuN7NCaELcwqDijPN7SALrmzVFBpEcQbKb
	 wOYMg9FxajBEk8X4LrkyV5aJG+52McELMPY4ZjuuFxCgU2jQOm47bQvFEAl2TOBrBN
	 aitFLxKUAxWBYYOFuooQV0ZmgEO0HyQ806qoLNvTuJ+06AZZdKZKyIwsGYyc0w2LAB
	 0oRmYfB7gF72q4xsw/5KJQtGE62RSCC4wxsV9Ar1J7Y5Y10YYTIwhqkA40xxVa3sD8
	 RtBIHcMsbCweA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/5] iio: adc: versal-sysmon: add I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260624143722.4047649-4-salih.erim@amd.com>
References: <20260624143722.4047649-1-salih.erim@amd.com>
 <20260624143722.4047649-4-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 14:50:17 +0000
Message-Id: <20260624145018.2830B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Non-atomic I2C read sequence allows bus interleaving, potentiall=
y corrupting hardware state or readings.
--

commit 9ab4d88815ee621205c4b3e8a0bb6032534c3baa
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add I2C driver

Add an I2C transport driver for the Versal SysMon block. The SysMon
provides an I2C slave interface that allows an external master to
read voltage and temperature measurements through the same register
map used by the MMIO path.

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

[Severity: Medium]
Does this split I2C read sequence allow bus interleaving?

Calling i2c_master_send() followed by i2c_master_recv() releases the I2C
adapter lock and generates a STOP condition on the bus between the two call=
s.

If another I2C transaction is scheduled during this window (for example, fr=
om
userspace via /dev/i2c-* or from another driver sharing the bus), it could
interleave with this read sequence.

This breaks the atomicity of the command/response pair, potentially returni=
ng
corrupted data or breaking the hardware's state machine.

Could a single i2c_transfer() call with two messages be used here to
generate a Repeated START, or i2c_lock_bus() be used if a STOP condition is
strictly required by the hardware?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624143722.4047=
649-1-salih.erim@amd.com?part=3D3
