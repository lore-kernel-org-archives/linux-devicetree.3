Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E33D75CD
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549348; cv=none; b=gEmZ41JXPGn10PCIAYBHbJApddRL5caf02f3t++oesbWMK0s0vKq14rc2rOr7CJMIqvKUcBI4XqJN4CBMZCzFfZxUTgnDICiHvNYnRlMKe6EzYwnY+4DE8tIDvkiyM8VUMJwipvT0JNFEAfe7WjjcDv79dYxFflYylUZWiwuda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549348; c=relaxed/simple;
	bh=ire6thNKu2KOeyF27/nVdcfsRBQ+2E6CRpTt7bxIhiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LbbpRcNizXTuL7OhTJb11fJglUaNLNxLC+XLl/ZzqU56XGDoV3ZN3xyzr73CjdST6UY/5HJSEcI0phhaISQbXqee0DW+ZNMt6Ko4sgIrsAMz/69JbLwn3fLj8ksvLGtDKd8dPIlj7/F2uZ+4p/QWkXwxA6uWPm5nZ06L6G74R98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7UAotpM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7UAotpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496EE1F00A3A;
	Mon, 20 Jul 2026 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784549345;
	bh=PgCyVWtYeb+SiOXNuExWtmQBSC4x6PKpRg0QGIWcLYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b7UAotpMCO8hsP9npN521uUuPzbyh/h8wfk3RvC79/q9EQOOQ2q4G2hWWVTtZoX3e
	 vMyvVPn4q5c4B2LWBdo4itq+k/pB63dM6kiI5qhQLtGJ045uvXQMPwV3rYitq2ulii
	 eCVueLfby78KsW+2EaCXh1o8/NDfEGuvUdksX3NOoBlCBxAqWjIdgVNlYPxGS7kzwY
	 f+CCdgaaZm2pYt0hJkm6dy6MxLtm5rXrRt2fjFewyHNR9BIticQ+su3o6bk827PsJN
	 E/8tP8rk0I4/EQw0Z6JNy2NWAEor6B9+KPzkTGeah8AYap1Ye21MRubt6QLOw+e4vD
	 j3CHr1ubAFQsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 2/4] crypto: spacc - Add SPAcc ahash support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720113740.64960-3-pavitrakumarm@vayavyalabs.com>
References: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
 <20260720113740.64960-3-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 12:09:04 +0000
Message-Id: <20260720120905.496EE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Race condition and ring buffer corruption in `spacc_process_jb` du=
e to unsafe reloading of the tail pointer.
- [High] Use-After-Free of algorithm structures during `spacc_unregister_ha=
sh_algs`.
- [High] Device teardown sequence in `spacc_crypto_remove()` causes deadloc=
k, hangs, and DMA Use-After-Free.
- [High] DDT DMA descriptors are written in CPU endianness, causing memory =
corruption on big-endian architectures.
- [High] The `SPACC_AADCOPY_FLAG` multiplexing causes hash requests of 2GB =
or more to be silently truncated.
- [Low] Mixing goto-based error handling with guard() cleanup in the same f=
unction.
--

--- Patch [2]: [PATCH v17 2/4] crypto: spacc - Add SPAcc ahash support ---
commit 21597ca0ff89c5c87f4b74d99d92b89fb2a1eac7
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc ahash support

This commit adds ahash support to the SPAcc driver. It implements various
hash algorithms including CMAC, XCBC, MD5, and SHA variants, along with
crypto engine integration, hardware descriptor management, and device
teardown sequences.

> diff --git a/drivers/crypto/dwc-spacc/spacc_ahash.c b/drivers/crypto/dwc-=
spacc/spacc_ahash.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_ahash.c
> @@ -311,10 +311,10 @@ static int spacc_hash_do_one_request(struct crypto_=
engine *engine, void *areq)
> [ ... ]
> +	{
> +		guard(mutex)(&tctx->lock);
> +
> +		if (tctx->handle < 0 || !tctx->ctx_valid) {
> [ ... ]
> +			tctx->handle =3D spacc_open(&priv->spacc,
> +					CRYPTO_MODE_NULL, salg->mode->id,
> +					-1, 0, spacc_digest_cb, reqtfm);
> +			if (tctx->handle < 0) {
> +				dev_dbg(salg->dev,
> +					"context open failed, fallback\n");
> +				goto fallback;

[Severity: Low]
Does this code violate the cleanup subsystem technical guidelines?

The guidelines explicitly prohibit mixing goto-based error handling and
guard() declarations in the same function to prevent confusing ownership
semantics. Here, the goto fallback jumps out of a block protected by
guard(mutex)(&tctx->lock).

> [ ... ]
> +	}
> +	rc =3D spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
> +			&ctx->src, &ctx->dst, req->nbytes,
> +			0, req->nbytes, 0, 0, 0);

[Severity: High]
Could this cause silent truncation for hash requests of 2GB or larger?

In spacc_hash_do_one_request(), req->nbytes is passed as pre_aad_sz
to spacc_packet_enqueue_ddt_ex(). This creates an issue when multiplexing
large lengths with control flags in the lower layers.

> @@ -978,5 +978,5 @@ int spacc_unregister_hash_algs(struct spacc_priv *pri=
v)
> [ ... ]
> +	list_for_each_entry_safe(salg, tmp, &priv->hash_alg_list, list) {
> +		crypto_engine_unregister_ahash(&salg->alg.hash);
> +		list_del(&salg->list);
> +	}

[Severity: High]
Could this lead to a use-after-free during module unload?

When crypto_engine_unregister_ahash() is called on salg->alg.hash, it
drops the final reference to the algorithm, triggering the asynchronous
destructor spacc_hash_alg_destroy() which calls kfree(salg). The
immediate next line executes list_del(&salg->list), dereferencing the
freed salg pointer.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
> @@ -1286,7 +1286,7 @@ int spacc_packet_enqueue_ddt_ex(struct spacc_device=
 *spacc, int use_jb,
> [ ... ]
> +	if (pre_aad_sz & SPACC_AADCOPY_FLAG) {
> +		job->ctrl  |=3D SPACC_CTRL_MASK(SPACC_CTRL_AAD_COPY);
> +		pre_aad_sz &=3D ~(SPACC_AADCOPY_FLAG);
> +	} else
> +		job->ctrl  &=3D ~SPACC_CTRL_MASK(SPACC_CTRL_AAD_COPY);
> +
> +	job->pre_aad_sz  =3D pre_aad_sz;

[Severity: High]
Is the SPACC_AADCOPY_FLAG multiplexing safe for large hash requests?

If req->nbytes from ahash requests is greater than or equal to 0x80000000
(2GB), the driver interprets the MSB as the SPACC_AADCOPY_FLAG here. It
strips the MSB from the length, silently truncating the requested hash leng=
th,
and sets the hardware control flag instead of processing the full buffer.

> diff --git a/drivers/crypto/dwc-spacc/spacc_device.c b/drivers/crypto/dwc=
-spacc/spacc_device.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_device.c
> @@ -185,8 +185,8 @@ static void spacc_crypto_remove(struct platform_devic=
e *pdev)
> [ ... ]
> +	spacc_irq_glbl_disable(&priv->spacc);
> +	spacc_unregister_algs(priv);
> +
> +	if (priv->engine)
> +		crypto_engine_exit(priv->engine);

[Severity: High]
Is the teardown sequence ordered correctly?

During driver removal, spacc_irq_glbl_disable() turns off hardware IRQs. Ne=
xt,
spacc_unregister_algs() destroys the DMA hash_pool. Then crypto_engine_exit=
()
tries to stop the engine, waiting up to 10 seconds for engine->busy to clea=
r.

Because IRQs are disabled, inflight requests can never finish. The engine
fails to stop, leaks its worker thread, and the hardware can perform DMA
writes into the destroyed pool, resulting in a use-after-free.

> diff --git a/drivers/crypto/dwc-spacc/spacc_hal.c b/drivers/crypto/dwc-sp=
acc/spacc_hal.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_hal.c
> @@ -251,8 +251,8 @@ int pdu_ddt_add(struct device *dev, struct pdu_ddt *d=
dt, dma_addr_t phys,
> [ ... ]
> +	if (ddt->idx =3D=3D ddt->limit)
> +		return -EINVAL;
> +
> +	ddt->virt[ddt->idx * 2 + 0] =3D (uint32_t)phys;
> +	ddt->virt[ddt->idx * 2 + 1] =3D size;
> +	ddt->virt[ddt->idx * 2 + 2] =3D 0;
> +	ddt->virt[ddt->idx * 2 + 3] =3D 0;

[Severity: High]
Does this code handle endianness correctly for the DMA descriptors?

The SPAcc hardware uses a little-endian DMA bus interface, but the code
writes the phys address and size parameters directly to ddt->virt
without a cpu_to_le32() conversion. On big-endian architectures, this
results in byteswapped addresses and lengths being read by the hardware,
leading to out-of-bounds DMA accesses and memory corruption.

> diff --git a/drivers/crypto/dwc-spacc/spacc_manager.c b/drivers/crypto/dw=
c-spacc/spacc_manager.c
> --- /dev/null
> +++ b/drivers/crypto/dwc-spacc/spacc_manager.c
> @@ -350,10 +350,10 @@ int spacc_process_jb(struct spacc_device *spacc, un=
signed long *lock_flag)
> [ ... ]
> +					spin_unlock_irqrestore(&spacc->lock,
> +							       *lock_flag);
> +					job->cb(spacc, job->cbdata);
> +					spin_lock_irqsave(&spacc->lock,
> +							  *lock_flag);
> +					tail =3D spacc->jb_tail;
> +				} else if (!spacc->autodetect) {
> +					job->job_done =3D 1;
> +					wake_up_interruptible(&job->waitq);
> +				}
> +			}
> +		}
> +
> +		tail++;
> +		if (tail =3D=3D SPACC_MAX_JOB_BUFFERS)
> +			tail =3D 0;
> +
> +		spacc->jb_tail =3D tail;

[Severity: High]
Can this sequence cause a race condition and corrupt the ring buffer?

In spacc_process_jb(), the lock is dropped to call job->cb. If another
thread queues a new job and processes it, advancing spacc->jb_tail, the
first thread will wake up, reload the newly advanced jb_tail into tail,
and unconditionally increment it here. This skips the unprocessed job at
the new tail index and corrupts the buffer state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720113740.6496=
0-1-pavitrakumarm@vayavyalabs.com?part=3D2
