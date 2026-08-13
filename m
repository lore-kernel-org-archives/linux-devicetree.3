Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F000E3E49EC
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658342; cv=none; b=PUN/6bqTgV3lxJ/7fF4SaRkhNi75OSBuEPgLCN7vzgl/vJZ6mNXol/nBAvcCBLJbynFVaNyvhuHVGM77Xxt74ZAonWmG+KDNUC9G4c2yvpncLMl+PkyAT4PMsxgK3e684TbHxpb7pGk0RFf/JGFxdFgIppeC3INzxwL0U8IVlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658342; c=relaxed/simple;
	bh=lNaor0Vn0YjFwHLxAggedabxFXdRJOtNMc1NjBISB1Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=grSnvUad8B1T/Fd/6CoXpNBawD67TS05k6JRUPDaiNxY3nBloVW5F07F+gBbpzu9YifUgEVg38uZZs6L/IVVTjuxOmQnwsfVTHHu82Z+FqNmGEMatvixH0aS86IF3q1BzD46LpuSDlfg6ieMF1jCRFpNULaP8lJbtyJ1PzNIOXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpYUb7nd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpYUb7nd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CFE1F000E9;
	Thu, 13 Aug 2026 21:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786658340;
	bh=ddDwIeO1Dr9YR2BzaukHQUJMxfykQsV+0iX8ayPSFK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mpYUb7ndzbYS0EmOpEQw19TJXJ7CmueSNAyWU4FLRAuUp0Uryn3WMoyEVjd8r3FQq
	 h075aEhnL0IfP6p4205sa4Ey+jD7PBiAwjmSIAI+XxrjIjnZa7lqn9R5eowF02Xe7Q
	 vYnDtFGXtNfapsvux38IRaKQmscI8J5Y00nnTTj5YTbe/zDWv9yUGYI1nD1jsPNECi
	 8kmgZ9rhMugcjGsMkAGIL5hIiciqSTL2b55cdF02+GRMYhAjDttwM7+BdAs0Nc+lbJ
	 XjhVcgv8cCFoUuqFuzRDdFB4XiOn2ud8HhBBO0WfUfH4hoHVM8gB+xjckMN5XtmZWS
	 VTV7iFXmgE4Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260318071808.817074-3-pavitrakumarm@vayavyalabs.com>
References: <20260318071808.817074-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 21:58:59 +0000
Message-Id: <20260813215900.58CFE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 17 potential issue=
(s) to consider:
- [Critical] Heap buffer overflow when setting keys for CMAC and SHA3 algor=
ithms.
- [High] The error path in spacc_ctx_clone_handle frees uninitialized memor=
y and triggers double-frees of DMA buffers in spacc_hash_init_dma.
- [High] Multi-segment scatterlists are silently truncated on hardware requ=
iring linear buffers.
- [High] Software fallback TFM is never allocated, causing a kernel panic o=
n hash operations.
- [High] spacc->ctx_sem is double-incremented when a context is closed, bre=
aking accounting and allowing unbounded allocations.
- [High] wait_event_interruptible error path aborts tracking but fails to h=
alt in-flight hardware DMA in spacc_compute_xcbc_key.
- [High] Failing probe inside spacc_crypto_probe leaves major resources lea=
ked (memory, DMA pools, workqueues).
- [High] Asynchronous teardown symmetry is violated between workqueue/memor=
y cleanup and devm-managed IRQ lifecycle.
- [High] 16-byte slab out-of-bounds write in hash export and import functio=
ns.
- [Medium] tctx->tmp_sgl is leaked when hardware job enqueueing fails and t=
he crypto engine retries the request.
- [Medium] Hardware handles and device references are leaked during error p=
aths in spacc_hash_init_dma and spacc_hash_do_one_request.
- [Medium] spacc_hash_cleanup_dma unconditionally unmaps req->src, failing =
to handle zero-length requests that use tctx->tmp_sgl.
- [Medium] do_shash mixes goto-based error handling with scope-based __free=
(kfree) cleanup declarations.
- [Medium] Stack out-of-bounds read during XOF string size autodetection.
- [Medium] Global DMA pool pointer is overwritten and globally destroyed, b=
reaking multi-device support.
- [Medium] Unaligned memory access in context read/write functions.
- [Medium] Re-initializing an already initialized spinlock via init_waitque=
ue_head.
--

--- Patch [2]: [PATCH v11 2/4] crypto: spacc - Add SPAcc ahash support ---
commit 6d2638eacfe650dd652f8987389e3aa213991b55
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: crypto: spacc - Add SPAcc ahash support

Add ahash support to SPAcc driver.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
[ ... ]
> +static void spacc_hash_cleanup_dma(struct device *dev,
> +				   struct ahash_request *req)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +
> +	dma_unmap_sg(dev, req->src, ctx->src_nents, DMA_TO_DEVICE);
> +	pdu_ddt_free(&ctx->src);

[Severity: Medium]
For zero-length requests, spacc_hash_init_dma() maps tctx->tmp_sgl instead
of req->src. However, this cleanup function unconditionally unmaps req->src.
Could this result in an invalid DMA unmap and a leak of the mapped
tctx->tmp_sgl on error?

[ ... ]
> +static int spacc_ctx_clone_handle(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +	struct spacc_priv *priv =3D dev_get_drvdata(tctx->dev);
> +
> +	if (tctx->handle < 0)
> +		return -EINVAL;
> +
> +	ctx->acb.new_handle =3D spacc_clone_handle(&priv->spacc, tctx->handle,
> +						 &ctx->acb);
> +
> +	if (ctx->acb.new_handle < 0) {
> +		spacc_hash_cleanup_dma(tctx->dev, req);
> +		return -ENOMEM;
> +	}

[Severity: High]
If spacc_clone_handle() fails here, spacc_hash_cleanup_dma() is called,
which unmaps and frees ctx->src before it has been initialized by
spacc_sg_to_ddt(). Furthermore, returning an error causes the caller
spacc_hash_init_dma() to jump to err_free_dst, which frees ctx->dst and
ctx->digest_buf a second time. Could this lead to double-frees and
uninitialized memory access when under memory pressure?

[ ... ]
> +static int spacc_hash_init_dma(struct device *dev, struct ahash_request =
*req)
> +{
[ ... ]
> +	} else if (ctx->total_nents =3D=3D 0 && req->nbytes =3D=3D 0) {
> +		rc =3D spacc_ctx_clone_handle(req);
> +		if (rc < 0)
> +			goto err_free_dst;
> +
> +		/* zero length case */
> +		memset(tctx->tmp_buffer, '\0', PPP_BUF_SIZE);
> +		sg_set_buf(&tctx->tmp_sgl[0], tctx->tmp_buffer, PPP_BUF_SIZE);
> +		rc =3D spacc_sg_to_ddt(dev, &tctx->tmp_sgl[0],
> +				     tctx->tmp_sgl[0].length,
> +				     &ctx->src, DMA_TO_DEVICE);
> +	}
> +
> +	if (rc < 0)
> +		goto err_free_dst;

[Severity: Medium]
If spacc_sg_to_ddt() fails for the zero-length case, it jumps to
err_free_dst without closing the cloned handle acquired just above.
Does this cause a resource leak of the hardware handle?

[ ... ]
> +static int do_shash(struct device *dev, unsigned char *name,
> +		    unsigned char *result, const u8 *data1,
> +		    unsigned int data1_len)
> +{
> +	int rc =3D 0;
> +	unsigned int size;
> +	struct sdesc *sdesc __free(kfree) =3D NULL;
> +	struct crypto_shash *hash;
[ ... ]
> +do_shash_err:
> +	crypto_free_shash(hash);
> +
> +	return rc;
> +}

[Severity: Medium]
This function uses the scope-based __free(kfree) macro for sdesc, but also
utilizes a goto label (do_shash_err) to clean up the crypto_shash instance.
The kernel cleanup guidelines explicitly state that goto and scope-based
cleanup should never be mixed in the same function to avoid ownership and
double-free issues during refactoring. Should this be converted to use only
one cleanup style?

[ ... ]
> +static int spacc_hash_setkey(struct crypto_ahash *tfm, const u8 *key,
> +		unsigned int keylen)
> +{
[ ... ]
> +	if (keylen > block_size && salg->mode->id !=3D CRYPTO_MODE_MAC_CMAC) {
[ ... ]
> +	} else {
> +		memcpy(tctx->ipad, key, keylen);
> +		tctx->ctx_valid =3D false;
> +	}

[Severity: Critical]
The size check here explicitly excludes MAC_CMAC, and for SHA3-224 the
block size is 144 bytes, which is larger than the fixed 128-byte tctx->ipad
buffer. If a user sets a key larger than 128 bytes for these algorithms via
the AF_ALG socket API, will this memcpy overflow the tctx->ipad buffer and
corrupt adjacent slab memory?

> +
> +	/*
> +	 * Save the processed key length so that do_one_request can
> +	 * write the key context to HW later if setkey couldn't
> +	 * acquire a HW context now (e.g., all contexts busy).
> +	 */
> +	tctx->keylen =3D keylen;
> +
> +	/* close handle since key size may have changed */
> +	if (tctx->handle >=3D 0) {
> +		spacc_close(&priv->spacc, tctx->handle);
> +		put_device(tctx->dev);
> +		tctx->handle =3D -1;
> +		tctx->dev =3D NULL;
> +	}
> +
> +	/* reset priv */
> +	priv =3D NULL;
> +	priv =3D dev_get_drvdata(salg->dev);
> +	tctx->dev =3D get_device(salg->dev);

[Severity: Medium]
Here tctx->dev is overwritten with get_device(). If tctx->handle was
previously < 0, the previous device reference is never put.
Does this cause a reference leak on the device?

[ ... ]
> +static int spacc_hash_do_one_request(struct crypto_engine *engine, void =
*areq)
> +{
[ ... ]
> +	if (tctx->handle < 0 || !tctx->ctx_valid) {
> +		priv =3D dev_get_drvdata(salg->dev);
> +		tctx->dev =3D get_device(salg->dev);

[Severity: Medium]
Similar to spacc_hash_setkey(), this overwrites tctx->dev with get_device()
without dropping the previous reference. Is this another device reference
leak?

[ ... ]
> +	rc =3D spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
> +			&ctx->src, &ctx->dst, req->nbytes,
> +			0, req->nbytes, 0, 0, 0);
> +	if (rc < 0) {
> +		spacc_hash_cleanup_dma(tctx->dev, req);
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
> +
> +	}

[Severity: Medium]
If spacc_packet_enqueue_ddt() returns -EBUSY, the engine returns -ENOSPC to
trigger a retry. However, tctx->tmp_sgl is not freed before returning.
Since a retry will reallocate tctx->tmp_sgl at the beginning of this
function, does this leak the previous array?

[ ... ]
> +static int spacc_hash_init_tfm(struct crypto_ahash *tfm)
> +{
> +	const struct spacc_alg *salg =3D container_of(crypto_ahash_alg(tfm),
> +						    struct spacc_alg,
> +						    alg.hash.base);
> +	struct spacc_crypto_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +
> +	tctx->handle    =3D -1;
> +	tctx->ctx_valid =3D false;
> +	tctx->dev       =3D get_device(salg->dev);
> +
> +	return 0;
> +}

[Severity: High]
The driver implements fallback operations (e.g., using HASH_FBREQ_ON_STACK
in spacc_hash_init), but spacc_hash_init_tfm() never allocates the fallback
TFM (tctx->fb.hash) via crypto_alloc_ahash(). Does this result in a NULL
pointer dereference when a hardware fallback path or piecewise hash
operation is triggered?

[ ... ]
> +static int spacc_hash_export(struct ahash_request *req, void *out)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +
> +	memcpy(out, ctx->state_buffer, sizeof(ctx->state_buffer));
> +	return 0;
> +}

[Severity: High]
The algorithm registers its state size as HASH_MAX_STATESIZE, but the
export and import functions copy sizeof(ctx->state_buffer) bytes, which is
defined as HASH_MAX_STATESIZE + 16. Will this cause a 16-byte slab
out-of-bounds read/write when state is exported or imported, potentially
corrupting adjacent objects?

[ ... ]
> +int spacc_probe_hashes(struct platform_device *spacc_pdev)
> +{
[ ... ]
> +	spacc_hash_pool =3D dma_pool_create("spacc-digest", &spacc_pdev->dev,
> +					  SPACC_MAX_DIGEST_SIZE,
> +					  SPACC_DMA_ALIGN, SPACC_DMA_BOUNDARY);

[Severity: Medium]
The dma_pool spacc_hash_pool is stored as a global static pointer. If
multiple SPAcc devices are probed on a system, this will overwrite the
pointer and leak the previous pool. Additionally, unbinding one device will
destroy the pool globally for all remaining active devices. Should this pool
be stored in the per-device context instead?

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> +int spacc_packet_enqueue_ddt_ex(struct spacc_device *spacc, int use_jb,
> +				int job_idx, struct pdu_ddt *src_ddt,
> +				struct pdu_ddt *dst_ddt, u32 proc_sz,
> +				u32 aad_offset, u32 pre_aad_sz,
> +				u32 post_aad_sz, u32 iv_offset,
> +				u32 prio)
> +{
[ ... ]
> +	if (spacc->config.dma_type =3D=3D SPACC_DMA_DDT) {
> +		pdu_io_cached_write(spacc->dptr, spacc->regmap +
> +				    SPACC_REG_SRC_PTR, (uint32_t)src_ddt->phys,
> +				    &spacc->cache.src_ptr);
> +		pdu_io_cached_write(spacc->dptr, spacc->regmap +
> +				    SPACC_REG_DST_PTR, (uint32_t)dst_ddt->phys,
> +				    &spacc->cache.dst_ptr);
> +	} else if (spacc->config.dma_type =3D=3D SPACC_DMA_LINEAR) {
> +		pdu_io_cached_write(spacc->dptr, spacc->regmap +
> +				    SPACC_REG_SRC_PTR,
> +				    (uint32_t)src_ddt->virt[0],
> +				    &spacc->cache.src_ptr);
> +		pdu_io_cached_write(spacc->dptr, spacc->regmap +
> +				    SPACC_REG_DST_PTR,
> +				    (uint32_t)dst_ddt->virt[0],
> +				    &spacc->cache.dst_ptr);
> +	} else
> +		return -EIO;

[Severity: High]
When processing a multi-segment scatterlist on hardware configured for
SPACC_DMA_LINEAR, this writes only the physical address of the first
scatterlist segment to the hardware, but passes the total logical length.
Will this cause the hardware to read past the end of the first physical
page, leading to out-of-bounds physical memory access?

[ ... ]
> +/* releases a crypto context back into appropriate module's pool */
> +int spacc_close(struct spacc_device *dev, int handle)
> +{
> +	int ret;
> +	int ref_cnt_before =3D 0;
> +	unsigned long flags;
> +
> +	if (handle < 0 || handle >=3D SPACC_MAX_JOBS)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&dev->ctx_lock, flags);
> +
> +	if (dev->job[handle].ctx_idx !=3D SPACC_CTX_IDX_UNUSED &&
> +	    dev->job[handle].ctx_idx < dev->config.num_ctx)
> +		ref_cnt_before =3D dev->ctx[dev->job[handle].ctx_idx].ref_cnt;
> +
> +	spin_unlock_irqrestore(&dev->ctx_lock, flags);
> +
> +	ret =3D spacc_job_release(dev, handle);
> +
> +	if (ref_cnt_before =3D=3D 1)
> +		up(&dev->ctx_sem);
> +
> +	return ret;
> +}

[Severity: High]
When a context is released and its reference count hits zero, the internal
call to spacc_ctx_release() already increments the semaphore
spacc->ctx_sem. However, spacc_close() also explicitly increments the
semaphore if ref_cnt_before =3D=3D 1. Will this double-increment the semaph=
ore,
breaking the context accounting and allowing unbounded allocations?

[ ... ]
> +static int spacc_xof_stringsize_autodetect(struct spacc_device *spacc)
> +{
[ ... ]
> +	unsigned char buf[256];
[ ... ]
> +			/* clear buf and then insert test string */
> +			memset(buf, 0, sizeof(buf));
> +			memcpy(buf, test_str, sizeof(test_str));
> +			memcpy(buf + (buflen >> 1), test_str, sizeof(test_str));
> +
> +			/* write key context */
> +			pdu_to_dev_s(spacc->regmap + SPACC_CTX_HASH_KEY, buf,
> +				     spacc->config.hash_page_size >> 2,
> +				     spacc->config.big_endian);

[Severity: Medium]
The stack buffer buf is sized at exactly 256 bytes. However,
pdu_to_dev_s() reads spacc->config.hash_page_size bytes from it. If the
hardware reports a hash context page size larger than 256 bytes, will this
perform a stack out-of-bounds read and leak adjacent stack memory to the
hardware device?

[ ... ]
> +int spacc_compute_xcbc_key(struct spacc_device *spacc, int mode_id,
> +			   int job_idx, const unsigned char *key,
> +			   int keylen, unsigned char *xcbc_out)
> +{
[ ... ]
> +	spacc_set_operation(spacc, handle, OP_ENCRYPT, 0, 0, 0, 0, 0);
> +	job =3D &spacc->job[handle];
> +	init_waitqueue_head(&job->waitq);

[Severity: Medium]
The job waitqueue is globally initialized in spacc_job_init_all(). However,
spacc_compute_xcbc_key() unconditionally re-initializes it via
init_waitqueue_head() every time it runs. Could this trigger lockdep
warnings or corrupt the waitqueue if there were any preexisting waiters?

[ ... ]
> +		/*
> +		 * Do the 48 bytes as a single SPAcc job this is the ideal case
> +		 * but only possible if ECB was enabled in the core
> +		 */
> +		spacc_write_context(spacc, handle, SPACC_CRYPTO_OPERATION,
> +				    key, keylen, iv, 16);
> +		err =3D spacc_packet_enqueue_ddt(spacc, handle, &ddt, &ddt, 48,
> +					       0, 0, 0, 0, 0);
> +		if (err !=3D 0)
> +			goto xcbc_err;
> +
> +		wait_event_interruptible(job->waitq, job->job_done);
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +
> +		if (err !=3D 0)
> +			goto xcbc_err;
> +	}

[Severity: High]
If wait_event_interruptible() is interrupted by a signal, it returns an
error and the code jumps to xcbc_err, where the DMA buffer and descriptor
are freed. However, since the hardware engine is still processing the job,
will it write the result to the freed physical memory when it finishes,
causing a use-after-free and memory corruption?

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
[ ... ]
> +static int spacc_crypto_probe(struct platform_device *pdev)
> +{
> +	int rc =3D 0;
> +
> +	rc =3D spacc_init_device(pdev);
> +	if (rc < 0)
> +		goto err;
> +
> +#if IS_ENABLED(CONFIG_CRYPTO_DEV_SPACC_HASH)
> +	rc =3D spacc_probe_hashes(pdev);
> +	if (rc < 0)
> +		goto err;
> +#endif
> +
> +	return 0;
> +err:
> +	spacc_unregister_algs();
> +
> +	return rc;
> +}

[Severity: High]
If spacc_probe_hashes() fails during driver initialization, the error
handling jumps to err and only unregisters algorithms. It skips invoking
the necessary teardown functions like spacc_remove() and pdu_mem_deinit().
Does this leave major resources such as memory, DMA pools, and workqueues
permanently leaked?

[ ... ]
> +static void spacc_crypto_remove(struct platform_device *pdev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);
> +
> +	if (priv->spacc_wq)
> +		destroy_workqueue(priv->spacc_wq);
> +
> +	spacc_unregister_algs();
> +	spacc_remove(pdev);
> +}

[Severity: High]
The IRQ is requested using devm_request_irq() during probe, meaning it
remains active until after spacc_crypto_remove() completes. However,
spacc_crypto_remove() destroys the workqueue and frees memory without
disabling the hardware interrupts. If an interrupt fires before the devres
cleanup disables it, could it access the freed spacc->job array and the
destroyed workqueue, causing a use-after-free crash?

> diff --git a/drivers/crypto/dwc-spacc/spacc_hal.c b/drivers/crypto/dwc-sp=
acc/spacc_hal.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
[ ... ]
> +static void pdu_to_dev_little(void __iomem *addr_, const unsigned char *=
src,
> +			      unsigned long nword)
> +{
> +	u32 __iomem *addr =3D addr_;
> +	u32 data;
> +	__le32 val;
> +
> +	while (nword--) {
> +		data =3D *((u32 *)src);
> +		val =3D __cpu_to_le32(data);
> +
> +		__raw_writel((u32 __force)val, addr);
> +		src +=3D 4;
> +		addr++;
> +	}
> +}

[Severity: Medium]
In spacc_manager.c:spacc_write_context(), a 300-byte character array buf
is allocated on the stack, giving it 1-byte alignment. It is then passed to
pdu_to_dev_s() and subsequently pdu_to_dev_little() here, which casts it
to a u32 pointer and dereferences it. Can this cause unaligned memory
access exceptions on architectures with strict alignment requirements?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260318071808.8170=
74-1-pavitrakumarm@vayavyalabs.com?part=3D2
