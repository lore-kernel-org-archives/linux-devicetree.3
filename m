Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097748F837
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047134; cv=none; b=o+N9rW/6SYGlwJWdVNAfRDmk1XGLSjlzxZDzpdfIjz5xUzS3MatKsJuP2tELFE/YsogsOtVwnR+VbH8MCpnw/Xdz2g+vB2aZP6Iqg3P2piO9rEFueWoWDhc/6Q9owpxIKb1G+OoifDYhMO8/OWKnvYNu3aqD6FL3u1gjdCqSzIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047134; c=relaxed/simple;
	bh=+FgDoACLSZ+PUC38ZRtj235KDCKliDDpP230oYeNCKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+TCvAO0hFpU/JIIvZ62r9PjjJYtkge8MdTCbk0Z8CMtiZeuVVsIRh7WkALjQuay+3hNDaa+iTjjJwmleTTcRjo7oEXuAAlKx2TPpcMCM4AjYFvB0XY7RRcs8C6U3o2/ItL3JXIQr0gQgyTi+h1k7dS1wXtI2MYO1xZKHhZkXgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kc/e/J+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc/e/J+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160F11F00A3A;
	Thu,  6 Aug 2026 20:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047126;
	bh=9T+LHZeu/apo+SaaxlkBQIEy/z4T2vBawZ+9w7oUwLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kc/e/J+UaYT2ogZrsrfCAb30R41gdol2ecq+a2XrOyu3ahC+7UCCS4CEgbGwb7u+2
	 EvO09YW4fUjJIGH/5Zw6jhvwfM7JPcOym0xJ/CHPXe11UIZT+8mUhrANj6IuDMnqW3
	 UZuWCoMpRZ5bMDds+9LnXtS6MhRQ46MAyAoNTOJzXKcBi1jOI4yxmxy0X50xQmtbyr
	 mHnlw46QQkcMcgmrQ5Tg8VrY999/cFXYMNxx2DJ2J9XGHJvXNGphe8RSa+wj+0w/cu
	 w9Q96CBFoTKZatzAeFy5FQg0258MemtGZL4Y7i6hKz+2afDd1pWJuSB8DrnZ5YCaM0
	 sah9iW6P0uOJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806195519.2703224-5-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-5-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:12:05 +0000
Message-Id: <20260806201206.160F11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] Integer overflow in `cmh_hash_finup()` leads to undersized all=
ocation and heap buffer overflow.
- [High] Driver attempts to linearize entire scatterlists with `kmalloc()`,=
 breaking the crypto API for large payloads.
- [High] Unaligned DMA mapping of an embedded structure member causes cache=
line tearing.
- [High] SHAKE algorithms incorrectly use a `block_size` of 1, bypassing th=
e hardware holdback logic.
- [High] Algorithm registration unconditionally assumes HC cores are presen=
t, leading to a fatal divide-by-zero.
- [Medium] Transient errors in `cmh_hash_update()` silently corrupt the req=
uest's holdback state.

Pre-existing issues:
- [High] Transaction manager thread is started before its 'running' flag is=
 set, potentially causing immediate exit.
--

--- Patch [4]: [PATCH v3 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash -=
--
commit cd0a896498edd93a15534bfd2d7287f9465b9b18
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SHA-2/SHA-3/SHAKE ahash

This commit registers ahash algorithms for SHA-2, SHA-3, and SHAKE families
using the CMH hash core. It implements incremental hardware updates, hardwa=
re
state save/restore across requests, and zero-copy from virtual buffers.

> diff --git a/drivers/crypto/cmh/cmh_hash.c b/drivers/crypto/cmh/cmh_hash.c
> new file mode 100644
> index 0000000000000..2a9a3c6a69855
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hash.c
> @@ -0,0 +1,888 @@
[ ... ]
> +	{
> +		.hc_algo     =3D HC_ALGO_SHAKE128,
> +		.digest_size =3D CMH_SHAKE128_DIGEST_SIZE,
> +		.block_size  =3D 1,    /* XOF: no meaningful block for crypto API */

[Severity: High]
Does setting the block size to 1 here cause the hardware holdback logic to =
be
bypassed?

In cmh_hash_update(), the holdback checks:
    if (total_avail < block_size) { ... }

Since the block size is 1, this condition fails for any non-empty input. Co=
uld
this force the hardware to process unaligned byte counts instead of bufferi=
ng
them to the required rate alignment?

> +		.alg_name    =3D "shake128",
> +		.drv_name    =3D "rambus-cmh-shake128",
> +	},
[ ... ]
> +struct cmh_hash_reqctx {
> +	const struct cmh_hash_alg_info *info;
> +	int    error;
> +	u32    hw_started;      /* non-zero after first HW submission */
> +	u32    buf_len;         /* bytes in holdback buf[] */
> +	u32    has_checkpoint;  /* non-zero if checkpoint[] valid */
> +	/* DMA state for current async operation */
> +	dma_addr_t ckpt_dma;   /* RESTORE input */
> +	dma_addr_t save_dma;   /* SAVE output (update only) */
> +	dma_addr_t data_dma;   /* UPDATE input */
> +	dma_addr_t digest_dma; /* FINAL output (final/digest only) */
> +	u8    *save_buf;       /* SAVE output buffer */
> +	u8    *data_buf;       /* linearised data for DMA */
> +	u32    data_len;       /* bytes in data_buf */
> +	u8    *digest_buf;     /* digest output buffer */
> +	u8     buf[CMH_HASH_MAX_BLOCK]; /* holdback for partial block */
> +	u8     checkpoint[HC_CONTEXT_SIZE]; /* HC context from last SAVE */

[Severity: High]
Is there a risk of cacheline tearing during DMA mapping here?

The checkpoint array is embedded within struct cmh_hash_reqctx without expl=
icit
alignment constraints. When cmh_hash_update() invokes cmh_dma_map_single() =
on
this member, could flushing or invalidating the buffer corrupt adjacent fie=
lds
that share the same cacheline?

> +	struct vcq_cmd packed[CMH_HASH_MAX_PACKED];
> +};
[ ... ]
> +static int cmh_hash_update(struct ahash_request *req)
> +{
[ ... ]
> +	/*
> +	 * Linearise: holdback prefix + full blocks from scatterlist.
> +	 * full_len is user-controlled and can exceed KMALLOC_MAX_SIZE for a
> +	 * single large update; __GFP_NOWARN avoids splatting the page
> +	 * allocator on an oversized request.
> +	 */
> +	rctx->data_buf =3D kmalloc(full_len, gfp | __GFP_NOWARN);
> +	if (!rctx->data_buf)
> +		return -ENOMEM;

[Severity: High]
Can this memory allocation fail deterministically for valid large payloads?

The kernel crypto ahash API is expected to handle arbitrarily large
scatterlists. By attempting to linearize the entire operation into a single
physically contiguous buffer, could this fail for payloads exceeding the
maximum kmalloc size and break subsystems that rely on large streams?

> +
> +	if (rctx->buf_len > 0)
> +		memcpy(rctx->data_buf, rctx->buf, rctx->buf_len);
[ ... ]
> +	/* Move tail to holdback */
> +	if (tail_len > 0) {
> +		if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +			memcpy(rctx->buf, req->svirt + from_src,
> +			       tail_len);
> +		else
> +			scatterwalk_map_and_copy(rctx->buf, req->src,
> +						 from_src, tail_len,
> +						 0);
> +	}
> +	rctx->buf_len =3D tail_len;
> +	rctx->data_len =3D full_len;
> +
> +	/* Allocate SAVE output buffer */
> +	rctx->save_buf =3D kzalloc(HC_CONTEXT_SIZE, gfp);
> +	if (!rctx->save_buf) {
> +		ret =3D -ENOMEM;
> +		goto err_free;
> +	}

[Severity: Medium]
Could a memory allocation failure here permanently corrupt the internal hash
holdback state?

The tail data is copied to rctx->buf and rctx->buf_len is updated prior to
allocating save_buf. If this allocation or the subsequent DMA mapping fails,
the function returns early with an error, discarding the previous holdback
prefix data. Should the internal state mutation be deferred until all
allocations succeed?

[ ... ]
> +static int cmh_hash_finup(struct ahash_request *req)
> +{
[ ... ]
> +	data_len =3D rctx->buf_len + req->nbytes;

[Severity: Critical]
Can this integer addition wrap around for extremely large payloads?

Unlike cmh_hash_update(), which explicitly checks for overflow, this functi=
on
lacks validation. If data_len overflows, it would result in a small memory
allocation followed by a massive out-of-bounds copy operation below.

> +
> +	if (data_len =3D=3D 0)
> +		return cmh_hash_submit_final(req, NULL, 0);
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);
> +	if (!data_buf)
> +		return -ENOMEM;

[Severity: High]
Similar to cmh_hash_update(), does linearizing the entire buffer with
kmalloc() break the crypto API contract for large scatterlists?

> +
> +	if (rctx->buf_len > 0)
> +		memcpy(data_buf, rctx->buf, rctx->buf_len);
> +
> +	if (req->nbytes > 0) {
> +		if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +			memcpy(data_buf + rctx->buf_len,
> +			       req->svirt, req->nbytes);
[ ... ]
> +int cmh_hash_register(void)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < CMH_HASH_ALG_COUNT; i++) {
[ ... ]
> +		ret =3D crypto_register_ahash(alg);

[Severity: High]
Does this algorithm registration cause a divide-by-zero during testing if
the hardware lacks HC cores?

Algorithms are registered unconditionally here. When the crypto framework
allocates an algorithm for testing, cmh_core_select_instance() performs a
modulo by ct->num_instances. If the device tree safely omits HC cores, could
this crash during boot or driver probe?

[ ... ]

This isn't a bug introduced by this patch, but looking at cmh_tm_init() in
drivers/crypto/cmh/cmh_txn.c:

cmh_tm_init() {
    ...
    tm.thread =3D kthread_run(cmh_tm_thread, NULL, "cmh_tm");
    if (IS_ERR(tm.thread)) {
        ...
    }

    WRITE_ONCE(tm.running, true);
    ...
}

[Severity: High]
Could the transaction manager thread exit immediately upon creation?

Because kthread_run() synchronously starts and schedules cmh_tm_thread,
the new thread could check the tm.running flag before the parent thread
executes WRITE_ONCE(tm.running, true), observing it as false and exiting
permanently.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D4
