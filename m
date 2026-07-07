Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5B3416132
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429997; cv=none; b=KOUF320/AXAdVu5F9fl/mHiyH3/tuy6emgRt4kYwZUwy0a6eiPr4TIZzS1ICpM9n7o/RQU8G1rHrQcPCgHhu49w9N8gEVg/68n+UBT8FDdgLNJspIpSTdfAq3jwrj9p5unGPyJSP54dFByRY/jEiDIYqM8ujaP2+77I7O0JlKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429997; c=relaxed/simple;
	bh=aTV2EAlt8iOCWxr3x0Q+TImJIzEOzrCuzN/2SXubjiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jZGD6W015ZZaIXjYunRDzk9+Yg3ZsEW1dOG49areWbaBkQ4VnNpei8ognL1wzmGIh5TXC0mnqHJ+ItdDXlrhrw687vlOvx5XkMzFTlBRrvUujSsQOBkkc39TjMp39GeF9MY278Vy2oAKdtp4eyOf681/sfWzwksjXM9K9URJgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7OCSlrX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7OCSlrX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDD91F000E9;
	Tue,  7 Jul 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783429995;
	bh=3F0WfQqkBibMo2Ly4LDmXTTHHMhDr3/QUfHBOE8r430=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j7OCSlrXVdTmjU2a/tSjmZch9LmHYj7XTKXtbQbOqw7ct291V49tdPPf/8RDV+KSb
	 O0wEgeg09+CD8QgMXtimgN2d+eN3dvk7Szlk5S2fRGGIUlZHZnp72iLg+7D3SZZik3
	 Qe8mplF4F7GHttp2Jv0dAhx2qlzJOJTQWQRRPbPC1HTuZfdbg9fTYKxmADMBS+OfDQ
	 HiP8UH222SOx/ezA5K0Tm68R6nvWfbEkkht6bRMUQKYe0fgpwsnwWvFA3WfNEdtTA/
	 ojzL6qzqFoP3tqQcKCvGo7gmdDmqzJxRfq3Dm4Jvcbvy7vBegcOtZ3BR0XjRv7Vhpn
	 NHPujkCtFyyFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707125311.2398031-3-pavitrakumarm@vayavyalabs.com>
References: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
 <20260707125311.2398031-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:13:14 +0000
Message-Id: <20260707131315.5BDD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 15 potential issue=
(s) to consider:
- [Critical] Missing CRYPTO_ALG_NEED_FALLBACK flag for non-MAC hashes cause=
s use-after-free and stack overflows in software fallback paths.
- [High] wait_event_interruptible() falls back to wait_event() on signal, c=
ausing a permanent hang.
- [High] Queue pointer `jb_tail` is rewound to a stale value after dropping=
 the spinlock, causing queue corruption.
- [High] Incorrect device teardown ordering causes deadlocks, Use-After-Fre=
e, and DMA corruption.
- [High] Concurrent `setkey()` temporarily nullifies `tctx->dev`, risking a=
 NULL pointer dereference in DMA cleanup.
- [High] Error handling in `spacc_pop_packets_ex` aborts the hardware FIFO =
processing loop, leaking completions.
- [High] `spacc_sg_to_ddt` maps the entire scatterlist chain ignoring `req-=
>nbytes`, leading to IOMMU resource exhaustion.
- [High] Hardware maximum message length is unchecked, leading to silent tr=
uncation and incorrect hashes.
- [High] Monotonic `job_next_swid` assignment wraps around and overwrites a=
ctive job tracking structures.
- [High] Incorrect use of I/O accessors causes byte-swapping on big-endian =
systems when writing to the device context.
- [High] Exhaustion of hardware contexts permanently deadlocks the single g=
lobal crypto engine kworker.
- [High] Exporting hash state blindly copies 512 bytes, leaking uninitializ=
ed kernel memory.
- [Medium] `spacc_hash_do_one_request` mixes goto-based error handling with=
 `guard()` declarations, violating cleanup rules.
- [Medium] CRYPTO_ALG_OPTIONAL_KEY is erroneously set for HMAC algorithms, =
bypassing mandatory key enforcement.
- [Medium] Data race on `spacc->wdcnt` between the interrupt handler and th=
e workqueue.
--

--- Patch [2]: [PATCH v16 2/4] crypto: spacc - Add SPAcc ahash support ---
commit 9b37a1ea0e79e785bc1e2213daaf06064d34b667
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

Add ahash support to SPAcc driver.
Below are the hash algos supported:
- cmac(aes), xcbc(aes), cmac(sm4), xcbc(sm4), hmac(md5), md5, hmac(sha1),
  sha1, sha224, sha256, sha384, sha512, hmac(sha224), hmac(sha256),
  hmac(sha384), hmac(sha512), sha3-224, sha3-256, sha3-384, sha3-512

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
> @@ -76,22 +76,22 @@
>  static void spacc_hash_cleanup_dma_src(struct spacc_crypto_ctx *tctx,
>  				       struct ahash_request *req)
>  {
>  	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> =20
>  	if (tctx->tmp_sgl && tctx->tmp_sgl[0].length !=3D 0) {
>  		dma_unmap_sg(tctx->dev, tctx->tmp_sgl, ctx->src_nents,
>  			     DMA_TO_DEVICE);
>  		kfree(tctx->tmp_sgl_buff);
>  		tctx->tmp_sgl_buff =3D NULL;
>  		tctx->tmp_sgl[0].length =3D 0;
>  	} else
>  		dma_unmap_sg(tctx->dev, req->src, ctx->src_nents,
>  			     DMA_TO_DEVICE);

[Severity: High]
Could this lead to a NULL pointer dereference regression? In
spacc_hash_cleanup_dma_src, tctx->dev is read locklessly during request
completion. If this coincides with spacc_hash_setkey, which momentarily
sets tctx->dev to NULL under a lock, the DMA unmap path might attempt
to unmap using a NULL device.

[ ... ]

> @@ -231,18 +231,18 @@
>  	tctx->tmp_sgl[0].length =3D 0;
> =20
>  	{
>  		guard(mutex)(&tctx->lock);
> =20
>  		if (tctx->handle < 0 || !tctx->ctx_valid) {
>  			/*
>  			 * spacc_open() acquires ctx_sem which may sleep;
>  			 * do_one_request runs in the crypto_engine workqueue
>  			 * which is a sleepable context, so this is safe.
>  			 */
>  			tctx->handle =3D spacc_open(&priv->spacc,
>  					CRYPTO_MODE_NULL, salg->mode->id,
>  					-1, 0, spacc_digest_cb, reqtfm);
>  			if (tctx->handle < 0) {
>  				dev_dbg(salg->dev,
>  					"context open failed, fallback\n");
>  				goto fallback;
>  			}

[Severity: Medium]
Is it safe to mix goto-based error handling with guard() declarations in
spacc_hash_do_one_request? This combination can create ambiguous lock
ownership release paths, violating the cleanup subsystem conventions.

[ ... ]

> @@ -307,13 +307,13 @@
>  			dev_dbg(salg->dev,
>  				"DMA init failed (%d), falling back\n", rc);
>  			goto fallback;
>  		}
>  	}
>  	rc =3D spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
>  			&ctx->src, &ctx->dst, req->nbytes,
>  			0, req->nbytes, 0, 0, 0);

[Severity: High]
Might this introduce a data corruption regression? The variable req->nbytes
is directly passed to the hardware without validating against
spacc->config.max_msg_size. Oversized requests might be silently truncated
when written to the 32-bit SPACC_REG_PROC_LEN register in
spacc_packet_enqueue_ddt_ex, which would produce invalid hash digests
without an error.

[ ... ]

> @@ -348,11 +348,11 @@
>  			rc =3D crypto_shash_final(desc, req->result);
> =20
>  		shash_desc_zero(desc);
>  	} else {
>  		HASH_FBREQ_ON_STACK(fbreq, req);
> =20
>  		rc =3D crypto_ahash_digest(fbreq);
> =20
>  		HASH_REQUEST_ZERO(fbreq);
>  	}

[Severity: Critical]
Will this sequence cause a use-after-free regression and stack overflow?
When DMA fails, the stack-allocated fbreq is enqueued asynchronously. If
CRYPTO_ALG_NEED_FALLBACK is omitted for non-MAC hashes, the fallback TFM is
uninitialized. The asynchronous crypto engine might execute this after the
stack frame is gone, resulting in severe memory corruption.

[ ... ]

> @@ -558,9 +558,9 @@
>  static int spacc_hash_export(struct ahash_request *req, void *out)
>  {
>  	struct spacc_crypto_reqctx *ctx =3D ahash_request_ctx(req);
> =20
>  	memcpy(out, ctx->state_buffer, HASH_MAX_STATESIZE);
>  	return 0;
>  }

[Severity: High]
Does exporting the hash state leak uninitialized kernel memory?
The function spacc_hash_export statically copies HASH_MAX_STATESIZE
(512 bytes) from the request context. Since the underlying fallback
algorithms only initialize a fraction of this structure, this might leak
uninitialized heap data to userspace.

[ ... ]

> @@ -835,16 +835,16 @@
>  	if (salg->mode->id =3D=3D CRYPTO_MODE_MAC_CMAC ||
>  			salg->mode->id =3D=3D CRYPTO_MODE_MAC_XCBC ||
>  			salg->mode->id =3D=3D CRYPTO_MODE_MAC_SM4_CMAC ||
>  			salg->mode->id =3D=3D CRYPTO_MODE_MAC_SM4_XCBC) {
>  		salg->alg.hash.base.halg.base.cra_flags =3D
>  			CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_ASYNC |
>  			CRYPTO_ALG_NO_FALLBACK;
>  	} else {
>  		salg->alg.hash.base.halg.base.cra_flags =3D
>  			CRYPTO_ALG_TYPE_AHASH | CRYPTO_ALG_ASYNC |
>  			CRYPTO_ALG_OPTIONAL_KEY;
>  	}

[Severity: Critical]
Does the omission of the CRYPTO_ALG_NEED_FALLBACK flag for non-MAC hashes
lead to the aforementioned stack overflow regression?

[Severity: Medium]
Could applying CRYPTO_ALG_OPTIONAL_KEY to HMAC algorithms bypass mandatory
key enforcement? This omits the CRYPTO_TFM_NEED_KEY constraint, permitting
execution with uninitialized state and yielding deterministic but meaningle=
ss
MACs instead of returning -ENOKEY.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
> @@ -115,11 +115,11 @@
> =20
>  	nents =3D dma_map_sg(dev, sg, orig_nents, dma_direction);
>  	if (nents <=3D 0)
>  		return -ENOMEM;

[Severity: High]
Does this mapping exhaust IOMMU resources? The operation unconditionally
traverses and maps the full scatterlist chain derived from orig_nents in
spacc_sg_to_ddt, instead of limiting the mapped segments to the requested
payload length defined by req->nbytes.

[ ... ]

> @@ -445,11 +445,11 @@
>  			err =3D spacc_packet_enqueue_ddt(spacc, handle, &ddt, &ddt, 48,
>  					       0, 0, 0, 0, 0);
>  		if (err !=3D 0)
>  			goto xcbc_err;
> =20
>  		if (wait_event_interruptible(job->waitq, job->job_done))
>  			wait_event(job->waitq, job->job_done);

[Severity: High]
Can this fallback sleeper hang indefinitely? If wait_event_interruptible
is interrupted, it falls back to wait_event in TASK_UNINTERRUPTIBLE
state. The completion handler in spacc_pop_packets_ex only uses
wake_up_interruptible, which exclusively wakes TASK_INTERRUPTIBLE tasks,
leaving this sleeper stranded.

[ ... ]

> @@ -668,11 +668,11 @@
>  	struct spacc_device *spacc =3D &priv->spacc;
> =20
>  	/*
>  	 * Decrement the WD CNT here since
>  	 * now we're actually going to respond
>  	 * to the IRQ completely
>  	 */
>  	if (spacc->wdcnt)
>  		--(spacc->wdcnt);

[Severity: Medium]
Is there a data race on spacc->wdcnt here? The counter is incremented under
a lock inside the IRQ handler, but spacc_pop_jobs executes a
read-modify-write decrement asynchronously without lock protection.
This might cause lost increments that break the watchdog logic.

[ ... ]

> @@ -841,12 +841,12 @@
>  	const struct hash_config *hash_cfg =3D NULL;
>  	unsigned long flags;
> =20
>  	if (ctxid =3D=3D -1) {
>  		if (down_interruptible(&spacc->ctx_sem)) {
>  			dev_dbg(spacc->dptr, "ERR: Interrupted by signal\n");
>  			return -ERESTARTSYS;
>  		}
>  	}

[Severity: High]
Does acquiring this sleepable semaphore without a timeout cause a permanent
deadlock in the global crypto engine kworker? If active TFMs outnumber
hardware contexts, the engine worker sleeps indefinitely within
do_one_request, which would stall all subsequent operations for all
hardware engines.

[ ... ]

> @@ -1313,11 +1313,11 @@
>  	if (job->first_use) {
>  		writel(job->ckey_sz | SPACC_SET_KEY_CTX(job->ctx_idx),
>  		       spacc->regmap + SPACC_REG_KEY_SZ);
>  		writel(job->hkey_sz | SPACC_SET_KEY_CTX(job->ctx_idx),
>  		       spacc->regmap + SPACC_REG_KEY_SZ);
>  	}
> =20
>  	job->job_swid =3D spacc->job_next_swid;
>  	spacc->job_lookup[job->job_swid] =3D job_idx;
>  	spacc->job_next_swid =3D (spacc->job_next_swid + 1) % SPACC_MAX_JOBS;

[Severity: High]
Can the monotonic job_next_swid wrap around and overwrite active job
tracking structures? If the global job_next_swid wraps completely while
older, low-priority jobs remain active, it looks like it blindly
overwrites the job_lookup table and disassociates the active hardware job
from its software tracking context.

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
> @@ -218,12 +218,12 @@
> =20
>  	/*
>  	 * Unregister the (possibly shared) IRQ first so no *new* work can
>  	 * be queued onto spacc_wq from this point on.
>  	 */
>  	devm_free_irq(&pdev->dev, priv->irq, &pdev->dev);
> =20
>  	if (priv->spacc_wq)
>  		destroy_workqueue(priv->spacc_wq);
> =20
>  	spacc_unregister_algs(priv);
> =20
>  	if (priv->engine)
>  		crypto_engine_exit(priv->engine);

[Severity: High]
Does this teardown sequence introduce deadlocks and use-after-free
regressions? Freeing the workqueue, DMA pools, and algorithms before
terminating the active crypto engine might force in-flight asynchronous
requests to execute against destroyed memory structures. Active TFMs
outliving device unbinding may also cause memory corruption during
spacc_hash_exit_tfm.

> diff --git a/drivers/crypto/dwc-spacc/spacc_hal.c b/drivers/crypto/dwc-sp=
acc/spacc_hal.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
> @@ -155,10 +155,10 @@
>  	u32 __iomem *addr =3D addr_;
> =20
>  	while (nword--) {
>  		/*
>  		 * src may be unaligned; read it as a defined little-endian
>  		 * word, then write the raw value (__raw_writel does not
>  		 * byte-swap) so the device sees the bytes in buffer order
>  		 * regardless of CPU endianness.
>  		 */
>  		__raw_writel((__force u32)get_unaligned_le32(src), addr);

[Severity: High]
Will this combination of get_unaligned_le32 and __raw_writel corrupt
the byte stream on big-endian architectures? The function
get_unaligned_le32 converts memory to host-endian, which __raw_writel
then writes without byte-swapping, reversing the byte sequence of
the context stream instead of preserving the memory layout.

> diff --git a/drivers/crypto/dwc-spacc/spacc_interrupt.c b/drivers/crypto/=
dwc-spacc/spacc_interrupt.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_interrupt.c
> @@ -35,11 +35,11 @@
>  			/* write the pop register to get the next job */
>  			writel(1, spacc->regmap + SPACC_REG_STAT_POP);
>  			cmdstat =3D readl(spacc->regmap + SPACC_REG_STATUS);
> =20
>  			swid =3D SPACC_STATUS_SW_ID_GET(cmdstat);
> =20
>  			if (swid >=3D SPACC_MAX_JOBS) {
>  				ret =3D -EIO;
>  				goto ERR;
>  			}

[Severity: High]
Does this error path prematurely abort the hardware FIFO processing loop?
Encountering a single invalid swid triggers a goto that entirely breaks out
of the STAT FIFO polling loop in spacc_pop_packets_ex. With the IRQ already
cleared, this strands the remaining completed jobs in the hardware FIFO.

[ ... ]

> @@ -91,10 +91,10 @@
> =20
>  			job->job_err =3D ret;
> =20
>  			if (spacc->autodetect) {
>  				job->job_done =3D 1;
>  				wake_up_interruptible(&job->waitq);
>  			}

[Severity: High]
As mentioned earlier, wait_event_interruptible can fall back to
wait_event in TASK_UNINTERRUPTIBLE. This wake_up_interruptible
will fail to wake that sleeper, leading to a permanent hang.

> diff --git a/drivers/crypto/dwc-spacc/spacc_manager.c b/drivers/crypto/dw=
c-spacc/spacc_manager.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_manager.c
> @@ -265,10 +265,10 @@
>  					job->job_done =3D 1;
>  					wake_up_interruptible(&job->waitq);
>  				}
>  			}
>  		}
> =20
>  		tail++;
>  		if (tail =3D=3D SPACC_MAX_JOB_BUFFERS)
>  			tail =3D 0;
> =20
>  		spacc->jb_tail =3D tail;

[Severity: High]
Does this logic cause queue corruption and lost jobs? The function
spacc_process_jb caches jb_tail, drops the spinlock to execute a
callback, and then blindly restores the cached value upon reacquiring the
lock. This appears to unconditionally overwrite any concurrent queue
advancements.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707125311.2398=
031-1-pavitrakumarm@vayavyalabs.com?part=3D2
