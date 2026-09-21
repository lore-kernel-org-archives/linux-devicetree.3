Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B993C4563
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992296; cv=none; b=XAqypWccj0ILqx9Jv0bmP+1eVIc30q1HQPXA1rbvW2P732L2eprfrkwKMczvGNFnhYzILqngW5Ym28cM55fKk02/WMrsSO4rzDXZKw2F87cRkkTZCXzISIXsnNa8SxH1UoiFFElXQUHxbR8uNyZmnjyPcUbk1dr9MfSGH5LBDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992296; c=relaxed/simple;
	bh=jyDq/LajI+O0htZIfAAJrzFu5G1PQzowW4gHIoaqlRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B9yEEMjV4nu0/m1GtMGSAK7Bb1JUIxu7KdkBAorqq3j/4r+Fxs/8al4ERqcTUSwzIDqllXtQji+YrlFf97/FzNzpVA++ZxKBa28pNeNPAZLzPv/Q7+5qZdYaepczzvZ4ABoajexqkg35RG28kM6sDve7u4Cnu3Z8glVfUdVAf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5tlOzEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5tlOzEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2FA1F000FF;
	Mon, 21 Sep 2026 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992294;
	bh=kV33mtonalRHII7VC/9UYxSBKGobKE6Cu531+2My1hU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f5tlOzEp7V1Se5G3cQhB03CICfXF+QYGcBsOrzHDt8Ai7ysDw2qm2ivtPbQbruhfM
	 Med+mvYz6hwMl6ak9OkDm4r+jFiKdi1fhQxFkgyV3i7aP4cq7etoH4xSNwT8u2McZK
	 0inpGsaQYnuGsFJHgy0v3l5SbC3owXi6wNLnMhKx8wovsSgz+IQ6Kq0fDvXwjM/Poh
	 jtXReOyIuvUBc+IyvON6Qi40QsfX+/Pls6vRe4wqszRkOoy4wMhYD0ZPK8mw/Q+9Ap
	 PVHrrqxR1jBm21pMp2URKUbGLcs5VZoA9fuiv7BuiBHoDtFqIUN8+o6+fy1+fNKDK0
	 VNI4IMVj/IUeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] optee: Add support for arm,ffa-lend-pool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260921110050.3977591-7-vdonnefort@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <20260921110050.3977591-7-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 12:04:54 +0000
Message-Id: <20260921120454.7E2FA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] tee: optee: premature lend pool detachment prevents direct map res=
tore
--

commit 4b4b22cda5d128d440dc2543a21dd2f20cdf757f
Author: Vincent Donnefort <vdonnefort@google.com>

optee: Add support for arm,ffa-lend-pool
   =20
Hook OP-TEE dynamically allocated protected memory pools to the
"arm,ffa-lend-pool" driver. While the SMC transport platform device
resolves the pool through its DT "memory-region" property, the FF-A
transport lacks a device tree node and binds via ffa_lend_pool_attach().

> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index a52c1f498b996..39f315cea830d 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -201,6 +201,12 @@ void optee_remove_common(struct optee *optee)
>  	/* Unregister OP-TEE specific client devices on TEE bus */
>  	optee_unregister_devices();
> =20
> +	/*
> +	 * Must follow optee_unregister_devices(). Clients require the lend pool
> +	 * linkage to successfully free their memory.
> +	 */
> +	optee_lend_pool_unregister(optee);
> +
>  	optee_notif_uninit(optee);
>  	optee_shm_arg_cache_uninit(optee);
>  	teedev_close_context(optee->ctx);

[Severity: High]
Does detaching the lend pool here before tee_device_unregister() risk
leaving CMA pages unmapped?

If a user-space process holds a DMA buffer open during driver unbind,
tee_device_unregister() (called shortly after this) will block waiting for
the teedev refcount to drop to zero.

When the user-space process finally closes the buffer, release_dyn_protmem()
will invoke optee_lend_pool_reclaimed() to restore the direct map.

If optee_lend_pool_unregister() has already detached the pool, will the
direct map restore fail? This could cause the CMA pages to be returned to
the allocator unmapped, leading to a fatal synchronous data abort when the
kernel later accesses them.

[ ... ]

> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index 633715b98625c..e979dbc9a5475 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -1172,6 +1180,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_d=
ev)
> =20
>  err_unregister_devices:
>  	optee_unregister_devices();
> +	optee_lend_pool_unregister(optee);
>  	if (optee->ffa.bottom_half_value !=3D U32_MAX)
>  		notif_ops->notify_relinquish(ffa_dev,

[Severity: High]
Does this error path in optee_ffa_probe() have the same issue with premature
detachment?=20

It seems optee_lend_pool_unregister() runs before err_unreg_teedev calls
tee_device_unregister(). If a DMA allocation was active during a probe
failure, the delayed cleanup might fail to restore the direct map.

[ ... ]

> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index b8a2bdac3208f..e46eb881cf903 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1932,6 +1942,7 @@ static int optee_probe(struct platform_device *pdev)
>  		optee_disable_shm_cache(optee);
>  	optee_smc_notif_uninit_irq(optee);
>  	optee_unregister_devices();
> +	optee_lend_pool_unregister(optee);
>  err_notif_uninit:
>  	optee_notif_uninit(optee);
>  err_close_ctx:

[Severity: High]
Does this error path in optee_probe() also detach the pool before
tee_device_unregister() ensures DMA buffers are closed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921110050.3977=
591-1-vdonnefort@google.com?part=3D6
