Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE536403C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786658449; cv=none; b=HGCsZ8dA8CBz1h3m9Pl3CA2UfZKA41kBOHp/bJviHyT99cFk9BRK5Sx9oJmWLOl9eSIvu5FNjNTjv86QBF4HeEKVOVfRpJtnsrZ+7Z6U3I8CxUVizTfyhO2B8MNNNSDMcCb8IpxycAKCa4jTpbd0TVKmYWHMgNeLzjLGNUGwJyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786658449; c=relaxed/simple;
	bh=b5djUTSikkjedYMKlKb4f6nrt0gbRYsFjVUxQ7LFpsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XtjMsEhq6FvtkRuetkLaEw+rkQOTy2qlpFTqDJ/m9RIGMOinrdq74e8zsJ6s0JGxhjq0DbDxUEgSoQvzkpGwi01CMDjKxKHAXlVIvyp7Ga+hdHoQ+1p0dEZh1CEzd5STdDQCrmTB7o7tnG/3dXHTmzpfK+fW5R+y/dKYw1+H3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRyVKCwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRyVKCwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59431F000E9;
	Thu, 13 Aug 2026 22:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786658445;
	bh=/8/gXu1RVjQyNymiXSXQ6Sg/SWiEEjfJ9h0vOf8Cyzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRyVKCwqXg+ZiF5CslHiXavqBwrgHwPM3dQjqMtU1hKRfa/05mfzpb2UqY7lIGxZ6
	 Hjah6J0CTNJQbCurRxw1Xa3sr/3QvY6OfIp3Ohux7XgCFjw01Trsjcyv3ztc7qF4jq
	 8S91KSlc7Sc9ZWKS1G3hu/+bbtJzVY7Sxug2b16B4zaZIQHM8q2xxPT5QRXgpRkzp/
	 IX7poCHi86T2Jtl6R65/maDYIayP2IoV/vPtk3eSkC5/UbZSOFwqeffZlE9EUPdh4Y
	 gWT6eiOaP5dY2SLIY7l44JmVl69GlLvIYE66zlaetTZiLZR5CcyFHCTBw5A/yC1ye4
	 SnSKcZjgr2Few==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260318063012.816060-3-pavitrakumarm@vayavyalabs.com>
References: <20260318063012.816060-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 22:00:44 +0000
Message-Id: <20260813220044.C59431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 21 potential issue=
(s) to consider:
- [Critical] Use-After-Free / DMA Memory Corruption via Signal Interrupt in=
 `spacc_compute_xcbc_key`.
- [Critical] NULL pointer dereference when invoking software fallback via `=
HASH_FBREQ_ON_STACK`.
- [Critical] Buffer overflow in `spacc_hash_export` and `spacc_hash_import`.
- [Critical] Heap buffer overflow in `spacc_hash_setkey` when processing CM=
AC algorithms.
- [High] Unaligned memory access on stack buffers causes kernel panics on s=
trict-alignment architectures.
- [High] Double free in `spacc_hash_init_dma` during context cloning failur=
e.
- [High] DMA mapping leak and invalid unmap when the hardware queue is full.
- [High] Use-After-Free due to premature workqueue destruction in `spacc_cr=
ypto_remove`.
- [High] Semaphore count corruption via double `up()` breaks hardware concu=
rrency limits.
- [High] Global state corruption and memory leaks on multi-device systems.
- [High] Duplicate Job ID (SWID) assignment causes incorrect request comple=
tion and memory corruption.
- [High] Hardware context leak on key setup failure causes resource exhaust=
ion.
- [High] Use-After-Free during driver unload due to inverted teardown seque=
nce.
- [High] Truncation of 64-bit DMA addresses to 32-bit corrupts memory on sy=
stems with >4GB RAM.
- [High] `SPACC_DMA_LINEAR` mode corrupts memory by assuming scatterlists a=
re physically contiguous.
- [High] Struct assignment overwrites `wait_queue_head_t`, corrupting waitq=
ueues.
- [Medium] Missing delay in hardware polling loop causes string size autode=
tection to fail.
- [Medium] Hardware handle leak when descriptor allocation fails.
- [Medium] Mixing `__free()` automated cleanup with `goto`-based error hand=
ling violates guidelines.
- [Medium] Missing endianness conversion for DDT DMA descriptors.
- [Medium] Autodetect logic writes DMA Descriptor Table address directly to=
 data pointer registers in LINEAR mode.
--

--- Patch [2]: [PATCH v9 2/4] crypto: spacc - Add SPAcc ahash support ---
commit f0780fa72b9e4a4d1f84586504117d3ec9b1a785
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: crypto: spacc - Add SPAcc ahash support

Add ahash support to the SPAcc driver. This introduces ahash algorithm
implementations for multiple hashing algorithms including AES, SM4, MD5,=20
and SHA families.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
> @@ -0,0 +1,886 @@

[ ... ]

> +static void spacc_hash_cleanup_dma(struct device *dev,
> +				   struct ahash_request *req)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +
> +	dma_unmap_sg(dev, req->src, ctx->src_nents, DMA_TO_DEVICE);
> +	pdu_ddt_free(&ctx->src);

[Severity: High]
What happens if this cleanup is called for a zero-length request where the
dynamic scatterlist was mapped instead of req->src? Looking at
spacc_hash_do_one_request(), if req->nbytes =3D=3D 0, tctx->tmp_sgl is mapp=
ed.
Does this code attempt to unmap the unmapped req->src and inadvertently leak
the memory allocated for tctx->tmp_sgl?

> +
> +	dma_pool_free(spacc_hash_pool, ctx->digest_buf, ctx->digest_dma);
> +	pdu_ddt_free(&ctx->dst);
> +}

[ ... ]

> +static int spacc_hash_init_dma(struct device *dev, struct ahash_request =
*req)
> +{
> +	int rc =3D -1;

[ ... ]

> +	if (ctx->total_nents > 0 && ctx->single_shot) {
> +		/* single shot */
> +		rc =3D spacc_ctx_clone_handle(req);
> +		if (rc < 0)
> +			goto err_free_dst;
> +
> +		if (req->nbytes) {
> +			rc =3D spacc_sg_to_ddt(dev, req->src, req->nbytes,
> +					     &ctx->src, DMA_TO_DEVICE);

[Severity: Medium]
If spacc_sg_to_ddt() mapping fails and we jump to err_free_dst, the newly
cloned hardware context in ctx->acb.new_handle doesn't appear to be released
via spacc_close(). Does this leave the hardware handle permanently allocate=
d?

> +		} else {
> +			memset(tctx->tmp_buffer, '\0', PPP_BUF_SIZE);
> +			sg_set_buf(&tctx->tmp_sgl[0], tctx->tmp_buffer,
> +				   PPP_BUF_SIZE);
> +			rc =3D spacc_sg_to_ddt(dev, &tctx->tmp_sgl[0],
> +					     tctx->tmp_sgl[0].length,
> +					     &ctx->src, DMA_TO_DEVICE);
> +		}
> +	} else if (ctx->total_nents =3D=3D 0 && req->nbytes =3D=3D 0) {
> +		rc =3D spacc_ctx_clone_handle(req);
> +		if (rc < 0)
> +			goto err_free_dst;

[ ... ]

> +	return rc;
> +
> +err_free_dst:
> +	pdu_ddt_free(&ctx->dst);
> +err_free_digest:
> +	dma_pool_free(spacc_hash_pool, ctx->digest_buf, ctx->digest_dma);
> +
> +	return rc;
> +}

[Severity: High]
If spacc_ctx_clone_handle() fails, it already calls spacc_hash_cleanup_dma()
which frees these exact DMA resources. Does falling through to err_free_dst
cause a double free of both the DDT and the digest buffer?

[ ... ]

> +static int do_shash(struct device *dev, unsigned char *name,
> +		    unsigned char *result, const u8 *data1,
> +		    unsigned int data1_len)
> +{
> +	int rc =3D 0;
> +	unsigned int size;
> +	struct sdesc *sdesc __free(kfree) =3D NULL;

[Severity: Medium]
This isn't a bug, but the subsystem guidelines recommend avoiding mixing
scope-based cleanup like __free() with manual goto error labels in the same
function. Could we stick to one style to prevent future ownership issues?

> +	struct crypto_shash *hash;
> +
> +	hash =3D crypto_alloc_shash(name, 0, 0);

[ ... ]

> +	rc =3D crypto_shash_final(&sdesc->shash, result);
> +	if (rc)
> +		dev_err(dev, "ERR: Could not generate %s hash\n", name);
> +
> +do_shash_err:
> +	crypto_free_shash(hash);
> +
> +	return rc;
> +}

[ ... ]

> +static int spacc_hash_setkey(struct crypto_ahash *tfm, const u8 *key,
> +		unsigned int keylen)
> +{
> +	int rc =3D 0;

[ ... ]

> +	if (keylen > block_size && salg->mode->id !=3D CRYPTO_MODE_MAC_CMAC) {
> +		dev_dbg(salg->dev, "Exceeds keylen: %u\n", keylen);
> +		dev_dbg(salg->dev, "Req. keylen hashing %s\n",
> +				salg->calg->cra_name);

[ ... ]

> +		keylen =3D digest_size;
> +		dev_dbg(salg->dev, "updated keylen: %u\n", keylen);
> +
> +		tctx->ctx_valid =3D false;
> +	} else {
> +		memcpy(tctx->ipad, key, keylen);
> +		tctx->ctx_valid =3D false;
> +	}

[Severity: Critical]
Is it possible for a user to provide an oversized key for CMAC algorithms?
Since the bounds validation via spacc_is_mode_keysize_supported() happens
after this memcpy(), could an arbitrarily large key overflow the fixed
128-byte tctx->ipad buffer?

[ ... ]

> +	rc =3D spacc_write_context(&priv->spacc, tctx->handle,
> +					 SPACC_HASH_OPERATION, tctx->ipad,
> +					 keylen, NULL, 0);
> +	}
> +
> +	memset(tctx->ipad, 0, sizeof(tctx->ipad));
> +	if (rc < 0) {
> +		dev_err(tctx->dev, "ERR: Failed to write SPAcc context\n");
> +		/* Non-fatal, we continue with the software fallback */
> +		return 0;
> +	}

[Severity: High]
When spacc_write_context() fails, we return early without calling
spacc_close(). Since tctx->ctx_valid remains false, will the next hash
operation allocate a brand new handle and leak the current one, eventually
exhausting all hardware contexts?

[ ... ]

> +static int spacc_hash_init(struct ahash_request *req)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +	int rc;
> +
> +	HASH_FBREQ_ON_STACK(fbreq, req);
> +
> +	rc =3D crypto_ahash_init(fbreq);

[Severity: Critical]
Does HASH_FBREQ_ON_STACK() safely handle the fallback transform if
CRYPTO_ALG_NEED_FALLBACK wasn't set? If the fallback tfm->fb pointer is
NULL, wouldn't invoking the software fallback here cause an immediate NULL
pointer dereference?

[ ... ]

> +static int spacc_hash_export(struct ahash_request *req, void *out)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +
> +	memcpy(out, ctx->state_buffer, sizeof(ctx->state_buffer));
> +	return 0;
> +}

[Severity: Critical]
The driver registers algorithms with .statesize =3D HASH_MAX_STATESIZE, but
ctx->state_buffer is sized HASH_MAX_STATESIZE + 16. When we use
sizeof(ctx->state_buffer) here, does this write 16 bytes past the end of the
framework-provided out buffer?

> +
> +static int spacc_hash_import(struct ahash_request *req, const void *in)
> +{
> +	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> +
> +	memcpy(ctx->state_buffer, in, sizeof(ctx->state_buffer));
> +	return 0;
> +}

[Severity: Critical]
Similarly to the export function, does this memcpy read past the end of the
framework-provided in buffer?

[ ... ]

> +int spacc_probe_hashes(struct platform_device *spacc_pdev)
> +{
> +	int rc =3D 0;
> +	unsigned int index;
> +	int registered =3D 0;
> +	struct spacc_alg *salg;
> +	struct spacc_priv *priv =3D dev_get_drvdata(&spacc_pdev->dev);
> +	const char *name =3D NULL;
> +
> +
> +	spacc_hash_pool =3D dma_pool_create("spacc-digest", &spacc_pdev->dev,
> +					  SPACC_MAX_DIGEST_SIZE,
> +					  SPACC_DMA_ALIGN, SPACC_DMA_BOUNDARY);

[Severity: High]
Could probing multiple devices cause issues with global state? If
spacc_probe_hashes() unconditionally overwrites the global spacc_hash_pool
pointer on every successful probe, do we lose the references to previous
pools?

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
> @@ -0,0 +1,1311 @@

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

[Severity: High]
Is it safe to cast a dma_addr_t directly to uint32_t here? On systems with
more than 4GB of RAM or 64-bit IOMMUs, wouldn't truncating the upper 32 bits
cause the hardware to perform DMA to the wrong physical addresses?

> +	} else if (spacc->config.dma_type =3D=3D SPACC_DMA_LINEAR) {
> +		pdu_io_cached_write(spacc->dptr, spacc->regmap +
> +				    SPACC_REG_SRC_PTR,
> +				    (uint32_t)src_ddt->virt[0],
> +				    &spacc->cache.src_ptr);
> +		pdu_io_cached_write(spacc->dptr, spacc->regmap +
> +				    SPACC_REG_DST_PTR,
> +				    (uint32_t)dst_ddt->virt[0],
> +				    &spacc->cache.dst_ptr);

[Severity: High]
When operating in linear mode, we use the first scatter-gather element as
the base physical address. If a user request spans multiple physically
discontiguous segments (sg_nents > 1), wouldn't the hardware blindly
read/write past the end of the first segment into unrelated memory?

> +	} else
> +		return -EIO;

[ ... ]

> +	if (job->first_use) {
> +		writel(job->ckey_sz | SPACC_SET_KEY_CTX(job->ctx_idx),
> +		       spacc->regmap + SPACC_REG_KEY_SZ);
> +		writel(job->hkey_sz | SPACC_SET_KEY_CTX(job->ctx_idx),
> +		       spacc->regmap + SPACC_REG_KEY_SZ);
> +	}
> +
> +	job->job_swid =3D spacc->job_next_swid;
> +	spacc->job_lookup[job->job_swid] =3D job_idx;
> +	spacc->job_next_swid =3D (spacc->job_next_swid + 1) % SPACC_MAX_JOBS;

[Severity: High]
Is there a risk of duplicate ID assignment here? Since the hardware supports
QoS priorities, if a low-priority job is running while many high-priority
jobs complete, could job_next_swid wrap around and overwrite the lookup
table entry for the still-active low-priority job?

> +
> +	writel(SPACC_SW_CTRL_ID_SET(job->job_swid) |
> +	       SPACC_SW_CTRL_PRIO_SET(prio),
> +	       spacc->regmap + SPACC_REG_SW_CTRL);
> +	writel(job->ctrl, spacc->regmap + SPACC_REG_CTRL);

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

[Severity: High]
In spacc_job_release(), the context is released via spacc_ctx_release(),
which already increments the semaphore if the reference count reaches zero.
Does calling up(&dev->ctx_sem) a second time here artificially inflate the
semaphore count and break concurrency limits?

> +
> +	return ret;
> +}

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

[Severity: High]
By performing a direct struct assignment, this copies wait_queue_head_t
waitq by value. Does copying a waitqueue head overwrite its internal spinlo=
ck
and list pointers, potentially corrupting the queue if there are active
waiters?

> +	spacc->job[new_handle].job_used =3D new_handle;
> +	spacc->job[new_handle].cbdata   =3D cbdata;
> +
> +	return new_handle;
> +}

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

[Severity: Medium]
Could this loop time out prematurely? Without any delays like udelay() or
cpu_relax(), twenty consecutive MMIO reads might execute too quickly for
the crypto engine to complete its work, causing string size autodetection
to consistently fail.

> +		if (rbuf)
> +			continue;
> +
> +		/* Check result */
> +		writel(1, spacc->regmap + SPACC_REG_STAT_POP);

[ ... ]

> +static int spacc_xof_stringsize_autodetect(struct spacc_device *spacc)
> +{
> +	void *virt;
> +	int ss, alg;

[ ... ]

> +	pdu_ddt_add(spacc->dptr, &ddt, dma, SPACC_TEST_DMA_BUFF_SIZE);
> +
> +	/* populate registers for jobs */
> +	writel((uint32_t)ddt.phys, spacc->regmap + SPACC_REG_SRC_PTR);
> +	writel((uint32_t)ddt.phys, spacc->regmap + SPACC_REG_DST_PTR);

[Severity: Medium]
If the hardware is configured for linear DMA mode instead of scatter-gather,
won't it treat this descriptor table address as a raw data pointer? Could
this cause the hardware to hash the descriptor bytes instead of the test
payload?

> +
> +	writel(16, spacc->regmap + SPACC_REG_PROC_LEN);
> +	writel(16, spacc->regmap + SPACC_REG_PRE_AAD_LEN);

[ ... ]

> +int spacc_compute_xcbc_key(struct spacc_device *spacc, int mode_id,
> +			   int job_idx, const unsigned char *key,
> +			   int keylen, unsigned char *xcbc_out)
> +{

[ ... ]

> +	if (usecbc) {
> +		/*
> +		 * We can do the ECB work in CBC using three
> +		 * jobs with the IVreset to zero each time
> +		 */
> +		for (i =3D 0; i < 3; i++) {
> +			spacc_write_context(spacc, handle,
> +					    SPACC_CRYPTO_OPERATION, key,
> +					    keylen, iv, 16);
> +			err =3D spacc_packet_enqueue_ddt(spacc, handle, &ddt,
> +						       &ddt, 16, (i * 16) |
> +						       ((i * 16) << 16), 0, 0,
> +						       0, 0);
> +			if (err !=3D 0)
> +				goto xcbc_err;
> +
> +			wait_event_interruptible(job->waitq, job->job_done);
> +			job->job_done =3D 0;
> +			err =3D job->job_err;
> +
> +			if (err !=3D 0)
> +				goto xcbc_err;

[Severity: Critical]
If a signal interrupts the wait, wait_event_interruptible() returns
-ERESTARTSYS, but we ignore its return value and check job->job_err. If the
hardware job is still actively running in the background, wouldn't jumping
to xcbc_err free the DMA buffers while the device is actively writing to th=
em?

> +		}
> +	} else {
> +		/*
> +		 * Do the 48 bytes as a single SPAcc job this is the ideal case
> +		 * but only possible if ECB was enabled in the core
> +		 */

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
> @@ -0,0 +1,276 @@

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
If probing fails for a second device instance, we call spacc_unregister_alg=
s().
Does this unregister the algorithms and destroy the global DMA pool that
might still be in use by the first successfully probed device?

> +
> +static void spacc_crypto_remove(struct platform_device *pdev)
> +{
> +	struct spacc_priv *priv =3D platform_get_drvdata(pdev);
> +
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);
> +
> +	if (priv->spacc_wq)
> +		destroy_workqueue(priv->spacc_wq);

[Severity: High]
We destroy the workqueue here before the shared hardware interrupts are
masked or unregistered. If a late interrupt fires, could the handler try
to queue work on the destroyed workqueue, causing a use-after-free?

[Severity: High]
We also exit the crypto engine before unregistering the algorithms. Does
this create a window where the crypto API can still dispatch incoming
requests to the driver, leading to a dereference of the freed priv->engine?

> +
> +	spacc_unregister_algs();
> +	spacc_remove(pdev);
> +}

> diff --git a/drivers/crypto/dwc-spacc/spacc_hal.c b/drivers/crypto/dwc-sp=
acc/spacc_hal.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
> @@ -0,0 +1,374 @@

[ ... ]

> +static void pdu_to_dev_big(void __iomem *addr_, const unsigned char *src,
> +			   unsigned long nword)
> +{
> +	u32 __iomem *addr =3D addr_;
> +	u32 data;
> +	__be32 val;
> +
> +	while (nword--) {
> +		data =3D *((u32 *)src);
> +		val =3D __cpu_to_be32(data);

[Severity: High]
In spacc_write_context(), we allocate unsigned char buf[300] on the stack
which only guarantees 1-byte alignment. When this is passed into
pdu_to_dev_big(), the byte pointer is cast directly to a u32 * and
dereferenced here. Can this cause fatal alignment exceptions on strict
alignment architectures?

> +
> +		__raw_writel((u32 __force)val, addr);
> +		src +=3D 4;
> +		addr++;
> +	}
> +}

[ ... ]

> +int pdu_ddt_add(struct device *dev, struct pdu_ddt *ddt, dma_addr_t phys,
> +		unsigned long size)
> +{
> +#ifdef CONFIG_CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
> +
> +	dev_dbg(dev, "   DDT[%.8lx]: 0x%.8lx size %lu\n",
> +		(unsigned long)ddt->phys,
> +		(unsigned long)phys, size);
> +#endif
> +
> +	if (ddt->idx =3D=3D ddt->limit)
> +		return -EINVAL;
> +
> +	ddt->virt[ddt->idx * 2 + 0] =3D (uint32_t)phys;
> +	ddt->virt[ddt->idx * 2 + 1] =3D size;

[Severity: Medium]
The DMA descriptor table (DDT) is written directly using native CPU
endianness. Since the driver handles endian conversions for MMIO registers,
shouldn't we also apply endian conversions to memory-resident descriptors
before the hardware reads them?

> +	ddt->virt[ddt->idx * 2 + 2] =3D 0;
> +	ddt->virt[ddt->idx * 2 + 3] =3D 0;
> +	ddt->len +=3D size;
> +	++(ddt->idx);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260318063012.8160=
60-1-pavitrakumarm@vayavyalabs.com?part=3D2
