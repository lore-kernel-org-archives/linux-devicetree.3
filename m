Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC6A305E1F
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315020; cv=none; b=X9T/IrHqkPyzvYgxIba6d3u/p51epunTgw/M26mcU966D1hiFYRSGja/v3zKwaHhLUJir1g5/vSFlElujNVCW72DlrgN1ZTePOG57nP3NDL3oCXYI7saihKCjJeo0RcSKRhDKKv/3r6eXmxXUGka1WwOYaiQBv1dRlZaXaBiMB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315020; c=relaxed/simple;
	bh=HEeSD8vyd1QCfwvLJ0zF5Zrg6gG6nKGbW70zF5cWwu4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DifnBUQTO0LQNPSZA71mgflTVmmjFKxK/nqZ6I1L27rxU1UBWRw+IS9hlDIIw8xq4X6jM3wafWePku+Ea2ZH9ej9hEVXa50h/bJXZxBuoBXSkv07NOnN+uB/KjZNsChIcOx/AWNFl/rvH6IlcPFRP9hjowryOg3kREdY/CqnrLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxAeTu8f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxAeTu8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66711F000E9;
	Fri, 17 Jul 2026 19:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315019;
	bh=QYEZk9m38fNnuEJhf1SgZyVqRHzCNRBV2AEDEM0HVlQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxAeTu8fzPUae6BWgHlKU1CwohgYcHowUtpDEm3XsJbnp5S0HzRoaLyhGu0YgKPos
	 qy6T7rB3gUM6vya8dqiw5qWgcnUndtt9cyY9YpYKWsM/ZDY9ktG+HsJfdiyUcx0N43
	 KuCihu3c1+/R583GcpllWmUjIyXYn5Zd+kSASarjeh5imoMV+KUNWEaiHrIP9R5/te
	 3sScid97/B6xK/FKtkEaSZF8KGborveUFXU909qK8wpE5zmtibalGkuexsjQxlaeOB
	 Yf2o+qduZO5DpAtgnxyENQ02kUjHXJGdaSW78jU6/dru7g/a6E2yW1O8vVPvALbFKi
	 WwlayqNp1lrww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/17] spi: spi-mem: add execute_tuning callback and
 spi_mem_execute_tuning()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717185116.2065505-6-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-6-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:03:38 +0000
Message-Id: <20260717190338.E66711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `spi_mem_execute_tuning()` invokes the hardware controller's tunin=
g callback without locking the SPI bus or acquiring runtime PM references.
- [Medium] `spi_mem_execute_tuning()` fails to check for GPIO Chip Select u=
sage, leading to hardware tuning without an asserted chip select.
--

--- Patch [5]: [PATCH v5 05/17] spi: spi-mem: add execute_tuning callback a=
nd spi_mem_execute_tuning() ---
commit 6a445325da668ad3d841d5bfb6bc2ba5a8bc4d99
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: add execute_tuning callback and spi_mem_execute_tuning()

Add an execute_tuning callback to struct spi_controller_mem_ops. The
callback receives a mandatory read op template and an optional write op
template. On success the controller sets op->max_freq in each provided
template to the validated clock rate.

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
> +	if (!ctlr->mem_ops || !ctlr->mem_ops->execute_tuning)
> +		return -EOPNOTSUPP;

[Severity: Medium]
Other spi-mem operations like spi_mem_exec_op() and spi_mem_poll_status()
verify that a GPIO chip select isn't being used by checking
!spi_get_csgpiod(mem->spi, 0) before delegating to hardware mem_ops.

Hardware sequencers typically only manage native chip selects. If a GPIO CS
is used, will this skip the check and attempt hardware tuning while the fla=
sh
device's chip select remains deasserted?

> +
> +	return ctlr->mem_ops->execute_tuning(mem, read_op, write_op);

[Severity: High]
Does this execute the hardware tuning callback without locking the SPI bus =
or
acquiring runtime PM references?

Other wrappers that invoke hardware controller callbacks directly (such as
spi_mem_exec_op() and spi_mem_poll_status()) are wrapped in
spi_mem_access_start() and spi_mem_access_end() to power up the hardware
and lock the bus against concurrent transfers.

Should spi_mem_access_start() be called here before execute_tuning()?

> +}
> +EXPORT_SYMBOL_GPL(spi_mem_execute_tuning);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D5
