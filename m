Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379484;
	b=X7HCs3RcMSJmtSLlsHUF2M7k8NJB4I/js7QhogB3sKGZLKJfqQVyVGOIOXxc820MpBXQ
	 tHbZU+OuhqKqIyij39YKKWdc9EGVMUxhhx2UL6IDQvBfNiz7PTQRfD+cbjeDTr5zrjDCJ
	 b/sVTwHHZBkWpnfuTzGb3EmSGgCqbfkZPYneW6R38KLGvmTHbdVm5VD9WcuwExURPOT3Q
	 0n4PhmmAfLZK7YjAndW2eDsEMVLOzEEk1iASmeB+m2p1WEgWDZn8P6xmBLax2lHCQQy1J
	 kUefYuAFQCiufPrMySXsmIkXWvOVBo+DHcLZjDntPtIWsaNaS1lQDbV4tPWzXyZ2CEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379484;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MQZxgboD7326TKsyM1FW4IBBP6/ipj7VMqLHpbjPHbM=;
	b=5sCsKzg6uefrbhZm+m0nFs13A2mRMFjQWauz3rmH4NuO9gwPgKVww51yT6VGVotzjI80
	 W9uQVlXZIKHIca5b6hqYiiW9VMuInkhT3bkfrlakHzxKLMGKJ1drXfg+Jkua9X5opEijE
	 S4iGIc667OP/U7Dq5hjqbh2V1FmK9fR308JNMTCxIsAZ/2X2M74OBhzZc3shG1pvJzg9t
	 70pKkOFJImxpk+rF2q7+a4XVnuALhx/ig04dPyT3zjqSqhJ5jbclqlnHE4wABZ7K3vmAZ
	 Fy13/Vq8CS3KZpryuaR7QeQa0+JDcTvgeqcQPk0QFwQoXSev56FUrI2m8+gCYu8UZaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZGPrpyqV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDCD606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZGPrpyqV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FD51F0093A;
	Fri, 30 Oct 2026 16:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379484;
	bh=MQZxgboD7326TKsyM1FW4IBBP6/ipj7VMqLHpbjPHbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZGPrpyqVD2+zfJYm1kwM+bgvflW8tK/9KRTgBysfQXr5mawN+v7zyuhtlOtrqwvRK
	 RsXuamd3rj5e41cVanV4j08NsvxF4FBYCxnsdC2fynKfkuhVn4W9yEInF0CIedWP3M
	 2v2NOvS+XZpI5dmvWpWGj4Dre5UvXBLNI5Zkd1Sf32pm0QkhkSW0TojD2h85Uf+MLE
	 ZKLrVgszMPFEEutWBE3I7z9LzBsGSWoOTjwX8DRE9Yz4j+akD8iZWZZcGSQvsyKWn9
	 c4FhbPLR8nFemQaZXSH1AO/rS1Gu1w3+vieTnl+t/flP2BvBm+fRYSV1LrIMsGhP60
	 jJiHATQnF5czA==
Message-ID: <sashiko-outbox-191295@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for Texas Instruments
 TLA2528 adc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030164705.297354-3-maxime.chevallier@bootlin.com>
References: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
 <20261030164705.297354-3-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 16:58:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: adc: ti-tla2528: uninitialized stack read in tla2528_read_s=
ample()
- [Low] iio: adc: ti-tla2528: positional initializer in struct i2c_device_i=
d table
--

commit 25a176a55c9c7afc00ecb1f3b6cd5d101cdeee77
Author: Maxime Chevallier <maxime.chevallier@bootlin.com>

iio: adc: add driver for Texas Instruments TLA2528 adc

This commit adds an IIO ADC driver for the Texas Instruments TLA2528 8-chan=
nel
12-bit I2C ADC supporting raw channel reads.

> diff --git a/drivers/iio/adc/ti-tla2528.c b/drivers/iio/adc/ti-tla2528.c
> new file mode 100644
> index 0000000000000..287e52dc9d6d2
> --- /dev/null
> +++ b/drivers/iio/adc/ti-tla2528.c
> @@ -0,0 +1,245 @@

[ ... ]

> +static int tla2528_read_sample(const struct i2c_client *client)
> +{
> +	__be16 data;
> +	int ret;
> +
> +	ret =3D i2c_master_recv(client, (char *)&data, sizeof(data));
> +	if (ret < 0)
> +		return ret;
> +
> +	return be16_to_cpu(data) >> 4;
> +}

[Severity: Medium]
Can tla2528_read_sample() read uninitialized stack memory from data when
called via tla2528_read_raw() -> tla2528_read() -> tla2528_read_sample()?

i2c_master_recv() calls i2c_transfer_buffer_flags():

drivers/i2c/i2c-core-base.c:i2c_transfer_buffer_flags() {
	...
	ret =3D i2c_transfer(client->adapter, &msg, 1);

	/*
	 * If everything went ok (i.e. 1 msg transferred), return #bytes
	 * transferred, else error code.
	 */
	return (ret =3D=3D 1) ? count : ret;
}

If the underlying I2C adapter returns 0 messages transferred from
i2c_transfer() without populating the receive buffer, i2c_master_recv()
returns 0. Because tla2528_read_sample() only checks for ret < 0, it will
proceed to shift and return the uninitialized stack variable data to
userspace.

Should this check if (ret !=3D sizeof(data)) and return -EIO when a short r=
ead
occurs?

[ ... ]

> +static const struct i2c_device_id tla2528_id[] =3D {
> +	{ "tla2528" },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but should the new entry in tla2528_id in
drivers/iio/adc/ti-tla2528.c use a named initializer ({ .name =3D "tla2528"=
 })
to follow the I2C subsystem convention?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030164705.2973=
54-1-maxime.chevallier@bootlin.com?part=3D2
