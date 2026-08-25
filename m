Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F833F37A
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696929; cv=none; b=iwgPKV8OJf23Uh0I5hgua5ywvRcVTP6AvqUkZfc3MqBlO3zj/HlFDK6or5U6UWANZ943G7J5tZwLU8xcTxUp52WBtxIfFv8PWEXqcwxhqF5hkSSH2DtltYQW5feEHllzblqIlmmk1lSwDigEmmD2r7Q7uJL3ulKbXcUkqOi1VnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696929; c=relaxed/simple;
	bh=Qs4xWE6qDTfRkJ/s+YsDLz3116H3E0YLZnTnlIUrVIA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JxaOWoLQKNM9NqZzWRlygn7/nGAukxisVoj3UXHHooG8ZXnTYiSjwAWHIhubb+pRUVQPYiP9T+FM0xsF1xMUoNbkIgV4VXt/b0JczaxllI2pQg8+9qz5X2waSgqKe+9qLkgeQpR8qqWT9Jl2TBfkPO91/TnmZPhO+keg/kkVwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/F3KcDi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/F3KcDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93BD1F00A3A;
	Tue, 25 Aug 2026 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787696928;
	bh=bhzA5+7QXK7ND3kk7PhPUzvibpJ9lRxQ2XYewKTdOIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/F3KcDivcb0BaDSpz3v1d6tp11CCRxktGS4/taXmWZlDvwxjYiredp2teHTpuTPG
	 ch7cHdBfsu8wdrGw06iRulngDKCMtE86P9a0aWfH3A+PrCkdbqoT4iRoAsb+BIzQKi
	 ObSEsm4FDDbst/fFU6mmSYZxBS4+VYNNdxKXrr2e1ZN7EhwFg8YKsohivoH1RN3WIw
	 14ykmTzS8MTFKTf8PK9mldnZij7yAqhXbBgAIkWaptzRZlLg95DnjfOXw0ZbL30SxH
	 iNCx7KXliy7JVwH7HZn7WTc0yKrYWO8+4fJP4qymnQ7tbFlmoKPbztded5nvGHA3uO
	 nCQKrg+Fl4gvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/19] crypto: cmh - add SM3 ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825221539.255951-8-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-8-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:28:47 +0000
Message-Id: <20260825222847.C93BD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Deterministic failure on large hash updates due to a single large =
kmalloc linearization.
- [High] Race condition leading to Use-After-Free or state corruption becau=
se the request context and input buffers are modified after asynchronous su=
bmission.
- [High] DMA mapping of an unaligned embedded structure member violates the=
 DMA API, causes cache coherency corruption, and risks kernel panics if map=
ped from a vmap stack.
--

commit db71afa324a1c32abd2a50db9da6330962bdae16
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SM3 ahash

Register the SM3 ahash algorithm using the CMH SM3 core. Supports
incremental update, finup, final, and export/import functionality.

> diff --git a/drivers/crypto/cmh/cmh_sm3.c b/drivers/crypto/cmh/cmh_sm3.c
> new file mode 100644
> index 0000000000000..8dbc46c30a40f
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_sm3.c
[ ... ]
> +struct cmh_sm3_reqctx {
> +	int    error;
> +	u32    hw_started;
> +	u32    buf_len;
> +	u32    has_checkpoint;
> +	u8     checkpoint[SM3_CONTEXT_SIZE]; /* SM3 context from last SAVE */
> +	/* DMA state for current async operation */
[ ... ]
> +static int cmh_sm3_update(struct ahash_request *req)
> +{
[ ... ]
> +	/*
> +	 * full_len is user-controlled and can exceed KMALLOC_MAX_SIZE for a
> +	 * single large update; __GFP_NOWARN avoids splatting the page
> +	 * allocator on an oversized request.
> +	 */
> +	rctx->data_buf =3D kmalloc(full_len, gfp | __GFP_NOWARN);
> +	if (!rctx->data_buf)
> +		return -ENOMEM;

[Severity: High]
Is it safe to assume the entire remaining data can be linearized into a
single kmalloc buffer? If a caller attempts to hash a large input (e.g.,
several megabytes) using the ahash API via AF_ALG, this allocation will
predictably fail for sizes exceeding KMALLOC_MAX_SIZE or under memory
fragmentation, which breaks the API contract.

[ ... ]
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    SM3_CONTEXT_SIZE,
> +						     DMA_TO_DEVICE);

[Severity: High]
Does mapping this inline checkpoint buffer violate the DMA API?

The checkpoint array is embedded directly inside struct cmh_sm3_reqctx with=
out
ARCH_DMA_MINALIGN alignment, which can lead to cacheline corruption on
non-coherent architectures when adjacent fields are modified.

Additionally, if the request context is allocated on the stack (for instance
via AHASH_REQUEST_ON_STACK) on a system with CONFIG_VMAP_STACK enabled, map=
ping
a stack address results in a bogus physical address and can cause kernel
panics.

[ ... ]
> +	ret =3D cmh_vcq_pack_and_submit_async(cmds, idx, rctx->packed,
> +					    CMH_SM3_MAX_PACKED,
> +					    d.mbx_idx,
> +					    cmh_sm3_update_complete, req,
> +					    !!(req->base.flags &
> +					       CRYPTO_TFM_REQ_MAY_BACKLOG),
> +					    cmh_tm_async_timeout_jiffies());
> +	if (ret && ret !=3D -EBUSY)
> +		goto err_unmap_ckpt;
> +
> +	/*
> +	 * Submit accepted (in flight or backlogged) -- only now move the tail
> +	 * into the holdback.  A synchronous rejection above (e.g. -EAGAIN)
> +	 * leaves rctx->buf/buf_len untouched so the caller can retry the
> +	 * identical update.
> +	 */
> +	if (tail_len > 0) {
> +		if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +			memcpy(rctx->buf, req->svirt + from_src, tail_len);
> +		else
> +			scatterwalk_map_and_copy(rctx->buf, req->src,
> +						 from_src, tail_len, 0);
> +	}
> +	rctx->buf_len =3D tail_len;

[Severity: High]
Is there a race condition here that could lead to a use-after-free or state
corruption?

This block modifies the holdback buffer (rctx->buf) and reads from the requ=
est
input (req->svirt or req->src) after ownership has already been yielded to =
the
hardware asynchronously via cmh_vcq_pack_and_submit_async().

If the hardware completes the operation quickly, the interrupt handler could
execute cmh_sm3_update_complete() on another CPU and signal completion to t=
he
caller. The caller could then free or reuse the request and its scatterlists
while this thread is still copying the tail bytes from the freed memory.

[ ... ]
> +static int cmh_sm3_submit_final(struct ahash_request *req,
> +				u8 *data_buf, u32 data_len)
> +{
[ ... ]
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    SM3_CONTEXT_SIZE,
> +						     DMA_TO_DEVICE);

[Severity: High]
Similarly, in the finalization stage, can mapping this embedded inline buff=
er
cause DMA API violations or kernel panics on vmap stacks?

[ ... ]
> +static int cmh_sm3_finup(struct ahash_request *req)
> +{
[ ... ]
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);
> +	if (!data_buf)
> +		return -ENOMEM;

[Severity: High]
Does this finup path have the same issue with large inputs?

Because data_len could be very large depending on the caller, this single
kmalloc attempt could deterministically fail if it exceeds KMALLOC_MAX_SIZE,
similar to the issue in the update path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D7
