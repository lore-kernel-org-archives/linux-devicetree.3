Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D94449980
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 20:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630054; cv=none; b=l/pgYRu9FbFCpngS3OaUWNlYzUEfKEl2zhBZLJRg6a5oDKRPo0/qqQ5b40OrC3xfSpZpb/ea6oWYxxjK0HkbxaDQRuihKfMLjbY0lO9NUTZSNqWdTtR5U1WOqxQhEgy7MqKfoSKKO2AJ/DhH28PR/ceHLu2rDYRCDsdZ42RCCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630054; c=relaxed/simple;
	bh=XzOiy1ghlJuZet3R9Xve/3GHgHS2RO8vjr2iRc9Wtqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G7Rx5H3KPaGNTy8UGyxy3WKpWo7tC7lKMMvd806ZZR8QDHe45AxLzF5wiYYtO76kVc88TcvbJWpjZeaRflCh4lRwMLQbyTGRLdG3xskzVTnwu57i2I2pthdJljkG+56T12WVZj4EzwszX/+r991nwluEMNmvngwL50SPHxv0yBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B26eP5VT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B26eP5VT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66F61F000E9;
	Thu,  9 Jul 2026 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783630051;
	bh=cCJQDEYQTZYo2V1zey3xyqvnVbl/x4d7XLJuWbjPT68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B26eP5VTtMvPgZ5xguneHQ2cEuJ1XwyYprpiGtF/iSX1hRJ09OWrtKNfKD/p8PR2l
	 ieT91D3YPIlL1evft9eRZISGjnGeYm5ajaXTiIScJlqHrG2WCZkxmzz9Z6zE/Zy68w
	 gPEdke6wUYL8tB7+FiQ9aGUJczBteXFot8fk2QRl1qSKasZ5ahM7LlVoU9r0CVp+IL
	 7PwmfMCm3mNbND1TuZsqtPlqu21rWrqf4UNZy95wJk+3etgMC98ezdMMLXsH5Hf9Rg
	 K80OhkG+NZ6fXgd3vZT8FVTZbHNsRHGsY4UwMCx3oYK0IoS59NNPllyz86SBu92ca1
	 ziNDG0I21T3HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/19] crypto: cmh - add CSHAKE/KMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709203037.1884436-7-skrishnamoorthy@rambus.com>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-7-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 20:47:31 +0000
Message-Id: <20260709204731.A66F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unbounded memory allocation in `cmh_cshake_update` allows local me=
mory exhaustion (OOM).
- [High] Orphaned chunk memory leak during ahash request re-initialization =
or abort.
- [High] Sleeping allocations and synchronous hardware submission in `.expo=
rt()` callback.
- [High] Use-After-Free when memory chunks are freed before their correspon=
ding DMA mappings are unmapped in `cmh_cshake_export`.
- [High] Softirq state corruption caused by using `spin_lock_bh()` in gener=
ic ahash callbacks.
- [High] DMA mapping of stack-allocated memory (`rctx->checkpoint`) violate=
s the DMA API.
--

--- Patch [6]: [PATCH v2 06/19] crypto: cmh - add CSHAKE/KMAC ahash ---
commit cc0628276b3e9843b67472a50c051e71a03197e3
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add CSHAKE/KMAC ahash

Register ahash algorithms for cSHAKE128, cSHAKE256, KMAC128, and
KMAC256 using the CMH hash core.  cSHAKE supports incremental
update and export/import.  KMAC has a 64KB data cap imposed by the
hardware.

> diff --git a/drivers/crypto/cmh/cmh_cshake.c b/drivers/crypto/cmh/cmh_csh=
ake.c
> new file mode 100644
> index 0000000000000..02f9b853dd338
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_cshake.c
[ ... ]
> +static int cmh_cshake_init(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_cshake_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_cshake_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	rctx->num_chunks =3D 0;

[Severity: High]
When the crypto framework re-uses an active request by calling the init
or import callbacks, does this overwrite the list head without freeing the
previously linked chunks?

For long-lived sessions, like IPsec or AF_ALG sockets, it seems the chunks
might remain permanently orphaned in the global tctx->all_chunks list,
leading to a progressive memory leak. Should we free the existing chunks
before re-initializing the list head here, and also in cmh_cshake_import()
and cmh_kmac_init()?

> +	rctx->total_len =3D 0;
> +	rctx->has_checkpoint =3D 0;
> +
> +	return 0;
> +}
> +
> +static int cmh_cshake_update(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_cshake_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_cshake_reqctx *rctx =3D ahash_request_ctx(req);
> +	struct cmh_cshake_chunk *chunk;
> +	int nents;
> +
> +	if (rctx->error)
> +		return rctx->error;
> +
> +	if (!req->nbytes)
> +		return 0;
> +
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes,
> +			req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +			GFP_KERNEL : GFP_ATOMIC);

[Severity: High]
Is there a limit on how much memory can be allocated here?

Unlike the KMAC implementation which enforces a 64KB cap, this appears to
unconditionally allocate memory for every incoming chunk and append it to
the request context. If an unprivileged local attacker streams endless
amounts of data to the cshake128 algorithm via an AF_ALG socket, could
this buffer the entire stream in memory and trigger the OOM killer?

> +	if (!chunk) {
> +		rctx->error =3D -ENOMEM;
> +		goto err_free_chunks;
> +	}
[ ... ]
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Is it safe to use the _bh spinlock variants in generic ahash callbacks?

The ahash API allows update and final operations to be invoked with hardware
interrupts disabled. spin_unlock_bh() internally calls local_bh_enable(),
which requires hardware IRQs to be enabled. Calling it from an IRQ-disabled
context might trigger warnings and corrupt the softirq state. Should this
use standard irqsave variants instead here and in cmh_kmac_update()?

> +	rctx->num_chunks++;
> +	rctx->total_len +=3D req->nbytes;
> +
> +	return 0;
[ ... ]
> +static int cmh_cshake_final(struct ahash_request *req)
> +{
[ ... ]
> +	/* Map checkpoint buffer if present (CMH eSW reads it) */
> +	if (rctx->has_checkpoint) {
> +		ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +					      HC_CONTEXT_SIZE, DMA_TO_DEVICE);

[Severity: High]
Can the rctx->checkpoint buffer be allocated on the stack?

The ahash_request structure is frequently allocated on the stack by kernel
subsystems using the AHASH_REQUEST_ON_STACK macro. Stack memory is not
guaranteed to be cache-line aligned or isolated, meaning a DMA operation
could overwrite adjacent active stack variables. Could this cause memory
corruption or kernel panics on architectures with non-coherent caches?

> +		if (cmh_dma_map_error(ckpt_dma)) {
> +			ret =3D -ENOMEM;
> +			goto out_unmap_digest;
> +		}
> +	}
[ ... ]
> +static int cmh_cshake_export(struct ahash_request *req, void *out)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_cshake_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_cshake_reqctx *rctx =3D ahash_request_ctx(req);
> +	const struct cmh_cshake_alg_info *info =3D rctx->info;
> +	struct core_dispatch d;
> +	struct vcq_cmd cmds[CMH_CSHAKE_MAX_PAYLOAD];
> +	struct cmh_sg_map *sgm =3D NULL;
> +	dma_addr_t save_dma =3D DMA_MAPPING_ERROR;
> +	dma_addr_t ckpt_dma =3D DMA_MAPPING_ERROR;
> +	u8 *save_buf;
> +	u32 idx;
> +	int ret;
> +
> +	if (rctx->num_chunks > 0) {
> +		sgm =3D cmh_cshake_build_sg(rctx, GFP_KERNEL);

[Severity: High]
Is it intended to unconditionally use GFP_KERNEL in the export callback?

The crypto API allows export and import to be called from non-sleepable
atomic contexts, such as inside network softirqs or under spinlocks.
Allocating with GFP_KERNEL can sleep, which might lead to deadlocks or
scheduling while atomic warnings if called from these contexts.

> +		if (!sgm)
> +			return -ENOMEM;
> +	}
> +
> +	save_buf =3D kzalloc(HC_CONTEXT_SIZE, GFP_KERNEL);
> +	if (!save_buf) {
> +		cmh_dma_free_sg(sgm);
> +		return -ENOMEM;
> +	}
[ ... ]
> +	vcq_add_hc_save(&cmds[idx++], d.core_id, (u64)save_dma,
> +			HC_CONTEXT_SIZE);
> +	vcq_add_flush(&cmds[idx++], d.core_id);
> +
> +	ret =3D cmh_vcq_pack_and_submit(cmds, idx, rctx->packed, CMH_CSHAKE_MAX=
_PACKED,
> +				      d.mbx_idx);

[Severity: High]
Could this synchronous hardware submission block in an atomic context?

Because export can be called from non-sleepable contexts, waiting for a
hardware response might block the CPU and cause system instability.

> +
> +	/* Unmap before CPU read */
> +	if (rctx->has_checkpoint)
> +		cmh_dma_unmap_single(ckpt_dma, HC_CONTEXT_SIZE, DMA_TO_DEVICE);
> +	cmh_dma_unmap_single(save_dma, HC_CONTEXT_SIZE, DMA_FROM_DEVICE);
> +
> +	if (!ret) {
> +		memcpy(out, save_buf, HC_CONTEXT_SIZE);
> +		/* Checkpoint now represents all accumulated state */
> +		memcpy(rctx->checkpoint, save_buf, HC_CONTEXT_SIZE);
> +		rctx->has_checkpoint =3D 1;
> +		/* Accumulated chunks are now captured in checkpoint */
> +		cmh_cshake_free_chunks(rctx, tctx);
> +	}
> +
> +	kfree(save_buf);
> +	cmh_dma_free_sg(sgm);

[Severity: High]
Does this free the chunks before tearing down their DMA mappings?

In the success path, cmh_cshake_free_chunks() loops over the chunks and
frees them. Immediately afterward, cmh_dma_free_sg() iterates and calls
dma_unmap_single() on the addresses mapping those newly freed chunks.

The DMA API requires that memory must be unmapped from the device prior
to being freed back to the allocator. Could this sequence lead to cache
and memory corruption?

> +	return ret;
> +}
> +
> +static int cmh_cshake_import(struct ahash_request *req, const void *in)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_cshake_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_cshake_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	rctx->num_chunks =3D 0;

[Severity: High]
Similar to the issue in cmh_cshake_init(), does this overwrite the list head
without freeing the existing chunks, causing an orphaned memory leak?

> +	rctx->total_len =3D 0;
> +
> +	memcpy(rctx->checkpoint, in, HC_CONTEXT_SIZE);
> +	rctx->has_checkpoint =3D 1;
> +
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/crypto/cmh/cmh_kmac.c b/drivers/crypto/cmh/cmh_kmac.c
> new file mode 100644
> index 0000000000000..7177a2558e977
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_kmac.c
[ ... ]
> +static int cmh_kmac_init(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_kmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_kmac_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	rctx->num_chunks =3D 0;

[Severity: High]
As with the cSHAKE implementation, does this re-initialization leak the
previously buffered chunks by overwriting the list head without freeing the=
m?

> +	rctx->total_len =3D 0;
> +
> +	return 0;
> +}
> +
> +static int cmh_kmac_update(struct ahash_request *req)
> +{
[ ... ]
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
As noted in the cSHAKE update function, does using the _bh spinlock variants
here risk corrupting the softirq state if called from an IRQ-disabled
context?

> +	rctx->num_chunks++;
> +	rctx->total_len +=3D req->nbytes;
> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709203037.1884=
436-1-skrishnamoorthy@rambus.com?part=3D6
