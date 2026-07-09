Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6632B399350
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629959; cv=none; b=CqRUlFtjZ2NO1DcxK51kFZ7IzVoEvqJ0lZPWfzvDnpnW+vmavN2LUEr+3g0zXxhWoBN6YNAKWGxKCE67cL/22sremvL0dL1wjvdmwF2De8XSFN+wMfcHBeXWN/MgMYiMUHypQShxZkfa09k2Z8v/TeZFYOCq/SaJrBsOUo05Nes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629959; c=relaxed/simple;
	bh=1AzhMmUmI0iVoHKa6f+P5wL1HZG9WqHB7NpqvmIROXU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ISVOP+CeBEb+THqKAAB5+IJafXixdodCpzKd9smY4fEih/n/ur+U9WAC8Jw8OoLB3eygYuqDZqvXm1fvtOkEfQyV/LFBbkfc5s+J2m0svn/C/m3vYu9p0Bpm8AeSbidEllCbfmvWHEAIUsHE8HQOOTXJy5DnyMV5Jv5XLYWwtPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VE7NP3NY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE7NP3NY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ADC1F000E9;
	Thu,  9 Jul 2026 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783629957;
	bh=EJM4euXwSE8eX+aVDxxzxPk27aThBgnIhpi9IAVmwz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VE7NP3NYUn2aBePZQY1P8KYEFsixH//PhsAKV+EHxyU73sSOKg+B+veSplP4Dcmxi
	 X4GDOA/dwukI6mQn6IOLhSxKlLtHTlO0f4POON07qp5h0L0Uw2eh6XUPnWWRJkQqsE
	 +RXdqmE8SxeRYw+ToCQleN0NBMmefR9kfrjUbbjm84ItPfVGC+1QTCt6sdX839ApT5
	 ++EWhUkHTItxLihlJiLcLTSgfsTwdvEMFL3O9sgRUzMe6FUVdbmDQPRj7CGmpTY5S1
	 VvwhWn/bKl0Hn0Z1rgBX7MU0BVwxau+Z/YrBkr40/Ccx1inoMClTpSX2hwsV4Qnar+
	 sHNnxfMyr/mSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709203037.1884436-5-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-5-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:45:56 +0000
Message-Id: <20260709204556.A1ADC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Integer underflow and overflow in buffer length calculations c=
ause massive out-of-bounds memory corruption.
- [High] Reusing API `block_size` for internal holdback breaks hardware Kec=
cak state for SHAKE algorithms.
- [High] DMA mapping an embedded stack buffer violates the DMA API and caus=
es memory corruption.
- [Medium] Linearizing arbitrary-length payloads into a single `kmalloc` bu=
ffer leads to ENOMEM DoS.
- [Medium] Information leak of uninitialized kernel memory in state export.
- [Medium] Mutating internal request state before verifying resource alloca=
tions causes permanent state corruption on transient errors.
--

--- Patch [4]: [PATCH v2 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash -=
--
commit e7705891a076afa5f048f03e13336b71200b908c
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add SHA-2/SHA-3/SHAKE ahash

Register ahash algorithms for SHA-224, SHA-256, SHA-384, SHA-512,
SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128, and SHAKE256
using the CMH hash core (core ID 0x02).

> diff --git a/drivers/crypto/cmh/cmh_hash.c b/drivers/crypto/cmh/cmh_hash.c
> new file mode 100644
> index 0000000000000..2256bf4314c33
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_hash.c
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
Could this array cause memory corruption during DMA unmap?

The checkpoint array is embedded here without cacheline alignment padding.=
=20
Since ahash_request contexts can be allocated on the stack (for instance, v=
ia=20
AHASH_REQUEST_ON_STACK in networking subsystems), cache invalidations durin=
g=20
DMA unmap might silently corrupt adjacent struct members like buf and packe=
d on=20
non-cache-coherent architectures. Additionally, the DMA API strictly forbid=
s=20
mapping stack memory.

> +	struct vcq_cmd packed[CMH_HASH_MAX_PACKED];
> +};
[ ... ]
> +static int cmh_hash_update(struct ahash_request *req)
> +{
> +	struct cmh_hash_reqctx *rctx =3D ahash_request_ctx(req);
> +	const struct cmh_hash_alg_info *info =3D rctx->info;
> +	struct vcq_cmd cmds[CMH_HASH_MAX_PAYLOAD];
> +	struct core_dispatch d;
> +	u32 block_size =3D info->block_size;
> +	u32 total_avail, full_len, tail_len, from_src;
> +	u32 idx;
> +	int ret;
> +	gfp_t gfp;
[ ... ]
> +	/* Have at least one full block -- submit to HW */
> +	full_len =3D total_avail - total_avail % block_size;

[Severity: High]
Does this break the hardware Keccak state for SHAKE algorithms?

The Linux crypto API requires cra_blocksize =3D 1 for byte-oriented XOFs li=
ke
SHAKE. Here, the driver reuses info->block_size for hardware holdback
calculations. For SHAKE, this results in full_len being calculated on unali=
gned
1-byte boundaries, whereas the hardware Keccak core requires SAVE and RESTO=
RE
operations to occur strictly on full rate-aligned boundaries (168 or 136 by=
tes).

> +	tail_len =3D total_avail - full_len;
> +	from_src =3D full_len - rctx->buf_len;

[Severity: Critical]
Is it possible for from_src to underflow here?

If an attacker uses AF_ALG to export state, alters state->buf_len to be lar=
ger
than the algorithm's block_size (for example, 100 for SHA-256 where block_s=
ize
is 64), and imports it, this bypasses the 144-byte MAX_BLOCK check in
cmh_hash_import.

A subsequent update calculates total_avail =3D 100 + 10 =3D 110, full_len =
=3D 64,
and from_src =3D 64 - 100 =3D -36. The u32 underflow results in 0xFFFFFFDC,=
 which
passes a > 0 check further down and copies a massive amount of memory from =
user
space into the kmalloc buffer.

> +
> +	/* Linearise: holdback prefix + full blocks from scatterlist */
> +	rctx->data_buf =3D kmalloc(full_len, gfp);

[Severity: Medium]
Could this allocation fail and cause a denial of service?

This attempts to allocate a physically contiguous buffer for the entire inp=
ut
payload. If users provide multi-megabyte payloads (for instance, through
dm-crypt or AF_ALG), this request will easily exceed the page allocator's
MAX_ORDER limit and fail with -ENOMEM. Processing large scatterlists might
need to be done in smaller, fixed-size chunks.

> +	if (!rctx->data_buf)
> +		return -ENOMEM;
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
Will this corrupt the cryptographic request state on transient memory press=
ure?

The persistent state (rctx->buf_len and rctx->buf) is advanced before
verifying the kzalloc and cmh_dma_map_single allocations. If an allocation
fails and returns an error without restoring the previous state, the full_l=
en
payload is lost. If the caller retries or ignores the error, the hash output
will be incorrect.

> +
> +	/* DMA map data, save output, and checkpoint */
> +	rctx->data_dma =3D cmh_dma_map_single(rctx->data_buf, full_len,
> +					    DMA_TO_DEVICE);
> +	if (cmh_dma_map_error(rctx->data_dma)) {
> +		ret =3D -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	rctx->save_dma =3D cmh_dma_map_single(rctx->save_buf, HC_CONTEXT_SIZE,
> +					    DMA_FROM_DEVICE);
> +	if (cmh_dma_map_error(rctx->save_dma)) {
> +		ret =3D -ENOMEM;
> +		goto err_unmap_data;
> +	}
> +
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    HC_CONTEXT_SIZE,
> +						     DMA_TO_DEVICE);

[Severity: High]
Does this violate the DMA API by mapping an embedded struct member?

This maps the checkpoint array which is embedded directly in the ahash_requ=
est
context. As mentioned above, this can map stack memory (forbidden by the DMA
API) and lacks cacheline alignment, which can lead to memory corruption dur=
ing
the mapping and unmapping operations.

> +		if (cmh_dma_map_error(rctx->ckpt_dma)) {
> +			ret =3D -ENOMEM;
> +			goto err_unmap_save;
> +		}
> +	}
[ ... ]
> +static int cmh_hash_finup(struct ahash_request *req)
> +{
> +	struct cmh_hash_reqctx *rctx =3D ahash_request_ctx(req);
> +	u32 data_len;
> +	u8 *data_buf;
> +	gfp_t gfp;
> +
> +	if (rctx->error)
> +		return rctx->error;
> +
> +	data_len =3D rctx->buf_len + req->nbytes;

[Severity: Critical]
Is this data_len calculation vulnerable to integer overflow?

Because data_len is a 32-bit u32, if req->nbytes is close to 4GB, the sum
can overflow. This would lead to a tiny 0-byte kmalloc allocation followed
by a massive memcpy.

> +
> +	if (data_len =3D=3D 0)
> +		return cmh_hash_submit_final(req, NULL, 0);
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp);

[Severity: Medium]
Can this large kmalloc cause a denial of service for large payloads?

Similar to the update path, attempting to allocate contiguous memory for the
entire payload plus holdback can exceed MAX_ORDER and fail reliably for lar=
ge
scatterlists.

> +	if (!data_buf)
> +		return -ENOMEM;
[ ... ]
> +static int cmh_hash_export(struct ahash_request *req, void *out)
> +{
> +	struct cmh_hash_reqctx *rctx =3D ahash_request_ctx(req);
> +	struct cmh_hash_export_state *state =3D out;
> +
> +	if (rctx->hw_started && rctx->has_checkpoint)
> +		memcpy(state->checkpoint, rctx->checkpoint, HC_CONTEXT_SIZE);
> +	else
> +		memset(state->checkpoint, 0, HC_CONTEXT_SIZE);
> +
> +	if (rctx->buf_len > 0)
> +		memcpy(state->buf, rctx->buf, rctx->buf_len);

[Severity: Medium]
Could this leak uninitialized kernel memory to callers?

This copies rctx->buf_len bytes into state->buf but does not clear the rest=
 of
the array. When the partial struct is populated into the caller's out buffer
(which is often uninitialized, such as with AF_ALG), the remaining padding =
and
trailing bytes retain stale kernel memory, which might later be exported or
dumped.

> +
> +	state->buf_len =3D rctx->buf_len;
> +	state->hw_started =3D rctx->hw_started;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D4
