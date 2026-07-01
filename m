Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937C48A2C2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910551; cv=none; b=B5XErR+QRTh165EVZxFyMNM+Ffud2SQG39pfk9nPqvBEsErPJQWlzFZFHLY5HBSIIjysBL0M3qM8Uu9V1sf1fmePHo6UpvTpgUIzFB7h5Co39MR15Z/MH5eoR/wwGb2XenF5feNJGbujGiZa16/x5R+jEynt+1aW+OFWDd4PlmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910551; c=relaxed/simple;
	bh=RKmgfYyPmjXUj8whEN9uP9lTy7zr30W/RRxnTv3SKsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eNXAhQT6SRqe0/upFDcR5eqp0roYVRbU5jZnhwsm4D5cSUEltaGa/2vL9/V8plpyPrmGkf5AIBzuKUFdaNLsDPZDSq0rg76ZC6HvXj3GTr0crD1U1Ii0kuPDjvg71nMU/b/Sn0khtVa0hMxyOsPcHPxVVqBcaa+W6hetup6r/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+nqNnyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+nqNnyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021471F00A3E;
	Wed,  1 Jul 2026 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782910549;
	bh=ZWY3SRNTumOES75pwRqf9iGq2fldhm1EiABrgQN3OcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+nqNnyhhg2vOU8JasyXYq/pT9x7uvJx+NXBMi45SeDRljMj4YBbTKieuEQxJUEjA
	 dDTcjpH7x6LPFFpF/RugU7nt2JxjDJCO+2dOsGLPCXTwfPw0uQq8PjgVB3BSfqBqCN
	 aDB6Pohoy/9E2UQ87yqAKYZqtj38JNqZQC4iVL2BhkAvwzjqQ7XWPm1s2hrrSj1YaH
	 yEI1aRW1tTZr6UkpPSGiClPHACc1jubcvQL8wjotDChEoUEG1u1Am60pocd8gk5m3D
	 TL97bjSjzWgLRLr50GKl0Ca5molsuwbhrZyeGpZW+OphT+LWshvYkEh0wuD6hpklaC
	 Puexn1JMoOKww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260701122941.2149121-3-pavitrakumarm@vayavyalabs.com>
References: <20260701122941.2149121-1-pavitrakumarm@vayavyalabs.com>
 <20260701122941.2149121-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:55:48 +0000
Message-Id: <20260701125549.021471F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] Crypto engine worker thread deadlocks due to context exhaustion.
- [High] Use-After-Free during device teardown due to premature algorithm d=
eallocation.
- [High] Returning a negative error code from `do_one_request` stalls the c=
rypto engine indefinitely.
- [High] SM4-CMAC and SM4-XCBC skip software fallback initialization and fa=
lsely advertise `CRYPTO_ALG_OPTIONAL_KEY`, leading to kernel panic.
- [High] Incorrect teardown order in `spacc_crypto_remove` causes Use-After=
-Free during workqueue execution.
- [High] Global DMA pools break multi-device support, causing IOMMU faults =
and Use-After-Free.
- [High] Shared IRQ is not freed in `spacc_init_device` error paths, causin=
g a destroyed workqueue to execute.
- [High] Unbalanced semaphore release in `spacc_open` inflates context capa=
city and breaks bounds logic.
- [High] Concurrent lockless mutation of `spacc_crypto_ctx` during `setkey`=
 causes NULL pointer dereferences in active hardware requests.
- [High] `spacc_job_release` leaves a stale job mapping, causing delayed ha=
rdware responses to falsely execute the callback of unrelated requests.
- [High] Jobs are silently discarded if buffered queue processing encounter=
s a validation failure, permanently hanging the crypto engine.
- [Medium] Uninitialized memory read of `ctx->acb.new_handle` leading to ac=
tive job corruption.
- [Medium] Software fallback truncates data and returns false success upon =
scatterlist length mismatch.
--

commit 5c2742d7183ca1c1ee4b0693c617c98d1a483ad4
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
crypto: spacc - Add SPAcc ahash support

Add ahash support to SPAcc driver.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> --- a/drivers/crypto/dwc-spacc/spacc_ahash.c
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
[ ... ]
> +static int spacc_hash_init_dma(struct device *dev, struct ahash_request =
*req)
> +{
[ ... ]
> +err_free_dst:
> +	/*
> +	 * If the handle was already cloned (semaphore count and job slot
> +	 * taken) before this failure, release it.  Clone-failure paths
> +	 * leave new_handle < 0, so the guard skips them.
> +	 */
> +	if (ctx->acb.new_handle >=3D 0) {
> +		spacc_close(&priv->spacc, ctx->acb.new_handle);
> +		ctx->acb.new_handle =3D -1;
> +	}

[Severity: Medium]
Can ctx->acb.new_handle be read uninitialized in this error path?=20

If this function is called with req->nbytes > 0 but ctx->total_nents =3D=3D=
 0
due to a scatterlist mapping failure, both initialization branches are
skipped and the function jumps to err_free_dst. The uninitialized stack or
heap memory of ctx->acb.new_handle would then be evaluated, potentially
closing an unrelated active handle if it evaluates to >=3D 0.

[ ... ]
> +static int spacc_hash_setkey(struct crypto_ahash *tfm, const u8 *key,
[ ... ]
> +	if (tctx->handle >=3D 0) {
> +		spacc_close(&priv->spacc, tctx->handle);
> +		tctx->handle =3D -1;
> +	}
> +
> +	if (tctx->dev) {
> +		put_device(tctx->dev);
> +		tctx->dev =3D NULL;
> +	}
> +
> +	tctx->ctx_valid =3D false;
> +	tctx->dev =3D get_device(salg->dev);

[Severity: High]
Is it safe to modify tctx->dev and other context fields without
synchronization here?

The crypto API permits setkey to run concurrently with do_one_request on the
same tfm. If spacc_hash_do_one_request() reads tctx->dev to extract drvdata
at the exact moment it is set to NULL here, it could result in a NULL
pointer dereference.

[ ... ]
> +static int spacc_hash_do_one_request(struct crypto_engine *engine, void =
*areq)
> +{
[ ... ]
> +		/*
> +		 * Open the HW context here, not in setkey.  spacc_open()
> +		 * acquires ctx_sem which may sleep; do_one_request runs in
> +		 * the crypto_engine workqueue which is a sleepable context,
> +		 * so this is safe.
> +		 */
> +		tctx->handle =3D spacc_open(&priv->spacc, CRYPTO_MODE_NULL,
> +				salg->mode->id, -1, 0,
> +				spacc_digest_cb, reqtfm);

[Severity: High]
Could this lead to a deadlock of the crypto engine worker thread?

When spacc_hash_do_one_request() calls spacc_open() with ctxid=3D-1, it
triggers down_interruptible(&spacc->ctx_sem). If userspace opens more tfm
instances than the hardware limit, the single engine worker thread will blo=
ck
indefinitely on this semaphore, completely stalling all crypto operations.

[ ... ]
> +	rc =3D spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
> +			&ctx->src, &ctx->dst, req->nbytes,
> +			0, req->nbytes, 0, 0, 0);
> +	if (rc < 0) {
> +		spacc_free_mems(ctx, tctx, req);
> +
> +		dma_pool_free(priv->hash_pool, ctx->digest_buf,
> +					ctx->digest_dma);
> +		pdu_ddt_free(&ctx->dst);
> +
> +		if (ctx->acb.new_handle >=3D 0) {
> +			spacc_close(&priv->spacc, ctx->acb.new_handle);
> +			ctx->acb.new_handle =3D -1;
> +		}
> +
> +		if (rc =3D=3D -EBUSY) {
> +			dev_dbg(salg->dev, "HW full, engine retry\n");
> +			return -ENOSPC;
> +		}
> +
> +		return rc;

[Severity: High]
Does returning an error directly here stall the crypto engine indefinitely?

Since the engine was initialized with retry_support =3D false, returning a
negative error code directly without calling crypto_finalize_hash_request()
will fail to clear engine->cur_req. The engine pump loop then permanently
aborts because engine->cur_req remains populated.

[ ... ]
> +fallback:
> +	kfree(tctx->tmp_sgl);
> +	tctx->tmp_sgl =3D NULL;
> +
> +	if (tctx->shash_fb) {
> +		SHASH_DESC_ON_STACK(desc, tctx->shash_fb);
> +
> +		desc->tfm =3D tctx->shash_fb;
> +
> +		rc =3D crypto_shash_init(desc);
> +		if (!rc) {
> +			struct sg_mapping_iter miter;
> +			unsigned int remaining =3D req->nbytes;
> +
> +			sg_miter_start(&miter, req->src,
> +				       sg_nents_for_len(req->src, req->nbytes),
> +				       SG_MITER_ATOMIC | SG_MITER_FROM_SG);

[Severity: Medium]
How does this handle a mismatch in scatterlist lengths?=20

If req->nbytes exceeds the actual sum of the scatterlist lengths,
sg_nents_for_len() returns -EINVAL. This negative error code is implicitly
cast to an unsigned integer in sg_miter_start(), causing the miter to
iterate to the end of the available data and the software fallback to
falsely return success for a partial MAC.

[ ... ]
> +static int spacc_hash_init_tfm(struct crypto_ahash *tfm)
> +{
[ ... ]
> +	if (salg->mode->id =3D=3D CRYPTO_MODE_MAC_CMAC ||
> +	    salg->mode->id =3D=3D CRYPTO_MODE_MAC_XCBC) {
> +		tctx->shash_fb =3D crypto_alloc_shash(
> +				salg->alg.hash.base.halg.base.cra_name, 0, 0);

[Severity: High]
Do SM4-CMAC and SM4-XCBC properly initialize their software fallbacks?

This condition only checks for AES MACs, meaning spacc_hash_init_tfm() does
not allocate tctx->shash_fb for SM4 MACs. If an unkeyed MAC is requested,
it falls back to the generic HASH_FBREQ_ON_STACK. Because the fallback TFM =
is
NULL, this triggers a guaranteed NULL pointer dereference.

[ ... ]
> +static int spacc_register_hash(struct spacc_alg *salg)
> +{
[ ... ]
> +	if (salg->mode->id =3D=3D CRYPTO_MODE_MAC_CMAC ||
> +	    salg->mode->id =3D=3D CRYPTO_MODE_MAC_XCBC) {
> +		salg->alg.hash.base.halg.base.cra_flags =3D
> +			CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_ASYNC |
> +			CRYPTO_ALG_NO_FALLBACK;
> +	} else {
> +		salg->alg.hash.base.halg.base.cra_flags =3D
> +			CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_ASYNC |
> +			CRYPTO_ALG_OPTIONAL_KEY;
> +	}

[Severity: High]
Similar to the fallback allocation above, SM4 MACs fall into the else branch
here, falsely advertising CRYPTO_ALG_OPTIONAL_KEY despite requiring a key
and missing their software fallback initialization.

[ ... ]
> +int spacc_unregister_hash_algs(struct spacc_priv *priv)
> +{
[ ... ]
> +	list_for_each_entry_safe(salg, tmp, &priv->hash_alg_list, list) {
> +		crypto_engine_unregister_ahash(&salg->alg.hash);
> +		list_del(&salg->list);
> +		kfree(salg);
> +	}

[Severity: High]
Is it safe to unconditionally kfree(salg) here?

While crypto_engine_unregister_ahash() removes the algorithm from the
registry, any currently open TFMs will continue to retain a pointer to the
freed salg memory. This results in a use-after-free when the device unbinds.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> +int spacc_open(struct spacc_device *spacc, int enc, int hash, int ctxid,
> +	       int secure_mode, spacc_callback cb, void *cbdata)
> +{
[ ... ]
> +	if (ctxid =3D=3D -1) {
> +		if (down_interruptible(&spacc->ctx_sem)) {
> +			dev_dbg(spacc->dptr, "ERR: Interrupted by signal\n");
> +			return -ERESTARTSYS;
> +		}
> +	}
> +
> +	spin_lock_irqsave(&spacc->ctx_lock, flags);
> +	job_idx =3D spacc_job_request(spacc, ctxid);
> +
> +	if (job_idx < 0) {
> +		spin_unlock_irqrestore(&spacc->ctx_lock, flags);
> +		dev_dbg(spacc->dptr, "Failed to acquire context\n");
> +		ret =3D -EIO;
> +		goto err_release_sem;
> +	}
[ ... ]
> +err_release_job:
> +	spacc_job_release(spacc, job_idx);
> +err_release_sem:
> +	if (!ctx_reused)
> +		up(&spacc->ctx_sem);
> +
> +	return ret;
> +}

[Severity: High]
Can this error path result in an unbalanced semaphore release?

The spacc->ctx_sem semaphore is only acquired if ctxid =3D=3D -1, but the
err_release_sem path unconditionally calls up(&spacc->ctx_sem) since
ctx_reused defaults to false. This grants an extra phantom permit to the
semaphore, allowing concurrent callers to bypass context limits and access
out-of-bounds memory.

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> --- a/drivers/crypto/dwc-spacc/spacc_device.c
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
[ ... ]
> +static int spacc_init_device(struct platform_device *pdev)
> +{
[ ... ]
> +	irq_ret =3D devm_request_irq(&pdev->dev, irq_num, spacc_irq_handler,
> +			     IRQF_SHARED, dev_name(&pdev->dev),
> +			     &pdev->dev);
> +	if (irq_ret) {
> +		dev_err(&pdev->dev, "Failed to request IRQ : %d\n", irq_ret);
> +		err =3D irq_ret;
> +		goto free_spacc_workq;
> +	}
[ ... ]
> +	err =3D spacc_autodetect(&priv->spacc);
> +	if (err < 0) {
> +		spacc_irq_glbl_disable(&priv->spacc);
> +		goto free_spacc_workq;
> +	}
[ ... ]
> +free_spacc_workq:
> +	destroy_workqueue(priv->spacc_wq);
> +
> +free_engine:
> +	crypto_engine_exit(priv->engine);

[Severity: High]
Does the error path need to manually free the shared interrupt?

The interrupt is registered as IRQF_SHARED via devm, but if initialization
fails (e.g., during spacc_autodetect), the workqueue is destroyed while the
interrupt remains active until devres cleanup runs later. If another device
triggers the shared interrupt line in this window, the handler could try to
queue work to the destroyed workqueue.

[ ... ]
> +static void spacc_crypto_remove(struct platform_device *pdev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	spacc_irq_glbl_disable(&priv->spacc);
> +
> +	devm_free_irq(&pdev->dev, priv->irq, &pdev->dev);
> +
> +	spacc_unregister_algs(priv);
> +
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);
> +
> +	if (priv->spacc_wq)
> +		destroy_workqueue(priv->spacc_wq);
> +
> +	spacc_remove(pdev);
> +}

[Severity: High]
Is the teardown order correct here?

The driver calls spacc_unregister_algs() (which destroys priv->hash_pool)
before flushing and destroying priv->spacc_wq. If there are pending work
items in spacc_wq, spacc_pop_jobs() could run concurrently and attempt to
free memory from the already destroyed pool.

> diff --git a/drivers/crypto/dwc-spacc/spacc_hal.c b/drivers/crypto/dwc-sp=
acc/spacc_hal.c
> --- a/drivers/crypto/dwc-spacc/spacc_hal.c
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
[ ... ]
> +static struct dma_pool *ddt_pool, *ddt16_pool, *ddt4_pool;
> +static struct device *ddt_device;
> +
> +int pdu_mem_init(void *device)
> +{
> +	if (ddt_device)
> +		return 0; /* already setup */
> +
> +	/* max of 64 DDT entries */
> +	ddt_device =3D device;
> +	ddt_pool =3D dma_pool_create("spaccddt", device,
> +				   DDT_MAX_ENTRIES, 8, 0);

[Severity: High]
Could the use of global static variables for the DMA pools cause issues on
systems with multiple SPAcc engines?

If multiple instances probe, they will all share the pool allocated against
the first device's struct, which violates IOMMU isolation. Additionally, if
the first device is removed, it destroys the pool for all active instances,
leading to use-after-free crashes.

> diff --git a/drivers/crypto/dwc-spacc/spacc_manager.c b/drivers/crypto/dw=
c-spacc/spacc_manager.c
> --- a/drivers/crypto/dwc-spacc/spacc_manager.c
> +++ b/drivers/crypto/dwc-spacc/spacc_manager.c
[ ... ]
> +int spacc_job_release(struct spacc_device *spacc, int job_idx)
> +{
[ ... ]
> +	job	      =3D &spacc->job[job_idx];
> +	/* release context that goes with job */
> +	ret	      =3D spacc_ctx_release(spacc, job->ctx_idx);
> +	job->ctx_idx  =3D SPACC_CTX_IDX_UNUSED;
> +	job->job_used =3D SPACC_JOB_IDX_UNUSED;
> +	/* disable any callback */
> +	job->cb       =3D NULL;
> +
> +	/* NOTE: this leaves ctrl data in memory */
> +	spin_unlock_irqrestore(&spacc->lock, lock_flag);
> +
> +	return ret;
> +}

[Severity: High]
Should spacc->job_lookup be cleared for this swid during release?

If a request is software-aborted, the job slot is freed but the swid mapping
remains. When the hardware eventually completes the orphaned job, the IRQ
handler might read this stale mapping and fire the callback of a newly
allocated, completely unrelated request.

[ ... ]
> +int spacc_process_jb(struct spacc_device *spacc)
> +{
[ ... ]
> +		if (spacc->job_buffer[tail].active) {
> +			ret =3D spacc_packet_enqueue_ddt_ex
> +			      (spacc, 0, spacc->job_buffer[tail].job_idx,
> +			       spacc->job_buffer[tail].src,
> +			       spacc->job_buffer[tail].dst,
> +			       spacc->job_buffer[tail].proc_sz,
> +			       spacc->job_buffer[tail].aad_offset,
> +			       spacc->job_buffer[tail].pre_aad_sz,
> +			       spacc->job_buffer[tail].post_aad_sz,
> +			       spacc->job_buffer[tail].iv_offset,
> +			       spacc->job_buffer[tail].prio);
> +
> +			if (ret !=3D -EBUSY)
> +				spacc->job_buffer[tail].active =3D 0;
> +			else
> +				return -EBUSY;
> +		}

[Severity: High]
What happens to the pending request if spacc_packet_enqueue_ddt_ex() returns
an error other than -EBUSY (such as -EINVAL for LINEAR mode errors)?=20

By setting active to 0 and not invoking the job's callback, this silently
drops the request and leaves the crypto engine waiting forever.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122941.2149=
121-1-pavitrakumarm@vayavyalabs.com?part=3D2
