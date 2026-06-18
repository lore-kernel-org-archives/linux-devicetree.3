Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EBD2F39B5
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769459; cv=none; b=bgBrth7cni3kyTGFWxjrSCRShs3UlXtWfOp79fbmrIgv0HUCwAlfdbFAJq1UekPprNw53HyomldXaVVxYEmUYeewKHdUf/GhmBRn1tpzGNj+5or/OjzUryH+0+RgEnfKAOo5gln02E0vvtGpBtisflqEWSPAlhPh4TMEfJjWURE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769459; c=relaxed/simple;
	bh=S2NF1zAJ6qxyt6Jbb9rYJ/bRdpurn01eFeF55YC7g68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qbGzP9YDxXrqEs5GothErbyS/w8FLjrLxV+x6GOg4iRJyrqzgsmIhK4BkPMwwAV3Q3hcoFgo6uSIR+88vLXpa3n/vL+WcztNDMcmWgQ3X88zfosLGwa6gDktxO0ro11whrYiDeRk50ZcId6iTYb9RYjTfrno/7l3TgP3+U11hIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYDyYMY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYDyYMY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59931F000E9;
	Thu, 18 Jun 2026 07:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769458;
	bh=+M8Dia+vFe9BHKPwYGXJ33B0X0KN1ERlk2rQQaa+bYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IYDyYMY/VFu5VW0CXPWhgWORSBUImUw3JWFMtht6TGPAVb1XcCpVkNdmNOKHw+fUf
	 wwg0AbUpkBCta2S6GYhDbjIuhANGksRlfD0pQ3k4h70tO72uF16Ro8tcYfXEiFk2U8
	 F86Tf+aL0bX+kXDUHo/wdKCH60bf22ZAIYPsw7BbIE9j+1nS0PVf3Myw11z/RgG7Id
	 G9E8yByHnZ7kv6UsJZMM7YqYVwpOJThLBL8vBd6GZTuORoteIowkV29snQa0Vw+1JR
	 D2xP/JiW4VlakY/es4pv8iPUNjV8xYpXeznj0qCNUjwNACjLzveirLCQ+OZ/x2I0Kr
	 iFqJbuHlRAadA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/16] spi: spi-mem: add execute_tuning callback and
 spi_mem_execute_tuning()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260618073725.84733-6-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-6-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:57:37 +0000
Message-Id: <20260618075737.C59931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing bus lock in spi_mem_execute_tuning() leads to data corrupt=
ion and hardware state race conditions.
- [Medium] spi_mem_execute_tuning() invokes hardware tuning without verifyi=
ng if a GPIO chip-select is in use, causing spurious tuning failures.
--

commit 488642092bb43537c3028baead18a5f59abeb41c
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: add execute_tuning callback and spi_mem_execute_tuning()

This commit adds an execute_tuning callback to struct spi_controller_mem_ops
and a corresponding spi_mem_execute_tuning() wrapper. This provides a stand=
ard
interface for SPI memory drivers to trigger controller tuning procedures
required for high-speed operation modes.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index b0b111642a358..ae9f55f4ef90d 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c

[ ... ]

> @@ -653,6 +653,37 @@ u64 spi_mem_calc_op_duration(struct spi_mem *mem, st=
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
> + *         -EOPNOTSUPP if controller doesn't support tuning,
> + *         or a controller-specific error code on failure.
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
> +	if (!ctlr->mem_ops || !ctlr->mem_ops->execute_tuning)
> +		return -EOPNOTSUPP;

[Severity: Medium]
Hardware tuning engines are usually hardwired to toggle the controller's
dedicated native CS line and cannot natively toggle a GPIO CS.

If we omit checking for a GPIO CS here, could the hardware tuning sequence
run on a GPIO CS configuration? The hardware sequencer might generate clock
and data without asserting the GPIO CS, causing the flash device to ignore
the tuning phase and resulting in a spurious failure.

Should this verify !spi_get_csgpiod(mem->spi, 0) before proceeding to invoke
the hardware-accelerated callback, similar to spi_mem_exec_op() and
spi_mem_poll_status()?

> +
> +	return ctlr->mem_ops->execute_tuning(mem, read_op, write_op);

[Severity: High]
Does this execute_tuning() callback invocation need to be protected by the
SPI controller's bus_lock_mutex?

Hardware-specific tuning implementations often directly perform
read-modify-write operations on global controller registers to configure PHY
pipelines without necessarily relying entirely on spi_mem_exec_op() during
all stages.

If the bus lock is not held (via spi_mem_access_start() and
spi_mem_access_end()), could these unprotected register accesses violently
race with concurrent SPI transfers occurring on other chip-selects on the s=
ame
bus, potentially corrupting hardware states like PHY_EN or ENABLE bits?

> +}
> +EXPORT_SYMBOL_GPL(spi_mem_execute_tuning);
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D5
