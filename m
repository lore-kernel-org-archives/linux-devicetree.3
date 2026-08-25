Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6E53546CD
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697034; cv=none; b=MlixyG4X8poZDuIGDSDcSRQGBZLuQ9fHuXqV2KpAannX8TaQBY74P6H+0vFahpTyQ+833Lo7v8XX0UG8AuQmmm900OfuwR8oYBehZLpsTj4jbSqQlvVwtS7M8XtNxUg5coEhBYfZ2nlEcgbuTGFQ/e1I5I546DwoedcCG27dcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697034; c=relaxed/simple;
	bh=BD2vQrX8RqACDdswZuMRP5eTmYzRbWTt8vnWBMJL5hM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q/jjQaGHdUI3U/7H1qw19JJuvZexZXIdNpNvaSVt1ms+ItDtTiYYfSEpvwd8E39wEodocUFtQ2IGn7rZ+U93zbzIqzkyfLpzK779Qbl0uu5ikUcPdlfLS6UlhdnOgjvjr5L50+uRsGkHcHmF0qfYe9iOpgMKkS3L3+8lCsilJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZfKEX5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZfKEX5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7399C1F000E9;
	Tue, 25 Aug 2026 22:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697032;
	bh=ooQ+LpgcxDGNe5NyTJkbH8oQ48NpucY3OuQi4lXZysU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZfKEX5FddwjlGssqt0CZG9KpnneKXIrGEl6S8aJhQ+rWRurAlC1YMANcj8tgUEpU
	 wTSjTgyi/9cgFnygtiJ3o7Ohm/87ryYF4Y/A1scKzloCRV5b1D6RP5dqDC83Wzos6B
	 68zpbYyQio7b2Shb6Cq095JJsoD7w2S9mAa8erN5Y3ss57EMhoDK1JqTtlSvnqLPS1
	 F+wLotjNs9YF4Wut+KSfVmf1l0cuKy87b91ulNL0yJ5HX3SUWnstZKDBLQPJVoS4Ws
	 neIns6Z93XQ+gFqFIPHGDekG17ql4RGb4OGImI7IhHE00VebrZAYg0z7Fr8j8PN2mN
	 gqGPWbhrAz04A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/19] crypto: cmh - add ChaCha20-Poly1305
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260825221539.255951-11-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-11-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:30:32 +0000
Message-Id: <20260825223032.7399C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unbounded memory leak of dynamically allocated Poly1305 chunks (`s=
truct cmh_poly_chunk`) when an `ahash_request` is re-initialized or abandon=
ed, due to missing cleanup.
- [High] The driver linearizes arbitrary-length skcipher and AEAD requests =
into large contiguous kmalloc buffers (up to 1MB), which is highly prone to=
 allocation failures and violates API contracts.
- [Medium] Mapping an unaligned structure member for DMA violates DMA API c=
onstraints and causes cacheline sharing issues.
--

commit bb2ec11c7c7c49e89d1a8aef0363955e68578689
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Subject: crypto: cmh - add ChaCha20-Poly1305

This commit registers the ChaCha20-Poly1305 AEAD, ChaCha20 skcipher, and
Poly1305 ahash algorithms using the CMH CCP core. It introduces VCQ
transaction handling for hardware operations while accumulating data in
memory for arbitrary-length poly1305 requests.

> diff --git a/drivers/crypto/cmh/cmh_ccp.c b/drivers/crypto/cmh/cmh_ccp.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp.c
[ ... ]
> +static int cmh_ccp_crypt(struct skcipher_request *req, u32 ccp_op)
> +{
[ ... ]
> +	/* Limit linearisation buffers to avoid large allocations. */
> +	if (req->cryptlen > SZ_1M)
> +		return -EINVAL;
> +
> +	gfp =3D req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
> +	      GFP_KERNEL : GFP_ATOMIC;
> +
> +	memset(rctx, 0, sizeof(*rctx));
> +	rctx->cryptlen =3D req->cryptlen;
> +
> +	/* Linearise input from scatterlist */
> +	rctx->in_buf =3D kmalloc(req->cryptlen, gfp | __GFP_NOWARN);

[Severity: High]
Does this code linearize the entire payload into a large contiguous buffer?
Allocating up to 1MB of contiguous physical memory via kmalloc (especially
with GFP_ATOMIC) is extremely prone to failure under memory fragmentation.

Also, returning -EINVAL for requests larger than 1MB breaks the crypto API
contract, which expects support for arbitrary payload sizes. Could this
cause unpredictable failures for subsystems like IPsec?

> diff --git a/drivers/crypto/cmh/cmh_ccp_aead.c b/drivers/crypto/cmh/cmh_c=
cp_aead.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp_aead.c
[ ... ]
> +static int cmh_ccp_aead_crypt(struct aead_request *req, u32 ccp_op)
> +{
[ ... ]
> +	if ((u64)cryptlen + req->assoclen > SZ_1M)
> +		return -EINVAL;
[ ... ]
> +	/* Linearise input */
> +	if (cryptlen > 0) {
> +		rctx->in_buf =3D kmalloc(cryptlen, gfp | __GFP_NOWARN);

[Severity: High]
Does this AEAD implementation suffer from the same limitation?
Using kmalloc for large contiguous buffers (up to 1MB) can easily fail
under memory pressure, and rejecting requests larger than this size
violates the expected behavior of the crypto API. Can this be reworked to
use scatterlists directly or handle chunks iteratively?

> diff --git a/drivers/crypto/cmh/cmh_ccp_poly.c b/drivers/crypto/cmh/cmh_c=
cp_poly.c
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_ccp_poly.c
[ ... ]
> +static int cmh_poly_setkey(struct crypto_ahash *tfm, const u8 *key,
> +			   unsigned int keylen)
> +{
[ ... ]
> +	tctx->skey_dma =3D cmh_dma_map_single(tctx->key + CCP_POLY_KEY_SIZE,
> +					    CCP_POLY_KEY_SIZE,
> +					     DMA_TO_DEVICE);

[Severity: Medium]
Are we mapping a structure member that is not cacheline aligned for DMA?
Mapping an inner offset of the tctx->key array for DMA violates the DMA API
constraints and can cause cacheline sharing issues with surrounding fields
(like tctx->chunk_lock) on non-coherent architectures. Should this use a
separately allocated buffer instead?

[ ... ]
> +static int cmh_poly_init(struct ahash_request *req)
> +{
> +	struct cmh_poly_reqctx *rctx =3D ahash_request_ctx(req);
> +
> +	memset(rctx, 0, sizeof(*rctx));
> +	INIT_LIST_HEAD(&rctx->chunks);
> +	return 0;
> +}

[Severity: High]
Does this unconditionally overwrite the request context without cleaning up
previously allocated chunks?

If a user re-initializes a request (e.g. via crypto_ahash_init), any chunks
currently linked to rctx->chunks are abandoned here. Since the crypto
framework provides no request destructor, this leads to an unbounded memory
leak.

[ ... ]
> +static int cmh_poly_update(struct ahash_request *req)
> +{
[ ... ]
> +	chunk =3D kmalloc(sizeof(*chunk) + req->nbytes, gfp);
> +	if (!chunk) {
> +		ret =3D -ENOMEM;
> +		goto err_free_chunks;
> +	}
> +
> +	chunk->len =3D req->nbytes;
[ ... ]
> +	list_add_tail(&chunk->list, &rctx->chunks);
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_add_tail(&chunk->tfm_node, &tctx->all_chunks);
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Is this where the leaked chunks are accumulated?

Chunks allocated here are added to both the request list and the global
transform list. If the user abandons the request (like closing an AF_ALG
socket), the chunks remain permanently orphaned in tctx->all_chunks until
the parent transform is destroyed.

[ ... ]
> +static int cmh_poly_import(struct ahash_request *req, const void *in)
> +{
> +	struct crypto_ahash *tfm =3D crypto_ahash_reqtfm(req);
> +	struct cmh_poly_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_poly_reqctx *rctx =3D ahash_request_ctx(req);
> +	const struct cmh_poly_export_state *state =3D in;
> +	struct cmh_poly_chunk *chunk;
> +
> +	memset(rctx, 0, sizeof(*rctx));
> +	INIT_LIST_HEAD(&rctx->chunks);

[Severity: High]
Does this zeroing of the request context cause the same leak as
cmh_poly_init?

Any existing chunks attached to the request before the import will be
abandoned and remain orphaned in the global transform list.

[ ... ]
> +static void cmh_poly_exit_tfm(struct crypto_ahash *tfm)
> +{
> +	struct cmh_poly_tfm_ctx *tctx =3D crypto_ahash_ctx(tfm);
> +	struct cmh_poly_chunk *c, *tmp;
> +
> +	/* Free any orphaned chunks (e.g. testmgr export/reimport poison) */
> +	spin_lock_bh(&tctx->chunk_lock);
> +	list_for_each_entry_safe(c, tmp, &tctx->all_chunks, tfm_node) {
> +		list_del(&c->tfm_node);
> +		kfree_sensitive(c);
> +	}
> +	spin_unlock_bh(&tctx->chunk_lock);

[Severity: High]
Does this cleanup step confirm the accumulation of orphaned chunks?

The fact that chunks must be freed here during transform destruction
verifies that abandoned requests leave their chunks permanently stranded in
tctx->all_chunks throughout the lifetime of the transform, providing an
easy path for a local denial of service.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D10
