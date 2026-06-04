Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507FE4A33E5
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593165; cv=none; b=gl/68g0z8TKXZVEfKqpwzZIq7q53sHqr0edR//eWGPSvsegbI8IWZ3BsUVkLUgxpP2NHD20IbD9c0z4MDr1+STCbZwQnr3zAc2hl3XB/+ULLclzxRNsHblg/WfS32UjeRohEWgl4mWYJ6o1DseN8BHQqaMe/YRQ3fxRn2ssoL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593165; c=relaxed/simple;
	bh=9dDhcra1Y3ks+megxGTYhDLk3Mmzu/iuFGA+hFLHxQU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FIdQCzav83ha2rjYkMGWsDSpgcpGcAIsWwvGWxRlOGnh5ST1g71bjhJKO8DkjioGfHEAp/V5997BXe7iJrdreh8iiIhGvCmWOr4P0nzlbIBQU2VdcD3h1K2OvUBRnqwMGl/++Lrqcw03iFZHU3SrsnUbXMT3WM9UrPm5LNqDy4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt3lm6QE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt3lm6QE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACCD1F00893;
	Thu,  4 Jun 2026 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780593160;
	bh=gsB4rfjqTKq4/jB51ldEp1O2OR6T8T4GCh3ulJhS49o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zt3lm6QEFWex1X+b+OBkoOs6kI7wqZXhZmH4z8iDqsa7UV9wo2+vZYRtK85DZQSHj
	 TuCmTG1jCbRzto2eMrAb842JjHLBsZvtsZ4FIdzjUSRN/FcUnmt0yVIwtnaqZmNhVh
	 0YVWMWu4MNasmMkl35Rz5RRcmifURjr7lGEPbEn2sC9hoyDGp248C38x6s92aRh3HB
	 eYYTPfXcNWeL/wFLYdaSvYRIdmphhaTJzFf1+/F2VJ9XgpRQ4GuU3tNuBWA/Y4Ktdp
	 mBsjSC5K3zNvxM0syzQCXdv7yqB6lCTl6aJOKI5jttaYtnro9nGEF5Ys8pkSK3BqwZ
	 vTWeSU49hrSAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604165210.1141842-3-pavitrakumarm@vayavyalabs.com>
References: <20260604165210.1141842-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 17:12:40 +0000
Message-Id: <20260604171240.7ACCD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 20 potential issue=
(s) to consider:
- [Critical] Hardware DMA Use-After-Free and memory corruption via unguarde=
d `wait_event_interruptible`.
- [Critical] Hardware polling loop executes too quickly, leading to prematu=
re timeout and DMA memory corruption.
- [Critical] Copying of `wait_queue_head_t` breaks internal spinlocks and w=
aitqueue lists in `spacc_clone_handle`.
- [Critical] Destroying the workqueue in `spacc_crypto_remove` before disab=
ling interrupts creates a use-after-free window.
- [High] Double free of `ctx->dst` and `ctx->digest_buf` in `spacc_hash_ini=
t_dma` error path and uninitialized `ctx->src` unmap.
- [High] Software fallback hashes the entire lengths of scatterlist entries=
 rather than clamping to `req->nbytes`.
- [High] Incorrect DMA unmapping and memory leak of `tmp_sgl` on request en=
queue failure.
- [High] Non-cacheline-aligned fields embedded in the crypto context are ma=
pped for DMA, risking memory corruption.
- [High] Double `up()` on `ctx_sem` when releasing hardware contexts breaks=
 concurrency limits.
- [High] Incorrect module unload order leaves crypto engine vulnerable to u=
se-after-free.
- [High] Massive resource leak on probe failure due to missing cleanup in `=
spacc_crypto_probe`.
- [High] Use-After-Free of DMA pool during hash probe failure.
- [High] The driver uses a static global DMA pool, breaking multi-device is=
olation and causing crashes on removal.
- [High] AB-BA / Resource Deadlock in `spacc_compute_xcbc_key` due to `spac=
c_open` taking `ctx_sem` before reusing the context.
- [High] TOCTOU race on `ref_cnt` when releasing contexts via `spacc_close`.
- [High] Stack out-of-bounds read leading to information leak in `spacc_xof=
_stringsize_autodetect`.
- [High] Out-of-bounds memory accesses in `spacc_hash_export` and `spacc_ha=
sh_import`.
- [High] The linear DMA mode incorrectly handles fragmented scatterlists, l=
eading to silent memory corruption.
- [Medium] Undefined unaligned memory accesses when copying stack buffers t=
o device MMIO.
- [Medium] Device structure reference leak during key setting and request i=
nitialization.
--

commit 679c537a437ea5581e46701228d530d1fa314722
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: crypto: spacc - Add SPAcc ahash support

Add ahash support to SPAcc driver.
Below are the hash algos supported:
- cmac(aes)
- xcbc(aes)
- cmac(sm4)

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> index 0000000000000..a4a7776323606
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
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
Does this code introduce a double-free on the error path?

When spacc_ctx_clone_handle() fails, it calls spacc_hash_cleanup_dma() which
frees both ctx->digest_buf and ctx->dst. It then returns -ENOMEM to=20
spacc_hash_init_dma(), which branches to err_free_dst and err_free_digest,
freeing those same pointers a second time and corrupting the DMA pool.

Also, when this failure occurs, ctx->src is not yet mapped or initialized.
Will the cleanup function attempt to execute a bogus dma_unmap_sg() and
pdu_ddt_free() on uninitialized data?

[ ... ]
> +static int spacc_hash_setkey(struct crypto_ahash *tfm, const u8 *key,
> +		unsigned int keylen)
> +{
[ ... ]
> +	/* Invalidate any cached HW context =E2=80=94 key has changed. */
> +	if (tctx->handle >=3D 0) {
> +		spacc_close(&priv->spacc, tctx->handle);
> +		put_device(tctx->dev);
> +		tctx->handle =3D -1;
> +		tctx->dev =3D NULL;
> +	}
> +
> +	tctx->ctx_valid =3D false;
> +	tctx->dev =3D get_device(salg->dev);
> +
> +	return 0;
> +}

[Severity: Medium]
Will this leak the device structure reference when tctx->handle is less tha=
n 0?

In spacc_hash_init_tfm(), tctx->dev is initialized and tctx->handle is set
to -1. Later, in spacc_hash_setkey(), the driver only calls
put_device(tctx->dev) if tctx->handle >=3D 0. Because the handle is initial=
ly
negative, it skips the put_device() but unconditionally overwrites tctx->dev
with a newly acquired reference from get_device().

[ ... ]
> +static int spacc_hash_do_one_request(struct crypto_engine *engine, void =
*areq)
> +{
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

[Severity: High]
Does this error path incorrectly unmap DMA and leak memory?

For zero-length requests, spacc_hash_init_dma() allocates and maps
tctx->tmp_sgl. If spacc_packet_enqueue_ddt() fails, this error path calls
the generic spacc_hash_cleanup_dma(). That generic helper blindly unmaps
req->src rather than properly checking if tctx->tmp_sgl was the scatterlist
actually mapped.

This can result in unmapping an unmapped scatterlist, while permanently
leaking the actual DMA mapping. The error path also returns early without
freeing the array, permanently leaking the tctx->tmp_sgl allocation.

[ ... ]
> +static int spacc_hash_update(struct ahash_request *req)
> +{
[ ... ]
> +	if (tctx->shash_fb) {
> +		SHASH_DESC_ON_STACK(desc, tctx->shash_fb);
> +		struct sg_mapping_iter miter;
> +
> +		desc->tfm =3D tctx->shash_fb;
> +		rc =3D crypto_shash_import(desc, ctx->state_buffer);
> +		if (rc)
> +			goto out_shash;
> +
> +		sg_miter_start(&miter, req->src,
> +			       sg_nents_for_len(req->src, req->nbytes),
> +			       SG_MITER_ATOMIC | SG_MITER_FROM_SG);
> +		while (sg_miter_next(&miter)) {
> +			rc =3D crypto_shash_update(desc,
> +						miter.addr, miter.length);
> +			if (rc)
> +				break;
> +		}
> +		sg_miter_stop(&miter);

[Severity: High]
Does the software fallback improperly hash data outside the logical request?

The code iterates over the source scatterlist using sg_nents_for_len(). If
req->nbytes exceeds the total scatterlist length, sg_nents_for_len() returns
a negative error code, which is cast to a large unsigned integer by
sg_miter_start(), leading to massive out-of-bounds reads.

Even when successful, the loop unconditionally calls crypto_shash_update()
with the full miter.length of each chunk rather than tracking and clamping
to the remaining req->nbytes. This incorrectly hashes trailing out-of-bounds
bytes outside the logical request.

[ ... ]
> +static int spacc_hash_export(struct ahash_request *req, void *out)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +
> +	memcpy(out, ctx->state_buffer, sizeof(ctx->state_buffer));
> +	return 0;
> +}
> +
> +static int spacc_hash_import(struct ahash_request *req, const void *in)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +
> +	memcpy(ctx->state_buffer, in, sizeof(ctx->state_buffer));
> +	return 0;
> +}

[Severity: High]
Do these memcpy calls result in out-of-bounds accesses?

The algorithm's state size is explicitly set to HASH_MAX_STATESIZE during
registration. The crypto API bounds and allocates export buffers of exactly
this size.

However, the driver's export and import functions use
sizeof(ctx->state_buffer) as the length parameter. Because state_buffer
is defined internally as u8 state_buffer[HASH_MAX_STATESIZE+16], this
forcibly copies 16 bytes past the bounds of the API-provided buffers,
resulting in a heap buffer overflow on export and an out-of-bounds read
on import.

[ ... ]
> +int spacc_probe_hashes(struct platform_device *spacc_pdev)
> +{
[ ... ]
> +		/* Just check hardware support - no .valid flag needed */
> +		if (spacc_is_mode_keysize_supported(&priv->spacc,
> +				    possible_hashes[index].id & 0xFF,
> +				    possible_hashes[index].hashlen, 1)) {
> +			salg =3D kmalloc_obj(*salg, GFP_KERNEL);
> +			if (!salg) {
> +				rc =3D -ENOMEM;
> +				goto err_destroy_pool;
> +			}
> +
> +			salg->mode =3D &possible_hashes[index];
> +			salg->dev =3D &spacc_pdev->dev;
> +
> +			rc =3D spacc_register_hash(salg);
> +			if (rc < 0) {
> +				kfree(salg);
> +				continue;
> +			}
> +
> +			registered++;
> +		}
> +	}
> +
> +	return registered;
> +
> +err_destroy_pool:
> +	dma_pool_destroy(priv->hash_pool);
> +	priv->hash_pool =3D NULL;
> +	return rc;
> +}

[Severity: High]
Does this error path trigger a use-after-free of the DMA pool?

If kmalloc_obj() fails mid-loop, the code branches to err_destroy_pool and
immediately calls dma_pool_destroy(priv->hash_pool). However, algorithms
successfully registered in earlier loop iterations remain active in the
crypto API until the caller's error path eventually unregisters them.

If a concurrent crypto request is made against these active algorithms in
this window, it will attempt to allocate from the destroyed DMA pool.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> index 0000000000000..e0f64f41f4b41
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
Does the linear DMA mode incorrectly handle fragmented scatterlists?

If spacc->config.dma_type =3D=3D SPACC_DMA_LINEAR, the code unconditionally
assigns the hardware source pointer to src_ddt->virt[0] (the physical
address of the first scatterlist chunk) and instructs the hardware to read
proc_len bytes contiguously.

It never verifies if the mapped scatterlist actually consists of a single
contiguous block (sg_nents =3D=3D 1). If a fragmented SG list is provided by
the crypto API, the hardware will read/write past the physical bounds of
the first chunk directly into unrelated physical memory pages.

[ ... ]
> +int spacc_open(struct spacc_device *spacc, int enc, int hash, int ctxid,
> +	       int secure_mode, spacc_callback cb, void *cbdata)
> +{
[ ... ]
> +	/*
> +	 * Acquire the semaphore. This will decrement the count. If the count
> +	 * is already zero (meaning all HW contexts are in use), this call
> +	 * will sleep interruptibly until another thread calls up().
> +	 */
> +	if (down_interruptible(&spacc->ctx_sem)) {
> +		dev_dbg(spacc->dptr, "ERR: Interrupted by signal\n");
> +		return -ERESTARTSYS; /* Woken by a signal */
> +	}
> +
> +	spin_lock_irqsave(&spacc->ctx_lock, flags);
> +	job_idx =3D spacc_job_request(spacc, ctxid);

[Severity: High]
Can this sequence cause a resource deadlock when reusing a context?

spacc_open() unconditionally blocks on down_interruptible(&spacc->ctx_sem)
before it acquires the spinlock to check if the context is being reused.

During an XCBC request, spacc_hash_do_one_request() calls spacc_open(),
acquiring a token from ctx_sem. It then calls spacc_compute_xcbc_key(),
which calls spacc_open() again to reuse the parent's ctx_idx. If all
hardware context semaphore tokens are currently held by other threads, this
inner spacc_open() will block indefinitely while still holding the parent
token, causing an unrecoverable AB-BA resource deadlock.

[ ... ]
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
Does this introduce a TOCTOU race on ref_cnt?

spacc_close() evaluates ref_cnt_before by reading it while holding
dev->ctx_lock, drops the lock, calls spacc_job_release() (which decreases
ref_cnt), and then uses ref_cnt_before to conditionally call
up(&dev->ctx_sem).

Concurrently, spacc_job_request() modifies ref_cnt holding ONLY spacc->lock,
completely bypassing ctx_lock. A concurrent clone operation can increment
ref_cnt between spacc_close()'s check and its action, causing spacc_close()
to erroneously release the semaphore for a context that was actively grabbed
by the clone.

[Severity: High]
Will this also result in a double up() on the semaphore?

When a context's reference count drops to 0, spacc_job_release() (via
spacc_ctx_release) already correctly releases the ctx_sem semaphore by
calling up(&spacc->ctx_sem). However, spacc_close() explicitly calls
up(&dev->ctx_sem) a second time. These persistent double-increments inflate
the semaphore count far past the physical hardware context limits, eventual=
ly
allowing infinite concurrent access and destroying hardware isolation.

[ ... ]
> +static bool spacc_wait_for_job_completion(struct spacc_device *spacc,
> +		void *virt, unsigned char *expected_md)
> +{
> +	int stat;
> +	unsigned long rbuf;
> +
> +	for (int i =3D 0; i < 20; i++) {
> +		rbuf =3D readl(spacc->regmap + SPACC_REG_FIFO_STAT) &
> +			SPACC_FIFO_STAT_STAT_EMPTY;
> +		if (rbuf)
> +			continue;
> +
> +		/* Check result */
> +		writel(1, spacc->regmap + SPACC_REG_STAT_POP);

[Severity: Critical]
Does this hardware polling loop execute too quickly and time out prematurel=
y?

The loop polls the hardware FIFO_STAT register 20 times in a tight CPU loop
with no delays (e.g., udelay() or cpu_relax()). On modern CPUs, this execut=
es
in a few dozen nanoseconds, guaranteeing a premature timeout before the
hardware cryptographic operation can complete.

The caller spacc_xof_stringsize_autodetect() interprets this false failure =
by
immediately freeing the active DMA buffers and resetting the engine while t=
he
hardware is still executing the job, causing it to DMA the crypto results
into freed physical memory.

[ ... ]
> +static int spacc_xof_stringsize_autodetect(struct spacc_device *spacc)
> +{
> +	void *virt;
> +	int ss, alg;
> +	dma_addr_t dma;
> +	struct pdu_ddt	ddt;
> +	unsigned long buflen;
> +	unsigned char buf[256];
[ ... ]
> +			/* write key context */
> +			pdu_to_dev_s(spacc->regmap + SPACC_CTX_HASH_KEY, buf,
> +				     spacc->config.hash_page_size >> 2,
> +				     spacc->config.big_endian);

[Severity: High]
Does this copy result in a stack out-of-bounds read?

The function allocates a fixed 256-byte stack array unsigned char buf[256].
However, it writes this buffer to the hardware using pdu_to_dev_s() with a
size parameter of spacc->config.hash_page_size >> 2 words.

Because the configured hash page size is read dynamically from a 4-bit
hardware capability field that configures contexts up to 32KB, it can vastly
exceed 256 bytes. This reads past the bounds of buf on the stack, exposing
arbitrary uninitialized kernel stack memory to the hardware cryptographic
context.

[ ... ]
> +int spacc_compute_xcbc_key(struct spacc_device *spacc, int mode_id,
> +			   int job_idx, const unsigned char *key,
> +			   int keylen, unsigned char *xcbc_out)
> +{
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

[Severity: Critical]
Can this lead to hardware DMA use-after-free if interrupted by a signal?

The driver waits for a hardware crypto job to finish using
wait_event_interruptible(), but completely ignores its return value.
If interrupted by a signal, the wait aborts, leaving job->job_done as 0
and job->job_err as -EINPROGRESS.

The code interprets this non-zero error as a failure and jumps to xcbc_err,
immediately freeing the buf DMA memory and DDT structures. Because the
hardware operation was never canceled, the device continues writing its
cryptographic results into the freed physical memory, causing severe
asynchronous DMA corruption.

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> index 0000000000000..a1948d6790a58
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
> +	spacc_unregister_algs(platform_get_drvdata(pdev));
> +
> +	return rc;
> +}

[Severity: High]
Does this error path leak resources on probe failure?

If spacc_probe_hashes() fails, the error path jumps to the err label, which
exclusively unregisters the algorithms. It completely fails to call
crypto_engine_exit(), destroy_workqueue(), or clean up the SPAcc device
hardware context.

This skips tearing down the device structures, leaves the IRQ handler
registered, and permanently leaks the hardware engine thread and workqueue.

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
> +	spacc_unregister_algs(priv);
> +	spacc_remove(pdev);
> +}

[Severity: High]
Does this module unload order leave the crypto engine vulnerable to
use-after-free?

crypto_engine_exit() is called before spacc_unregister_algs(). This stops
and destroys the crypto engine thread while the driver's algorithms are
still fully registered and actively exposed to the crypto API.

If a new request arrives in this window, the crypto API routes it to the
driver, which will attempt to queue it to the destroyed priv->engine
pointer, leading to a kernel crash.

[Severity: Critical]
Does destroying the workqueue here create a use-after-free window?

destroy_workqueue(priv->spacc_wq) is called to free the workqueue, but
hardware interrupts (SPACC_REG_IRQ_EN) are not manually disabled. Because
the IRQ handler is managed via devm_request_irq(), it remains fully active
until devres_release_all() runs after remove() completes.

If the hardware raises an interrupt in this window, the active IRQ handler
will call queue_work() on the already destroyed workqueue, leading to an
immediate use-after-free kernel panic.

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.h b/drivers/crypto/dwc=
-spacc/spacc_device.h
> index 0000000000000..991aef9a29ffb
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.h
[ ... ]
> +struct spacc_crypto_ctx {
> +	struct device *dev;
> +	unsigned int statesize;
> +	int handle, mode, auth_size, key_len;
> +	unsigned char *cipher_key;
> +
> +	/*
> +	 * Indicates that the H/W context has been setup and can be used for
> +	 * crypto; otherwise, the software fallback will be used.
> +	 */
> +	bool ctx_valid;
> +
> +	/* salt used for rfc3686/givencrypt mode */
> +	unsigned char csalt[16];
> +	u8 ipad[128] __aligned(sizeof(u32));
> +	u8 digest_ctx_buf[128] __aligned(sizeof(u32));
> +	u8 tmp_buffer[128] __aligned(sizeof(u32));

[Severity: High]
Are non-cacheline-aligned fields risking memory corruption during DMA?

tmp_buffer is declared with only __aligned(sizeof(u32)) (4-byte) alignment.
During zero-length requests, this internal buffer is mapped directly for
DMA via sg_set_buf().

Because it lacks ____cacheline_aligned, it shares a CPU cacheline with
adjacent struct fields. On non-coherent architectures that perform cache
maintenance (flush/invalidate) on full cachelines during DMA transfers,
concurrent CPU accesses to adjacent fields will result in silent memory
corruption.

> diff --git a/drivers/crypto/dwc-spacc/spacc_hal.c b/drivers/crypto/dwc-sp=
acc/spacc_hal.c
> index 0000000000000..7dc8139ae9499
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
[ ... ]
> +int pdu_mem_init(void *device)
> +{
> +	if (ddt_device)
> +		return 0; /* already setup */
> +
> +	/* max of 64 DDT entries */
> +	ddt_device =3D device;
> +	ddt_pool =3D dma_pool_create("spaccddt", device,
> +				   DDT_MAX_ENTRIES, 8, 0);
[ ... ]
> +void pdu_mem_deinit(void *device)
> +{
> +	/* for now, just skip deinit except for matching device */
> +	if (device !=3D ddt_device)
> +		return;
> +
> +	dma_pool_destroy(ddt_pool);

[Severity: High]
Do these static global DMA pools break multi-device isolation?

ddt_pool, ddt16_pool, and ddt4_pool are implemented as static global variab=
les.
pdu_mem_init() sets ddt_device to the first device that probes. If a second
SPACC device probes, it reuses the first device's pool, breaking IOMMU and
DMA mask isolation constraints.

If the first device is later unbound, pdu_mem_deinit() unconditionally
destroys the global DMA pools, leaving the second device active but using a
freed/destroyed DMA pool for all subsequent operations.

> diff --git a/drivers/crypto/dwc-spacc/spacc_manager.c b/drivers/crypto/dw=
c-spacc/spacc_manager.c
> index 0000000000000..518cc49866b54
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_manager.c
[ ... ]
> +int spacc_clone_handle(struct spacc_device *spacc, int old_handle,
> +		       void *cbdata)
> +{
> +	int new_handle;
> +
> +	new_handle =3D spacc_job_request(spacc, spacc->job[old_handle].ctx_idx);
> +	if (new_handle < 0)
> +		return new_handle;
> +
> +	spacc->job[new_handle]          =3D spacc->job[old_handle];
> +	spacc->job[new_handle].job_used =3D new_handle;
> +	spacc->job[new_handle].cbdata   =3D cbdata;
> +
> +	return new_handle;
> +}

[Severity: Critical]
Does copying struct spacc_job directly break internal spinlocks and waitque=
ues?

spacc_clone_handle() copies the struct spacc_job using a direct struct
assignment. Since struct spacc_job embeds a wait_queue_head_t waitq, this
blindly copies the underlying spinlock_t and list_head pointers.

This violates locking invariants and severely corrupts the waitqueue. If any
thread is waiting or subsequently waits on the child's waitqueue, the system
will panic or hang.

[ ... ]
> +int spacc_write_context(struct spacc_device *spacc, int job_idx, int op,
> +			const unsigned char *key, int ksz,
> +			const unsigned char *iv, int ivsz)
> +{
> +	int buflen;
> +	int ret =3D 0;
> +	unsigned char buf[300];
[ ... ]
> +		pdu_to_dev_s(ctx->ciph_key, buf, buflen >> 2,
> +			     spacc->config.big_endian);

[Severity: Medium]
Will this unaligned stack buffer trigger unaligned access kernel panics?

A local stack buffer is declared as unsigned char buf[300], providing only
a 1-byte alignment guarantee. This byte array is passed to pdu_to_dev_s()
and pdu_from_dev_s(), which cast the unsigned char * directly to u32 * and
perform raw 32-bit word dereferences (e.g., *((u32 *)src)).

On strict-alignment architectures, this violates alignment requirements and
triggers unaligned access kernel panics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604165210.1141=
842-1-pavitrakumarm@vayavyalabs.com?part=3D2
