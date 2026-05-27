Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84800405C57
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886909; cv=none; b=GavpgzUESP6FVvO6A2PI8gmePwVnlYoQG2Ucm7a0m6mqWPa9Z8XeG12AHfoj+0D2tW9qn1EJAK3xxj/Q7cUzFCc+kT0ET1c6fsomO16WJ2IrlGU+kN0EJkxYy/WI2cy5ITabagLM1/Gc2bD0Qt/wRnFFZLLYReIGA97xUHfxZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886909; c=relaxed/simple;
	bh=oJR+lJBquTPnBPSgczBr90MASjyyRV7q2ZheMXLbhcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ORsb1mht0LoSeR7jau8sDb72nykaeN18uInrbBmaMuf84W0yep9okYYnXbI9Lyt8Zbct2hRxSy159ufsSjc9KK0Kg4etNzF9m3O+NwnnNqyAbvff8T0I3FO4/LTq5r9KPcaKTKokjiLTrU2iYfSwz2JRtYdg/4Rqmip8i0kOIXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0igMXhl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0igMXhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D601F000E9;
	Wed, 27 May 2026 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779886908;
	bh=+lsCFcpNni/siMKQ1RY87mU6Y2CuWsDs6RA+pZ0Ygoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0igMXhlrl1lj7Dg0ByaQfidzLWJXYJ+gpuPCBayScI8i7S3yT4oessmlaxAwSfHI
	 pd0H+IQ+E/fAc8BtqCpdouIZR5m+BD0aJTeP8/0IJ1Kg6/s5O7wShssPnYUkhjsPmm
	 33nICJVyZqGSCAeGGf7cXrJjsOrg0h2ZF0YxM3kHVnSDnlJoLHuBkg29karq8ZqAQp
	 T6z0rDO8T2OsN7szfwEYjpz1vcGIWON9KTZFh97kXly/2T0awTAcGwJr3jp5C+45kj
	 tdc8BNIS4RixZJ2xo+uVcSXoJLHspLp7mSFTyhtgPEJNEanXFZQgi/7cvqgZDZGu+t
	 TAcX2B3pbgG+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] iio: adc: versal-sysmon: add I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527114211.174288-4-salih.erim@amd.com>
References: <20260527114211.174288-4-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 13:01:47 +0000
Message-Id: <20260527130148.30D601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The I2C register read operation splits the write and read phases=
 into two independent API calls, breaking bus atomicity and introducing an =
unsafe STOP condition.
- [Low] The VERSAL_SYSMON_I2C config is missing the architecture dependency=
 present in the related VERSAL_SYSMON config.
--

commit ce68d28f1b162fe7dac253345bd2e5c0af9ee334
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add I2C driver

This commit adds an I2C transport driver for the Versal SysMon block,
allowing reading voltage and temperature measurements over I2C.

> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index c7f1905748497..8f9fc9de74a54 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
[ ... ]
> @@ -1963,6 +1963,19 @@ config VERSAL_SYSMON
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called versal-sysmon.
> =20
> +config VERSAL_SYSMON_I2C
> +	tristate "AMD Versal SysMon I2C driver"
> +	depends on I2C
> +	select VERSAL_SYSMON_CORE

[Severity: Low]
Does this config need an architecture dependency?

The related VERSAL_SYSMON config restricts visibility with
"depends on ARCH_ZYNQMP || COMPILE_TEST". By omitting this dependency here,
will VERSAL_SYSMON_I2C be incorrectly presented as an available driver on
all I2C-enabled architectures?

> +	help
> +	  Say yes here to have support for the AMD/Xilinx Versal System
[ ... ]
> diff --git a/drivers/iio/adc/versal-sysmon-i2c.c b/drivers/iio/adc/versal=
-sysmon-i2c.c
> new file mode 100644
> index 0000000000000..92d149f517e57
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
> +	write_buf[SYSMON_I2C_OFS_LOW_IDX] =3D
> +		FIELD_GET(SYSMON_I2C_OFS_LOW_MASK, reg);
> +	write_buf[SYSMON_I2C_OFS_HIGH_IDX] =3D
> +		FIELD_GET(SYSMON_I2C_OFS_HIGH_MASK, reg);
> +	write_buf[SYSMON_I2C_INSTR_IDX] =3D SYSMON_I2C_INSTR_READ;
> +
> +	ret =3D i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (ret < 0)
> +		return ret;
> +	if (ret !=3D sizeof(write_buf))
> +		return -EIO;
> +
> +	ret =3D i2c_master_recv(client, read_buf, sizeof(read_buf));

[Severity: Medium]
Will this sequence of independent send and receive calls break bus atomicit=
y?

Since i2c_master_send() and i2c_master_recv() independently acquire and
release the I2C adapter lock, this approach generates a STOP condition on
the bus after the write phase.

On a shared I2C bus, couldn't this allow transactions for other devices to
interleave and disrupt the device state or abort the pending read sequence?

Would it be safer to use i2c_transfer() with an array of two i2c_msg
structures to ensure a Repeated START (Sr) condition?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527114211.1742=
88-1-salih.erim@amd.com?part=3D3
