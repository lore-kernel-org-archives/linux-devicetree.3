Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5637EFE2
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906110; cv=none; b=DSGby27oJX13iBwBvTJSbAjmylFYJzGblpFrNrYG9Jssa0DDd3hf2XX3EkyyYpbsKx+YKxI+qGBndPkHg8/NZ6Z+6eZJqtxYvj0Fjn+4NxWabNOZxbZ/QRN1CDZUveijv6buR7B+QJFqUbJZkc7wiSRWgrRefROM04sLkfzUeiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906110; c=relaxed/simple;
	bh=R6LBYXLP9FtU+kKnyp2OIHmCYqNG0Sshcjm+LD0dhtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CRfbnMJnsc4ZhY3p6KmocVAB8zsCKv1suCIjs7U12YnnYqTED/2vr8pmRnM7HGxFuEj0AzzlVUTdGIPoAUtuRxLBoq3HJw77oz5hC8Vc6gTlFcnaz2zF7faXCjjim3SyDEEBF3dRyQvxZh4cx5KG+PDGC/oBqRiGpQ82LinokwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrgVDzlW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrgVDzlW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04B61F000E9;
	Wed, 27 May 2026 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779906108;
	bh=T2FHLdua62TyY6oO57rXl5eRVOwtH2YqAStv3OO/a5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TrgVDzlW0LMZYkSd7/ODD9iVlSgTRG5IZZxM2/y5QAbfp4/+B35TsLwTLCxJcAX/I
	 FxXyzqG5cA5F8mAWpIjGaDIlgjA3GWgxWqoXPnhxBn4n1sNI3VFV0aLVoHOm6w70fj
	 EavlZ1L8lq/FLDvtVaHSlA8JwMUhIJjIBkZq6mR3B9vOJno3J13pFV19T8p83oerYz
	 70f540gnXlQTxokvWgsmHsrgwtafKuqLkjQtUqgUF/DMxogtCuZtPVBRleHOarV+Nh
	 kGbwpl8IUGUQHm8hfkwD7qXOm0N55kkHr10aAnK2IJiR7hexhf1focrI+CJWunAW8I
	 LDy7NvG68TjkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/13] spi: spi-mem: add execute_tuning callback and
 spi_mem_execute_tuning()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527175527.2247679-6-s-k6@ti.com>
References: <20260527175527.2247679-6-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 18:21:48 +0000
Message-Id: <20260527182148.B04B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi_mem_execute_tuning() invokes the controller's execute_tuning c=
allback without acquiring the SPI bus locks or waking the controller via Ru=
ntime PM.
--

commit 28d3375f6987174df306c004335ad6005919c344
Author: Santhosh Kumar K <s-k6@ti.com>

spi: spi-mem: add execute_tuning callback and spi_mem_execute_tuning()

This commit adds a new execute_tuning callback to spi_controller_mem_ops
and a corresponding spi_mem_execute_tuning() wrapper to allow drivers to
trigger tuning procedures for high-speed SPI memory operations.

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 37d10c4e614b2..98339ac8dafa2 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c

[ ... ]

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
> +
> +	return ctlr->mem_ops->execute_tuning(mem, read_op, write_op);

[Severity: High]
Does this code safely access the controller hardware without holding the SPI
bus locks or waking the controller via Runtime PM?

In the spi-mem subsystem, operations that interact directly with controller
hardware via ctlr->mem_ops typically must be wrapped with
spi_mem_access_start() and spi_mem_access_end(). These wrappers ensure
mutual exclusion by acquiring bus_lock_mutex and io_mutex, and power on the
controller via pm_runtime_resume_and_get().

Since spi_mem_execute_tuning() bypasses these wrappers, could the
controller's execute_tuning callback perform direct register accesses
without holding the bus locks? This might allow concurrent SPI operations to
other devices on the same bus to interfere.=20

Additionally, if tuning is executed outside of the initial device probe
context, could the controller be runtime-suspended, causing external aborts
or crashes when its registers are accessed?

It appears there might be a deeper architectural conflict here. If
spi_mem_execute_tuning() were to correctly acquire the locks, and a
controller's execute_tuning implementation called spi_mem_exec_op()
internally, wouldn't that attempt to acquire the same non-recursive mutexes
and cause a deadlock?

> +}
> +EXPORT_SYMBOL_GPL(spi_mem_execute_tuning);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527175527.2247=
679-1-s-k6@ti.com?part=3D5
