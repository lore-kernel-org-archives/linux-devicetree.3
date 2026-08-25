Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD43546CD
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697049; cv=none; b=fqxrm/3824EZmuwcEGrmBrgbchZSzvetFACHuzvxczcI0x81YMw4D8l/C7S/nSDjyPzbLHa/FApStFque5CfC2AYshdU3FEeljqvjgzPOtbjxfM01prZLVEfCFZNkvuLhnJASlJyHmBXJcbF5S2MH0YbA1DLtjolsRRqmdObhVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697049; c=relaxed/simple;
	bh=oIsajSK3g9WBGCo3hAhRCnSH4sVOduQ72Dm9U1AKdIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZyfMeIFnruPqJnRNsUAcsMc1xxBkxyPava1IxQj/RlP3Tmak3rhdoAyXOx0pU/Qe/p2e5yQUoxLIYa9WOOSISiWNq0NWV4q/KTMBPUpbldaqLpb1Heg9NvbhpBQa91ktL8gO6IPlFkF/7t+WruXQQ0ba1d7GRI8Ao5pQC/c/AvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctgkGJQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctgkGJQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDDE1F000E9;
	Tue, 25 Aug 2026 22:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697048;
	bh=kaFW39WnF6bXIsAzZkTvmq4YrMAvvXCoHRg/H4bmIcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ctgkGJQ3hPhUVuB5EUWzhEzLosQgm9/NjXt57dTZlQDPmtoWBNemkANVNVGtMtngX
	 VIVDeM8vIBLgzfunbZraM1zFRazhs6o45XR1eBaTBl62TTo0O++jd97ZW1XcYtqzZL
	 kkvPgezxgTEGzGn0hHR3Yb4CxZv2/IH6eW8w97FOmCe1kmGpuAGBSRHTyT2GlEGUpo
	 maGL66Oq49y4D9J13uxySGMuBQ+yXwjBBlw3YLVgXYnPt9pAd0tKU6Z8gR4WsAjFD9
	 YeYsloMzkgeo8kLSaOlOZ5sSF/q3OAGkE4COAJirukGgwIJTRTXstCKx9H+IpTU/B7
	 yIdFKv7G6Azww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/19] crypto: cmh - add CSHAKE/KMAC ahash
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260825221539.255951-7-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-7-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:30:47 +0000
Message-Id: <20260825223048.2BDDE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver illegally maps a request context field (`rctx->checkpoi=
nt`) for DMA, which may reside on the stack, causing IOMMU faults or memory=
 corruption.
- [High] Unbounded kernel memory leak (OOM vector) on abandoned KMAC reques=
ts because dynamically allocated chunks are orphaned onto a TFM-scoped list.
- [High] Race condition between tail holdback updates and asynchronous comp=
letion handler.
- [High] Use of spin_lock_bh() on a lock that can be acquired from hardirq =
context.
- [Medium] Unbounded `kmalloc` in `cmh_cshake_update` and `cmh_cshake_finup=
` breaks the API contract for large inputs.
- [Medium] State destruction on retryable synchronous rejection breaks the =
crypto API contract in cSHAKE and KMAC.
- [Medium] Defining export/import stubs for unsupported algorithms breaks t=
estmgr initialization.
--

commit 937f2b2e4d41db65f3412cfc2efce49cf5c88cf2
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add CSHAKE/KMAC ahash

Registers ahash algorithms for cSHAKE128, cSHAKE256, KMAC128, and KMAC256
using the CMH hash core. cSHAKE supports incremental update and export/impo=
rt,
while KMAC has a 64KB data cap.

> diff --git a/drivers/crypto/cmh/cmh_cshake.c b/drivers/crypto/cmh/cmh_csh=
ake.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_cshake.c
[ ... ]
> +static int cmh_cshake_update(struct ahash_request *req)
> +{
[ ... ]
> +	rctx->data_buf =3D kmalloc(full_len, gfp | __GFP_NOWARN);
> +	if (!rctx->data_buf)
> +		return -ENOMEM;

[Severity: Medium]
Can this allocation fail for large inputs? The buffer size scales directly
with the unconstrained user-supplied req->nbytes, which might trigger an
unbounded allocation.

[ ... ]
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    HC_CONTEXT_SIZE,
> +						    DMA_TO_DEVICE);

[Severity: High]
Does this map stack memory directly for DMA?

If a caller uses AHASH_REQUEST_ON_STACK to allocate the request, mapping the
inline context field rctx->checkpoint will generate invalid physical addres=
ses
on systems with CONFIG_VMAP_STACK enabled, causing IOMMU faults or memory
corruption.

> +		if (cmh_dma_map_error(rctx->ckpt_dma)) {
> +			ret =3D -ENOMEM;
> +			goto err_unmap_save;
> +		}
> +	}
[ ... ]
> +	ret =3D cmh_vcq_pack_and_submit_async(cmds, idx, rctx->packed,
> +					    CMH_CSHAKE_MAX_PACKED,
> +					    d.mbx_idx,
> +					    cmh_cshake_update_complete, req,
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
Does updating the tail holdback after submitting the asynchronous hardware
command introduce a race condition?

If the hardware processing completes instantly, the callback executes and
allows the caller to submit a new request while this thread is still modify=
ing
the holdback buffer, leading to state corruption.

> +
> +	if (ret =3D=3D -EBUSY)
> +		return -EBUSY;
[ ... ]
> +static int cmh_cshake_submit_final(struct ahash_request *req,
> +				   u8 *data_buf, u32 data_len)
> +{
[ ... ]
> +	rctx->ckpt_dma =3D DMA_MAPPING_ERROR;
> +	if (rctx->has_checkpoint) {
> +		rctx->ckpt_dma =3D cmh_dma_map_single(rctx->checkpoint,
> +						    HC_CONTEXT_SIZE,
> +						    DMA_TO_DEVICE);

[Severity: High]
Can this map a stack-allocated request context for DMA in the finalization =
path,
leading to the same memory corruption issue if AHASH_REQUEST_ON_STACK is us=
ed?

> +		if (cmh_dma_map_error(rctx->ckpt_dma)) {
> +			ret =3D -ENOMEM;
> +			goto err_unmap_data;
> +		}
> +	}
[ ... ]
> +err_free_digest:
> +	kfree(rctx->digest_buf);
> +	rctx->digest_buf =3D NULL;
> +err_free_data:
> +	kfree(data_buf);
> +	rctx->data_buf =3D NULL;
> +	cmh_cshake_free_reqctx(rctx);
> +	return ret;

[Severity: Medium]
Does clearing has_checkpoint in this error path break the API contract?

If the hardware submission is rejected synchronously (e.g., -EAGAIN or
-ENOSPC), the caller is expected to retry, but the ability to resume on ret=
ry
has been destroyed.

> +}
[ ... ]
> +static int cmh_cshake_finup(struct ahash_request *req)
> +{
[ ... ]
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	data_buf =3D kmalloc(data_len, gfp | __GFP_NOWARN);
> +	if (!data_buf)
> +		return -ENOMEM;

[Severity: Medium]
Will this unconstrained allocation fail if the caller provides a very large
input for the combined update and final transaction?

[ ... ]
> +	if (req->nbytes > 0) {
> +		if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +			memcpy(data_buf + rctx->buf_len,
> +			       req->svirt, req->nbytes);
> +		else
> +			scatterwalk_map_and_copy(data_buf + rctx->buf_len,
> +						 req->src, 0,
> +						 req->nbytes, 0);
> +	}
> +
> +	rctx->buf_len =3D 0;
> +	return cmh_cshake_submit_final(req, data_buf, data_len);

[Severity: Medium]
Is it safe to clear rctx->buf_len before knowing if the hardware will
accept the submission?

If cmh_cshake_submit_final() returns -EAGAIN, the caller will retry, but the
holdback tail has already been cleared.

> +}
[ ... ]
> diff --git a/drivers/crypto/cmh/cmh_kmac.c b/drivers/crypto/cmh/cmh_kmac.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_kmac.c
[ ... ]
> +static void cmh_kmac_free_chunks(struct cmh_kmac_reqctx *rctx,
> +				 struct cmh_kmac_tfm_ctx *tctx)
> +{
> +	struct cmh_kmac_chunk *chunk, *tmp;
> +
> +	spin_lock_bh(&tctx->chunk_lock);

[Severity: High]
Could using spin_lock_bh() lead to deadlocks?

The crypto ahash API can be called from a hardirq context. Because
spin_lock_bh() does not disable hardirqs, a hardware interrupt could spin
indefinitely on this lock if it attempts to acquire it while a softirq alre=
ady
holds it.

> +	list_for_each_entry_safe(chunk, tmp, &rctx->chunks, list) {
> +		list_del(&chunk->list);
> +		list_del(&chunk->tfm_node);
> +		kfree(chunk);
> +	}
> +	spin_unlock_bh(&tctx->chunk_lock);
> +	rctx->num_chunks =3D 0;
> +	rctx->total_len =3D 0;
> +}
[ ... ]
> +static int cmh_kmac_init(struct ahash_request *req)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_kmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	rctx->info =3D cmh_kmac_get_info(tfm);
> +	rctx->error =3D 0;
> +	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
Does re-initializing the request list drop tracking of previously accumulat=
ed
chunks?

If an earlier request was abandoned and not finalized properly, this leaves
the chunks orphaned in the TFM-scoped tctx->all_chunks list, creating a
memory leak.

> +	rctx->num_chunks =3D 0;
> +	rctx->total_len =3D 0;
> +
> +	return 0;
> +}
> +
> +static int cmh_kmac_update(struct ahash_request *req)
> +{
[ ... ]
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes,
> +			req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +			GFP_KERNEL : GFP_ATOMIC);
> +	if (!chunk) {
> +		rctx->error =3D -ENOMEM;
> +		goto err_free_chunks;
> +	}
> +
> +	chunk->len =3D req->nbytes;
> +	if (req->base.flags & CRYPTO_AHASH_REQ_VIRT) {
> +		memcpy(chunk->data, req->svirt, req->nbytes);
> +	} else {
> +		nents =3D sg_nents_for_len(req->src, req->nbytes);
> +		if (nents < 0 ||
> +		    sg_copy_to_buffer(req->src, nents,
> +				      chunk->data, req->nbytes) !=3D req->nbytes) {
> +			kfree(chunk);
> +			rctx->error =3D -EINVAL;
> +			goto err_free_chunks;
> +		}
> +	}
> +
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Is there an unbounded kernel memory leak here?

The chunks are dynamically allocated on the heap and tied to the TFM's life=
time
in tctx->all_chunks. If unprivileged userspace repeatedly creates and aband=
ons
requests (e.g. by closing an AF_ALG socket early), does it continuously leak
memory until an OOM panic occurs?

> +	rctx->num_chunks++;
> +	rctx->total_len +=3D req->nbytes;
> +
> +	return 0;
[ ... ]
> +static int cmh_kmac_final(struct ahash_request *req)
> +{
[ ... ]
> +out_free_sg:
> +	cmh_dma_free_sg(sgm);
> +
> +out_free:
> +	cmh_kmac_free_chunks(rctx, tctx);
> +	return ret;

[Severity: Medium]
Will this error path destroy all accumulated KMAC chunks if the hardware
submission is rejected synchronously?

This breaks the ability to retry on transient errors.

> +}
[ ... ]
> +static int cmh_kmac_export(struct ahash_request *req, void *out)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int cmh_kmac_import(struct ahash_request *req, const void *in)
> +{
> +	return -EOPNOTSUPP;
> +}

[Severity: Medium]
Do these stub implementations cause the testmgr to fail? The testmgr expects
that if export/import function pointers are non-NULL, the feature is suppor=
ted
and will try to exercise it.

[ ... ]
> +static void cmh_kmac_cra_exit(struct crypto_tfm *tfm)
> +{
> +	struct cmh_kmac_tfm_ctx *tctx =3D crypto_tfm_ctx(tfm);
> +	struct cmh_kmac_chunk *chunk, *tmp;
> +
> +	/* Free any orphaned chunks (e.g. testmgr export/reimport poison) */
> +	spin_lock_bh(&tctx->chunk_lock);

[Severity: High]
Does acquiring this lock with spin_lock_bh() during TFM destruction present
the same deadlock risk if hardirq accesses are possible?

> +	list_for_each_entry_safe(chunk, tmp, &tctx->all_chunks, tfm_node) {
> +		list_del(&chunk->tfm_node);
> +		kfree(chunk);
> +	}
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Is doing this sweep only at TFM teardown what permits the unbounded memory
growth during the TFM's lifetime for abandoned requests?

[ ... ]
> +	for (i =3D 0; i < CMH_KMAC_ALG_COUNT; i++) {
> +		const struct cmh_kmac_alg_info *info =3D
> +			&cmh_kmac_algs_info[i];
> +		struct cmh_kmac_alg_drv *drv =3D &cmh_kmac_drvs[i];
> +		struct ahash_alg *alg =3D &drv->alg;
> +
> +		drv->info =3D info;
> +
> +		alg->init   =3D cmh_kmac_init;
> +		alg->update =3D cmh_kmac_update;
> +		alg->final  =3D cmh_kmac_final;
> +		alg->finup  =3D cmh_kmac_finup;
> +		alg->digest =3D cmh_kmac_digest;
> +		alg->export =3D cmh_kmac_export;
> +		alg->import =3D cmh_kmac_import;

[Severity: Medium]
Is it problematic to expose these stubs to the crypto API by assigning them
here? The unsupported export/import will cause testmgr initialization to fa=
il.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D6
