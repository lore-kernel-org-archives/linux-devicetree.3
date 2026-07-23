Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83B744AB6F
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806246; cv=none; b=LME5Q9WVlFHDz/tS9+DnWMt2uyphkt0GkUZnZBMDfevw+6AuUpOEIf039H55TxA2C0xugJIHAldbC1BW5xu+pzEsldj/sU6OHaPVIDC+t/hmS2SY/MIe3K9SmiYTrhXSNMhTAgX23NhdQ9ufIS5BpekmIy1QBL9pna32tQ26IYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806246; c=relaxed/simple;
	bh=t8FY2279beUjKW8HbwYQBMTPNqQSdrhkjPK5lgJf+6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BpZ5C/+mJRRWyZ/6zjzF9JX7WbqlCmE8J42eJ3b+uCy843tpkuBRdM2ch4BdnyQZfTvGV9SO0fxK/pXZ6QjprYQmzf92JBKrA6QCgs/aL77MeWnksebyX0E/7+eeAQ8VEbrfXIYGBU+A6ecUT5Ehy54mcgbNSU+D4lDTko7a4kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2BD1F00A3E;
	Thu, 23 Jul 2026 11:30:43 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/17] spi: spi-mem: add execute_tuning callback and
 spi_mem_execute_tuning()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Richard Weinberger" <richard@nod.at>, robh@kernel.org, conor+dt@kernel.org, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260723110219.3180747-6-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-6-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:30:42 +0000
Message-Id: <20260723113043.CC2BD1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] spi_mem_execute_tuning() directly invokes the controller callback =
without acquiring the SPI bus locks or ensuring the controller is powered o=
n.
- [High] spi_mem_execute_tuning() does not check if the SPI device is using=
 a GPIO chip select before invoking the hardware tuning callback.
--

--- Patch [5]: [PATCH v6 05/17] spi: spi-mem: add execute_tuning callback a=
nd spi_mem_execute_tuning() ---
commit 74cda1abf92afd30bb8cd6cbe4cb6c5ffa5027f5
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: add execute_tuning callback and spi_mem_execute_tuning()

This commit adds an execute_tuning callback to struct spi_controller_mem_op=
s.
It also introduces the spi_mem_execute_tuning() wrapper function to check
callback availability and invoke it.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index e20eca1b82457..ae9e2d7ac6f3c 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c

[ ... ]

> @@ -660,6 +660,37 @@ u64 spi_mem_calc_op_duration(struct spi_mem *mem, st=
ruct spi_mem_op *op)
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
> =20
> +/**
> + * spi_mem_execute_tuning() - Execute controller tuning procedure
> + * @mem: the SPI memory device
> + * @read_op: read operation template (mandatory)
> + * @write_op: write operation template (optional, may be NULL)
> + *
> + * Requests the controller to perform tuning for high-speed operation
> + * using the provided op templates. On success the controller callback
> + * sets @read_op->max_freq (and @write_op->max_freq when non-NULL) to
> + * the validated clock rate.
> + *
> + * Return: 0 on success, -EINVAL if @mem or @read_op is NULL,
> + *         -EOPNOTSUPP if the controller doesn't support tuning,
> + *         or a negative error code on failure.
> + */
> +int spi_mem_execute_tuning(struct spi_mem *mem, struct spi_mem_op *read_=
op,
> +			   struct spi_mem_op *write_op)
> +{
> +	struct spi_controller *ctlr;
> +
> +	if (!mem || !read_op)
> +		return -EINVAL;
> +
> +	ctlr =3D mem->spi->controller;

[Severity: High]
Does this code execute hardware tuning operations without acquiring the SPI
bus locks or ensuring the controller is powered on?

Other standard SPI memory operations use spi_mem_access_start() and
spi_mem_access_end() to take the runtime PM reference and provide mutual
exclusion against other ongoing SPI transfers. Since those functions are
internal, external callers cannot acquire these necessary protections
themselves.

Could this lead to hardware lockups or data corruption on the SPI bus?

> +	if (!ctlr->mem_ops || !ctlr->mem_ops->execute_tuning)
> +		return -EOPNOTSUPP;
> +
> +	return ctlr->mem_ops->execute_tuning(mem, read_op, write_op);

[Severity: High]
Should this check if the SPI device is using a GPIO chip select before
delegating to the controller's hardware tuning callback?

Standard SPI memory operations (like spi_mem_exec_op) explicitly check
!spi_get_csgpiod(mem->spi, 0) before delegating to ctlr->mem_ops, because
hardware-level memory controllers operate the native chip select.

If a device is configured with a GPIO chip select, the hardware engine will
toggle the native CS (which might be disconnected or connected to a differe=
nt
device) instead of the GPIO CS. Does this need a check similar to other
spi_mem operations?

> +}
> +EXPORT_SYMBOL_GPL(spi_mem_execute_tuning);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D5
