Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC5494810
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047017; cv=none; b=mgfU2uveztqkdJmvyPWfOrV078Eqyg8nC1sjmEgARhZLNMZQLvOT5ZSOZKAs2P/BN8t0TTAB0niqF4RexJ8jGXuPVR1C7RPWAXyn8S7GvJzMHzPjPo3mHVtqFaZ2WNFs+vwlHMK2Y6Q3bSKdPdQ8+1UwejPhR5cLW6iWm5WpcXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047017; c=relaxed/simple;
	bh=vWTICHFOcG9oRclLiILeZ6tPxEnFEthccnu14kC90r0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LEw6Vra/9Zo4koFlK1I+/LU0RX/L+szuKecVou8s0gmDHLqZAmRYzT9Yqta87v9fTFMBTbJEU+HEoURzlDU5lKiv47MGEHLx0HND9xgwwR3JlZ0cRGrh2q0eBUwEwMIoG74rqh6XHMyZBrkP2lILEWL7XKGbkOa8AQGi82NHUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNbeYnkY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNbeYnkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A80B1F000E9;
	Thu,  6 Aug 2026 20:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047012;
	bh=1zm+nGX5s6QzSWPlMZAD2Q9n1AZrHppykik7L5cP+gQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HNbeYnkYBa7cCtvhV0kNx1f15EefXobuuyrvyBDwQpqRlpivneDvcLlUYv3ztJpuA
	 pCD58yoOx1tj4b8VVF3mrxdofyFxfpKFP/CljhKIpWLIHeNr41toXHHpgUy6bwCGt2
	 mSHCTonKAa0ETS3KMyuefAXcxsXjoW/aliTD8Wky2SqZRJvdt5tX5MsWQAFqw/mgxn
	 ILtFNooJkl1x43UcnqOgTG4KlL0jM7j1Yh/EHOF0Xb3c7tA0HrhfiZVdOcbYF8aUoU
	 vmaif9WfvliePjDN4nRLKg8Kz4rL15OjRQpZm0Rm/SEgJJ7s3ruPlAzBLBc7Jwtotm
	 RgFs2oADgQAHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/19] crypto: cmh - add AES skcipher/aead/cmac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806195519.2703224-9-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-9-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:10:11 +0000
Message-Id: <20260806201011.6A80B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unbounded memory accumulation of dynamically allocated chunks in t=
he CMAC ahash driver allows a local attacker to exhaust kernel memory (OOM).
- [High] Missing `chunksize` specification for CTR and CFB stream modes bre=
aks keystream continuity on partial block updates.
- [Medium] CFB-128 mode incorrectly computes the IV offset for non-block-al=
igned requests, resulting in corrupted IVs.
- [Medium] The skcipher implementation attempts massive physically contiguo=
us allocations via `kmalloc()`, causing deterministic failures for large re=
quests.
- [Medium] Missing AAD (Associated Data) copy for out-of-place AEAD operati=
ons.
- [Medium] Large user-controlled kmalloc allocations without `__GFP_NOWARN`=
 in the AEAD encrypt/decrypt paths can trigger page allocation failure spla=
ts.
--

--- Patch [8]: [PATCH v3 08/19] crypto: cmh - add AES skcipher/aead/cmac ---
commit 42f9420f62ca78ab729b2164543a52275ed3c503
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add AES skcipher/aead/cmac

Registers AES algorithms using the CMH AES core (core ID 0x03).
Supports skcipher, aead, and ahash with AES. Handles key sizes of
128, 192, and 256 bits.

> diff --git a/drivers/crypto/cmh/cmh_aes.c b/drivers/crypto/cmh/cmh_aes.c
> new file mode 100644
> index 0000000000000..36db9eabce8ab
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes.c

[ ... ]

> +	case AES_MODE_CFB:
> +		/*
> +		 * CFB-128 chains on the last ciphertext block.  On encrypt,
> +		 * that is out_buf; on decrypt, it is in_buf.
> +		 *
> +		 * For sub-block requests (cryptlen < 16), there is no
> +		 * complete ciphertext block to chain, so the IV is left
> +		 * unchanged -- CFB-128 has no defined chaining semantic
> +		 * for partial blocks (shift-register CFB-n is a different
> +		 * mode).  Without this guard the pointer arithmetic
> +		 * underflows and reads before the buffer.
> +		 */
> +		if (req->cryptlen >=3D bs) {
> +			if (op =3D=3D AES_OP_ENCRYPT)
> +				memcpy(req->iv, out_buf + req->cryptlen - bs,
> +				       bs);
> +			else
> +				memcpy(req->iv, in_buf + req->cryptlen - bs,
> +				       bs);
> +		}
> +		break;

[Severity: Medium]
Is the IV for CFB-128 correctly calculated here when cryptlen is not a
multiple of the block size?

When req->cryptlen is not block-aligned, copying from
out_buf + req->cryptlen - bs results in an unaligned window that spans the
trailing partial block and the preceding block.

Could this produce a corrupted IV for subsequent chaining?

[ ... ]

> +	/*
> +	 * Linearise input from scatterlist.  cryptlen is user-controlled up
> +	 * to CMH_AES_MAX_CRYPTLEN (well above KMALLOC_MAX_SIZE), so use
> +	 * __GFP_NOWARN: an oversized request fails cleanly with -ENOMEM
> +	 * instead of splatting the page allocator.
> +	 */
> +	rctx->in_buf =3D kmalloc(req->cryptlen, gfp | __GFP_NOWARN);

[Severity: Medium]
Will this allocation always fail for large valid requests?

Since req->cryptlen can be up to CMH_AES_MAX_CRYPTLEN (32MB), which
significantly exceeds the maximum page allocator order (KMALLOC_MAX_SIZE,
usually 4MB), a contiguous kmalloc will deterministically fail for sizes ab=
ove
that limit.

[ ... ]

> +		alg->base.cra_priority  =3D 300;
> +		alg->base.cra_flags     =3D CRYPTO_ALG_KERN_DRIVER_ONLY |
> +					  CRYPTO_ALG_ASYNC;
> +		alg->base.cra_blocksize =3D aes_is_stream_mode(info->aes_mode)
> +					  ? 1 : CMH_AES_BLOCK_SIZE;
> +		alg->base.cra_ctxsize  =3D sizeof(struct cmh_aes_tfm_ctx);

[Severity: High]
Is there a missing chunksize specification for CTR and CFB stream modes?

The cra_blocksize is set to 1, but chunksize is omitted, defaulting to 1.
For hardware engines that process in 16-byte blocks and do not save unconsu=
med
keystream between requests, won't submitting partial block updates cause the
hardware to discard remaining keystream bytes and break continuity on the
next update? Setting chunksize to the hardware block size would force
framework buffering.

> diff --git a/drivers/crypto/cmh/cmh_aes_aead.c b/drivers/crypto/cmh/cmh_a=
es_aead.c
> new file mode 100644
> index 0000000000000..9740e7e57b20f
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes_aead.c

[ ... ]

> +	if (!error) {
> +		/* GCM empty-input decrypt: compare computed tag with expected */
> +		if (rctx->empty_gcm_fallback && !rctx->encrypting) {
> +			if (crypto_memneq(rctx->tag_buf, rctx->in_buf,
> +					  rctx->authsize))
> +				error =3D -EBADMSG;
> +		}
> +		if (!error && rctx->cryptlen > 0)
> +			scatterwalk_map_and_copy(rctx->out_buf, req->dst,
> +						 req->assoclen,
> +						rctx->cryptlen, 1);
> +		if (!error && rctx->encrypting)
> +			scatterwalk_map_and_copy(rctx->tag_buf, req->dst,
> +						 req->assoclen +
> +						rctx->cryptlen,
> +						rctx->authsize, 1);
> +	}

[Severity: Medium]
Does this completion handler copy the associated data (AAD) to the destinat=
ion
buffer?

For out-of-place AEAD operations where req->src !=3D req->dst, the crypto A=
PI
requires the driver to copy the AAD from source to destination. The payload
and tag are copied starting at req->assoclen, but the AAD region from 0 to
req->assoclen - 1 appears to be left uninitialized.

[ ... ]

> +	memset(rctx, 0, sizeof(*rctx));
> +	rctx->cryptlen =3D cryptlen;
> +	rctx->assoclen =3D req->assoclen;
> +	rctx->authsize =3D authsize;
> +	rctx->encrypting =3D (aes_op =3D=3D AES_OP_ENCRYPT);
> +
> +	/* Linearise AAD */
> +	if (req->assoclen > 0) {
> +		rctx->aad_buf =3D kmalloc(req->assoclen, gfp);
> +		if (!rctx->aad_buf)
> +			return -ENOMEM;

[Severity: Medium]
Can these kmalloc calls trigger page allocation failure splats in the kernel
log?

The sizes are derived from user-controlled req->cryptlen and req->assoclen
(up to 1MB). When executed under memory pressure or with GFP_ATOMIC, large
contiguous allocations can fail loudly without the __GFP_NOWARN flag.

> diff --git a/drivers/crypto/cmh/cmh_aes_cmac.c b/drivers/crypto/cmh/cmh_a=
es_cmac.c
> new file mode 100644
> index 0000000000000..4cb3832780575
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_aes_cmac.c

[ ... ]

> +static int cmh_aes_cmac_init(struct ahash_request *req)
> +{
> +	struct cmh_aes_cmac_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	memset(rctx, 0, sizeof(*rctx));
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	return 0;
> +}

[Severity: High]
Can this result in orphaned chunks being leaked into the TFM list?

Any previously accumulated chunks linked from rctx->chunks will lose their
list head when rctx is zeroed, while remaining tracked in the long-lived
tctx->all_chunks list.

[ ... ]

> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes, gfp);
> +	if (!chunk) {
> +		ret =3D -ENOMEM;
> +		goto err_free_chunks;
> +	}
> +
> +	chunk->len =3D req->nbytes;
> +	if (req->base.flags & CRYPTO_AHASH_REQ_VIRT)
> +		memcpy(chunk->data, req->svirt, req->nbytes);
> +	else
> +		scatterwalk_map_and_copy(chunk->data, req->src,
> +					 0, req->nbytes, 0);
> +
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);
> +	rctx->total_len +=3D req->nbytes;
> +	return 0;

[Severity: High]
Does this permit a local attacker to exhaust kernel memory?

By repeatedly triggering updates and closing the AF_ALG socket before
finalization, chunks can accumulate indefinitely in the parent TFM's
all_chunks list. Since the ahash API has no per-request destructor hook, the
chunks are not freed when the request is dropped.

[ ... ]

> +static void cmh_aes_cmac_exit_tfm(struct crypto_ahash *tfm)
> +{
> +	struct cmh_aes_cmac_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_aes_cmac_chunk *c, *tmp;
> +
> +	/* Free any orphaned chunks (e.g. testmgr export/reimport poison) */
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_for_each_entry_safe(c, tmp, &tctx->all_chunks, tfm_node) {
> +		list_del(&c->tfm_node);
> +		kfree_sensitive(c);
> +	}

[Severity: High]
Since the chunks are only physically freed when the TFM is destroyed, could=
n't
a long-lived socket retain the leaked memory indefinitely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D8
