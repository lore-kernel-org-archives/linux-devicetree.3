Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AC3446CE
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696832; cv=none; b=UWz3v+xWctrCp8o9n7HeJI7iBXRzgsborczlmfukNaRpox58J4IZAhskxMkapa9Q+rBqAceT58jF2QvYjnI/J1+4OIL2pcMF+Vc9zjmayKmkgCx/Ib7fp1WdHIYJbzrOuZUZX66m2LIVQzpiPVSPL3GjcCIjedaWtvBXMl8BjJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696832; c=relaxed/simple;
	bh=PYtwptbzi4MiIOq0y8hMpjaPI2SJ8ZWh+GAf5gai/iQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KZaiExQUr7fkft55DIO+HMSDXE/mdZ1pfSh2SGB6SA6WkOfk/KO2faPlLk3JjFHi1VI7gFGbhTkQb0GNsJ3g0cODDOCnyMSKeVHBRtN3VTz54FhxqGKGGOrRiZzCRjL/xXauLqsQtO8X5hBsb1xgp+Ldl0iT53iMCVX9l4BjxaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaOctzK/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaOctzK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256441F000E9;
	Tue, 25 Aug 2026 22:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787696830;
	bh=JsszKPAbs6z/jWvWVGZtRGLjVNyJ/A9q7LEOVa4LGpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DaOctzK/IpOGNyxc3qSWMIRPEaqce2P7AIg5TbGeAkKC9S20YKoedqDUkfnBlB9Nk
	 ikRp+wLK7jJfIARH4FPFuOkZToy/o+8KQzRFZXkdiNr9FoQfElpiOIuxdNQ38oHJWn
	 z8jA2FwAM/UwUcwuUuqI8oHVRSJF93nQ9a/J2RHCg+QPdf5sjEqvZhtYwohWysYItO
	 agOYXvy9v26PPrU0oZes984UjRzcOEKErtIKXVbgtE1X6BMcQsF3SwD3iRcfdWHk37
	 l9dtJjJcjR77RRQa2e9OHtUAbLBEHqyBbHIG26V/x3qBl5HbBHVkyQneMIOokNswNr
	 yBR2BXZ+KnlDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825221539.255951-5-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-5-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:27:09 +0000
Message-Id: <20260825222710.256441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] DMA mapping the inline `rctx->checkpoint` buffer violates DMA API =
rules and causes memory corruption due to cache-line sharing or stack mappi=
ng.
- [High] The driver linearizes arbitrary-length hash updates into a single =
kmalloc buffer, causing valid large updates to predictably fail with -ENOME=
M.
- [High] Misusing the crypto API `cra_blocksize` for hardware alignment bre=
aks SHAKE holdback logic, leading to hardware state corruption and potentia=
l buffer overflows.
- [High] Accessing `req->src` and `rctx` after submitting an asynchronous h=
ardware request causes a Use-After-Free.
- [Medium] The commit message claims zero-copy support for virtual buffers,=
 but the implementation unconditionally copies the data.
--

commit 100670a57b48ff51f5668c01fd9ada227bac5247
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SHA-2/SHA-3/SHAKE ahash

This commit registers various ahash algorithms (SHA-2, SHA-3, SHAKE) using
the CMH hash core. It implements the necessary operations for incremental
updates, request cloning, and handles hardware submissions.

>     Supports incremental update/finup/final, init/export/import for
>     request cloning, and the CRYPTO_AHASH_REQ_VIRT flag for zero-copy
>     from virtual buffers.

[Severity: Medium]
Does the driver actually perform zero-copy DMA for virtual buffers?

Looking at cmh_hash_update() and cmh_hash_finup(), the implementation
appears to unconditionally allocate a bounce buffer with kmalloc() and
then executes a memcpy() from req->svirt into the bounce buffer. Is there
a code path that avoids the allocation and directly maps the virtual buffer
to DMA, or should the commit message be updated to reflect the copy?

> diff --git a/drivers/crypto/cmh/cmh_hash.c b/drivers/crypto/cmh/cmh_hash.c
> new file mode 100644
> index 0000000000000..72d09c5b0c91f
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hash.c
[ ... ]
> +	{
> +		.hc_algo     =3D HC_ALGO_SHAKE128,
> +		.digest_size =3D CMH_SHAKE128_DIGEST_SIZE,
> +		.block_size  =3D 1,    /* XOF: no meaningful block for crypto API */
> +		.alg_name    =3D "shake128",
> +		.drv_name    =3D "rambus-cmh-shake128",
> +	},
[ ... ]
> +static int cmh_hash_update(struct ahash_request *req)
> +{
[ ... ]
> +	/* Not enough for a full block -- just buffer */
> +	if (total_avail < block_size) {
> +		if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +			memcpy(rctx->buf + rctx->buf_len,
> +			       req->svirt, req->nbytes);

[Severity: High]
Does this logic bypass the software holdback for SHAKE algorithms?

Because block_size is explicitly defined as 1 to indicate byte-oriented
operation for the crypto API, the condition total_avail < block_size is
practically never met (only when total_avail is 0).

The hardware Keccak cores require intermediate updates to be multiples of
the algorithm's block rate (e.g., 168 bytes for SHAKE-128) to correctly
save the state. Submitting unaligned arbitrary byte fragments might
corrupt the hardware state. Additionally, CMH_HASH_MAX_BLOCK is 144, which
would not be able to hold back a true SHAKE-128 block of 168 bytes without
overflowing the array.

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
Will legitimate large hash requests deterministically fail with -ENOMEM
here?

The ahash API does not enforce a maximum size on req->nbytes, and clients
like IPsec, IMA, or AF_ALG can submit very large scatterlists. Because
kmalloc() is strictly limited to KMALLOC_MAX_SIZE and can fail earlier due
to fragmentation, dynamically allocating a contiguous buffer for an
arbitrary-length user-provided req->nbytes causes large updates to predicta=
bly
fail with -ENOMEM.

[ ... ]
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    HC_CONTEXT_SIZE,
> +						     DMA_TO_DEVICE);

[Severity: High]
Does DMA mapping the inline rctx->checkpoint violate the DMA API rules?

The checkpoint array is embedded inline in struct cmh_hash_reqctx without
being aligned to the cacheline. If the request context is allocated on the
stack (e.g., via AHASH_REQUEST_ON_STACK), this maps stack memory for DMA,
which is prohibited by the DMA API and may trigger a kernel panic.

Even if heap-allocated, the unaligned array shares a cache line with
adjacent members like rctx->packed. Modifying these adjacent fields while
DMA is active could corrupt the checkpoint data (or vice versa) on
non-coherent architectures. This same mapping also happens in
cmh_hash_submit_final().

[ ... ]
> +	ret =3D cmh_vcq_pack_and_submit_async(cmds, idx, rctx->packed,
> +					    CMH_HASH_MAX_PACKED,
> +					    d.mbx_idx,
> +					    cmh_hash_update_complete, req,
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
Can accessing req->src and rctx after submitting an asynchronous hardware
request result in a use-after-free?

Once cmh_vcq_pack_and_submit_async() submits the request to the hardware,
the completion callback cmh_hash_update_complete() could run immediately
on another CPU and signal completion to the client. The client is then
free to release the ahash_request (which contains rctx) and the source
scatterlist (req->src).

If the original thread continues execution and attempts to copy the tail
data into rctx->buf using req->src, it will access freed memory.

[ ... ]
> +static int cmh_hash_finup(struct ahash_request *req)
> +{
[ ... ]
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);
> +	if (!data_buf)
> +		return -ENOMEM;

[Severity: High]
Similar to the allocation in cmh_hash_update(), could this unbounded
contiguous allocation fail deterministically for valid large requests?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D4
