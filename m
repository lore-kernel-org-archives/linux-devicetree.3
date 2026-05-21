Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61661FC7
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 04:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779337898; cv=none; b=Xo9ziMGhSL3sPMjbxkaXOayFguI/oTXokBTJlwLLhXUp+5zMK7LY77pp3/7htUe0q0uqjNEpyyqIolKT+QbDH+t3E9V3glU8GFexsMJLVg+Lf+TQFsUv2VpVLlh2raCPSQ4pmrjq/H1GqnN+itCfo2H6nPb+/3QToTYKZrrr07U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779337898; c=relaxed/simple;
	bh=ZdhPItu96h8Zo169aW9mnsnL86sxm6z8C5CeXF3wtJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ce4OQpvKwptJcfgx8pdaWE7wUE9EE42nQ/Y15mx+9K3uhY2TBnUpB+aJuUMJMTX1srBlHn2Zw5z7tVTKumcxdXfMR7pdnTOTLyATO7oomuy3qkDaeHy6+WSjeLnNRXLFeukrSor5yqcBt51W3A3CaZp84ud3FNIMBvNnIuOsdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ci0inTtH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ci0inTtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2391F000E9;
	Thu, 21 May 2026 04:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779337897;
	bh=BnHeQ79rUFPfA2QQd5FYDoGQkBfba511CvTGjuFJ9nE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ci0inTtHr9Y2qTnNOmOaI6BuSv9tL2d8mo6uO6/c/n5kXJjY5kbnK5ZwSHiiG4czC
	 T9odpoqfZX392a1YDse0fZe0jlOfXMkMwPnU+dr5nnML9Ehiod6HEKTBeL7U5VZx6s
	 c3dK61OCPhg0YebrC/k3Pi8YvY3GdDqGKsVyNDmlhxgeXOi2RHpxBuOIQYPz0Ai/ch
	 5Um0nfT8MnDS1aYeS8njmIv1j6Ncuql479a4Xudgfa90as4laGVQhauIfkumN61dYN
	 qwAo5zRfOm+JdSJIuyTO7w63qF2SsDsqeZy0BMa0aV2X5cZxOekg8+0RvyNvLPzPrI
	 H45eAplFYxwRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] i2c: designware: Export symbols and add __weak
 for DWC I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521034340.27837-3-lianfeng.ouyang@starfivetech.com>
References: <20260521034340.27837-3-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 04:31:36 +0000
Message-Id: <20260521043137.1D2391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Exporting core driver functions using `__weak` allows global overr=
ides, completely breaking generic DesignWare I2C hardware in multi-platform=
 kernels.
- [High] Compile-time `#if IS_ENABLED(CONFIG_I2C_DWC_CORE)` checks uncondit=
ionally replace generic hardware logic with StarFive DWC-specific logic.
- [High] The function `i2c_dw_set_fifo_size` acquires the bus lock but fail=
s to release it if `CONFIG_I2C_DWC_CORE` is enabled.
- [High] Return values of probe functions are ignored, and standard adapter=
 initialization is skipped when `CONFIG_I2C_DWC_CORE` is enabled.
- [High] The `adap->quirks` field is completely uninitialized when `CONFIG_=
I2C_DWC_SLAVE` is enabled.
- [High] Incorrect packing of FIFO depths leads to bitfield overlap and sev=
erely corrupted hardware configurations.
- [High] Skipped interrupt mask initialization for DWC I2C slaves opens the=
 system to unhandled interrupt storms.
--

commit 49b74b77ebfe8943f63b3e20e42d019503ae6640
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: i2c: designware: Export symbols and add __weak for DWC I2C driver

The upcoming StarFive DWC I2C driver is based on the DesignWare I2C core but
requires its own probe and configuration routines due to register layout
differences. Export several key functions and mark them as __weak to allow
the DWC driver to override the implementations.

> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/bus=
ses/i2c-designware-common.c
> index 4dc57fd561703..cfeec5d338bba 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
[ ... ]
> @@ -411,7 +416,7 @@ static void i2c_dw_write_timings(struct dw_i2c_dev *d=
ev)
>   *
>   * The controller must be disabled before this function is called.
>   */
> -void i2c_dw_set_mode(struct dw_i2c_dev *dev, int mode)
> +__weak void i2c_dw_set_mode(struct dw_i2c_dev *dev, int mode)

[Severity: High]
Does marking generic driver functions like i2c_dw_set_mode() as __weak risk
breaking generic DesignWare I2C hardware in multi-platform kernels?

If both the standard DesignWare and StarFive drivers are enabled, strong
symbols from the StarFive driver could globally override these functions for
all controllers. Could hardware-specific variants be implemented using an
operations structure with function pointers instead?

[ ... ]
> @@ -806,10 +811,25 @@ static int i2c_dw_set_fifo_size(struct dw_i2c_dev *=
dev)
>  	if (ret)
>  		return ret;
> =20
> +#if IS_ENABLED(CONFIG_I2C_DWC_CORE)
> +	u32 tx_fifo_cfg =3D 8, rx_fifo_cfg =3D 8;
> +
> +#ifdef CONFIG_OF
> +	ret =3D of_property_read_u32(dev->dev->of_node, "dwc-i2c-tx-fifo-depth"=
, &tx_fifo_cfg);
> +	if (!ret && (tx_fifo_cfg < 2 || tx_fifo_cfg > 256))
> +		tx_fifo_cfg =3D 8;
> +
> +	ret =3D of_property_read_u32(dev->dev->of_node, "dwc-i2c-rx-fifo-depth"=
, &rx_fifo_cfg);
> +	if (!ret && (rx_fifo_cfg < 2 || rx_fifo_cfg > 256))
> +		rx_fifo_cfg =3D 8;
> +#endif
> +	param =3D rx_fifo_cfg << 8 | tx_fifo_cfg << 16;

[Severity: High]
Can this bitwise packing corrupt the hardware configuration if rx_fifo_cfg =
is
set to 256?

Since 256 requires 9 bits, shifting rx_fifo_cfg by 8 yields 0x10000, which
sets bit 16 and overflows into the tx_fifo_cfg field. This causes FIELD_GET
to return 0 later on, incorrectly setting the FIFO depths to 1.

> +#else
>  	ret =3D regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
>  	i2c_dw_release_lock(dev);
>  	if (ret)
>  		return ret;
> +#endif

[Severity: High]
Does this code leak the bus lock when CONFIG_I2C_DWC_CORE is enabled?

i2c_dw_acquire_lock(dev) is called earlier in this function, but the matchi=
ng
i2c_dw_release_lock(dev) call is placed in the #else block. When the DWC co=
re
is enabled, the function returns without releasing the lock, which can cause
a deadlock during the next lock acquisition.

[ ... ]
> @@ -835,7 +855,9 @@ u32 i2c_dw_func(struct i2c_adapter *adap)
> =20
>  void i2c_dw_disable(struct dw_i2c_dev *dev)
>  {
> +#if !IS_ENABLED(CONFIG_I2C_DWC_CORE)
>  	unsigned int dummy;
> +#endif
>  	int ret;
> =20
>  	ret =3D i2c_dw_acquire_lock(dev);
> @@ -847,7 +869,12 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
> =20
>  	/* Disable all interrupts */
>  	__i2c_dw_write_intr_mask(dev, 0);
> +
> +#if IS_ENABLED(CONFIG_I2C_DWC_CORE)
> +	regmap_write(dev->map, DWC_IC_INTR_CLR, DWC_CLR_INTR);
> +#else
>  	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
> +#endif

[Severity: High]
Will this compile-time check break standard DesignWare I2C controllers in
multi-platform kernels?

By using #if IS_ENABLED(), the mandatory read from DW_IC_CLR_INTR is replac=
ed
globally by a write to DWC_IC_INTR_CLR when the DWC core is compiled in,
causing generic controllers to execute incorrect logic.

[ ... ]
> @@ -896,6 +923,12 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
>  	if (ret)
>  		return ret;
> =20
> +#if IS_ENABLED(CONFIG_I2C_DWC_CORE)
> +	if (dev->mode =3D=3D DW_IC_SLAVE)
> +		i2c_dw_probe_slave(dev);
> +	else
> +		i2c_dw_probe_master(dev);

[Severity: High]
Does this code ignore the return values of the probe functions?

If initialization fails inside i2c_dw_probe_slave() or i2c_dw_probe_master(=
),
the error is silently ignored and the driver continues probing.

> +#else
>  	ret =3D i2c_dw_probe_master(dev);
>  	if (ret)
>  		return ret;
> @@ -906,10 +939,16 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
> =20
>  	if (!adap->name[0])
>  		strscpy(adap->name, "Synopsys DesignWare I2C adapter");
> +#endif

[Severity: High]
Are we skipping generic initialization steps here?

Because the calls to i2c_dw_init(dev) and initializing adap->name are enclo=
sed
in the #else block, they are entirely skipped when CONFIG_I2C_DWC_CORE is
enabled, which could break standard adapter initialization.

>  	adap->retries =3D 3;
>  	adap->algo =3D &i2c_dw_algo;
> +#if IS_ENABLED(CONFIG_I2C_DWC_SLAVE)
> +	if (dev->mode =3D=3D DW_IC_SLAVE)
> +		adap->algo =3D &i2c_dw_slave_algo;
> +#else
>  	adap->quirks =3D &i2c_dw_quirks;
> +#endif

[Severity: High]
Will adap->quirks remain uninitialized when CONFIG_I2C_DWC_SLAVE is enabled?

The assignment to adap->quirks is in the #else block. If CONFIG_I2C_DWC_SLA=
VE
is enabled, adap->quirks is never initialized for any device mode, including
master. This removes quirks like I2C_AQ_NO_ZERO_LEN, which could allow
invalid zero-length transfers to hang standard controllers indefinitely.

>  	adap->dev.parent =3D dev->dev;
>  	i2c_set_adapdata(adap, dev);
> =20
> @@ -938,16 +977,18 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
>  	if (!dev->emptyfifo_hold_master)
>  		irq_flags |=3D IRQF_NO_THREAD;
> =20
> -	ret =3D i2c_dw_acquire_lock(dev);
> -	if (ret)
> -		return ret;
> +	if (!IS_ENABLED(CONFIG_I2C_DWC_CORE) || dev->mode =3D=3D DW_IC_MASTER) {
> +		ret =3D i2c_dw_acquire_lock(dev);
> +		if (ret)
> +			return ret;
> =20
> -	__i2c_dw_write_intr_mask(dev, 0);
> -	i2c_dw_release_lock(dev);
> +		__i2c_dw_write_intr_mask(dev, 0);
> +		i2c_dw_release_lock(dev);
> +	}
> =20
>  	if (!(dev->flags & ACCESS_POLLING)) {
>  		ret =3D devm_request_irq(dev->dev, dev->irq, i2c_dw_isr,

[Severity: High]
Could skipping the interrupt mask clearing for DWC slaves cause unhandled
interrupt storms?

If the unmasked hardware has pending interrupts, devm_request_irq() will
immediately trigger i2c_dw_isr_slave(). Because dev->slave is not yet
registered during probe, the ISR will return IRQ_NONE without clearing the
hardware interrupt, leading to a persistent storm.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521034340.2783=
7-1-lianfeng.ouyang@starfivetech.com?part=3D2
